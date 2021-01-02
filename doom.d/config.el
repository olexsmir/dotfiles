(setq user-full-name "Smirnov Alexandr"
      user-mail-address "ss2316544@gmail.com")

(setq doom-theme 'doom-one)
(setq org-directory "~/org/")
(setq display-line-numbers-type t)


(defun gk-markdown-preview-buffer ()
  (interactive)
  (let* ((buf-this (buffer-name (current-buffer)))
         (buf-html (get-buffer-create
                    (format "*gk-md-html (%s)*" buf-this))))
    (markdown-other-window (buffer-name buf-html))
    (shr-render-buffer buf-html)
    (eww-mode)
    (kill-buffer buf-html)))
