\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{picocon-fanzine}[2020/02/19 for the Picocon Fanzine]

%% DEPENDENCIES

\LoadClass[a4paper,12pt]{article}
\RequirePackage[bottom=2.5cm,left=2cm,right=2cm,top=2cm]{geometry}

\RequirePackage{graphicx} % image imports

% no indent + spacing between paragraphs
% (also, preserve spacing in minipages)
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


\newcommand{\storyhead}[3]{
  \section[%
    #1
    \newline{\normalfont #2}
    \newline{\normalfont\footnotesize\textit{#3}}%
  ]{%
    #1
    \newline by #2
  }
}
\newcommand{\story}[4]{
  % #1 - title
  % #2 - author
  % #3 - hook
  % #4 - content path
  \storyhead{#1}{#2}{#3}
  \input{#4}
  \tombstone
}
