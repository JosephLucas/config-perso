imap ,l <esc>A
imap ,o <esc>o
"""""""""""""""""""""
" Autocomplétitions "
"""""""""""""""""""""
inoremap ( ()<left>
"inoremap { {}<left>
"inoremap [ []<left>
inoremap " ""<left>
"inoremap ' ''<left>
"inoremap < <><left>

" Mise en page d'une ligne continu sur plusieurs lignes
  set wrap

" Type de fichiers à ignorer... ou presque
	set wildignore+=*.dvi,*.ps,*.pdf,*.fig,*.fig.bak
	set suffixes+=*.aux,*.log,*.toc

" Quelques variables pour les programmes principaux...
" pdflatex"
	let $LATEXCOMPILER = "./complatex.sh"
	let $VIEWER = "evince"
	let $PDFVIEWER = "evince"

" Réglages spécifiques gVim
	if has("gui_running")
		" Dossier du fichier comme dossier de travail de gVim
		set acd
	endif

" Tabulation
	set ts=2
	set sw=2

" Largeur de texte standard
	set tw=72

" Sauvegarde et compilation PDFLaTeX (-> PDF)
	map <F4> <ESC>:w<CR>:! $LATEXCOMPILER %<.tex<CR><CR>
	imap <F4> <ESC>:w<CR>:! $LATEXCOMPILER %<.tex<CR>a

" Visualisation PDF
	map <F3> :! $VIEWER %<.pdf &<CR><CR>
	imap <F3> <ESC>:! $VIEWER %<.pdf &<CR><CR>a

" Nettoyage des fichiers (en ligne de commande)
	map <F7> :!rm -f %<.aux %<.cb %<.cb2 %<.dvi %<.log %<.nav %<.out %<.ps %<.snm %<.toc %<-quarto.pdf %<-miformat.ps %<.pyg %<.synctex.gz<CR><CR>
	imap <F7> <ESC>:!rm -f %<.aux %<.cb %<.cb2 %<.dvi %<.log %<.nav %<.out %<.ps %<.snm %<.toc %<-quarto.pdf %<-miformat.ps %<.pyg %<.synctex.gz<CR><CR>a

""""""""""""""
" Raccourcis "
""""""""""""""
" Commentaire en LaTeX
	vmap ,com :s/^/% /<CR>
" TeX, LaTeX
	imap ,tex \TeX{}
	imap ,la \LaTeX{}

" Euro
	imap ,eu \euro{}
	imap ,,eu \,\euro{}
	imap _eu \,\textrm{\euro{}}

" (Sous-(sous-)Section numérotée
	imap ,s \section{}<ESC>i
	imap ,ss \subsection{}<ESC>i
	imap ,sss \subsubsection{}<ESC>i
	vmap ,s s\section{<ESC>pa}
	vmap ,ss s\subsection{<ESC>pa}
	vmap ,sss s\subsubsection{<ESC>pa}

" (Sous-)Section non-numérotée
	imap ,s* \section*{}<ESC>i
	imap ,ss* \subsection*{}<ESC>i
	imap ,sss* \subsubsection*{}<ESC>i
	vmap ,s* s\section*{<ESC>pa}
	vmap ,ss* s\subsection*{<ESC>pa}
	vmap ,sss* s\subsubsection*{<ESC>pa}

" Environnement quelconque
	imap ,env \begin{ENV}<CR>\end{ENV}<ESC>O
	vmap ,env S\begin{ENV}<CR>\end{ENV}<ESC>P

	" Mode maths en ligne
	imap ,$ $$<ESC>i
	vmap ,$ s$<ESC>pa$

" Mode maths centré
	imap ,$$ \[<CR>\]<ESC>O
	vmap ,$$ S\[<CR>\]<ESC>P

" Texte normal en mode maths
	imap ,rm \,\textrm{}<ESC>i

" Centrage
	imap ,c \begin{center}<CR>\end{center}<ESC>O
	vmap ,c S\begin{center}<CR>\end{center}<ESC>P

" Minipage
	imap ,mp \begin{minipage}[t]{.5\textwidth}<CR>\end{minipage}<ESC>O
	vmap ,mp S\begin{minipage}[t]{.5\textwidth}<CR>\end{minipage}<ESC>P

" Caractères italiques
	imap ,i \textit{}<ESC>i
	vmap ,i s\textit{<ESC>pa}
	
	imap ,is {\itshape<CR>}<ESC>O
	vmap ,is S{\itshape<CR>}<ESC>P

" Petites capitales
	imap ,sc \textsc{}<ESC>i
	vmap ,sc s\textsc{<ESC>pa}

" Verbatim
	imap ,vb \verb++<ESC>i
	vmap ,vb s\verb+<ESC>pa+

	imap ,vbt \begin{verbatim}<CR>\end{verbatim}<ESC>O
	vmap ,vbt S\begin{verbatim}<CR>\end{verbatim}<ESC>P
		
	imap ,vtt \begin{verbatimtab}[4]<CR>\end{verbatimtab}<ESC>O
	vmap ,vtt S\begin{verbatimtab}[4]<CR>\end{verbatimtab}<ESC>P

" Insertion tableau
	imap ,tab \begin{tabular}[t]{}<CR>\end{tabular}<ESC>k$i
	imap ,tabc \begin{tabular}[c]{}<CR>\end{tabular}<ESC>k$i
	imap ,hl \hline
	imap ,tn \tabularnewline <CR>
	imap _tn \tabularnewline

	imap ,al \begin{align*}<CR>\end{align*}<ESC>O
	vmap ,al S\begin{align*}<CR>\end{align*}<ESC>P

	imap ,ar \begin{array}[t]{rcl}<CR>\end{array}<ESC>O
	vmap ,ar S\begin{array}[t]{rcl}<CR>\end{array}<ESC>P

	imap ,eqn \begin{eqnarray*}<CR>\end{eqnarray*}<ESC>O

	imap ,sy \left\lbrace{}<CR>\begin{array}{rcl}<CR>\end{array}\right.<ESC>O

	vmap ,tab S\begin{tabular}[t]{}<CR>\end{tabular}<ESC>P

" Liste
	imap ,ite \begin{itemize}<CR>\end{itemize}<ESC>O\item<SPACE>
	vmap ,ite S\begin{itemize}<CR>\end{itemize}<ESC>P

	imap ,itb \begin{itemize}[<+->]<CR>\end{itemize}<ESC>O\item<SPACE>
	vmap ,itb S\begin{itemize}[<+->]<CR>\end{itemize}<ESC>P

	imap ,it \item

" Enumeration
	imap ,en \begin{enumerate}[1°)]<CR>\end{enumerate}<ESC>O\item<SPACE>
	vmap ,en S\begin{enumerate}[1°)]<CR>\end{enumerate}<ESC>P

	imap ,an \begin{enumerate}[a)]<CR>\end{enumerate}<ESC>O\item<SPACE>
	vmap ,an S\begin{enumerate}[a)]<CR>\end{enumerate}<ESC>P

" Initialisation de compteur 
	imap ,ct \setcounter{enumi}{}<ESC>i
	
" Enumeration avec initialisation de compteur
	imap ,ens \begin{enumerate}[1°)]<CR>\setcounter{enumi}{0}<CR>\end{enumerate}<ESC>O\item<SPACE>
	vmap ,ens S\begin{enumerate}[1°)]<CR>\setcounter{enumi}{0}<CR>\end{enumerate}<ESC>P
	
" Description
	imap ,des \begin{description}<CR>\end{description}<ESC>O\item[]<ESC>i
	vmap ,des S\begin{description}<CR>\end{description}<ESC>P

	imap ,itd \item[]<ESC>i

" Citation
	imap ,qt \begin{quote}<CR>\end{quote}<ESC>O
	vmap ,qt S\begin{quote}<CR>\end{quote}<ESC>P

" Pourcentage bien espacé
	imap ,% \,\%

