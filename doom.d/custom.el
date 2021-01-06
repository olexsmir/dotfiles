(custom-set-variables
 '(package-selected-packages '(racket-mode markdown-mode zoutline)))
(custom-set-faces)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)

  :mode
  ("README.*\\.md\\'" . gfm-mode)
  ("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)

  :hook
  (markdown-mode . variable-pitch-mode)
  (markdown-mode . yas-minor-mode)
  (markdown-mode . smartparens-mode)

  :custom
  (markdown-command "pandoc")
  (markdown-header-scaling t)

  :config
  (unbind-key "DEL" gfm-mode-map))
