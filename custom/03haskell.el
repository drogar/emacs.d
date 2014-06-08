(add-to-list 'load-path "~/.emacs.d/third-party/hasktags-emacs")
(add-to-list 'load-path "~/.emacs.d/third-party/hs-lint")
(require 'hs-lint)

(load "hasktags")
(defun my-haskell-mode-hook ()
  (local-set-key "\C-cl" 'hs-lint))

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
   "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
   "Major mode for editing literate Haskell scripts." t)

;(setq font-lock-maximum-decoration '((haskell-mode . 2) (t . 0)))
(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
(add-hook 'haskell-mode-hook 'my-ac-hask-mode)

(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)

(line-number-mode 1)
(column-number-mode 1)

(defun haskell-indent-hook-func-1()
  (local-set-key [(delete)] 'delete-char))
(add-hook 'haskell-indent-hook
	  'haskell-indent-hook-func-1)

(global-set-key [(delete)]  `delete-char)
