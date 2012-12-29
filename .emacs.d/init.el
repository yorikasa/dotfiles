;; Add to load-path resursively
(defun add-to-load-path (&rest paths)
  (let (path)
	(dolist (path paths paths)
	  (let ((default-directory
			  (expand-file-name (concat user-emacs-directory path))))
		(add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
			(normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp")

(prefer-coding-system 'utf-8)


;; Global Key Config
(define-key key-translation-map [?\C-h] [?\C-?])
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map [(super w)] 'kill-buffer)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-t") 'other-window)


;; Fix Enter key issue in ansi-term
(add-hook 'term-mode-hook
		  #'(lambda () (setq autopair-dont-activate t)))

;; Tab width
(setq-default tab-width 4)
(setq c-basic-offset 4)


;; Remove scratch message, etc
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

;; Transmit Remote Edit Fix
(setq backup-by-copying t)


;; Silent
(setq ring-bell-function 'ignore)


;; Ignore case
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)


;; Smooth Scroll
(setq mouse-wheel-scroll-amount '(0.01))


;; Full screen patch
(define-key global-map [C-s-268632070] 'ns-toggle-fullscreen)

;; Buffer auto reload
(global-auto-revert-mode 1)

;;misc
(set-default 'cursor-type 'bar)
(setq frame-title-format "%f")


;; Auto-save
(setq backup-directory-alist
	  `((".*" . ,"~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms
	  `((".*" , "~/.emacs.d/backups/" t)))

;; Theme
(require 'color-theme-subdued)
(color-theme-subdued)

;; Highlight
(global-hl-line-mode 1)
(set-face-background hl-line-face "#111111")


;; For Terminal
(unless window-system
  (menu-bar-mode 0)
  )


;; For Emacs.app
(when window-system
  ;; Font
  (set-face-attribute 'default nil
					  :family "Menlo"
					  :height 110)

  (set-fontset-font nil 'japanese-jisx0208
					(font-spec :family "Hiragino Kaku Gothic ProN"))

  (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

  ;; Window size
  (add-to-list 'default-frame-alist '(width . 80))
  (add-to-list 'default-frame-alist '(height . 50))

  ;; line-spacing!!!
  (setq-default line-spacing 1)
  
  ;; UI
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (setq ns-pop-up-frames nil)
  )


;; Show characters count on mode line
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d chars "
              
              (- (region-end) (region-beginning)))
    ""))

(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))


;; =============================================================================
(defvar org-directory "")

;; auto-install.el -------------------------------------------------------------
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
;(auto-install-update-emacswiki-package-name 0)
;; (setq url-proxy-services '(("http" . "squid.smile.priv:8080")))
; (auto-install-compatibility-setup)


;; autopair --------------------------------------------------------------------
(require 'autopair)
(autopair-global-mode)


;; anything --------------------------------------------------------------------
(when (require 'anything nil t)
  (define-key global-map [(super a)] 'anything)
  (define-key global-map [(control x)(b)] 'anything)
  (setq
   anything-enable-shortcuts 'alphabet)
  )
(require 'anything-config)
(setq anything-sources
      '(anything-c-source-buffers
	anything-c-source-recentf
	anything-c-source-files-in-current-dir
	anything-c-source-emacs-commands
	anything-c-source-emacs-functions
	))


;; auto-complete ---------------------------------------------------------------
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
  (ac-config-default)
  (ac-set-trigger-key "TAB")
  (setq ac-auto-start 3)
  (setq ac-auto-show-menu 1)
  (setq ac-use-menu-map t)
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)
  (set-face-background 'ac-candidate-face "gray99")
  (set-face-background 'ac-selection-face "royalblue")

  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(column-number-mode t)
   '(scroll-bar-mode nil)
   '(tool-bar-mode nil))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(linum ((t (:inherit (shadow default)
						 :background "#0f0f0f" :foreground "#aaaaaa")))))
  )

;; markdown-mode ---------------------------------------------------------------
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))


;; AUCTeX ----------------------------------------------------------------------
(require 'tex-site)
(require 'tex)

 (setq TeX-default-mode 'japanese-Latex-mode)
 (setq japanese-Latex-default-style "jsarticle")
 (setq japanese-TeX-command-default "pTeX")
 (setq japanese-LaTeX-command-default "pLaTeX")
 (add-to-list 'TeX-output-view-style
              '("^dvi$" "." "dvipdfmx %dS %d && open %s.pdf"))


;; Redo+ -----------------------------------------------------------------------
(require 'redo+)


;; Egg (Git): https://github.com/byplayer/egg ----------------------------------
(when (executable-find "git")
  (require 'egg nil t))
(setq egg-auto-update nil)
(setq egg-switch-to-buffer t)

;; Modes =======================================================================

;; Ruby ------------------------------------------------------------------------
(setq ruby-indent-level 4)

;; Flymake
;; (defun flymake-ruby-init()
;;   (list "ruby" (list "-c" (flymake-init-create-temp-buffer-copy
;; 						   'flymake-create-temp-inplace))))
;; (add-to-list 'flymake-allowed-file-name-masks
;; 			 '("\\.rb\\'" flymake-ruby-init))
;; (add-to-list 'flymake-err-line-patterns
;; 			 '("\\(.*\\):(\\([0-9]+\\)): \\(.*\\)" 1 2 nil 3))

;; PHP -------------------------------------------------------------------------
(require 'php-mode)


;; CSS -------------------------------------------------------------------------
(add-hook 'css-mode-hook (lambda ()
			(setq autopair-dont-activate t)))
(setq cssm-indent-level 4)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-mirror-mode t)
