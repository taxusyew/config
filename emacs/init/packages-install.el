; my-packages.el
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'exec-path "C:\\Users\\TT\\AppData\\Local\\GitHub\\PortableGit_c2ba306e536fdf878271f7fe636a147ff37326ad\\bin")

; 总是提示无法创建连接，即使已经开了vpn
; (add-to-list 'package-archives
;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

; 设置需要安装的插件
; <- 左边依赖右边
; magit <-  dash 2.10.0 / emacs 24.4 / git-commit 2.1.0 / magit-popup 2.1.0 / with-editor 2.1.0
; ace-window <- avy
; helm <- async 1.3 / cl-lib 0.5 / emacs 24 / helm-core 1.7.4
; smartparens <- cl-lib 0.3 / dash 2.10.0
; projectile <- pkg-info 0.4 / dash 2.10.0
; impatient-mode <- simple-httpd 1.4.0 /  htmlize 1.40
; company-web <- company 0.8.0 / dash 2.8.0 / web-completion-data 0.1.0
(defvar required-packages
  '(
    dash
    yasnippet
    fiplr
    async
    avy
    ace-window
    flx
    flx-ido
    evil
    evil-escape
    evil-matchit
    evil-visualstar
    evil-nerd-commenter
    emmet-mode
    color-theme
    company
    web-completion-data
    company-web
    lush-theme
    linum-relative
    helm
    hydra
    hipster-theme
    htmlize
    project-explorer
    js2-mode
    js2-refactor
    magit
    multiple-cursors
    smex
    sr-speedbar
    smart-mode-line
    smartparens
    simple-httpd
    impatient-mode
    web-mode
    window-numbering
    projectile
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
