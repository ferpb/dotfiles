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

(load "~/Library/Mobile Documents/com~apple~CloudDocs/emacs/.emacs.secrets" t)

(setq mac-option-modifier 'meta)

(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "<C-return>") 'newline)

(define-key key-translation-map (kbd "M-ñ") (kbd "M-;"))
(define-key key-translation-map (kbd "C-ñ") (kbd "C-;"))

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-s") 'isearch-backward)

(define-key key-translation-map (kbd "<S-mouse-1>") (kbd "<mouse-2>"))

(setq visible-bell nil
      ring-bell-function #'ignore)

(defun my/reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(use-package gruvbox-theme
  :ensure t)

(show-paren-mode 1)
(setq show-paren-delay 0)

(electric-pair-mode 1)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(setq display-line-numbers-grow-only t)
;; (setq display-line-numbers-width-start t)
;; Make the left fringe smaller
;; (fringe-mode '(1 . 4))

(defun calculate-width (n)
  "Calculate width in O(1) time"
  (let ((width
    (if (< n 1)
        1
      (+ 1 (floor (/ (log n) (log 10)))))))

    (if (and (>= n 80) (<= n 99))
        (1+ width)
      width)))

(defun my-display-line-numbers-mode-hook ()
  (setq-local display-line-numbers-width (calculate-width (count-lines (point-max) (point-min)))))
(add-hook 'display-line-numbers-mode-hook #'my-display-line-numbers-mode-hook)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(setq-default indicate-empty-lines t)

(unless backup-directory-alist
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))))

(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory "auto-save-list") t)))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq ido-use-filename-at-point 'guess)

(setq ido-create-new-buffer 'always)

(setq ido-file-extensions-order '( ".org" ".txt" ".py" ".emacs" ".xml" ".el"
                                   ".ini" ".cfg" ".cnf"))

(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(windmove-default-keybindings)

(defun other-window-backward ()
  "Goto previous window"
  (interactive)
  (other-window -1))
(global-set-key (kbd "\C-x p") 'other-window-backward)

(defun other-kill-buffer-and-window ()
  "If there are multiple windows, close the other window and kill the buffer in it also."
  (interactive)
  (other-window 1)
  (kill-buffer-and-window))
(global-set-key (kbd "\C-x 4 o") 'other-kill-buffer-and-window)

(setq disabled-command-function nil)

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(fset 'yes-or-no-p 'y-or-n-p)

(setq sentence-end-double-space nil)

(when (string-equal system-type "darwin")
  (setq delete-by-moving-to-trash t)
  (setq trash-directory "~/.Trash"))

(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(setq-default indent-tabs-mode nil)

(setq tab-always-indent 'complete)

(delete-selection-mode 1)

(save-place-mode 1)

(global-visual-line-mode t)

(setq apropos-do-all t)

(setq ispell-program-name "hunspell")
;; you could set `ispell-dictionary` instead but `ispell-local-dictionary' has higher priority
(setq ispell-dictionary "en_US,es_ES")
;; (setq ispell-local-dictionary "en_US,es_ES")
(setq ispell-hunspell-dictionary-alist '(("en_US,es_ES" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US,es_ES") nil utf-8)))

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(setq-default fill-column 80)

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package slime
  :ensure t
  :init
  ;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
  :config
  ;; Contributors
  (setq slime-contribs '(slime-fancy slime-repl slime-scratch slime-trace-dialog))
  ;; (setq slime-contribs '())
  ;; Select Lisp implementation
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit))

(use-package paredit
  :ensure t
  :init
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'slime-repl-mode-hook #'enable-paredit-mode))

(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))

(use-package highlight-quoted
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . highlight-quoted-mode))

(use-package highlight-defined
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode) . highlight-defined-mode))

(defun begining-expression ()
  "Move point to the begining of the expression at point."
  (interactive)
  (backward-up-list 1 t)
  (forward-char))
(global-set-key (kbd "C-<") 'begining-expression)

(defun end-expression ()
  "Move point to the end of the expression at point."
  (interactive)
  (backward-up-list 1 t)
  (forward-sexp)
  (backward-char))
(global-set-key (kbd "C->") 'end-expression)

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

(setq org-use-property-inheritance t)

(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.2))

(remove-hook 'org-cycle-hook
             #'org-optimize-window-after-visibility-change)

(use-package auctex
  :defer t
  :ensure t
  :config
  (setq TeX-auto-save t))

(use-package latex-preview-pane
  :ensure t
  :config
  (latex-preview-pane-enable))

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all)
  (yas-global-mode 1))

(use-package magit
  :ensure t
  :config
  ;; Open magit status
  (global-set-key (kbd "C-x g") 'magit-status)
  ;; Open transient of transients from non-Magit buffers
  ;; Same as pressing h from a Magit buffer
  (global-set-key (kbd "C-x M-g") 'magit-dispatch))

(use-package erc
  :custom
  (erc-fill-function 'erc-fill-static)
  (erc-fill-static-center 15)
  (erc-track-exclude-types '("JOIN" "MODE" "NICK" "PART" "QUIT"
                             "324" "329" "332" "333" "353" "477"))
  :config
  ;; (add-to-list 'erc-modules 'notifications)
  ;; (add-to-list 'erc-modules 'spelling)
  (erc-services-mode 1)
  (erc-update-modules))

(use-package erc-hl-nicks
  :after erc)

(use-package erc-image
  :after erc)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq dired-dwim-target t)

(setq dired-listing-switches "-alh")
