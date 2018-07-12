set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

" La touche leader pour les commandes
let mapleader = "é"

" Liste des configurations vim
syntax on
set cmdheight=1
set ignorecase
set autoindent
set ruler
set showcmd
" set colorcolumn=85
set rnu
set nu
set numberwidth=3
set shiftwidth=3
set backupcopy=yes
set tabstop=3
set wildmenu
set lazyredraw " permet d'accelerer les macros"
set backspace=indent,eol,start
set laststatus=2
set noerrorbells
set background=dark
set encoding=utf-8
set fileencoding=utf-8
set incsearch
set hlsearch
set cindent

" Key mapping pour le live preview latex
nnoremap <leader>p :LLPStartPreview<CR>

" Spell check
map <F6> :setlocal spell! spelllang=en_gb<CR>

" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"Alter Vim & Reload VIM
nnoremap <leader>av :tabnew $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" Status bar du bas
let g:lightline = {'colorscheme': 'wombat',}

" Gestion des tabs
nnoremap <leader>nt :tabnew
nnoremap <leader>dt :tabclose<CR>
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <leader><Tab> <C-W><C-W>
nnoremap <leader>c <C-W>c

" Emulation de la touche ESC
inoremap jj <ESC>
inoremap kk <ESC>

" Ajout des matching braces
inoremap {{ {<CR><CR>}<UP><TAB>

" Raccourics divers
nnoremap <leader>O ko<ESC>j
nnoremap <leader>o o<ESC>k
nnoremap <leader>f /
nnoremap <leader>F ?
nnoremap <C-k> ddkP
nnoremap <C-j> ddp
nnoremap <C-y> <C-x>
nnoremap <C-x> <C-a>
nnoremap <leader>sc :SyntasticToggleMode<CR>

" Insertion automatique de la date
nnoremap <leader>date "=strftime("%x %X")<CR>P
nnoremap <leader>nom iChatelan Matthieu

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <leader><space> za

" Sauver et quitter vim plus rapidement
nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>Q :q!<CR>

" Corrections automatiques typos
iabbr ture true
iabbr fasle false
iabbr MC Matthieu Chatelan

" Syntastic pour C++
" let g:syntastic_cpp_compiler='gcc'
" let g:syntastic_cpp_compiler_options='-std=c++11'

" Pour le plugin YCM
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_server_python_interpreter = '/usr/bin/python2'
"
" Default Autocomplete remap
inoremap <TAB> <C-n>

" Permet de quitter nerdTree quand on entre dans un fichier
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Coloration python
let python_highlight_all=1

" Pour les commentaires automatiques, mettre un espace avant les // ou /*
let g:NERDSpaceDelims = 1

" Couleur de font des objets dans le code
" Comment 		Comments within a program
" Constant 		Program constants, such as numbers, quoted strings, or true/false
" Identifier 	Variable identifier names
" Statement 	A programming language statement, if, while, ...
" PreProc 		A preprocessor, include, ...
" Type 			A variable datatype, such as int
" Special 		A special symbol, usually used for special characters \n, %s
" Underlined 	Text that should be underlined
" Error 			Text which contains a programming language error
highlight Comment ctermfg=cyan cterm=italic
highlight Constant ctermfg=Red
highlight Statement ctermfg=yellow cterm=bold
highlight PreProc ctermfg=magenta cterm=bold
highlight Type ctermfg=green cterm=bold
highlight Special ctermfg=cyan
highlight ColorColumn ctermbg=gray


"""LATEX

autocmd FileType tex noremap <leader>c :! pdflatex main.tex<CR><CR>

autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><Enter><Enter>\end{frame}<Enter><Enter><Esc>6kf}i
autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<Esc>T{i
autocmd FileType tex inoremap ;label \label{}<Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ;it \textit{}<Esc>T{i
autocmd FileType tex inoremap ;cite \cite{}<Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><Space>\\<Enter><Space>\\<Enter>\trans{``<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;np \newpage
autocmd FileType tex inoremap ;ms \medskip<Esc>
autocmd FileType tex inoremap ;ref \ref{}<Space><Esc>T{i
autocmd FileType tex inoremap ;aref \autoref{}<Space><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><Enter>\end{tabular}<Enter><Enter><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;bash \begin{lstlisting}[style=BASH]<CR><CR>\end{lstlisting}<Esc>ki
autocmd FileType tex inoremap ;java \begin{lstlisting}[style=JAVA]<CR><CR>\end{lstlisting}<Esc>ki
autocmd FileType tex inoremap ;center \begin{center}<CR><CR>\end{center}<Esc>ki
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<Tab>\const{<Tab><Enter><Enter>\end{tableau}<Enter><Enter><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<Space><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><Enter>\end{DELRN}<Enter><Enter><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;java \begin{lstlisting}[style=JAVA]<CR><CR>\end{lstlisting}
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;rn (\ref{})<Esc>F}i
autocmd FileType tex inoremap ;img \includegraphics[width=\textwidth]{}<Esc>T{i
autocmd FileType tex inoremap ;image \begin{figure}[!h]<CR>\centering<CR>\includegraphics[width=\textwidth]{}<CR>\caption{}<CR>\label{}<CR>\end{figure}<Esc>kkkA<Esc>i
