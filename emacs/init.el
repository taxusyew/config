(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/init/keybind.el")
))

(load "~/.emacs.d/init/packages-config.el")
; (load "~/.emacs.d/init/packages-install.el")
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))