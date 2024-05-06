\ProvidesClass{hust/hust}

\LoadClass[a4paper]{article}
\RequirePackage{hust/pkgs}

%=============== 参数 ================%

\SetupKeyvalOptions {
    family=HUST,
    prefix=HUST@,
    setkeys=\setkeys
}

% 文档类型
\newcommand{\HUST@docmode}{thesis}
\DeclareVoidOption{thesis}{\renewcommand{\HUST@docmode}{thesis}} % 论文
\DeclareVoidOption{proposal}{\renewcommand{\HUST@docmode}{proposal}} % 报告
\DeclareVoidOption{translation}{\renewcommand{\HUST@docmode}{translation}} % 翻译

% 文档标题 \HUST@doctitle (不是封面标题, 用于页眉显示)
% 论文一般为 华中科技大学毕业设计
% 报告一般为 华中科技大学本科生毕业设计（论文）开题报告
% 翻译一般为 毕业设计（论文）参考文献译文
\DeclareStringOption[华中科技大学毕业设计]{doctitle}

% 字体方案 \HUST@fontset, 可选方案有 
% source 思源字体方案
% noto 谷歌 noto 字体方案
% fz 方正字体方案
% none 不使用预设方案
\DeclareStringOption[source]{fontset}

% 页面方案, 以 \HUST@plan, 可选方案有
% hgp 来自模板的方案 https://github.com/SukunaShinmyoumaru-hust/Hust-undergraduate-thesis.git
% pst 根据已有资料自定义的方案
\DeclareStringOption[hgp]{plan}

\ProcessKeyvalOptions*

%============== 中文字体 ===============%

% 基本字体方案由参数确定, 默认启用方正楷体
\RequirePackage[fontset=\HUST@fontset,fzkt]{utility/fontsetsc}

%============== 页面格式 ===============%

% 页边距
\geometry{left=1.25in,right=1.25in,top=1.4in,bottom=1.4in}
\geometry{headsep=1em,footskip=3em}
\geometry{headheight=36.1pt}

\setstretch{1.625}                  % 行间距 (latex=word*13/12)
\setlength{\parskip}{3pt}           % 段间距
% \setlength{\parindent}{0.0in}     % 段落缩进

% 页眉与页脚样式
\pagestyle{fancy}
\fancyhf{}
\definecolor{headblue}{RGB}{46,116,181}

% 设置页眉样式

% 页眉标题
\newcommand{\HUST@header}{
    \IfStrEqCase{\HUST@docmode}{
        {translation}{\ziju{0.5}\HUST@doctitle}
        {proposal}{\HUST@doctitle}
        {thesis}{\ziju{1}\HUST@doctitle}
    }
}

% 页眉样式
\IfStrEqCase{\HUST@plan}{
    {hgp}{% 页眉处使用双线红字
        \fancyhead[C]{\textcolor[RGB]{192,0,0}{
            \kaishu\bfseries\zihao{3}\HUST@header
        }}
        \def\headrule{
            {
                \if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
                \vspace*{1mm}
                {\color{headblue}\hrule\@height 0.5pt\@width\headwidth\vskip1pt}
                {\color{headblue}\hrule\@height 0.5pt\@width\headwidth}
                \vskip-2\headrulewidth\vskip-1pt
            }
            \vspace{35pt}
        }
    }
    {pst}{% 页眉处使用单线灰字
        \fancyhead[C]{\textcolor[RGB]{128,128,128}{
            \songti\zihao{5}\HUST@header
        }}
        \def\headrule{
            {
                \if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
                \vspace*{1mm}
                {\color{headblue}\hrule\@height 0.5pt\@width\headwidth}
                \vskip-2\headrulewidth\vskip-1pt
            }
            \vspace{35pt}
        }
    }
}

% 设置页脚样式
\fancyfoot[L]{\textcolor{headblue}{\rule[3pt]{6.7cm}{0.4pt}}}
\fancyfoot[C]{\zihao{5}\thepage}
\fancyfoot[R]{\textcolor{headblue}{\rule[3pt]{6.7cm}{0.4pt}}}

%============== 标题格式 ===============%

\IfStrEqCase{\HUST@plan}{
    {pst}{% 参照要求 http://one.hust.edu.cn/dcp/viewer.jsp?id=2193
        \IfStrEqCase{\HUST@docmode}{
            {translation}{
                \ctexset{
                    section={format={\sffamily\raggedright\bfseries\zihao{3}}}
                }
            }
            {proposal}{
                \ctexset{
                    section={
                        name={,、},
                        aftername=\hspace{0pt},
                        number={\chinese{section}},
                        format={\sffamily\raggedright\bfseries\zihao{3}}
                    }
                }
            }
            {thesis}{
                \ctexset{
                    % 使用小二
                    section={format={\sffamily\centering\bfseries\zihao{-2}}}
                }
            }
        }
        \ctexset{
            subsection={format={\sffamily\bfseries\zihao{4}}},
            subsubsection={format={\sffamily\bfseries\zihao{-4}}}
        }
    }
    {hgp}{
        \IfStrEqCase{\HUST@docmode}{
            {translation}{
                \ctexset{
                    section={format={\raggedright\bfseries\zihao{4}}},
                    subsection={format={\bfseries\zihao{-4}}},
                    subsubsection={format={\bfseries\zihao{-4}}}
                }
            }
            {proposal}{
                \ctexset{
                    section={
                        name={,、},
                        aftername=\hspace{0pt},
                        number={\chinese{section}},
                        format={\raggedright\bfseries\zihao{4}}
                    },
                    subsection={format={\bfseries\zihao{-4}}},
                    subsubsection={format={\bfseries\zihao{-4}}}
                }
            }
            {thesis}{
                \ctexset{
                    section={format={\centering\bfseries\zihao{-2}}},
                    subsection={format={\bfseries\zihao{4}}},
                    subsubsection={format={\bfseries\zihao{-4}}}
                }
            }
        }
    }
}

% 图表标题格式
\DeclareCaptionFont{hust}{\heiti\zihao{-4}}
\captionsetup{labelsep=quad}
\captionsetup{font=hust}
\captionsetup[figure]{skip={6pt}}
\captionsetup[table]{skip={0pt}}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
% 代码环境标题
\renewcommand{\lstlistingname}{代码}

%=============== 引用 ================%
\hypersetup{hidelinks}

% 按章编号
\newcommand{\HUST@setcounter}[1]{
    \IfStrEqCase{\HUST@plan}{
    {hgp}{
        \ifdefstring{\HUST@docmode}{thesis}{
            \expandafter\renewcommand\csname the#1\endcsname{\thesection-\arabic{#1}}
            \@addtoreset{#1}{section}
        }{}
    }
    {pst}{
        % 全部使用数字起止符连接
        \expandafter\renewcommand\csname the#1\endcsname{\thesection--\arabic{#1}}
        \@addtoreset{#1}{section}
    }
    }
}
\HUST@setcounter{figure}
\HUST@setcounter{table}
\HUST@setcounter{equation}
% \HUST@setcounter{algorithm}

% autoref
\def\equationautorefname{式}
% \def\algorithmautorefname{算法}
\def\footnoteautorefname{注}
\def\itemautorefname{项}
\def\figureautorefname{图}
\def\tableautorefname{表}
\def\appendixautorefname{附录}
\def\sectionautorefname{节}
\def\subsectionautorefname{节}
\def\subsubsectionautorefname{节}
% 代码环境
\def\lstlistingautorefname{代码}

%=============== 目录格式 ================%

\setcounter{tocdepth}{2}
\tocloftpagestyle{fancy}

\IfStrEqCase{\HUST@plan}{
    {pst}{
        \renewcommand{\cfttoctitlefont}{\sffamily\hfill\bfseries\zihao{-2}}
    }
    {hgp}{
        \renewcommand{\cfttoctitlefont}{\hfill\bfseries\zihao{-2}}
    }
}

\renewcommand{\contentsname}{目\hspace{1em}录}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftafterloftitleskip}{12pt}
\renewcommand{\cftdotsep}{0.75}
\renewcommand{\cftsecdotsep}{\cftdotsep}    % 设置 Section 引导点
\renewcommand{\cftbeforesecskip}{3pt}       % 设置段间距

%============== 列表格式 ===============%

\newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
    circle (.45em) node {\makebox[1em][c]{\small #1}};}}
\robustify{\circled}

\setenumerate[1]{label=(\arabic*)}
\setenumerate[2]{label=\circled{\arabic*}}
\setenumerate[3]{label=\Alph*.}

%============== 代码格式 ===============%

\lstdefinestyle{vscodec}{
    backgroundcolor=\color{white},
    basicstyle=\ttfamily\color{black}\footnotesize,
    commentstyle=\color[RGB]{0, 128, 0},
    keywordstyle=\color{blue},
    numberstyle=\ttfamily\color[RGB]{110, 118, 129}\footnotesize,
    stringstyle=\color[RGB]{163, 21, 21},
    frame=single,
    rulecolor=\color{black},
    numbers=left,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    showtabs=false,                  
    tabsize=4
}
\lstset{style=vscodec}

%============== 实用命令 ===============%

% 参考文献
\bibliographystyle{gbt7714-numerical}

\NewDocumentCommand\reference{m}{
    \clearpage
    \bibliography{#1}
    \addcontentsline{toc}{section}{参考文献}
}

% 关键词, 用于摘要结尾
% 中文关键词
\newcommand{\keywordsch}{{\sffamily\noindent\zihao{4}\bfseries 关键词：}}
% 英文关键词
\newcommand{\keywordsen}{{\sffamily\noindent\zihao{4}\bfseries Keywords: }}

% 定义加入目录的不编号标题
\newcommand{\sectionUnnumbered}[1]{
    \section*{#1}
    \addcontentsline{toc}{section}{#1}
}

% 摘要
% 中文摘要标题
\newcommand{\abstractch}{
    \clearpage
    \IfStrEqCase{\HUST@docmode}{
        {proposal}{}
        {translation}{{\noindent\bf\zihao{4}摘要：}}
        {thesis}{\sectionUnnumbered{摘\hspace{1em}要}}
    }
}

% 英文摘要标题
\newcommand{\abstracten}{
    \clearpage
    \IfStrEqCase{\HUST@docmode}{
        {proposal}{}
        {translation}{{\noindent\bf\zihao{4}Abstract: }}
        {thesis}{\sectionUnnumbered{Abstract}\sloppy}
    }
}

% 致谢标题
\newcommand{\acknowledgement}{
    \clearpage
    \IfStrEq{\HUST@docmode}{thesis}
    {
        \sectionUnnumbered{致\hspace{1em}谢}
    }
    {
        \sectionUnnumbered{致谢}
    }
}

% 文献翻译结尾插入原文
\newcommand{\originalart}[1]{
    \clearpage
    \begin{table}[h]
    \vspace{240pt}
    \centerline{\bf\zihao{3}参考文献原文}
    \end{table}
    \clearpage
    \includepdf[pages=-]{#1}
}

% 附录
\newcommand{\intoappendix}{
    \appendix
    \ctexset{
        section={
            name={附录,、},
            aftername=\hspace{0pt},
            number={\Alph{section}},
        }
    }
}
