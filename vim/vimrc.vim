" General Vim settings
	syntax on
	let mapleader=","
	set autoindent
	set tabstop=4
	set shiftwidth=4
	set dir=/tmp/
	set relativenumber 
	set number
	filetype indent plugin on
	set cursorline
	hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold



if has ('autocmd')
	augroup vimrc
		autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	augroup END
endif



	set hlsearch
	nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>
	nnoremap <C-c> :set norelativenumber<CR>:set nonumber<CR>:echo "Line numbers turned off."<CR>
	nnoremap <C-n> :set relativenumber<CR>:set number<CR>:echo "Line numbers turned on."<CR>

	nnoremap n nzzzv
	nnoremap N Nzzzv

	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg

	map <tab> %

	set backspace=indent,eol,start

	nnoremap <Space> za
	nnoremap <leader>z zMzvzz

	nnoremap vv 0v$

	set listchars=tab:\|\ 
	nnoremap <leader><tab> :set list!<cr>
	set pastetoggle=<F2>
	set mouse=a
	set incsearch

" Language Specific
	" General
		inoremap <leader>for <esc>Ifor (int i = 0; i < <esc>A; i++) {<enter>}<esc>O<tab>
		inoremap <leader>if <esc>Iif (<esc>A) {<enter>}<esc>O<tab>
		

	" Java
		inoremap <leader>sys <esc>ISystem.out.println(<esc>A);
		vnoremap <leader>sys yOSystem.out.println(<esc>pA);

	" Java
		inoremap <leader>con <esc>Iconsole.log(<esc>A);
		vnoremap <leader>con yOconsole.log(<esc>pA);

	" C++
		inoremap <leader>cout <esc>Istd::cout << <esc>A << std::endl;
		vnoremap <leader>cout yOstd::cout << <esc>pA << std:endl;

	" C
		inoremap <leader>out <esc>Iprintf(<esc>A);<esc>2hi
		vnoremap <leader>out yOprintf(, <esc>pA);<esc>h%a

	" Typescript
		autocmd BufNewFile,BufRead *.ts set syntax=javascript
		autocmd BufNewFile,BufRead *.tsx set syntax=javascript

	" Markup
		inoremap <leader>< <esc>I<<esc>A><esc>yypa/<esc>O<tab>


" File and Window Management 
	inoremap <leader>w <Esc>:w<CR>
	nnoremap <leader>w :w<CR>

	inoremap <leader>q <ESC>:q<CR>
	nnoremap <leader>q :q<CR>

	inoremap <leader>x <ESC>:x<CR>
	nnoremap <leader>x :x<CR>

	nnoremap <leader>e :Ex<CR>
	nnoremap <leader>t :tabnew<CR>:Ex<CR>
	nnoremap <leader>v :vsplit<CR>:w<CR>:Ex<CR>
	nnoremap <leader>s :split<CR>:w<CR>:Ex<CR>

" Return to the same line you left off at
	augroup line_return
		au!
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\	execute 'normal! g`"zvzz' |
			\ endif
	augroup END

" Future stuff
	"Swap line
	"Insert blank below and above:
execute pathogen#infect()
set background=dark
let g:solarized_termtrans = 1 " This gets rid of the grey background

colorscheme solarized

"PYTHON
	autocmd Filetype python,py inoremap ;pri <esc>Iprint(<esc>A)

	autocmd Filetype python,py inoremap ;js <esc>I"<esc>ea":<esc>wi"<esc>A",
	autocmd Filetype python,py inoremap ;ran <esc>Ifor<space>i<space>in<space>range(<esc>A):<enter>


"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
	autocmd Filetype markdown map <F5> :!pandoc.exe<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>
	autocmd Filetype rmd map <F5> :!echo<space>"Sys.setlocale(, 'Norwegian');<space>require(rmarkdown);<space>render(input<space>=<space>'<c-r>%',encoding<space>=<space>'UTF-8')"<space>\|<space>R.exe<space>--vanilla<enter>
	autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
    autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO



"""LATEX
	" Word count:
	autocmd FileType tex map <F3> :w !detex.exe \| wc -w<CR>
	autocmd FileType tex inoremap <F3> <Esc>:w !detex.exe \| wc -w<CR>
	" Compile document using xelatex:
	autocmd FileType tex inoremap <F5> <Esc>:!xelatex.exe<space><c-r>%<Enter>a
	autocmd FileType tex nnoremap <F5> :!xelatex.exe<space><c-r>%<Enter>
	" Code snippets
	autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ;li <Enter>\item<Space>
	autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ;bt {\blindtext}
	autocmd FileType tex inoremap ;nu $\varnothing$
	autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i

"""LATEX Logical symbols
	autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
	autocmd FileType tex inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
	autocmd FileType tex inoremap ;neg {\neg}
	autocmd FileType tex inoremap ;V {\vee}
	autocmd FileType tex inoremap ;or {\vee}
	autocmd FileType tex inoremap ;L {\wedge}
	autocmd FileType tex inoremap ;and {\wedge}
	autocmd FileType tex inoremap ;ra {\rightarrow}
	autocmd FileType tex inoremap ;la {\leftarrow}
	autocmd FileType tex inoremap ;lra {\leftrightarrow}
	autocmd FileType tex inoremap ;fa {\forall}
	autocmd FileType tex inoremap ;ex {\exists}
	autocmd FileType tex inoremap ;dia	{\Diamond}
	autocmd FileType tex inoremap ;box	{\Box}
	autocmd FileType tex inoremap ;gt	{\textgreater}
	autocmd FileType tex inoremap ;lt	{\textless}
"""LaTeX Linguistics Shortcuts
	autocmd Filetype tex inoremap ;nom {\textsc{nom}}
	autocmd FileType tex inoremap ;acc {\textsc{acc}}
	autocmd FileType tex inoremap ;dat {\textsc{dat}}
	autocmd FileType tex inoremap ;gen {\textsc{gen}}
	autocmd FileType tex inoremap ;abl {\textsc{abl}}
	autocmd FileType tex inoremap ;voc {\textsc{voc}}
	autocmd FileType tex inoremap ;loc {\textsc{loc}}
	autocmd Filetype tex inoremap ;inst {\textsc{inst}}
	autocmd FileType tex inoremap ;tipa \textipa{}<Space><++><Esc>T{i

