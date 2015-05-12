Editor Config
==============
# Emacs
组织结构

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
整体流程是emacs先找到init.el
根据里面的配置`load packages-config.el`
在packages-config中先 `load packages-install.el`判断有没有未安装的插件，如果没有则先安装，如果有则返回配置文件进行配置

目前添加的插件：
- magit
- yasnippet
- fiplr
- async
- helm
- flx
- flx-ido
- evil
- evil-escape

# Sublime 3
一直没有找到好的插件来解决跳出光标右侧字符：` , ; ] } ) ' " `

自己想到较好的方法是通过绑定tab快捷键来实现，判断如果光标右侧是这些字符的时候，就向右移动一个字符

但是在有snippet补全的情况下会有问题，自己的绑定优先级高于原生的`next_field`，所以同时存在两种情况的时候光标就不会移动到下一个补全区域

解决办法把`"keys": ["tab"], "command": "next_field"`在自己的键位绑定下面重写一次
后面的优先级比前面的高
