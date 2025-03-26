(setq doom-font (font-spec :family "JetBrainsMono Nerd Font"
                           :size 15))
(setq doom-theme 'doom-tokyo-night)
(setq display-line-numbers-type 'relative)

;; orgmode
(setq org-directory "~/org/")
(after! org
  (setq org-agenda-window-setup 'other-window)
  (setq org-todo-keywords '((sequence "TODO(t)" "DOING(p)" "INB(i)" "|" "DONE(d)" "KILL(k)")))
  (setq org-agenda-custom-commands
        '(("n" "Next Actions"
           ((tags-todo "+next")))))

  (map! :leader
        :prefix "o a"
        :desc "Next actions"
        "n" #'(lambda () (interactive)
                         (org-agenda nil "n"))))
