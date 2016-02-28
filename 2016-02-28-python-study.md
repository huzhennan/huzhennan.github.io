---
layout: post
title:  "Python Cheetsheet"
categories: Python
---

# Python Cheetsheet
## 实用的python内建函数
- dir([obj])
- help([obj])
- len(obj)
- open(fn, mode)
- rang([start,] stop[,step])
- raw_input(str)
- cmp(obj1, obj2)
- repr(obj) 或 `obj`

### 工厂函数
- int(obj), long(), float(), complex()
- str(obj), unicode(), basestring()
- list(), tuple()
- type(obj)
- dict()
- bool()
- set(), frozenset()
- object()
- classmethod()
- staticmethod()
- super()
- property()
- file()

##专用下划标识符
- _xxx 不用'from module import *'导入
- __xxx__ 系统定义名字
- __xxx 类中的私有变量名

##模块结构和而已
- 起始行（Unix)
- 模块文档
- 模块导入
- 变量定义
- 类定义
- 函数定义
- 主程序

##标准类型
- 数字(int long)
- 布尔(bool)
- 浮点数(float)
- 复数
- 字符串(str)
- 列表(list)
- 元组(tuple)
- 字典(dict)

##其他内建类型
- 类型(type)
- Null对象(None)
- 文件(file)
- 集合/固定集合
- 函数/方法
- 模块
- 类

##布尔测试
所有标准对象均可用于布尔测试，同类型的对象之间可以比较大小。每个对象天生具有布尔True或False值
**注:** 空对象、值为堆的任何数字或者Null对象None的布尔值都是False