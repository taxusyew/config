Editor Config
==============
# Emacs
> 暂时只是在windows 8 x64位上使用，并未兼容其他平台
> 只支持emacs 24


## 配置组织结构

```
.emacs.d
  |
  |-- init.el
  \-- init
        |
        |-- keybind.el
        |-- packages-config.el
        \-- packages-install.el
```
## 整体流程
1. emacs先找到`c:\Users\<USER>\AppData\Roaming\.emacs.d\`文件夹下的`init.el`
2. 根据`init.el`里面的配置先`load packages-config.el`
3. 在`packages-config`中又先 `load packages-install.el`来判断`required-packages`中还有没有未安装的插件，如果有则先安装，如果全都安装了则返回`packages-config`对所有插件进行配置
4. 等到emacs初始化完成以后，`init.el`里的`add-hook 'after-init-hook`就会生效，加载全局生效的`keybind.el`,其中使用`hydra`改写快捷键的调用，大幅提升对window的管理

## 目前添加的插件：
- dash
- yasnippet
- fiplr
- async
- avy
- ace-window
- flx
- flx-ido
- evil
- evil-escape
- evil-matchit
- evil-visualstar
- evil-nerd-commenter
- emmet-mode
- color-theme
- company
- lush-theme
- helm
- hydra
- hipster-theme
- htmlize
- project-explorer
- js2-mode
- js2-refactor
- magit
- smex
- sr-speedbar
- smart-mode-line
- smartparens
- simple-httpd
- impatient-mode
- web-mode
- window-numbering
- projectile

# Sublime 3
一直没有找到好的插件来解决跳出光标右侧字符：` , ; ] } ) ' " `

自己想到较好的方法是通过绑定tab快捷键来实现，判断如果光标右侧是这些字符的时候，就向右移动一个字符

但是在有snippet补全的情况下会有问题，自己的绑定优先级高于原生的`next_field`，所以同时存在两种情况的时候光标就不会移动到下一个补全区域

解决办法把`"keys": ["tab"], "command": "next_field"`在自己的键位绑定下面重写一次
后面的优先级比前面的高

# Total Command

