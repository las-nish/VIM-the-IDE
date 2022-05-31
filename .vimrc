" Make external commands work through a pipe instead of a pseudo-tty
" set noguipty

" You can also specify a different font, overriding the default font
" if has('gui_gtk')
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
" else
"   set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
" endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" File Options
" ------------

set nobackup
set noswapfile
set noundofile

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Appearance
" ----------

" set guioptions-=r
" set guioptions-=R

" set guioptions-=m
" set guioptions-=T

set number
set guioptions-=l
set guioptions-=L

set laststatus=2

set vb t_vb=      " stop beeping or flashing the screen

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

" Delete Whitespace
" -----------------

fun! CleanExtraSpaces()
  let save_cursor=g  etpos(".")
  let old_query=g  etreg('/')
  silent! %s/\s\+$//e

  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.md,*.txt,*.asm,*.s,*.oe,*.sh :call CleanExtraSpaces()
endif

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

  " Plugins for Customization

  Plug 'ntpeters/vim-better-whitespace'
  Plug 'nathanaelkane/vim-indent-guides'

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

  " Plugins for Languages

  Plug 'iosmanthus/vim-nasm'
call plug#end()

" ----------------------------------------------------------------------------------------------------------------
" ----------------------------------------------------------------------------------------------------------------

" Set Appearance by Plugins (Moonfly Plugin)
" ------------------------------------------

colorscheme pencil
set background=dark

let g:pencil_higher_contrast_ui = 1
let g:pencil_neutral_headings = 1
let g:pencil_neutral_code_bg = 1

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

" Indent Guides
" -------------

let g:indent_guides_enable_on_vim_startup=1

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
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \ },
  \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
