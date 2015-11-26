(require 'hydra)

;; 字体缩放
(defhydra hydra-zoom ()
  "zoom"
  ("l" text-scale-increase "large")
  ("s" text-scale-decrease "small"))
(global-set-key (kbd "<C-f2>") 'bookmark-set)
(global-set-key (kbd "<f2>") 'bookmark-jump)
(global-set-key (kbd "<f5>") 'hydra-zoom/body)
(global-set-key (kbd "<f6>") 'recentf-open-files)
(global-set-key (kbd "<f8>") 'neotree-toggle)
(global-set-key (kbd "C-<return>") 'evil-open-below)
(global-set-key (kbd "C-S-<return>") 'evil-open-above)
;; 不再使用 SPC-4 来到结尾，要不和 C-a 不配套
;; 参照 https://github.com/fukamachi/.emacs.d/blob/master/inits/10-evil.el
;; 这条语句不生效 (global-set-key (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)

                                        ; 不再使用默认的
                                        ; ;; Wind-move
                                        ; (global-set-key (kbd "C-c C-j") 'windmove-left)
                                        ; (global-set-key (kbd "C-c C-k") 'windmove-down)
                                        ; (global-set-key (kbd "C-c C-l") 'windmove-up)
                                        ; (global-set-key (kbd "C-c C-;") 'windmove-right)

;; 覆盖原始的M-x，启用helm
(global-set-key (kbd "M-x") 'helm-M-x)

;; 覆盖原始的C-x C-f，启用helm-find-files
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; 绑定comment-dwim-2注释插件快捷键
; (global-set-key (kbd "M-;") 'comment-dwim-2)

;; 绑定注释插件快捷键
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)

;; 默认
;; 复制  c-insert
;; 粘贴  
;; undo  c-/

;; smex
                                        ;; (global-set-key (kbd "M-x") 'smex)

;; sr-speedbar 侧边栏
                                        ;; (global-set-key (kbd "C-c C-k") 'sr-speedbar-toggle)

;; 水平分割window c-x 2
;; 垂直分割window c-x 3
;; 关闭其他window c-x 1
;; 改变window大小
                                        ;; (global-set-key (kbd "M-<down>") 'enlarge-window)
                                        ;; (global-set-key (kbd "M-<up>") 'shrink-window)
                                        ;; (global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
                                        ;; (global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
                                        ;; (global-set-key (kbd "C-[") 'indent-region)

(global-set-key
 (kbd "C-M-w")
 (defhydra hydra-window ()
   "window"
   ("h" windmove-left)
   ("j" windmove-down)
   ("k" windmove-up)
   ("l" windmove-right)
   ("-" shrink-window-horizontally)
   ("=" enlarge-window-horizontally)
   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
    "vert")
   ("x" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down))
    "horz")
   ("t" transpose-frame "'")
   ("o" delete-other-windows "one" :color blue)
   ("a" ace-window "ace")
   ("s" ace-swap-window "swap")
   ("d" ace-delete-window "del")
   ("i" ace-maximize-window "ace-one" :color blue)
   ("b" ido-switch-buffer "buf")
   ("q" nil "cancel")))

;; 光标插件
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; 有道词典快捷键
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+)

(global-set-key
 (kbd "C-M-e")
 (defhydra hydra-tag ()
   "html tag"
   ("d" web-mode-element-kill "delete all")
   ("r" web-mode-element-rename "rename")
   ("v" web-mode-element-vanish "delete self")
   ("w" web-mode-element-wrap "wrap")
   ("k" web-mode-element-previous)
   ("j" web-mode-element-next )
   ("u" web-mode-element-parent "parent" ) ))

;;-----------------------
;; org-capture
;;-----------------------
(global-set-key (kbd "<f9>") 'org-capture)
(setq org-capture-templates
      '(("l" "灵感" entry (file+headline "D:\\betamethasone\\lifelog\\创意.org" "创意")
         "* %?\n  %i\n  
          Added: %U %a")
        ("j" "日记" entry (file+datetree "D:\\betamethasone\\lifelog\\journal.org")
         "* %?\n\n输入于： %U\n  %i\n")
        ("t" "TODO" entry (file+datetree "D:\\betamethasone\\lifelog\\todo.org")
         "* TODO %^{Description} %?\n\n输入于： %U\n")
        ("c" "常识" entry (file+datetree "D:\\betamethasone\\lifelog\\common.org")
         "* %?\n\n输入于： %U\n")
        ("w" "worklog" entry (file+datetree "D:\\betamethasone\\lifelog\\worklog.org")
         "* %?\n\n输入于： %U\n")
        ("m" "meeting" entry (file+datetree "D:\\betamethasone\\lifelog\\journal.org")
         "* %^{title} :meeting:\n %?\n\n输入于： %U\n")))


;;-----------------------
;; evil-leader
;;-----------------------
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'eshell
  "k" 'kill-buffer
  "<tab>" 'switch-to-prev-buffer
  "f" 'projectile-find-file
  "1" 'hs-toggle-hiding
  ;; "4" 'end-of-line
  "5" 'evilmi-jump-items
  "q" '(lambda () (interactive) (evil-execute-macro 1 "q")))

;;-----------------------
;; 如果 neotree 和 evil-mode 快捷键有冲突
;; 参照 emacswiki 来进行修正
;; 如果使用 c-h m 来查看，依然是 neotree 的绑定模式
;;-----------------------
(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
