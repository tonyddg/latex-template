# Latex 实用模板库

个人 Latex 实用模板与宏库

## 编译环境
默认采用以下编译环境:  
TexLive 2023 + vscode + LaTeX WorkShop 插件  
Citation: Backend: bibtex

编译选项
```json
{
    "name": "xelatexmk",
    "command": "latexmk",
    "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-xelatex",
        "-outdir=%OUTDIR%", // build 文件夹
        "%DOC%" // 当前工作文件夹
    ],
    "env": {}
},
```

## 使用方法
使用模板中的例子编译时
* 将模板移动到仓库根目录下
* 将模板的主文件重命名为 `main.tex`
* 在 `main.tex` 第一句添加 `%!TEX root = ./main.tex`

自行使用模板时
* 将模板文件夹与 `utility` 文件夹复制到工作目录下
* 在工作目录的根目录下编写 `main.tex`, 调用模板
* 在 `main.tex` 第一句添加 `%!TEX root = ./main.tex`

## 已有模板
* [华中科技大学非官方论文模板](./hust/README.MD)

## 实用宏包
[详细说明](./utility/README.MD)

* 中文字体方案

## 文件结构
* build 构建文件夹
* res 共享资源文件夹
* utility 实用宏定义文件夹
* 其他 模板文件夹
