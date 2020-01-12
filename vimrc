let g:go_version_warning = 0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'fatih/vim-go'
Plugin 'molokai'
Plugin 'pangloss/vim-javascript'

" paragraph formatting
" commented out because Im' not sure it should apply to all files
" but I want to keep it here for reference. Maybe add some filetype
" matching for this
" set formatoptions=tq2ac

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" affects the behavior of backspace.
set backspace=indent,eol,start
" always have a status line
set laststatus=2
set clipboard=unnamed
set ruler
" set cindent
set expandtab
set incsearch
set scrolloff=3
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
" Seems to have an important effect on python indentation (and maybe other
" langs?) Can't remember where I got this. Typical cryptic vim.
" set cinkeys=0{,0},:,0#,!^F
map <S-k> <Nop>

let g:pydiction_location = '/Users/abuchanan/.vim/pydiction-1.2/complete-dict'

let g:go_fmt_command = "goimports"

" command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"filetype plugin on

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
au BufNewFile,BufRead *.mtr set filetype=miter
au BufNewFile,BufRead *.geo set filetype=glsl
au BufNewFile,BufRead *.star set filetype=python
"au BufNewFile,BufRead *.vert,*.frag set filetype=glsl


" au FileType python set autoindent
autocmd FileType make set noexpandtab
autocmd TextChanged,TextChangedI *.vert silent write
autocmd TextChanged,TextChangedI *.frag silent write
autocmd TextChanged,TextChangedI *.geo silent write
autocmd TextChanged,TextChangedI *muse.js silent write
autocmd TextChanged,TextChangedI *.glsl silent write

syntax on

" Set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction

autocmd BufEnter * call SetTerminalTitle()

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


" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
"
"set t_Co=256
"set t_Co=88
"if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  "\ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  "runtime! plugin/guicolorscheme.vim
  "GuiColorScheme tender
"else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
  colorscheme molokai
"endif

set nocompatible               " be iMproved

set hlsearch
set autoindent
set backupcopy=yes
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
