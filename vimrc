scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
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

Plugin 'autowitch/hive.vim'
" for .hql files
au BufNewFile,BufRead *.hql set filetype=hive expandtab
" for .q files
au BufNewFile,BufRead *.q set filetype=hive expandtab

Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/SQLUtilities'
vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR>

" autoformat code
Plugin 'chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>
nmap <silent>aft :Autoformat<CR>
"au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatter_yapf_style = 'google'

Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'airblade/vim-gitgutter'
Plugin 'jreybert/vimagit'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#vimagit#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#vimagit#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" set status line
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='dark'
" enable powerline-fonts
let g:airline_powerline_fonts = 1
" show buffer number
" set left separator
" let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
" let g:airline#extensions#tabline#left_alt_sep = '|'
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
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_check_on_open=1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"
" map cc :SyntasticCheck<CR>

Plugin 'ryanoasis/vim-devicons'
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

Plugin 'scrooloose/nerdtree'
Plugin 'posva/vim-vue'
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>
let g:NERDTree_title="[NERDTree]"
let NERDTreeHighlightCursorline=1
let NERDChristmasTree=1

Plugin 'arthurzwl/nerdtree-tagbar-combined'
nmap <F7> :ToggleNERDTreeAndTagbar<CR>
nmap <silent> wm :ToggleNERDTreeAndTagbar<CR>

Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
let g:NERDTreeLimitedSyntax = 1

" Plugin 'fholgado/minibufexpl.vim'

" Indent Guides
" Plugin 'Yggdroot/indentLine'
" let g:indentLine_enabled = 1
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '.'

" function! NERDTree_Start()
"    exec 'NERDTree'
" endfunction

" function! NERDTree_IsValid()
"    return 1
" endfunction

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
" let g:Lf_ShortcutF = '<C-F>'
" let g:Lf_WindowPosition = 0
" let g:Lf_CommandMap = {'<C-F>': ['<C-D>'], '<C-Q>': ['<Esc>']}
" let g:Lf_DefaultMode = 3

Plugin 'tpope/vim-commentary'
nmap <BS> gcc
vmap <BS> gc

" Track the engine.
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-v>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" Plugin 'airblade/vim-gitgutter'

" Solidity
Plugin 'tomlion/vim-solidity'

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
  " set guifont=Source\ Code\ Pro\ Medium\ 14
  set guifont=SauceCodePro\ Nerd\ Font\ Medium\ 14
  set background=dark
  colorscheme solarized
  let g:solarized_termcolors=256
endif

set nu
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
set cc=120

set sw=2
set ts=2
set sts=2
set et

filetype indent on
autocmd FileType python setlocal et sta sw=4 sts=4 ts=4
autocmd FileType html setlocal et sta sw=2 sts=2 ts=2
autocmd FileType smarty setlocal et sta sw=2 sts=2 ts=2
autocmd FileType javascript setlocal et sta sw=2 sts=2 ts=2
autocmd FileType css setlocal et sta sw=2 sts=2 ts=2
noremap <c-h> :bp<CR>
noremap <c-l> :bn<CR>
nmap <F2> :%s/\s*$//<cr>:%retab!<cr>
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

" 空格显示为.
set list
set lcs=tab:»-,trail:∙,eol:↲,extends:»,precedes:«,nbsp:%,space:∙

