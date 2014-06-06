;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
;;; - Below not needed, emacs.d/snippets is autoloaded
;;;(setq yas-snippet-dirs
;;      '("~/.emacs.d/snippets" ))
(yas-global-mode 1)


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/.cask/24.4.50.1/elpa/auto-complete-20140414.2324/dict")
(ac-config-default)
(defun my-ac-lisp-mode ()
  (setq ac-sources '(ac-source-symbols ac-source-words-in-same-mode-buffers ac-source-yasnippet ac-source-features ac-source-functions ac-source-variables ac-source-dictionary)))
(defun my-ac-hask-mode ()
  (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-yasnippet ac-source-dictionary)))

(setq ac-auto-start 2)
(setq ac-ignore-case nil)
;(global-auto-complete-mode t)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'haskell-mode)
(add-to-list 'ac-modes 'literate-haskell-mode)
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'LaTeX-mode)
(add-to-list 'ac-modes 'TeX-latex-mode)

(add-hook 'emacs-lisp-mode-hook 'my-ac-lisp-mode)


(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (make-local-variable 'ac-ignores)
            (add-to-list 'ac-ignores "end")))
