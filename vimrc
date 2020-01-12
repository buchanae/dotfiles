
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'fatih/vim-go'
Plugin 'molokai'
Plugin 'pangloss/vim-javascript'
"Plugin 'Shougo/deoplete.nvim'
Plugin 'dart-lang/dart-vim-plugin'

" paragraph formatting
" commented out because Im' not sure it should apply to all files
" but I want to keep it here for reference. Maybe add some filetype
" matching for this
" set formatoptions=tq2ac

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" yank to the system clipboard (I think?)
set clipboard=unnamed

" include the cursor position in the status line
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

" Make cnext and cprev wrap
" https://vi.stackexchange.com/questions/8534/make-cnext-and-cprevious-loop-back-to-the-begining
command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry
command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry
cabbrev cnext Cnext
cabbrev cprev CPrev
cabbrev lnext Lnext
cabbrev lprev Lprev

" Set the leader key to comma
let mapleader = ","

" Set some easy keybindings for vim-go stuff
autocmd FileType go nmap <Leader>d :GoDef<CR>
autocmd FileType go nmap <Leader>b :GoBuild<CR>
autocmd FileType go nmap <Leader>r :GoRun<CR>
autocmd FileType go nmap <Leader>n :cnext<CR>
autocmd FileType go nmap <Leader>m :cprevious<CR>
autocmd FileType go nmap <Leader>x :cclose<CR>

" vim-go settings
let g:go_version_warning = 0
let g:go_fmt_command = "goimports"
let g:go_template_autocreate = 0
"let g:go_list_type = "quickfix"

" autocomplete related stuff
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" disable the preview window for autocomplete
"set completeopt-=preview

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"


" command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
"filetype plugin on

au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead wscript set filetype=python
au BufNewFile,BufRead *.thtml set filetype=php
au BufNewFile,BufRead *.test set filetype=php
au BufNewFile,BufRead *.scala set filetype=scala
au BufNewFile,BufRead *.mustache set filetype=mustache
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead buildfile set filetype=ruby
au BufNewFile,BufRead *.less set filetype=less
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

" NOTE: seems broken with neovim
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"set viminfo='10,\"100,:20,%,n~/.viminfo

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


colorscheme molokai

" highlight all search matches
set hlsearch

set autoindent
set backupcopy=yes
