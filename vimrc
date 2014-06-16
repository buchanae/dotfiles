set bs=2
set laststatus=2
set clipboard=unnamed
set paste
set ruler
set cindent
set expandtab
set incsearch
set scrolloff=3
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set cinkeys=0{,0},:,0#,!,!^F
map <S-k> <Nop>
filetype plugin on

let g:pydiction_location = '/Users/abuchanan/.vim/pydiction-1.2/complete-dict'

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead wscript set filetype=python
au BufNewFile,BufRead *.thtml set filetype=php
au BufNewFile,BufRead *.test set filetype=php
au BufNewFile,BufRead *.scala set filetype=scala
au BufNewFile,BufRead *.mustache set filetype=mustache
au BufNewFile,BufRead *.ceylon set filetype=ceylon
au BufNewFile,BufRead *.forth set filetype=forth
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead buildfile set filetype=ruby
au BufNewFile,BufRead *.cljs set filetype=clojure
au BufNewFile,BufRead *.less set filetype=less


autocmd FileType make set noexpandtab

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END 

syntax on

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

set nocompatible               " be iMproved

" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
"set t_Co=256
"set t_Co=88
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  runtime! plugin/guicolorscheme.vim
  GuiColorScheme mine
else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme mine
endif

set autoindent
let vimclojure#ParenRainbow = 1
set backupcopy=yes
