;; Wind-move
(global-set-key (kbd "C-c C-j") 'windmove-left)
(global-set-key (kbd "C-c C-k") 'windmove-down)
(global-set-key (kbd "C-c C-l") 'windmove-up)
(global-set-key (kbd "C-c C-;") 'windmove-right)

;; 覆盖原始的M-x，启用helm
; (global-set-key (kbd "M-x") 'helm-M-x)

;; 绑定comment-dwim-2注释插件快捷键
; (global-set-key (kbd "M-;") 'comment-dwim-2)

;; 绑定注释插件快捷键
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)

;; 默认
;; 复制  c-insert
;; 粘贴  
;; undo  c-/

;; smex
(global-set-key (kbd "M-x") 'smex)

;; sr-speedbar 侧边栏
; (global-set-key (kbd "C-c C-k") 'sr-speedbar-toggle)