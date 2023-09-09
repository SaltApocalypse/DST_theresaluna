# 介绍
正在做一个月下的饥荒mod

# 仓库的一些约定（想到什么写什么）
## 自添加的文件命名
- 前排约定
必要内容/参数：`<required>`
可选内容/参数：`[optional]`

- modinfo.lua
设置：
    - 设置标签：`cfg_lab_<Label>`
    - 设置键：`cfg_<key>`
    - 设置值：`cfg_<Key>_<Value>`

**角色名**书写/标签：
- 月下
小写：`theresaluna`
大写：`THERESALUNA`
~~- 大月下~~
~~小写：`theresaluna_grownup`~~
~~大写：`THERESALUNA_GROWNUP`~~

~~**文件命名**格式：~~
~~- 类似官方的那些参考官方的格式~~
~~- 自定义： `角色名_文件名_可选的后缀`~~
~~例如血印槽（饥荒样式）：`theresaluna_sanguinebadge`~~

## 目前的实现和定义
1. 组件component：血印槽 `theresaluna_sanguine`