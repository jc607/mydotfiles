set nocompatible
call pathogen#infect()
call pathogen#helptags()

let mapleader = ","
syntax enable

" Mappings 

" Insert mode mappings 
inoremap <C-l> <space>=><space>
inoremap <C-c> :colorscheme<space><tab>
inoremap <C-s> <Esc>:w<CR>a
imap <leader>' ''<esc>i
imap <leader>" ""<esc>i
imap <leader>( ()<esc>i
imap <leader>[ []<esc>i
imap <leader>{ {}<esc>i

" Normal mode mappings 
nnoremap <C-s> :w<CR>
nnoremap <leader>ev :vs $MYVIMRC<CR>
nnoremap <leader>gs :Gstatus<CR><C-W>15+
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>rs :!clear;rspec --color spec<CR>
nnoremap <leader>a :Ack 
nnoremap <leader>d :bd<CR> 
nnoremap <leader>w :w<CR>
nnoremap <leader><cr> :noh<CR>
nnoremap <leader>l :ls<CR>:b
nnoremap <leader>t :CtrlP<CR>
nnoremap n nzz
nnoremap <leader>" ""<esc>i
nnoremap N Nzz
"Turn on the whole plugin                                            *'g:pymode'*
let g:pymode = 1
"Turn off plugin's warnings                                 *'g:pymode_warnings'*
let g:pymode_warnings = 1
"Add paths to `sys.path`                                         *'g:pymode_paths'*
"Value is list of path's strings. 
let g:pymode_paths = []
"Trim unused white spaces on save                    *'g:pymode_trim_whitespaces'*
let g:pymode_trim_whitespaces = 1
"Setup default python options                                *'g:pymode_options'*
let g:pymode_options = 1

" Visual mode mappings 
vnoremap < <gv
vnoremap > >gv

" Execute dot in the selection
vnoremap . :norm.<CR>
" 
" General settings 
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set gdefault
set guifont=Courier\ 10\ Pitch\ 14
"set guioptions-=Be
"set guioptions=aAc
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅
set noswapfile
set number
set shell=/bin/zsh
set showmatch
set smartcase
set smartindent
set term=screen-256color
set ts=4 sts=4 sw=4 expandtab
set visualbell
set winheight=5
set winheight=999
"set winminheight=5
set winwidth=84
" 

" 

" Show syntax highlighting groups for word under cursor
"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"  if !exists("*synstack")
"    return
"  endif
"  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

set background=dark
colorscheme solarized
" Autocommands {{{


" Markdown gets auto textwidth
au Bufread,BufNewFile *.md set textwidth=79

" .feature files are Cucumber.
au Bufread,BufNewFile *.feature set filetype=cucumber
" }}}

" Statusline {{{
hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1 guifg=#002B36
hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000 guifg=#89a1a1

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]\ 
set statusline+=%<pwd:%{getcwd()}\ 
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\ 
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\ 

set laststatus=2

" }}}

" vim: foldmethod=marker foldmarker={{{,}}}

