\LoadClass[a4paper,12pt]{article} % Classe du document

%--------------------- Packages ------------------------
\RequirePackage{hyperref}
\RequirePackage[french]{babel} %Langue du document
\RequirePackage[utf8]{inputenc} %Caractères spéciaux
\RequirePackage[section]{placeins}%Pour placement de section
\RequirePackage{fancyhdr}
\RequirePackage[left=2cm,right=2cm,top=2cm,bottom=4cm]{geometry} %Configuration de la page
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{eso-pic}
\RequirePackage{transparent}
\RequirePackage{graphicx}

\RequirePackage{afterpage} % Pour afficher le footer seulement sur la première page
%\RequirePackage{background}

%------------------------------ Setup ----------------------------------

\newcommand{\customsection}{%
\setmainfont{Quicksand}
\newfontfamily{\titillium}{Titillium Web}
\titleformat{\section}
  {\color{white}\normalfont\fontsize{40}{48}\selectfont\bfseries}
  {\thesection}
  {1em}
  {}
  \titlespacing*{\section}{0pt}{\dimexpr -5pt-\baselineskip}{\baselineskip}
  \renewcommand{\thesection}{}
  \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\titleformat*{\subsection}{ \LARGE\bfseries}
\titleformat*{\subsubsection}{ \Large\bfseries}
\titleformat*{\paragraph}{\large\bfseries}
\titleformat*{\subparagraph}{\large\bfseries} 

\setlength{\parindent}{40pt}
}

\hypersetup{
colorlinks=true,
linkcolor=black,
filecolor=magenta,
urlcolor=red,
}

%-------------------- Informations sur le rapport ----------------------
\newcommand{\formation}[1]{\renewcommand{\formation}{#1}}
\newcommand{\sujet}[1]{\renewcommand{\sujet}{#1}}
\newcommand{\titre}[1]{\renewcommand{\titre}{#1}}
\newcommand{\formateur}[1]{\renewcommand{\formateur}{#1}}
\newcommand{\logo}[1]{\renewcommand{\logo}{#1}}



\newcommand{\fairepagedegardeVun}{
\begin{titlepage}
	\AddToShipoutPictureBG*{% Ajoute une image en arrière-plan sur toutes les pages
		\AtPageLowerLeft{% Positionne l'image en bas à gauche de la page
			\hspace{\paperwidth}% Décale l'image à droite de la page
			\begin{tikzpicture}[remember picture, overlay]
			\node[opacity=0.6,inner sep=0pt,anchor=south east,shift={(0,0.5)}] at (current page.south east)
			{\includegraphics[width=14cm]{img/TitleImage.png}};
			\end{tikzpicture}	
		}%
	}
	\thispagestyle{TitlePageFooter}
	
	\background{img/Title.png}
	\vspace*{5.5cm}%Espace de 1cm
	
	\centering %Centraliser le contenu
	
	%\rule{\linewidth}{0.2 mm} \\[0.4 cm]
	{\titillium\fontsize{45}{55}\bfseries \titre \par} \
	%\rule{\linewidth}{0.2 mm} \\[1.5 cm]

\end{titlepage}
}

\newcommand{\fairepagedegardeVdeux}{
\begin{titlepage}
	\background{img/Title.png}
	\vspace*{5cm}%Espace de 1cm
	
	\centering %Centraliser le contenu
	
	\rule{\linewidth}{0.2 mm} \\[0.4 cm]
	{\huge\bfseries \titre \par} \
	\rule{\linewidth}{0.2 mm} \\[1.5 cm]

	\begin{minipage}{0.4\textwidth} %Minipage pour faire deux colonnes
		\begin{flushleft} \LARGE %Envoyer à gauche
			\emph{\textbf{Formateur :}} \\
			\formateur \\
			\end{flushleft}
	\end{minipage}
	~
	\begin{minipage}{0.5\textwidth}
		\begin{flushright} \large
			\includegraphics[width=1\textwidth]{img/TitleImage.jpg}
		\end{flushright}
	\end{minipage}\\[4cm]
	\vfill

	{\large \today\par} %Affichage de la date

\end{titlepage}
}

\newcommand{\background}[1]{%
\AddToShipoutPictureBG*{\includegraphics[width=\paperwidth,height=\paperheight]{#1}}
}

%-----------------------------------------------------------------------

%-------------------- Création Section ---------------------------------

\newcounter{mycounter}
\setcounter{mycounter}{0}
\newcommand{\myimage}[2]{%
    
    \pgfmathtruncatemacro{\myremainder}{mod(\themycounter,3)}
    \background{img/section\myremainder.png}
    \stepcounter{mycounter}
}
\newcommand{\mysection}[1]{%
    \clearpage
    \myimage{#1}{}
    \section{{#1}}%\textcolor{white}
    \begin{tikzpicture}[remember picture,overlay]
	\node[anchor=north west, font=\fontsize{60}{60}\selectfont\bfseries\color{white}] at ($(current page.north west)+(0.1cm,-0.4cm)$) {\two@digits{\themycounter}};
    \end{tikzpicture}
	
	
}

%-----------------------------------------------------------------------


%-------------------- Création footer ----------------------------------
\setlength{\footskip}{65pt}
\newcommand{\BackgroundPic}{%
	\put(0,0){%
		\parbox[b][\paperheight]{\paperwidth}{%
			\vfill
			\centering
			\includegraphics[width=\paperwidth,height=\paperheight,%
			keepaspectratio]{img/fg.png}%
			\vfill
		}
	}
}


\newcommand{\fairemarges}{
	% Supprime le header
	\fancyhead{}
	% Supprime la ligne de header
	\renewcommand{\headrulewidth}{0pt}
	\pagestyle{fancy}

	%%%%%%%%%%%%%%%% Création footer %%%%%%%%%%%%%%%%%%%%%
	\fancyfoot[L]{    
		\begin{picture}(0,0)
		\put(-35,-35){\includegraphics[scale=0.2]{\logo}}
		\end{picture}
    	}
	\fancyfoot[C]{}
	\fancyfoot[R]{\thepage} % remonte le footer de 15 pixels
}
\fancypagestyle{TitlePageFooter}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}\fancyfoot[L]{\hspace{-1cm}\LARGE{\textbf{Formateur :}} \\\hspace{-1cm}\formateur \\}}
%-----------------------------------------------------------------------

%-------------------- Création Table des matières ----------------------
\newcommand{\tabledematieres}{
	\tableofcontents
	\newpage
}

\renewcommand{\tableofcontents}{%
	\clearpage
	\null\vfill
	\begin{center}
		\Large\bfseries\contentsname\par
	\end{center}
	\vspace{10pt}
	\titlecontents{section}
		[0pt] % left margin
		{\vspace{0.5em}\bfseries} % formatting of section heading
		{\contentslabel{2.3em}} % section number
		{\hspace{1.5em}} % separator between number and title
		{\hfill\contentspage} % page number\vspace{10pt}
	\@starttoc{toc}%
	\vfill\newpage
}