;; 全体加载完成后设置键位绑定
(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/init/keybind.el")
))

;; 设置第三方插件
(load "~/.emacs.d/init/packages-config.el")
; (load "~/.emacs.d/init/packages-install.el")

;; 设置全局外观
(load "~/.emacs.d/init/global-facade.el")