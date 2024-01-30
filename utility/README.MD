# Latex 实用宏包

## 中文字体方案 fontsetsc
### 字体方案说明
提供以下字体方案

* [思源字体](https://github.com/adobe-fonts)方案
    * 宋体 (`\songti`, main)
        * 基础字体 SourceHanSerifSC-Regular.otf
        * 加粗字体 SourceHanSerifSC-SemiBold.otf
        * 斜体 自动斜体
    * 黑体 (`\heiti`, sf)
        * 基础字体 SourceHanSansCN-Regular.otf
        * 加粗字体 SourceHanSansCN-Bold.otf
        * 斜体 自动斜体
    * 等宽字体 (`\dengkuan`, tt)
        * 基础字体 SourceHanMonoSC-Regular.otf
        * 加粗字体 SourceHanMonoSC-Bold.otf
        * 斜体 自动斜体
* [noto 字体](https://github.com/notofonts/noto-cjk/tree/main)方案
    * 宋体 (`\songti`, main)
        * 基础字体 NotoSerifCJKsc-Regular.otf
        * 加粗字体 NotoSerifCJKsc-SemiBold.otf
        * 斜体 自动斜体
    * 黑体 (`\heiti`, sf)
        * 基础字体 NotoSansCJKsc-Regular.otf
        * 加粗字体 NotoSansCJKsc-Bold.otf
        * 斜体 自动斜体
    * 等宽字体 (`\dengkuan`, tt)
        * 基础字体 NotoSansCJKsc-Regular.otf
        * 加粗字体 NotoSansCJKsc-Bold.otf
        * 斜体 自动斜体
* 方正字体方案
    * 宋体 (`\songti`, main)
        * 基础字体 FZSSK.TTF
        * 加粗字体 自动粗体
        * 斜体 自动斜体
    * 黑体 (`\heiti`, sf)
        * 基础字体 FZHTK.TTF
        * 加粗字体 自动粗体
        * 斜体 自动斜体
    * 等宽字体 (`\dengkuan`, tt)
        * 基础字体 FZKTK.TTF (方正楷体)
        * 加粗字体 自动粗体
        * 斜体 自动斜体

### 宏包选项
* 参数 fontset 选择方案 (默认值: `source`)
    * `source` 思源字体方案
    * `noto` noto 字体方案
    * `fz` 方正字体方案
* 选项 fzkt (默认不使用)  
启用时, 将导入方正楷体 (FZKTK.TTF) 作为楷体字体, 并提供命令 `\kaishu`
