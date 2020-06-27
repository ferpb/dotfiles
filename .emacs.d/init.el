(setq default-directory "~/")

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(eval-when-compile
  (require'use-package))

(setq use-package-always-ensure t)

(setq custom-file "~/.emacs.d/.emacs-custom.el")
(load custom-file)

(setq inhibit-startup-screen t)

(menu-bar-mode 1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(setq-default cursor-type 'bar)

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(load "~/.emacs.d/.emacs.secrets" t)

(setq mac-option-modifier 'meta)

(define-key global-map (kbd "RET") 'newline-and-indent)

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-delete t)
  (setq evil-want-C-u-scroll t)
  (setq evil-shift-width 4)
  (setq evil-echo-state nil)
  ;; evil-collection assumes evil-want-keybinding is set to nil and
  ;; evil-want-integration is set to t before loading evil
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  ;; Load all bindings
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(defun my/reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(use-package gruvbox-theme
  :ensure t)

(show-paren-mode)

(electric-pair-mode 1)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(add-hook 'prog-mode-hook
	  (lambda () (linum-mode 1)))

(setq-default indicate-empty-lines t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq ido-use-filename-at-point 'guess)

(setq ido-create-new-buffer 'always)

(setq ido-file-extensions-order '( ".org" ".txt" ".py" ".emacs" ".xml" ".el"
                                   ".ini" ".cfg" ".cnf"))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(windmove-default-keybindings)

(defun other-window-backward ()
  "Goto previous window"
  (interactive)
  (other-window -1))
(global-set-key (kbd "\C-x p") 'other-window-backward)

(setq disabled-command-function nil)

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(setq-default indent-tabs-mode nil)

(delete-selection-mode 1)

(save-place-mode 1)

(global-visual-line-mode t)

(define-key key-translation-map (kbd "<S-mouse-1>") (kbd "<mouse-2>"))

(setq-default fill-column 80)

(load (expand-file-name "~/quicklisp/slime-helper.el"))

(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (python-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)

(require 'org)

(require 'org-tempo)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-adapt-indentation nil)

(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.2))

(use-package auctex
  :defer t
  :ensure t
  :config
  (setq TeX-auto-save t))

(use-package latex-preview-pane
  :ensure t
  :config
  (latex-preview-pane-enable))
