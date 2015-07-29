(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/init/keybind.el")
))

(load "~/.emacs.d/init/packages-config.el")
; (load "~/.emacs.d/init/packages-install.el")

;; 不再显示原始的欢迎界面
(setq inhibit-startup-screen "*scratch*")

;; 设置scratch提示
(setq initial-scratch-message ";; scratch buffer\n;; <c-j> to evil lisp\n\n")
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; 设置字体
(set-default-font "Consolas-11")
(set-fontset-font "fontset-default"
  'unicode '("微软雅黑" . "unicode-bmp"))

; windows下最大化，而不是full-screen
(w32-send-sys-command #xf030)

;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)

;;时间使用24小时制
(setq display-time-24hr-format t)

;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
