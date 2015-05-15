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

Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:syntastic_check_on_open=1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"

" syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_auto_jump=1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_enable_highlighting = 0
let g:syntastic_php_checkers = ['php']
let g:syntastic_python_checkers = ['pyflakes']
" let g:syntastic_python_checkers = ['pylint']
map cc :SyntasticCheck<CR>

Plugin 'arthurzwl/taglist'
let Tlist_Show_One_File=1 "only show current file
let Tlist_Exit_OnlyWindow=1 "if taglist is the last windwow, exit vim
let Tlist_WinWidth=30
let Tlist_Process_File_Always=1

Plugin 'scrooloose/nerdtree'
let g:NERDTree_title="[NERDTree]"
let NERDTreeHighlightCursorline=1
let NERDChristmasTree=1

Plugin 'vim-scripts/winmanager'
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth=30

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size=1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
map ,ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

nmap <silent> wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR>

" Plugin 'tpope/vim-fugitive'

Plugin 'Valloric/YouCompleteMe'

Plugin 'Yggdroot/LeaderF'
let g:Lf_ShortcutF = '<C-F>'
let g:Lf_WindowPosition = 0
let g:Lf_CommandMap = {'<C-F>': ['<C-D>'], '<C-Q>': ['<Esc>']}
let g:Lf_DefaultMode = 3

Plugin 'tpope/vim-commentary'
nmap <BS> gcc
vmap <BS> gc

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/SQLComplete.vim'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<C-v>'
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

"python syntax highlight
Plugin 'hdima/python-syntax'
let python_highlight_all = 1

"color theme
Plugin 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256
Plugin 'darkburn'

Plugin 'The-NERD-Commenter'
Plugin 'dantezhu/authorinfo'
let g:vimrc_author='Arthur Zhang'
let g:vimrc_email='zhangwenli@xiaomi.com'
let g:vimrc_homepage=''

nmap <F4> :AuthorInfoDetect<cr>

Plugin '2072/PHP-Indenting-for-VIm'

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

set t_Co=256
" colo darkburn
set background=dark
colorscheme solarized
" let g:solarized_termcolors=256
if has("gui_running")
    " 设定 linux
    "set guifont=Source\ Code\ Pro\ Regular:h14:cANSI
    set guifont=Source\ Code\ Pro\ Medium\ 14
    set background=dark
    colorscheme solarized
    let g:solarized_termcolors=256
endif

set nu!
set encoding=utf-8
set fileencodings=utf-8,chinese
set fileencoding=utf-8
syntax enable

set cul
set cuc

set ambiwidth=double
set autochdir
set autoindent cindent cinoptions=g0
set backspace=indent,eol,start
set fileformat=unix
set formatoptions=tcqro
syntax on
set cmdheight=1
set laststatus=2
set cc=80

set sw=4
set ts=4
set sts=4
set et

filetype indent on
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType html setlocal et sta sw=2 sts=2 ts=2
autocmd FileType smarty setlocal et sta sw=2 sts=2 ts=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置命令行和状态栏

" set cmdheight=1            " 设定命令行的行数为 1
" set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
" set statusline=%F%m%r\ \|\ %Y,%{&fileencoding}\ \|%=\ %l/%L,%c\ \|\ %f
                            " 设置在状态行显示的信息如下：
                            " %f    当前的文件名
                            " %F    当前全路径文件名
                            " %m    当前文件修改状态
                            " %r    当前文件是否只读
                            " %Y    当前文件类型
                            " %{&fileformat}
                            "       当前文件编码
                            " %{&fileencoding}
                            "       中文编码
                            " %b    当前光标处字符的 ASCII 码值
                            " %B    当前光标处字符的十六进制值
                            " %l    当前光标行号
                            " %c    当前光标列号
                            " %V    当前光标虚拟列号 (根据字符所占字节数计算)
                            " %p    当前行占总行数的百分比
                            " %%    百分号
                            " %L    当前文件总行数

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>
nmap <F2> :%s/ *$//<cr>:%retab!<cr>
nmap <F3> :!ctags -R<cr>
let mapleader=","
let g:mapleader=","
"inoremap <C-z> <esc>gUiwea
set clipboard=unnamedplus
