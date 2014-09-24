set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = 'f'

Plugin 'scrooloose/nerdtree'

Plugin 'bling/vim-airline'

Plugin 'scrooloose/syntastic'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_php_checkers = ['php', 'phpmd']
" let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"

Plugin 'arthurzwl/taglist'
let Tlist_Show_One_File=1 "only show current file
let Tlist_Exit_OnlyWindow=1 "if taglist is the last windwow, exit vim
let Tlist_WinWidth=30
let Tlist_Auto_Open=1
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if has("gui_running")
    " 设定 linux
    "set guifont=Source\ Code\ Pro\ Regular:h14:cANSI
    set guifont=Source\ Code\ Pro\ Regular\ h14
endif

set nu!
set encoding=utf-8
set fileencodings=utf-8,chinese
set fileencoding=utf-8
"colorscheme evening
set ambiwidth=double
set autochdir
set autoindent cindent cinoptions=g0
set backspace=indent,eol,start
set fileformat=unix
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set formatoptions=tcqro
syntax on
set cmdheight=1
set laststatus=2
"set statusline=%F%m%r\ \|\ %Y,%{&fileencoding}\ \|%=\ %l/%L,%c\ \|\ %f
"au FileType php setlocal dict+="~/.vim/after/phpdict/php_funclist.txt"
colorscheme desert
