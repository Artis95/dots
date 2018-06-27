(require 'package)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq package-check-signature nil)

(setq helm-descbinds-window-style 'same-window)

  (setq package-enable-at-startup nil)
      (package-initialize)
  (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(custom-safe-themes
  (quote
      ("8e4efc4bed89c4e67167fdabff77102abeb0b1c203953de1e6ab4d2e3a02939a" default)))
  '(package-selected-packages
  (quote
      (package-build shut-up epl git commander f dash s cask org-bullets evil-org evil-collection gruvbox-theme use-package helm evil-visual-mark-mode))))
  (custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(default ((t (:inherit nil :stipple nil :background "#151515" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "curie"))))
  '(fringe ((t (:background "#151515")))))


  (use-package evil
  :ensure t
  :init
(setq evil-want-integration nil)
  :config
  (evil-mode 1))

  (use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

  (unless (package-installed-p 'use-package)
  (package-refresh-contents)
(package-install 'use-package))

  (eval-when-compile
  (require 'use-package))

  (load-theme 'gruvbox-dark-hard t)

      (require 'helm)
  (require 'helm-config)

  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
      ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
      ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
      (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  (when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

  (defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
		  (let ((bg-color (face-background 'default nil)))
		      `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


  (add-hook 'helm-minibuffer-set-up-hook
	  'spacemacs//helm-hide-minibuffer-maybe)

  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)

  (helm-mode 1)

  (menu-bar-mode -1)
  (tool-bar-mode -1)

  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)

  (scroll-bar-mode -1)


  (global-set-key (kbd "M-x") 'helm-M-x)

  (helm-autoresize-mode t)


  (require 'org)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)

  (when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(setq user-full-name "Stan van der Vleuten"
user-mail-address "Stanneman95@gmail.com")

(add-to-list 'load-path "~/.emacs.d/resources/")

(setq evil-insert-state-message nil)
    (setq treemacs-no-png-images t)

(setq-default evil-cross-lines t)

(define-key evil-normal-state-map "H" 'beginning-of-line)
(define-key evil-normal-state-map "L" 'end-of-line)

(use-package evil-org
:ensure t
:after org
:config
(add-hook 'org-mode-hook 'evil-org-mode)
(add-hook 'evil-org-mode-hook
(lambda ()
(evil-org-set-key-theme))))





(global-evil-leader-mode)
      (evil-leader/set-leader ";")
      (evil-leader/set-key
      "e" 'projectile-find-file
      "B" 'helm-mini
      "q" 'kill-current-buffer
      "r" 'ranger
      "d" 'deer
";" 'avy-goto-word-1
      "'" 'other-window
      "v" 'split-window-below
      "h" 'split-window-right
      "t" 'treemacs-toggle
      "b" 'helm-bookmarks)

(setq-default indent-tabs-mode t)
(require 'powerline-evil)
(setq powerline-arrow-shape 'utf8)
(powerline-evil-center-color-theme)

(use-package dashboard
:config
(dashboard-setup-startup-hook))
(setq dashboard-banner-logo-title "Welcome to VIM.. I mean.. EMACS!!")
(setq dashboard-startup-banner 'logo)

(use-package nlinum
:config
(nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(add-hook 'org-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-current-symbol "")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)
(setq nlinum-relative-redisplay-delay 0))      ;; delay
;; Use `display-line-number-mode` as linum-mode's backend for smooth performance
(setq linum-relative-backend 'display-line-numbers-mode)

(setq ranger-show-hidden nil)

(setq tabbar-background-color "#151515") ;; the color of the tabbar background
(custom-set-faces
'(tabbar-default ((t (:inherit variable-pitch :background "#151515" :foreground "white" :weight bold))))
'(tabbar-button ((t (:inherit tabbar-default :foreground "#151515"))))
'(tabbar-button-highlight ((t (:inherit tabbar-default))))
'(tabbar-highlight ((t (:underline t))))
'(tabbar-selected ((t (:inherit tabbar-default :background "#95CA59"))))
'(tabbar-separator ((t (:inherit tabbar-default :background "#95CA59"))))
    '(tabbar-unselected ((t (:inherit tabbar-default)))))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))

;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

(with-eval-after-load 'org (setq org-startup-indented t))

(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/wm")
(load "wm.el")
(require 'wm)
(wm-mode 1)

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(defun go-mode-setup ()
  (go-eldoc-setup))
(add-hook 'go-mode-hook 'go-mode-setup)

(defun go-mode-setup ()
 (go-eldoc-setup)
 (setq gofmt-command "~/.go/bin/goimports")
 (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'go-mode-setup)
