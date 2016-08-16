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
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

Plugin 'tpope/vim-fugitive'

Plugin 'bling/vim-airline'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
" set status line
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" let g:airline_theme='wombat'
" let g:airline_theme='molokai'
" enable powerline-fonts
let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = 'X'

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
" let g:syntastic_check_on_open=1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"
" map cc :SyntasticCheck<CR>

Plugin 'arthurzwl/taglist'
let Tlist_Show_One_File=1 "only show current file
let Tlist_Exit_OnlyWindow=1 "if taglist is the last windwow, exit vim
let Tlist_WinWidth=30
let Tlist_Process_File_Always=1

Plugin 'scrooloose/nerdtree'
let g:NERDTree_title="[NERDTree]"
let NERDTreeHighlightCursorline=1
let NERDChristmasTree=1

" Plugin 'fholgado/minibufexpl.vim'

Plugin 'vim-scripts/winmanager'
let g:winManagerWindowLayout="NERDTree|TagList"
let g:winManagerWidth=30

" Indent Guides
Plugin 'nathanaelkane/vim-indent-guides'
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
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
"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tags_files = 1

"let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开

" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

" 直接触发自动补全 insert模式下
" let g:ycm_key_invoke_completion = '<C-Space>'
" 黑名单,不启用
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'gitcommit' : 1,
      \}

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

" Zen Coding
Plugin 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_settings = {
\ 'php' : {
\ 'extends' : 'html',
\ 'filters' : 'c',
\ },
\ 'xml' : {
\ 'extends' : 'html',
\ },
\ 'haml' : {
\ 'extends' : 'html',
\ },
\ 'phtml' : {
\ 'extends' : 'html',
\ },
\}

Plugin 'airblade/vim-gitgutter'

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
autocmd FileType python setlocal et sta sw=4 sts=4 ts=4
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

" set rtp+=/home/arthur/github/powerline/powerline/bindings/vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <c-h> :bp<CR>
noremap <silent> <c-l> :bn<CR>
nmap <F2> :%s/ *$//<cr>:%retab!<cr>
nmap <F3> :!ctags -R<cr>
let mapleader=","
let g:mapleader=","
"inoremap <C-z> <esc>gUiwea
" set clipboard=unnamedplus

" Yank text to the OS X clipboard" 将文本复制到OS X剪贴板中
noremap <leader>y "+y
noremap <leader>yy "+Y
" Preserve indentation while pasting text from the OS X clipboard 在粘贴OS X剪贴板中的文本时保留缩进
noremap <leader>p :set paste<CR>:put +<CR>:set nopaste<CR>

" 基于缩进或语法进行代码折叠
" za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。
set foldmethod=indent
" set foldmethod=syntax
" " 启动 vim 时关闭折叠代码
set nofoldenable
