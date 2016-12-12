%% LaTeX2e Formatklasse f�r Diplom- oder Studienarbeit    -*-Mode: LaTeX;-*-
%% Autor: Roland Bless 1996-2001 bless@telematik.informatik.uni-karlsruhe.de
%% --
%% (falls die Umlaute nicht richtig dargestellt werden: 
%%  der benutzte Zeichensatz ist ISO 8859-1!)
%% Hinweis f�r Literatur zu LaTeX 2e:
%% 1. Leslie Lamport: "Das LaTeX-Handbuch", Addison-Wesley 1995
%% 2. Goosens, Mittelbach, Samarin: "Der LaTeX-Begleiter"
%% Referenz und Grundbefehle sind in 1. zu finden, 2. erkl�rt
%% Zusatz-Pakete, die einem Dokument ein individuelleres Aussehen verleihen
%% k�nnen.
%%
%% Zusatzpakete und LaTeX k�nnen von ftp://ftp.dante.de bezogen werden
%% Fragen zu LaTeX: siehe FAQ auf http://www.dante.de
%%
%% $Id: wissdoc.cls 4 2005-10-10 20:51:21Z bless $
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01] % Sorry, wir brauchen LaTeX2e!
\ProvidesClass{wissdoc}[2001/01/24 Roland Bless - Wissenschaftliches Dokument]
\LoadClass[a4paper,11pt,titlepage,openright]{book} % diese Klasse basiert auf ``book''
% jan
%\RequirePackage{ngerman}[1998/07/08] % (V2.5e) Neue Rechtschreibung!
%\RequirePackage{german}[1998/07/08] % alte Rechtschreibung (>=V2.5e von german.sty)
\usepackage[T1]{fontenc}      % T1-encoded fonts: auch W�rter mit Umlauten trennen
\usepackage[latin1]{inputenc} % Eingabe nach ISO 8859-1 (Latin1)
                              % siehe Emacs: iso-accents-mode
%\usepackage[utf8]{inputenc}  % Eingabe nach UTF-8
\usepackage{ae}               % almost european, virtueller T1-Font
\usepackage[final]{graphicx}  % um Graphiken einzubinden
\usepackage{makeidx}          % wir wollen auch einen Index
\usepackage{vmargin}          % Seitenr�nder einstellen leichtgemacht
\usepackage{fancyhdr}         % definiere einfache Headings (mindestens V 1.99c
                              % notwendig)
\usepackage{array}          % fuer aufw�ndigere Tabellen
\usepackage{colortbl}       % farbige Tabellen (v. D. Carlisle)
\usepackage{longtable}      % seiten�bergreifende Tabellen

\usepackage[T1]{url} % much like \verb allow line breaks for paths and URLs
% Postscript Fonts
% times, palatino, newcent, bookman, garamond, basker, 
% lucid, lucidbrb, lucidbry (Kommerzielle Fonts von Y&Y)
%\usepackage{times}
%\usepackage{palatino}
% \usepackage{newcent}      %for sophisticated font style

% other interesting packages:
% \usepackage{varioref}
% \usepackage{verbatim}
% \usepackage{subfigure}
% \usepackage{color}
% \usepackage{shadow} % f�r schattierte Boxen etc.
% \usepackage{tabularx} % automatische Spaltenbreite
% \usepackage{supertab} % mehrseitige Tabellen
%% ---------------- end of usepackages -------------

%% Options
% Optionen:
% draft - L��t Titelseite, Inhaltsverzeichnis, Index, etc. weg.
%         Daf�r mu� allerdings die Unterst�tzung in der LaTeX Hauptdatei
%         vorhanden sein (\ifnotdraft{\include{bla...}}).
% relaxed - erlaubt etwas unsch�nere Abst�nde f�r automatische Zeilenumbr�che
% pdf     - setzt Optionen f�r pdf (wird aber automatisch bei pdflatex aktiviert)
\DeclareOption{draft}{\let\@draft\@empty}
\DeclareOption{relaxed}{\tolerance=1500 \emergencystretch=12pt}
\DeclareOption{pdf}{\@usepdfttrue}
%% Modifications
\let\@draft\@undefined %no draft
\newif\if@usepdf \@usepdffalse % not pdf ready
\ProcessOptions

\setcounter{secnumdepth}{3} % Numerierung auch f�r \subsubsection
\setcounter{tocdepth}{2}    % nimm auch \subsubsections ins Inhaltsverz. auf

%% Schusterjungen und Hurenkinder verhindern.
%% Siehe deutsches TeX-FAQ (6.1.3)
\clubpenalty = 10000
\widowpenalty = 10000
\displaywidowpenalty = 10000

%% New Commands
\newcommand{\ifnotdraft}[1]{\ifx\@draft\@undefined #1 \fi}
\newcommand{\ifnotdraftelse}[2]{\ifx\@draft\@undefined #1 \else #2 \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF dependent stuff (inspired by Frank P�hlke)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifx\pdftexversion\@undefined % kein PDFTeX aktiv
\else
\@usepdftrue % switch automatically to PDF mode
\fi

\if@usepdf
 \usepackage{ae}      % erzeuge lesbare Schriften (mit cmps-Fonts)
 \usepackage{color}   % f�r farbige Hyperlinks ben�tigt
 \usepackage[colorlinks=true,      
             linkcolor=black,      
             filecolor=black,      
             urlcolor=black,      
             citecolor=black,
%             raiselinks=true,%
             bookmarks=true,%
             bookmarksopenlevel=1,%
             bookmarksopen=true,%
             bookmarksnumbered=true,%
%             hyperindex=true,% 
             plainpages=false,% correct hyperlinks
             pdfpagelabels=true,% view TeX pagenumber in PDF reader
%             pdfborder={0 0 0.5}
             ]{hyperref} % erzeuge Hyperlinks z.B. f�r pdflatex
% \usepackage{thumbpdf}
 \pdfcompresslevel=9   % scheint zwar nichts zu bringen, aber was soll's
\else
  \usepackage{nohyperref}
\fi

\newif\if@usehyperref
\ifx\href\@undefined % Wenn kein hyperref Paket geladen
\@usehyperreffalse % hyperref used
\else
\@usehyperreftrue % hyperref used
\fi


% Das float-Paket muss NACH hyperref eingebunden werden,
% sonst klappt die PDF-Ausgabe nicht:
%\usepackage{float} %z.B. \floatstyle{ruled}

%% Seitengr��e mit vmargin-Paket einstellen
\setpapersize{A4}
% \setmarginsrb{randlinks}{randoben}{randrechts}{randunten}
%              {hoehekopf}{abstkopf}{hoehefuss}{abstfuss}
\setmarginsrb{3cm}{1cm}{3cm}{1cm}{6mm}{7mm}{5mm}{15mm}

%% Stil
\parindent 0cm                     % Absatzanfang wird nicht einger�ckt
\parskip1.5ex plus0.5ex minus0.5ex % Abstand zwischen zwei Abs�tzen

%\newcommand{\headfont}{\fontfamily{ppl}\selectfont}
%\newcommand{\headfont}{\sffamily}
\newcommand{\headfont}{\slshape}
\newcommand{\captionfont}{}
\newcommand{\chapterheadfont}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geaenderte Headings:
%% Seitenzahl normal, Text in slanted und nicht in Grossbuchstaben
%%
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\fancyhf{} % clear all header and footer fields
\fancyhead[LE,RO]{{\headfont\thepage}} % left/right header for even/odd pages
\fancyhead[LO]{\headfont\nouppercase{\rightmark}} % header for left side (odd)
\fancyhead[RE]{\headfont\nouppercase{\leftmark}} % right header for even pages
\renewcommand{\headrulewidth}{0.5pt} % head rule
\renewcommand{\footrulewidth}{0pt} % no rule
% plainstyle
\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
%\cfoot{\headfont\thepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linien f�r Bilder (ben�tigt float.sty)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Achtung! Folgende �nderungen sind evtl. vom benutzten float.sty abh�ngig,
% d.h. bei �nderungen des float.sty sind folgende Makros nicht mehr definiert
% oder unwirksam. In diesem Fall mu� erneut angepa�t werden.
%\newlength{\float@capnamewd}   % neu
%\newlength{\float@cparwidth}   % neu
%\newsavebox{\float@capnamebox} % neu
%\renewcommand\floatc@ruled[2]{%
%\savebox{\float@capnamebox}{\@fs@cfont #1\hspace*{1.5ex}}
%\settowidth{\float@capnamewd}{\usebox{\float@capnamebox}}%
%\setlength{\float@cparwidth}{\hsize}%
%\addtolength{\float@cparwidth}{-1.0\float@capnamewd}%
%\usebox{\float@capnamebox}\parbox[t]{\float@cparwidth}{#2\par}}
%\renewcommand\fs@ruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
%\def\@fs@pre{}%
%\def\@fs@post{\kern2.5pt\hrule height.1pt depth0pt\relax}%
%\def\@fs@mid{\kern2pt\hrule height.1pt depth0pt \kern2.5pt}%
%\def\@fs@cfont{\captionfont\bfseries}
%\let\@fs@iftopcapt\iffalse}
%\floatstyle{ruled}
%\restylefloat{figure}
%\restylefloat{table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Stil der Ueberschriften
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\chaptername}{}

\renewcommand{\chapter}{%
\@startsection{chapter}%
{0}% Gliederungsebene
{0mm}% Einzug
{0.5ex plus 1ex minus 1.2ex}% Vorabstand
{5ex plus 0.5ex minus 0.5ex}% Nachabstand
{\clearpage\chapterheadfont\Huge\bfseries}% Stil
}

\renewcommand{\section}{%
\@startsection{section}%
{1}% Gliederungsebene
{0mm}% Einzug
{1.5ex plus 1ex minus 1.2ex}% Vorabstand
{0.5ex plus 0.5ex minus 0.5ex}% Nachabstand
{\chapterheadfont\Large\bfseries}% Stil
}
\renewcommand{\subsection}{%
\@startsection{subsection}%
{2}%
{0mm}%
{1ex plus 1ex minus 1ex}%
{0.3ex plus 0.3ex minus 0.3ex}%
{\chapterheadfont\large\bfseries}%
}
\renewcommand{\subsubsection}{%
\@startsection{subsubsection}%
{3}%
{0mm}%
{1ex plus 1ex minus 1ex}%
{0.2ex plus 0.2ex minus 0.2ex}%
{\chapterheadfont\normalsize\bfseries}%
}
\renewcommand{\paragraph}{%
\@startsection{paragraph}%
{4}%
{0mm}%
{2ex plus 1ex minus 2ex}%
{0.2ex plus 0.2ex minus 0.2ex}%
{\chapterheadfont\normalsize\bfseries}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Stil der Kapitelueberschrift 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\chapnolen}
\newlength{\chapparlen}
\newsavebox{\chapno}
%% Kein ``Kapitel'' bei Kapitel�berschrift
% \renewcommand{\@chapapp}{} allein reicht nicht!
%% \chapter{...}
\renewcommand{\@makechapterhead}[1]{%
  \vspace*{0.2\textheight}%
  %\hrule
  \vskip 15\p@
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \savebox{\chapno}{\chapterheadfont\huge\bfseries \thechapter.}
        \settowidth{\chapnolen}{\usebox{\chapno}}
        \parbox[t]{\chapnolen}{\usebox{\chapno}}\nobreak\leavevmode
%        \par\nobreak
%        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@MM
    \setlength{\chapparlen}{\textwidth}
    \addtolength{\chapparlen}{-1.0\chapnolen}
    \addtolength{\chapparlen}{-2ex}
    \leavevmode\nobreak
    \parbox[t]{\chapparlen}{\raggedright\chapterheadfont\huge \bfseries #1\par\nobreak}
    %\the\textwidth
    %\the\chapparlen
    %\the\chapnolen
    %\vskip 20\p@
    %\rule{\textwidth}{1pt}
    \vskip 40\p@
  }}

%% \chapter*{...}
\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \chapterheadfont \huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Inhaltsverzeichnis (auch andere Fontfamilie)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\pdfbookmark{\contentsname}{\contentsname}\chapterheadfont\oldtableofcontents}}
\let\@olddottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{\@olddottedtocline{#1}{#2}{#3}{#4}{\chapterheadfont #5}}

%% pagestyle fuer Titelseite:
\def\titlehead#1{\def\@titlehead{#1}}
\def\titlefoot#1{\def\@titlefoot{#1}}
\def\@titlehead{}
\def\@titlefoot{}

\def\ps@title{%
\headheight 15mm
\footskip   0cm
\addtolength{\textheight}{-15mm}
\let\@mkboth\@gobbletwo%
  \def\@oddhead{\vbox{\hbox to\textwidth{\@titlehead}
                \vskip 1.5mm
                \hbox to\textwidth{\hrulefill}}}
  \def\@oddfoot{\vbox{\vskip -1mm\hbox to\textwidth{\hrulefill}\vskip 1mm
                \hbox to\textwidth{\@titlefoot}}}
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
}

\renewenvironment{titlepage}
{%
  \let\oldheadheight\headheight
  \let\oldfootskip\footskip
  \let\oldtextheight\textheight
  
   \cleardoublepage
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse\newpage
    \fi
    \thispagestyle{title}%
    \setcounter{page}\@ne
}%
{\if@restonecol\twocolumn \else \newpage \fi
 \if@twoside\else
    \setcounter{page}\@ne
 \fi
 \let\headheight\oldheadheight
 \let\textheight\oldtextheight
 \let\footskip\oldfootskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% jan
%\renewcommand{\bibname}{Literatur}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Stil Index-Seite
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{theindex}
{\if@twocolumn
   \@restonecolfalse
 \else
   \@restonecoltrue
 \fi
 \columnseprule \z@
 \columnsep 35\p@
 \twocolumn[\@makeschapterhead{\indexname}]%
 \@mkboth{\indexname}%
         {\indexname}%
 \thispagestyle{fancy}\parindent\z@
 \parskip\z@ \@plus .3\p@\relax
 \let\item\@idxitem
 \raggedright}

\newtheorem{definition}{Definition}[chapter]
\newtheorem{satz}{Satz}[chapter]

%% **** END OF CLASS ****