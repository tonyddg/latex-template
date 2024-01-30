# 华中科技大学非官方论文模板
提供文档类 `hust/hust` 与封面宏包 `hust/cover`

参考自模板 <https://github.com/SukunaShinmyoumaru-hust/Hust-undergraduate-thesis>

不包含定理环境与算法环境  

## 已知问题
编译后有警告
```
The definition of \label has changed! 
(nameref)	Check your packages! 
(nameref)	Replacing it with the kernel definition.
```

## 模板选项
* 参数 doctitle 文章名称 (默认值 `华中科技大学毕业设计`)  
用于页眉显示, 非文章封面
* 参数 fontset 字体方案 (默认值 `source`)  
    * `none` 不使用预设的字体方案
    * 其他[参数参考](/utility/README.MD#中文字体方案-fontsetsc)
* 参数 plan 排版方案 (默认值 `hgp`)
    * `hgp` 使用与[参考模板](https://github.com/SukunaShinmyoumaru-hust/Hust-undergraduate-thesis/blob/main/template/hust.cls)一致的排版
    * `pst` 基于参考模板优化的排版, 具体见注释, 不一定满足标准
* 参数 docmode 文档类型 (默认值 `thesis`)
    * `thesis` 论文
    * `proposal` 报告
    * `translation` 文献翻译

## 实用命令
* `\reference{m}` 生成参考文档页, 参数将传入命令 `bibliography`
* `\keywordsch` 引出中文关键词
* `\keywordsen` 引出英文关键词
* `\abstractch` 中文摘要标题
* `\abstracten` 英文摘要标题
* `\intoappendix` 附录标题
* `\acknowledgement` 致谢标题
* `\originalart{m}` 插入翻译原文, 参数为原文 pdf
* `\sectionUnnumbered{m}` 不编号节

## 封面
使用前需要引入宏包 `\usepackage{hust/cover}`

### 封面信息设置
```latex
% 封面主标题
\renewcommand{\headCover}{本科生毕业设计}
% 封面次标题
\renewcommand{\subheadCover}{论文标题}

% 院系名称
\renewcommand{\collegeCover}{\;}
% 专业班级
\renewcommand{\classCover}{\;}
% 作者
\renewcommand{\authorCover}{\;}
% 学号
\renewcommand{\numberCover}{\;}
% 指导教师
\renewcommand{\teacherCover}{\;}

% 年
\renewcommand{\yearCover}{\;}
% 月
\renewcommand{\monthCover}{\;}
% 日
\renewcommand{\dayCover}{\;}
```

注意
* `thesis` 类型的文档不需要次标题
* `proposal` 类型的文档主标题默认可换行, 若不换行需要在末尾添加 `\\\;`

### 提供命令
* `\makecover{O}` 生成基本封面
    * 参数为文档类型, 默认参数为文档类的模板类型
* `\coverEnd` 进入正文    
在 `\makecover` 命令后, 可使用 `\includepdf` 插入要求页, 插入后使用该命令进入正文

## 文件结构
* example 使用示例
* res 模板资源
