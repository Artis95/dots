
(package-initialize)

(org-babel-load-file "~/.emacs.d/configuration.org")(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 47 124 33)))
 '(company-require-match nil)
 '(custom-safe-themes
   (quote
    ("858a353233c58b69dbe3a06087fc08905df2d8755a0921ad4c407865f17ab52f" "8e4efc4bed89c4e67167fdabff77102abeb0b1c203953de1e6ab4d2e3a02939a" default)))
 '(doc-view-continuous t)
 '(global-company-mode t)
 '(inhibit-startup-screen t)
 '(jdee-server-dir "/home/stan/.programs/jdee")
 '(package-selected-packages
   (quote
    (go-eldoc go-mode evil-easymotion auto-complete company-emacs-eclim xpm haskell-mode company-tern xref-js2 js2-refactor js2-mode org-ref yasnippet-snippets ox-twbs ranger markdown-mode polymode ess tabbar writeroom-mode auctex-lua pdf-tools latex-preview-pane auctex-latexmk nlinum-relative package-build shut-up epl git commander f dash s cask org-bullets evil-org evil-collection gruvbox-theme use-package helm evil-visual-mark-mode)))
 '(powerline-default-separator (quote bar))
 '(powerline-default-separator-dir (quote (left . right)))
 '(tool-bar-mode nil)
 '(whitespace-style (quote (face trailing tabs space-mark tab-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#151515" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "curie"))))
 '(fringe ((t (:background "#151515"))))
 '(helm-candidate-number ((t (:foreground "#8ec07c"))))
 '(helm-match ((t (:foreground "#b16286"))))
 '(linum ((t (:background "#151515" :foreground "#504945"))))
 '(nlinum-relative-current-face ((t (:inherit linum :background "#151515" :foreground "#fdf4c1" :weight normal))))
 '(org-done ((t (:foreground "#fb4934" :weight bold))))
 '(org-level-1 ((t (:foreground "#fabd2f"))))
 '(org-level-2 ((t (:foreground "#83a598"))))
 '(org-todo ((t (:foreground "#8ec07c" :weight bold))))
 '(powerline-evil-emacs-face ((t (:inherit powerline-evil-base-face :background "#fe8019"))))
 '(powerline-evil-insert-face ((t (:inherit powerline-evil-base-face :background "#b16286"))))
 '(powerline-evil-motion-face ((t (:inherit powerline-evil-base-face :background "#458588"))))
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "#689d6a"))))
 '(powerline-evil-visual-face ((t (:inherit powerline-evil-base-face :background "#d79921"))))
 '(tabbar-button ((t (:inherit tabbar-default :foreground "#151515"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-default ((t (:inherit variable-pitch :background "#151515" :foreground "white" :weight bold))))
 '(tabbar-highlight ((t (:underline t))))
 '(tabbar-selected ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "#95CA59"))))
 '(tabbar-unselected ((t (:inherit tabbar-default))))
 '(treemacs-term-node-face ((t (:foreground "#fabd2f"))))
 '(whitespace-hspace ((t (:background "#1d2021" :foreground "#1d2021"))))
 '(whitespace-indentation ((t (:foreground "#7c6f64"))))
 '(whitespace-line ((t (:background "#3c3836"))))
 '(whitespace-newline ((t (:background "#1d2021" :foreground "#1d2021"))))
 '(whitespace-space ((t (:background "#151515" :foreground "#7c6f64"))))
 '(whitespace-tab ((t (:background "#151515" :foreground "#7c6f64"))))
 '(whitespace-trailing ((t (:background "#151515" :foreground "#fb4933")))))
