;(add-to-list 'load-path "/Users/gilesb/Copy/emacspackages/Enhanced-Ruby-Mode")
;(add-to-list 'load-path "/Users/gilesb/Copy/emacspackages/rubocop-emacs")
;;(setq enh-ruby-program "/home/gnufied/.rvm/bin/rvm-auto-ruby")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(require 'rubocop)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(add-hook 'enh-ruby-mode-hook 'rubocop-mode)

(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)

(require 'cl) ; If you don't have it already

(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (loop
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

(require 'compile)

(defun rspec-compile-file ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s"
		   (get-closest-gemfile-root)
		   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
		   ) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s:%s"
		   (get-closest-gemfile-root)
		   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
		   (line-number-at-pos)
		   ) t))
(defun jrspec-compile-file ()
  (interactive)
  (compile (format "cd %s;jrspec %s"
		   (get-closest-gemfile-root)
		   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
		   ) t))

(defun jrspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s;jrspec %s:%s"
		   (get-closest-gemfile-root)
		   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
		   (line-number-at-pos)
		   ) t))

(add-hook 'enh-ruby-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c l") 'jrspec-compile-on-line)
	    (local-set-key (kbd "C-c j") 'jrspec-compile-file)
	    (local-set-key (kbd "C-c L") 'rspec-compile-on-line)
	    (local-set-key (kbd "C-c r") 'rspec-compile-file)
      (local-set-key (kbd "C-c f") 'rubocop-check-current-file)
      (local-set-key (kbd "C-c F") 'rubocop-autocorrect-current-file)
	                ))
