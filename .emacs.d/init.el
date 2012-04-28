;; add to load-path
;; (defun add-to-load-path (&rest paths)
;;   (let (path)
;;     (dolist (path paths paths)
;;       (let ((default-directory (expand-file-name
;; 				(concat user-emacs-directory path))))
;; 	(add-to-list 'load-path default-directory)
;; 	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;; 	    (normal-top-level-add-subdirs-to-load-path))))))

;; (add-to-load-path "elisp" "conf")

(add-to-list 'load-path "~/.emacs.d/elisp/")


(prefer-coding-system 'utf-8)


(global-hl-line-mode 1)
(set-face-background hl-line-face "#eeeeee")

(define-key key-translation-map [?\C-h] [?\C-?])

(menu-bar-mode 0)

(setq-default tab-width 4)
(setq standard-indent 4)
(setq c-basic-offset 4)

;; (setq skeleton-pair t)
;; (global-set-key "(" 'skeleton-pair-insert-maybe)
;; (global-set-key "[" 'skeleton-pair-insert-maybe)
;; (global-set-key "{" 'skeleton-pair-insert-maybe)

;; emacs.appでの設定
(when (display-graphic-p)
  ;; フォントセットを作る
  (let* ((fontset-name "myfonts") ; フォントセットの名前
	 (size 11) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
	 (asciifont "Menlo") ; ASCIIフォント
	 (jpfont "Hiragino Kaku Gothic ProN") ; 日本語フォント
	 (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
	 (fontspec (font-spec :family asciifont))
	 (jp-fontspec (font-spec :family jpfont)) 
	 (fsn (create-fontset-from-ascii-font font nil fontset-name)))
    (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
    (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
    (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
    )
  
  ;; デフォルトのフレームパラメータでフォントセットを指定
  (add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

  (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

  ;; フォントサイズの比を設定
  (dolist (elt '(("^-apple-hiragino.*" . 1.0)
  		 (".*osaka-bold.*" . 1.0)
  		 (".*osaka-medium.*" . 1.0)
  		 (".*courier-bold-.*-mac-roman" . 1.0)
  		 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
  		 (".*monaco-bold-.*-mac-roman" . 0.9)))
  (add-to-list 'face-font-rescale-alist elt))


  ;; デフォルトフェイスにフォントセットを設定
  ;; # これは起動時に default-frame-alist に従ったフレームが
  ;; # 作成されない現象への対処
  (set-face-font 'default "fontset-myfonts")

  (require 'color-theme-subdued)
  (color-theme-subdued)

  (global-hl-line-mode 1)
  (set-face-background hl-line-face "#111111")

  ;; Window size
  (add-to-list 'default-frame-alist '(width . 80))
  (add-to-list 'default-frame-alist '(height . 50))

  ;; line-spacing!!!
  (setq-default line-spacing 1)

  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (menu-bar-mode 1)
)

;; Remove scratch message, etc
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)


;; Silent
(setq ring-bell-function 'ignore)


;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)


;; auto-save
(setq backup-directory-alist
      `((".*" . ,"~/Library/Application Support/Emacs/Backups/")))
(setq auto-save-file-name-transforms
      `((".*" , "~/Library/Application Support/Emacs/Backups/" t)))


(setq mouse-wheel-scroll-amount '(0.01))


(define-key global-map (kbd "RET") 'newline-and-indent)


;;(setq-default truncate-lines t)


(set-default 'cursor-type 'bar)


;; ============================================================================


;; auto-install.el
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
;; (auto-install-update-emacswiki-package-name t)
;; (setq url-proxy-services '(("http" . "squid.smile.priv:8080")))
; (auto-install-compatibility-setup)


;; autopair
(require 'autopair)
(autopair-global-mode)




;; anything 
(require 'anything)
; (global-unset-key "\C-xb")
(define-key global-map [(super a)] 'anything)
(define-key global-map [(control x)(b)] 'anything)
(require 'anything-config)
(setq anything-sources
      '(anything-c-source-buffers
	anything-c-source-recentf
	anything-c-source-files-in-current-dir
	anything-c-source-emacs-commands
	anything-c-source-emacs-functions
	))

;; auto-complete
(require 'auto-complete-config)
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

(add-to-list 'ac-modes 'csharp-mode)


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


;; Fullscreen patch
(define-key global-map [(meta control f)] 'ns-toggle-fullscreen)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))


;; C#
(autoload 'csharp-mode "csharp-mode-0.8.5.el" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
(defun csharp-sucks ()
  (auto-complete-mode t)
  (setq indent-tabs-mode nil))
(add-hook 'csharp-mode-hook 'csharp-sucks)
;; (add-hook 'csharp-mode-hook 'auto-complete-mode)

;; AUCTeX
(require 'tex-site)
(require 'tex)

 (setq TeX-default-mode 'japanese-Latex-mode)
 (setq japanese-Latex-default-style "jsarticle")
 (setq japanese-TeX-command-default "pTeX")
 (setq japanese-LaTeX-command-default "pLaTeX")
 (add-to-list 'TeX-output-view-style
              '("^dvi$" "." "dvipdfmx %dS %d && open %s.pdf"))


(setq ruby-indent-level 4)


(require 'redo+)


(add-hook 'html-mode-hook
	  (lambda ()
	    ;; Default indentation is usually 2 spaces, changing to 4.
	    (set (make-local-variable 'sgml-basic-offset) 4)))
