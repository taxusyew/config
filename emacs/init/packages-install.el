; my-packages.el
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

; 总是提示无法创建连接，即使已经开了vpn
; (add-to-list 'package-archives
;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

; 设置需要安装的插件
; <- 左边依赖右边
; smartparens <- cl-lib 0.3 / dash 2.10.0
(defvar required-packages
  '(
    magit
    dash
    yasnippet
    fiplr
    async
    helm
    flx
    flx-ido
    evil
    evil-escape
    evil-nerd-commenter
    emmet-mode
    smex
    color-theme
    lush-theme
    hipster-theme
    window-numbering
    avy
    ace-window
    project-explorer
    js2-mode
    js2-refactor
    sr-speedbar
    smart-mode-line
    web-mode
    smartparens
  ) "a list of packages to ensure are installed at launch.")

(require 'cl)

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))