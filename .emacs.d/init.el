  (setq default-directory "~/")

  (require 'package)

  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/"))

  ;; Initialize the packages
  (unless (bound-and-true-p package--initialized)
    (setq package-enable-at-startup nil)
    (package-initialize))

  ;; Make sure `use-package'is available
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  ;; Configure `use-package'
  (eval-and-compile
    (setq use-package-verbose t)
    (setq use-package-compute-statistics t)
    ;; Don't append `hook' suffix when using :hook
    (setq use-package-hook-name-suffix nil))

  (eval-when-compile
    (require'use-package))

  (setq use-package-always-ensure t)

  (setq custom-file "~/.emacs.d/.emacs-custom.el")
  (load custom-file)

  (setq inhibit-startup-screen t)

  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (toggle-scroll-bar -1)
  (add-hook 'after-make-frame-functions '(lambda (frame)
                                           (modify-frame-parameters frame
                                                                    '((vertical-scroll-bars . nil)
                                                                      (horizontal-scroll-bars . nil)))))

  ;; (setq-default cursor-type 'bar)
  (blink-cursor-mode 0)

  ;; (set-default-font "Monaco-12")
  ;; set font for all windows. keep window size fixed
  (set-frame-font "Menlo-12" nil t)
  (set-face-attribute 'variable-pitch nil :width 'normal :family "Helvetica" :height 130)

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
  (global-set-key (kbd "C-x C-.") 'flyspell-auto-correct-previous-word)

  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "M-z") 'zap-up-to-char)

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-s") 'isearch-backward)

  (global-set-key (kbd "M-%") 'query-replace-regexp)
  (global-set-key (kbd "C-M-%") 'query-replace)

  (define-key key-translation-map (kbd "<S-mouse-1>") (kbd "<mouse-2>"))

  (setq visible-bell nil
        ring-bell-function #'ignore)

  (defun my/reload-emacs-configuration ()
    (interactive)
    (load-file "~/.emacs.d/init.el"))

  (use-package gruvbox-theme
    :ensure t)

  (use-package monokai-theme
    :ensure t
    :config

    ;; (setq monokai-background "#282923"
    ;;       monokai-blue "#67d8ef"
    ;;       monokai-cyan "#a1efe4"
    ;;       monokai-gray "#75715e"
    ;;       monokai-green "#a6e22c"
    ;;       monokai-magenta "#fd5ff0"
    ;;       monokai-orange "#fd9621"
    ;;       monokai-red "#f92472"
    ;;       monokai-violet "#ac80ff"
    ;;       monokai-yellow "#e7db74")

    ;; (setq monokai-comments "#74705d"
    ;;       monokai-line-number "90918b"
    ;;       monokai-highlight "#383830"
    ;;       monokai-highlight-alt "#3e3d32"
    ;;       monokai-highlight-line "#71716b")

    ;;  (setq monokai-distinct-fringe-background nil
    ;;       monokai-doc-face-as-comment t)

    (setq monokai-height-minus-1 1
          monokai-height-plus-1 1
          monokai-height-plus-2 1
          monokai-height-plus-3 1
          monokai-height-plus-4 1))

  (use-package monokai-pro-theme
    :ensure t)

  (use-package monokai-alt-theme
    :ensure t)

  (use-package darkokai-theme
    :ensure t)

  (use-package doom-themes
    :ensure t
    :config
    (setq doom-themes-enable-bold t
          doomt-themes-enable-italic t)

    (doom-themes-org-config))

  (use-package dracula-theme
    :ensure t
    :config
    (setq dracula-enlarge-headings nil)
    (setq dracula-alternate-mode-line-and-minibuffer t))

  (when (display-graphic-p)
    (load-theme 'gruvbox-dark-hard))

  (show-paren-mode 1)
  (setq show-paren-delay 0)

  (electric-pair-mode 1)

  (use-package paren-face
    :ensure t
    :config
    (global-paren-face-mode))

  (line-number-mode t)
  (column-number-mode t)

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

  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  (setq-default indicate-empty-lines t)

  (unless backup-directory-alist
    (setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))))

  (setq delete-old-versions -1)
  (setq version-control t)
  (setq vc-make-backup-files t)
  (setq auto-save-file-name-transforms `((".*" ,(concat user-emacs-directory "auto-save-list") t)))

  (use-package counsel
    :after ivy
    :config
    (setq counsel-find-file-at-point t)
    (counsel-mode))

  (use-package ivy
    :defer 0.1
    :diminish
    :bind
    (("C-c C-r" . ivy-resume))
    :custom
    ;; (ivy-use-virtual-buffers t)
    (enable-recursive-minibuffers t)
    (ivy-count-format "(%d/%d) ")
    (ivy-display-style 'fancy)
    (ivy-use-selectable-prompt t)
    (ivy-do-completion-in-region nil)
    :config
    (ivy-mode))

  (use-package swiper
    :after ivy
    :bind
    (("C-S-s" . swiper)
     ("C-S-r" . swiper-backward)))

    (use-package amx
      :ensure t
      :after ivy
      :custom
      (amx-backend 'auto)
      (amx-save-save-file "~/.emacs.d/amx-items")
      (amx-history-length 50)
      :config
      (amx-mode 1))

  (use-package ivy-rich
    :ensure t
    :config
    (setcdr (assq t ivy-format-functions-alist)
            #'ivy-format-function-line)
    (ivy-rich-mode 1))

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

  (setq-default isearch-allow-scroll t
                ;; lazy-highlight-cleanup nil
                lazy-highlight-initial-delay 0)

  (setq scroll-conservatively 101
        scroll-margin 1
        scroll-step 1)

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

  (defun beginning-expression ()
    "Move point to the beginning of the expression at point."
    (interactive)
    (backward-up-list 1 t)
    (forward-char))
  (global-set-key (kbd "C-<") 'beginning-expression)

  (defun end-expression ()
    "Move point to the end of the expression at point."
    (interactive)
    (backward-up-list 1 t)
    (forward-sexp)
    (backward-char))
  (global-set-key (kbd "C->") 'end-expression)

  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-l")

  (use-package lsp-mode
      :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
              (python-mode-hook . lsp)
              ;; if you want which-key integration
              (lsp-mode-hook . lsp-enable-which-key-integration))
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

  (setq org-agenda-files
        '("~/Library/Mobile Documents/com~apple~CloudDocs/org"
          "~/Library/Mobile Documents/com~apple~CloudDocs/org/Recuperación Información"))

  (setq org-adapt-indentation nil)

(setq org-cycle-emulate-tab t
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0
      org-src-preserve-indentation t)

(setq org-use-property-inheritance t)

;; Enable changing image preview size with: #+attr_org: :width 100px
(setq org-image-actual-width nil)
;; (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
;; (set-face-attribute 'org-block nil :inherit 'fixed-pitch)

;; Load intelligent variabe-pith-mode for org-mode
(use-package org-variable-pitch
  :ensure t
  :config
  (set-face-attribute 'org-variable-pitch-fixed-face nil :width 'normal :family "Menlo" :height 120)
  (add-hook 'org-mode-hook 'org-variable-pitch-minor-mode))

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.2))

  (remove-hook 'org-cycle-hook
               #'org-optimize-window-after-visibility-change)

    (use-package tex
      :ensure auctex
      :config
      (setq TeX-auto-save t
            TeX-parse-self t
            TeX-save-query nil)
      (setq-default TeX-master "main"))

  (setq TeX-PDF-mode 1)
  ;; (setq TeX-save-query nil)

  (setq TeX-source-correlate-method 'synctex
        TeX-source-correlate-mode t
        TeX-source-correlate-start-server t)

  (setq TeX-view-program-list
        '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

  (setq TeX-view-program-selection '((output-pdf "Skim")))
  ;; (setq-default TeX-command-Show " ")

  (require 'bibtex)
  (bibtex-set-dialect 'biblatex)

  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

  (use-package auctex-latexmk
    :ensure t
    :config
    (auctex-latexmk-setup)
    (setq japanese-TeX-error-messages nil))

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
    ;; Call the command with prefix to open the repository selector
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

  (setq load-path (append (list (expand-file-name "/Applications/LilyPond.app/Contents/Resources/share/emacs/site-lisp")) load-path))
  (autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
  (add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))

  (use-package define-word
    :ensure t)

  (use-package pdf-tools
    :ensure t
    :config
    (pdf-tools-install))

  (use-package ace-window
    :ensure t
    :config
    (setq aw-background nil)
    (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
    (global-set-key (kbd "C-x o") 'ace-window))
