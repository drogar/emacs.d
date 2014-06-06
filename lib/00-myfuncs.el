;; A small exemples to show how Emacs is powerful.
; Define function to match a parenthesis otherwise insert a %

(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))



(defun empwrd ()
  (interactive)
  (setq str "\\emph{}")
  (insert str)
  (backward-char 1)
)

(defun startCcomment ()
  (interactive)
  (setq str "/* B03 - bgg ")
  (insert str)
  (insert (format-time-string "[%Y-%m-%d]*/"  )
	  )
  (backward-char 2)
)
(defun haskellcomment ()
  (interactive)
  (setq str "-- ")
  (insert str)
  (insert (format-time-string "[%Y-%m-%d]"  )
	  )
)
(defun ital ()
  (interactive)
  (setq str "\\textit{}")
  (insert str)
  (backward-char 1)
)
(defun boldit ()
  (interactive)
  (setq str "\\textbf{}")
  (insert str)
  (backward-char 1)
)
(defun listitem ()
  (interactive)
  (setq str "\\item{}")
  (insert str)
  (backward-char 1)
)


(defun integers ()
  (interactive)
  (setq str "\\integers{}")
  (insert str)
)
(defun rationals ()
  (interactive)
  (setq str "\\rationals{}")
  (insert str)
)
(defun tilde()
  (interactive)
  (setq str "\\tilde{}")
  (insert str)
  (backward-char 1)
  )
