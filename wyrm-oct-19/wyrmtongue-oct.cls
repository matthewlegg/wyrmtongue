\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{wyrmtongue-oct}[2019/09/28 for the freshers/october
  issues of Wyrmtongue, the Imperial College Sci-fi & Fantasy society
  newsletter]

%% DEPENDENCIES

% encoding & page layout
\LoadClass[a4paper,12pt]{article}
\RequirePackage[bottom=2.5cm,left=2cm,right=2cm,top=2cm]{geometry}

\RequirePackage{graphicx} % image imports
\RequirePackage{tgschola} % default font
\RequirePackage{textcomp} % symbols

% no indent + spacing between paragraphs
\RequirePackage{parskip}
\setlength{\parskip}{1em}
\newcommand{\@minipagerestore}{\setlength{\parskip}{1em}}

%% TOMBSTONE % (the little sci-fi symbol marking the end of an article)
\newcommand{\tombstone}{$\mathbf{\Psi\!\Phi}$}

%% FOOTNOTE SYMBOLS
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}

%% HEADER FONT
\newcommand{\altfont}[1]{\textbf{\fontfamily{ppl}\selectfont #1}}

%% HEADERS
\newcommand{\pagehead}[1]{%
  \parbox[t][\baselineskip]{\textwidth}{\centering \Huge \altfont{#1}}
  \par\vspace{1em}
  \hrule
  \vspace{0.5em}
}
\newcommand{\subhead}[1]{
  \vspace{1em}
         {\Large \textbf{#1}}\par
}

%% ARTICLE
% the pieces written by committee members.

\RequirePackage{ifoddpage} % conditional layout on odd/even pages
\RequirePackage{lettrine}  % drop-caps

% profile column %
\newcommand{\@articleprofile}[3]{%
  \begin{minipage}[t]{0.25\textwidth}%
    \vspace{-\parskip}\includegraphics[width=\textwidth]{img/profile/#1}
    \begin{flushright}
      {\Large \altfont{#2}}%
      \setlength{\parskip}{0.3em}\par% tighter space between name & title
      \altfont{\mdseries #3}
    \end{flushright}
  \end{minipage}%
}

% article body text column %
\newcommand{\@articlebody}[1]{%
  \def\dropcap##1##2 {\lettrine[lines=3]{##1}{##2} }%
  \begin{minipage}[t]{0.7\textwidth}
    \vspace{-\parskip}\expandafter\dropcap\@@input txt/#1 \tombstone
  \end{minipage}%
}

\newcommand{\article}[4]{%
  % #1 - path (the command includes article body text from txt/#1.tex,
  %      and the profile column image from img/profile/#1.png)
  % #2 - title
  % #3 - name
  % #4 - role
  %
  % page is formatted such that the profile column is always placed at
  % the open edge of the page.
  \pagehead{#2}
  \checkoddpage\ifoddpage
  \@articleprofile{#1}{#3}{#4}\hfill\@articlebody{#1}
  \else
  \@articlebody{#1}\hfill\@articleprofile{#1}{#3}{#4}
  \fi
}

%% BOOK RECOMMENDATIONS

\newcommand{\bookrec}[4]{%
  % #1 - name
  % #2 - book title
  % #3 - author
  % #4 - tagline
  \vspace{0.5em}
  #1\newline
  \hspace*{1.5em}--- \altfont{#2}
  % if invoked without an author, the 'by #3' text is omitted.
  \if#3\empty\else by \fi{#3}\newline
  \hspace*{1.5em}\textit{#4}
}


%% TIMETABLE
% this file provides two different sets of definitions for the events
% timetable, which are maybe misleadingly named `calendar*` and
% `timetable*`. They correspond roughly to the formats used in the
% 2019 and 2018 Octber issues, but it might be necessary to put
% together something ad-hoc depending on what looks nice, and what
% information the Chair of Vice has provided.

%% TIMETABLE - CALENDAR
\RequirePackage{xcolor}
\renewcommand{\arraystretch}{1.3}

\newcommand{\calendarformat}{%
  l | l | *{4}{p{0.16\textwidth} |}
  p{0.07\textwidth}
}
\newcommand{\calendarhead}{SUN & MON & TUE & WED & THU & FRI & SAT}

%\newcommand{\calendarweek}[1]{#1\\}

\newcounter{calendardaycount}
\newcommand{\calendarday}[2][]{%
  \stepcounter{calendardaycount}
  \if#1\empty\else\setcounter{calendardaycount}{#1}\fi
  \texttt{\arabic{calendardaycount}}
  \par#2
}
\newcommand{\calendardayalt}[2][]{%
  \stepcounter{calendardaycount}
  \if#1\empty\else\setcounter{calendardaycount}{#1}\fi
  \texttt{\color{gray!50} \arabic{calendardaycount}}
  \par#2
}

\newcommand{\calendarevent}[3]{%
  \raggedright
  \textbf{#2}
  \def\tmp{#3}\ifx\tmp\empty \else \par\textit{#3} \fi
  \def\tmp{#1}\ifx\tmp\empty \else \par{\footnotesize #1}\fi
}

\newenvironment{calendar}[2]{%
  \begingroup \small
  % #1 - month name
  % #2 - table row format
  \begin{center}
    \vspace{-0.5em}
    \subhead{\uppercase{#1}}
    \edef\tmp{\noexpand\begin{tabular}{\calendarformat}}
    \tmp
    \calendarhead
}{
      \end{tabular}
  \end{center}
  \endgroup
}


%% TIMETABLE - LIST
\RequirePackage{lscape} % render individual pages in landscape
\newenvironment{timetable}{}{}

\newlength{\timetablemonth@leftmargin}
\newenvironment{timetablemonth}[2]{%
  % #2 - month
  % #1 - date format
  {\centering \subhead{\MakeUppercase{#2}}}
  \hrule
  % calculate leftmargin according to date format supplied so that the
  % start of the date always aligns with the left of the
  % paragraph.
  \settowidth{\timetablemonth@leftmargin}{\texttt{#1N}}
  \begin{itemize}[leftmargin=\timetablemonth@leftmargin]
}{
  \end{itemize}
}

\newcommand{\timetableevent}[4]{%
  % #1 - date & day of week
  % #2 - time & location
  % #3 - name
  % #4 - description
\item[\texttt{#1}]
  \def\tmp{#4}\ifx\tmp\empty #3\else{\textbf{#3}\newline\textit{#4}}\fi%
  \def\tmp{#2}\ifx\tmp\empty \else\newline{\footnotesize \texttt{#2}}\fi%
}


%% GETTING INVOLVED
\newcommand{\socialmedia}[3]{
  % #1 - icon
  % #2 - url/username
  % #3 - tagline
  \vspace{0.5em}
  \parbox{0.12\textwidth}{
    \raggedleft \includegraphics[width=2em]{img/icons/#1}\hspace{1.5em}
  }%
  \parbox{0.88\textwidth}{
    {\texttt{#2}\newline\textit{#3}}
  }\par
}

%% CROSSWORD
% we're using cwpuzzle to typeset the grid, but rolling our own macros
% for the clues.

\RequirePackage[small,unboxed]{cwpuzzle}
\RequirePackage{enumitem,multicol}

% counts the number of characters in its argument.
\newcommand{\chcount}[1]{%
  \def\ch@gobble{\let\ch= }%
  \def\ch@next{\afterassignment\ch@step\ch@gobble}%
  \def\ch@step{%
    \ifx\ch\ch@end\let\next=\relax%
    \else%
    \advance\n by 1%
    \let\next=\ch@next%
    \fi%
    \next%
  }%
  \newcount\n%
  \afterassignment\ch@step\ch@gobble #1\ch@end%
  \the\n%
}

% blank underscore, for fill-in-the-blank type clues.
\newcommand{\crosswordblank}[1][1.8em]{\rule{#1}{0.4pt}}

% a list of crossword clues.
\newenvironment{crosswordclues}[2][]{
  % #1 - (optional) additional options for \itemize
  % #2 - header text (usually ACROSS / DOWN)
  %
  % a single crossword clue
  \newcommand{\clue}[3]{%
    % #1 - label number
    % #2 - solution
    % #3 - clue text
    %
    % note that \chcount doesn't strip whitespace, so if the clue is
    % more than one word, the argument must be supplied without
    % spaces for this command to produce a correct clue.
  \item[\texttt{##1}] ##3~\texttt{(\chcount{##2})}
  }
  \textbf{\small #2}
  \begingroup\footnotesize
  \begin{itemize}[itemsep=0pt,topsep=0pt,leftmargin=*,#1]
}{
  \end{itemize}
  \endgroup%
}


