\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{picocon-fanzine}[2020/02/19 for the Picocon Fanzine]

%% DEPENDENCIES
\LoadClass[a4paper,12pt]{article}
\RequirePackage[bottom=2.5cm,left=2cm,right=2cm,top=2cm]{geometry}

%% unicode input + symbols
\RequirePackage[utf8]{inputenc}
\RequirePackage{textcomp}

%% default fonts
\RequirePackage{tgschola}
\renewcommand*{\ttdefault}{lmvtt}

%% image imports
\RequirePackage{graphicx}

%% no indent + spacing between paragraphs
%% (also, preserve spacing in minipages)
\RequirePackage{parskip}
\setlength{\parskip}{1em}
\newcommand{\@minipagerestore}{\setlength{\parskip}{1em}}

%% TOMBSTONE - the little sci-fi symbol marking the end of an article
\newcommand{\tombstone}{$\mathbf{\Psi\!\Phi}$}

%% HORIZONTAL SEPARATOR - for stories in more than one part
\newcommand{\hsep}{
  \vspace{0.2\baselineskip}
  \begin{center}\rule{0.1\textwidth}{0.4pt}\end{center}
  \vspace{0.7\baselineskip}
}

%% SECTION HEADER - for editorial & table of contents.
\newcommand{\head}[1]{
  {\Large\bf\MakeUppercase{#1}\par}
  \hrule
  \vspace{0.5em}
}

%% TABLE OF CONTENTS
\renewcommand{\tableofcontents}{
  \head{\contentsname}
  \@starttoc{toc}
}


%% STORY - format for short story
\newcommand{\addcontentsdesc}[1]{
  \addtocontents{toc}{\noindent\detokenize{#1}\leavevmode\par\medskip}
}
\newcommand{\storyhead}[3]{
  % add title & description to toc.
  \addcontentsline{toc}{section}{#1}
  \addcontentsdesc{
    #2\vskip .5em
    \hspace{1em}
    \parbox{0.7\textwidth}{\itshape #3}
  }
  \hfill
  \parbox{0.95\textwidth}{
    {\Large\textbf{#1}\par}\vspace{0.2em}
    by {#2}
  }\par\vspace{1em}
}
\newcommand{\story}[4]{
  % #1 - title
  % #2 - author
  % #3 - hook
  % #4 - path to text
  \storyhead{#1}{#2}{#3}
  \input{#4}
  \tombstone
}

%% FULL-PAGE ART
\newcommand{\artpage}[3]{
  % #1 - name
  % #2 - author
  % #3 - path to image
  \addcontentsline{toc}{section}{#1 {\normalfont \textemdash{} artwork by #2}}
  \includegraphics[width=\textwidth]{#3}
  \vfill
  #1 by #2
  \clearpage
}
