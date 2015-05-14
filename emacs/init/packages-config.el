; 先跳转到package-install安装，再回来继续配置包
(load "~/.emacs.d/init/packages-install.el")

;;-----------------------
;; magit
;; Before running Git, Magit by default reverts all unmodified
;; buffers that visit files tracked in the current repository.
;; This can potentially lead to data loss, so you might want to
;; disable this by adding the following line to your init file:
;;-----------------------
(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

;;-----------------------
;; yasnippet
;;-----------------------
(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(add-hook 'term-mode-hook (lambda()
    (setq yas-dont-activate t)))


;;-----------------------
;; helm
;;-----------------------
(require 'helm-config)

;;-----------------------
;; flx-ido
;;-----------------------
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;-----------------------
;; evil
;; 安装完成以后，自动就会打开该模式
;;-----------------------
(require 'evil)
(evil-mode 1)

;;-----------------------
;; evil-escape
;; https://github.com/syl20bnr/evil-escape
;; 和vim本身还是不一样，不能直接配置evil来达到退出输入模式
;; 需要引入新的插件
;; Note: The variable evil-escape-delay must be set before requiring evil-escape.
;; Note: The variable evil-escape-key-sequence must be set before requiring evil-escape.
;; 配置快捷键从kj变为fd，否则单独运行k或者j的时候会有明显延迟
;;-----------------------
(setq-default evil-escape-delay 0.2)
(setq-default evil-escape-key-sequence "fd")
(require 'evil-escape)
(evil-escape-mode 1)

;; 如果只有上面的配置，那么在输入文件的时候，直接点击k，会报出下面的错误
;; symbol's value as variable is void: hl-line-mode
;; 所以添加下面的一行
(hl-line-mode nil)

;;-----------------------
;; emmet mode
;;-----------------------
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)


;;-----------------------
;; smex
;; 用来对emacs 的 m-x 进行自动补全
;; ido是对 c-x c-f 补全
;; https://github.com/nonsequitur/smex
;;-----------------------
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(setq smex-prompt-string "My Lord -> ")

;; 打开行数设置
(global-linum-mode t)

;;-----------------------
;; theme
;;-----------------------
(load-theme 'lush t)
;;-----------------------
; (load-theme 'hipster t)
; (set-frame-parameter (selected-frame) 'alpha '(88 70))
; (add-to-list 'default-frame-alist '(alpha 88 70))
;;-----------------------

