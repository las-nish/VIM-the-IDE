""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                                                                "
"                                    ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                                     "
"                                    ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                                     "
"                                    ██║   ██║██║██╔████╔██║██████╔╝██║                                          "
"                                    ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                                          "
"                                     ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                                     "
"                                      ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                                     "
"                                                                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" File Options
" ------------

set nobackup
set noswapfile
set noundofile

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Sound Effects
" -------------

set noerrorbells
set visualbell

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Appearance
" ----------

" set guioptions-=r  
" set guioptions-=R  

" set guioptions-=m  
set guioptions-=T  

set number
set guioptions-=l
set guioptions-=L

set laststatus=2

set vb t_vb=      " stop beeping or flashing the screen

set numberwidth=4
set report=0

set wildmenu
set wildchar=<TAB>
set wildmode=list:longest

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Command Line
" ------------

" set cmdheight=1

set history=1000        " Keep 100 lines of command line history
set ruler               " Show the cursor position all the time
set showcmd             " Display incomplete commands

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Code Editor
" -----------

set guifont=JetBrains\ Mono\ 10.5
" set guifont=DroidSansMono\ Nerd\ Font\ 11

" set invlist           " Change whitespaces
" set spell             " Spell check

behave mswin            " Set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows

set encoding=UTF-8      " Set to UTD 8 encoding
set termguicolors       " Enable true colors support
set cursorline          " Highlight the line currently under cursor
set cursorcolumn        " Highlight cursor line underneath the cursor vertically
set number              " Show line numbers on the sidebar
set autoread            " Automatically re-read files if unmodified inside Vim
set showmatch           " Show matching brackets

set expandtab           " Use spaces instead of tabs
set smarttab            " Be smart when using tabs

set shiftwidth=2        " 1 tab == 2 spaces
set tabstop=2  
set autoindent
set noexpandtab
set mousehide           " Hide the mouse pointer while typing
set showtabline=2  

set lbr                 " Linebreak on 500 characters
set tw=500

set ai                  " Auto indent
set si                  " Smart indent
set wrap                " Wrap lines

set nofixendofline      " No new line of the file end

hi LineNr guibg=bg      " Remove splitter bars
set foldcolumn=2  
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

set backspace=indent,eol,start whichwrap+=<,>,[,]

autocmd BufWritePre * %s/\s\+$//e
autocmd BufReadPost * normal `"

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Bracket Autoclose
" -----------------

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

map <C-t> <Esc>:tabnew<CR><Esc>:NERDTree<CR>
map <C-Q> <Esc>:tabclose<CR>
map <A-RIGHT> <Esc>:tabnext<CR>
map <A-LEFT> <Esc>:tabprev<CR>

map <C-S-UP> <C-W>j<C-W>_
map <C-S-DOWN> <C-W>k<C-W>_
map <C-S-LEFT> <C-W>h<C-W>|
map <C-S-RIGHT> <C-W>l<C-W>|
map <C-=> <C-W>=

noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

map <A-n> <ESC>:NERDTreeFocus<CR>

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>gi

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

if 1
  exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
  exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

if has("clipboard")
  vnoremap <C-X> "+x
  vnoremap <S-Del> "+x

  vnoremap <C-C> "+y
  vnoremap <C-Insert> "+y

  map <C-V> "+gP
  map <S-Insert> "+gP

  cmap <C-V>    <C-R>+
  cmap <S-Insert>   <C-R>+
endif

noremap <C-Z> u
inoremap <C-Z> <C-O>u

noremap <C-S-Z> <C-R>
inoremap <C-S-Z> <C-O><C-R>

noremap <C-S-W> :set wrap!<CR>
vnoremap <C-S-W> <C-C>:set wrap!<CR>
inoremap <C-S-W> <Esc>:set wrap!<CR>gi

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

if has("gui")
  noremap  <expr> <C-F> has("gui_running") ? ":promptfind\<CR>" : "/"
  inoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-O>:promptfind\<CR>" : "\<C-\>\<C-O>/"
  cnoremap <expr> <C-F> has("gui_running") ? "\<C-\>\<C-C>:promptfind\<CR>" : "\<C-\>\<C-O>/"

  nnoremap <expr> <C-H> has("gui_running") ? ":promptrepl\<CR>" : "\<C-H>"
  inoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-O>:promptrepl\<CR>" : "\<C-H>"
  cnoremap <expr> <C-H> has("gui_running") ? "\<C-\>\<C-C>:promptrepl\<CR>" : "\<C-H>"
  
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

map <C-S-T> :!gnome-terminal<CR>
map <C-S-B> :!make<CR>

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Plugin Manager : https://github.com/junegunn/vim-plug
"
" Commands:
" - :PlugInstall
" - :PlugUpdate
" - :PlugClean

call plug#begin()
  " Plugins for Themes

  Plug 'reedes/vim-colors-pencil'
  Plug 'rafalbromirski/vim-aurora'
  Plug 'nanotech/jellybeans.vim'
  Plug 'morhetz/gruvbox'
  Plug 'rafalbromirski/vim-aurora'
  Plug 'nlknguyen/papercolor-theme'

  " Plugins for Custom Plugin Themes

  Plug 'shinchu/lightline-gruvbox.vim'

  " Plugins for Customization

  Plug 'ntpeters/vim-better-whitespace'

  " Plugins for Productivity

  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'lifepillar/vim-mucomplete'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'reedes/vim-wheel'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'sstallion/vim-cursorline'
  Plug 'fergdev/vim-cursor-hist'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'mgee/lightline-bufferline'
  Plug 'niklaas/lightline-gitdiff'
  Plug 'sinetoami/lightline-hunks'
  Plug 'Akin909/lightline-statuslinetabs'
  Plug 'majutsushi/tagbar'
  Plug 'GlancingMind/vim-baker'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
  Plug 'easymotion/vim-easymotion'
  Plug 'sstallion/vim-cursorline'
  Plug 'mg979/vim-visual-multi'
  Plug 'airblade/vim-gitgutter'
  Plug 'makerj/vim-pdf'
  Plug 'jbgutierrez/vim-better-comments'
  Plug 'rhysd/vim-clang-format'
  Plug 'dpelle/vim-languagetool'
  Plug 'scrooloose/syntastic'
  Plug 'gcorne/vim-sass-lint'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'
  Plug 'dkprice/vim-easygrep'
  Plug 'gorodinskiy/vim-coloresque'
  Plug 'weirongxu/plantuml-previewer.vim'
  Plug 'tyru/open-browser.vim'

  " Plugins for Languages

  Plug 'dzeban/vim-log-syntax'
  Plug 'gisphm/vim-gitignore'
  Plug 'lervag/vimtex'
  Plug 'vim-latex/vim-latex'
  Plug 'gabrielelana/vim-markdown'
  Plug 'nfischer/vim-ohm'
  Plug 'aklt/plantuml-syntax'
  Plug 'leshill/vim-json'
  Plug 'othree/html5.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'vim-scripts/Sass'
  Plug 'pangloss/vim-javascript'
  Plug 'vim-scripts/c.vim'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'omnisharp/omnisharp-vim'
  Plug 'thosakwe/vim-flutter'
  Plug 'iosmanthus/vim-nasm'

  " Plugins for Language Options

  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'vim-scripts/log.vim'
  Plug 'vim-scripts/RTL'
call plug#end()

autocmd BufNewFile,BufRead *.bnf,*.ebnf set syntax=ohm

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Set Appearance by Plugins
" -------------------------

colorscheme pencil
set background=dark
let g:pencil_higher_contrast_ui = 1
let g:pencil_neutral_headings = 1
let g:pencil_neutral_code_bg = 1

" set background=dark
" colorscheme aurora

" colorscheme jellybeans
" let g:jellybeans_use_term_italics = 1

" set background=dark
" colorscheme gruvbox

" set background=dark
" colorscheme PaperColor

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Better Whitespaces
" ------------------

let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Vim Session
" -----------

let g:session_menu = 1
let g:session_default_name='gvim_default'                            " Name of the Default Session

let g:session_directory='/home/lasan0432/Documents/Vim Project'      " Session File Saving Location
let g:session_lock_directory='/home/lasan0432/Documents/Vim Project'
let g:session_extension='.vim_s'                                     " Session File Extension

let g:session_autoload='no'                                          " automatic session open, when no file at start
let g:session_autosave='yes'                                         " Automatically save session (if opened) when closing vim

set sessionoptions+=tabpages
set sessionoptions+=resize
set sessionoptions+=winpos
set sessionoptions-=folds
set sessionoptions-=buffers
set sessionoptions-=help

let g:session_lock_enabled=1
let g:session_command_aliases=1

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Vim NERDTree
" ------------

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let NERDTreeShowHidden=1

autocmd VimEnter * :NERDTree

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Mu incomplete
" -------------

set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
set belloff+=ctrlg

let g:mucomplete#enable_auto_at_startup = 1

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Better Whitespaces
" ------------------

let g:strip_whitespace_on_save=1  
let g:strip_whitespace_confirm=0  
let g:strip_only_modified_lines=1  
let g:strip_whitelines_at_eof=1

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Light Line
" ----------

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['separator'],
  \             ['gitbranch', 'readonly', 'filename', 'modified'],
  \             ['bufferbefore', 'buffercurrent', 'bufferafter'],    ],
  \   'right': [ ['statuslinetabs'], ['lineinfo'], ['percent'] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}',
  \   'separator': '',
  \ },
  \ 'component_expand': {
  \   'buffercurrent': 'lightline#buffer#buffercurrent',
  \   'bufferbefore': 'lightline#buffer#bufferbefore',
  \   'bufferafter': 'lightline#buffer#bufferafter',
  \ },
  \ 'component_type': {
  \   'buffercurrent': 'tabsel',
  \   'bufferbefore': 'raw',
  \   'bufferafter': 'raw',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \   'bufferinfo': 'lightline#buffer#bufferinfo',
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
  \ },
  \ 'separator': { 'left': ' ', 'right': ' ' },
  \ 'subseparator': { 'left': ' ', 'right': ' ' }
  \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

let g:lightline_buffer_enable_devicons = 1
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Markdown Live Preview
" ---------------------

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = '/usr/bin/epiphany-browser'
let g:mkdp_echo_preview_url = 1
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'light'

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Clang Format
" ------------

let g:clang_format#detect_style_file=1

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Syntastic
" ---------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_show_diagnostics_ui = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_c_checkers = ['clang_check']
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_compiler_options = '-std=c99'
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1

let g:syntastic_cpp_checkers = ['clang_check']
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1

let g:syntastic_cs_checkers = ['OmniSharp']
let g:syntastic_cs_compiler = 'dotnet'

let g:syntastic_dart_checkers = ['dartanalyzer']
let g:syntastic_dart_compiler = 'dart'

let g:syntastic_sass_checkers=["sasslint"]
let g:syntastic_scss_checkers=["sasslint"]

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Vim Dart
" --------

let dart_html_in_string=v:true
let g:dart_style_guide = 2

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------


" Omni Sharp
" ----------

let g:OmniSharp_server_path = '/sft/omnisharp-linux-x64/run'

let g:OmniSharp_popup_position = 'peek'

let g:OmniSharp_popup_options = {
\ 'highlight': 'Normal',
\ 'padding': [0],
\ 'border': [1],
\ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
\ 'borderhighlight': ['ModeMsg']
\}

let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}