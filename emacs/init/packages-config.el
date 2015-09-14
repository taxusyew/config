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
; (yas-load-directory "~/.emacs.d/snippets")
(yas-load-directory "~/.emacs.d/elpa/yasnippet-20150415.244/snippets")
(add-hook 'term-mode-hook (lambda()
    (setq yas-dont-activate t)))


;;-----------------------
;; helm
;; 底部弹出window交互
;; Helm has a built-in fuzzy matcher that is activated for some commands. 
;; Fuzzy matching is disabled by default.
;;-----------------------
(require 'helm-config)
(setq helm-M-x-fuzzy-match t)

;;-----------------------
;; flx-ido
;;-----------------------
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
; ;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-auto-merge-work-directories-length -1)

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

;;-----------------------
;; evil-visualstar
;; Make a visual selection with v or V, 
;; and then hit * to search that selection forward, 
;; or # to search that selection backward.
;;-----------------------
(global-evil-visualstar-mode)

;;-----------------------
;; evil-matchit
;; Press “%” to jump inside between tag pair in normal mode
;;-----------------------
(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; 如果只有上面的配置，那么在输入文件的时候，直接点击k，会报出下面的错误
;; symbol's value as variable is void: hl-line-mode
;; 所以添加下面的一行
(hl-line-mode nil)

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
;; linum-relative
;; 显示相对当前行号的其他行数
;;-----------------------
(require 'linum-relative)
(linum-on)

;;-----------------------
;; theme
;;-----------------------
(load-theme 'lush t)
;;-----------------------
; (load-theme 'hipster t)
; (set-frame-parameter (selected-frame) 'alpha '(88 70))
; (add-to-list 'default-frame-alist '(alpha 88 70))
;;-----------------------

;;-----------------------
;; window numbering
;; 使用M-<0-9>切换window
;; 如果希望打开特定buffer的时候，使用特定的数字，就用下面的绑定
;; (setq window-numbering-assign-func
;;      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
;;-----------------------
(window-numbering-mode t)

;;-----------------------
;; ace-window
;; 使用M-p之后，还需要再输入数字进行切换，还不如window numbering
;;-----------------------
; (global-set-key (kbd "M-p") 'ace-window)

;;-----------------------
;; direx
;; sidebar 浏览项目目录
;;-----------------------
; (require 'direx)
; (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;;-----------------------
;; js2-mode
;; 在js源码里的major mode
;;-----------------------
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;-----------------------
;; js2-refactor
;; 在js源码里的major mode
;;-----------------------
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;-----------------------
;; sr-speedbar
;; 在js源码里的major mode
;;-----------------------
; (require 'sr-speedbar)

;;-----------------------
;; smart-mode-line
;; 在js源码里的major mode
;;-----------------------
;; 修复emacs总是提示“Loading themes can run lisp code” 
(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/theme 'dark)


;;-----------------------
;; web-mode
;; 替代原来的html mode
;; http://web-mode.org/ Install
;;-----------------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-enable-comment-keywords t)
    ; (setq web-mode-enable-current-column-highlight t)
    (setq web-mode-enable-current-element-highlight t)
    ; (setq web-mode-enable-auto-pairing t)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


;;-----------------------
;; electric-indent-mode
;;-----------------------
; (electric-indent-mode 1)

;;-----------------------
;; emmet mode
;;-----------------------
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

;;-----------------------
;; smartparens
;; 括号补全
;;-----------------------
(smartparens-global-mode t)


;;-----------------------
;; projectile
;; 项目管理
;;-----------------------
(projectile-global-mode)

;;-----------------------
;; simple-httpd
;; 简单服务器
;;-----------------------
(require 'simple-httpd)
; (setq httpd-root "/var/www")

;;-----------------------
;; impatient-mode
;; 页面及时预览
;;-----------------------
(require 'impatient-mode)

;;-----------------------
;; company
;; 自动补全
;;-----------------------
(require 'company)         
(add-hook 'after-init-hook 'global-company-mode)
; (require 'company-web-html)

;;-----------------------
;; multiple-cursors
;; 多光标
;;-----------------------
(require 'multiple-cursors)

;;-----------------------
;; aggressive-indent
;; 自动化缩进
;;-----------------------
(require 'aggressive-indent)
(global-aggressive-indent-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;-----------------------
;; elpy
;; python开发环境
;;-----------------------
(elpy-enable)
(elpy-use-ipython)

;;-----------------------
;; recentf
;; This mode is part of GNU Emacs 21
;;-----------------------
(recentf-mode 1)
(setq recentf-max-menu-items 20)