" Map Leader <Has to be first line>
let mapleader = " "
let g:mapleader = " "

""" Dein Config

" Specify runtimepath

if has ("win32")
    set runtimepath+=~/.vim/plugins/repos/github.com/Shougo/dein.vim
else
    set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim
endif

" Add Plugins
if has ("win32")
    call dein#begin("~/.vim/plugins")
else
    call dein#begin("/home/strixx/.config/nvim/plugins")
endif

call dein#add('Shougo/dein.vim')

" Window Split Plugins
call dein#add('simeji/winresizer', {'on_map' : {'nv' : '<c-w>r' }})

" Align Plugins
call dein#add('junegunn/vim-easy-align')

" Interface Plugins
" call dein#add('itchyny/lightline.vim')
if has ('unix')
    call dein#add('junegunn/fzf', {'merged': 0})
    call dein#add('junegunn/fzf.vim', {'merged': 0})
endif
call dein#add('ap/vim-buftabline')
if has ("win32")
    call dein#add("scrooloose/nerdtree", { 'on_cmd' : 'NERDTreeToggle',
		\ 'hook_add': 'nnoremap <leader>n
		\ :NERDTreeToggle<cr>'})
endif
call dein#add('mbbill/undotree', { 'on_cmd' : 'UndotreeToggle',
	    \ 'hook_add': 'nnoremap <leader>u
	    \                :UndotreeToggle<cr>'
	    \})

" Local Win Plugins
if has ('win32')
    call dein#add('~/.vim/plugins/local/restore_view')
    call dein#add('~/.vim\plugins\local\statusline')
else
    call dein#add('~/.config/nvim/plugins/local/restore_view')
    call dein#add('~/.config/nvim/plugins/local/statusline')
endif

" Local Unix Plugins
if has ("unix")
    " Session Plugin Local
    call dein#local('/home/strixx/.config/nvim/plugins/repos/github.com/vim-scripts/')
endif

" ColorScheme Plugin
if has ("win32")
endif

" Code Completion Plugin
call dein#add('mattn/emmet-vim')
call dein#add('Raimondi/delimitMate')
call dein#add('jiangmiao/auto-pairs')
call dein#add('maralla/completor.vim')

" Automaticly Features Plugin
" call dein#add('b4b4r07/vim-sunset')

" Benchmark Plugin
call dein#add('tweekmonster/startuptime.vim')

" Commands Plugin
call dein#add('sbdchd/neoformat')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('andrewradev/splitjoin.vim', { 'on_ft' : [ 'html', 'css', 'htm', 'php', 'sass', 'scss', 'js' ] })
call dein#add('wellle/targets.vim')
call dein#add('justinmk/vim-sneak')
call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}})
call dein#add('tpope/vim-abolish')

" Intergrations Plugin
call dein#add('tpope/vim-commentary')
call dein#add('mileszs/ack.vim')
call dein#add('keith/gist.vim')
call dein#add('javier-lopez/sprunge.vim')

" Language Plugin
call dein#add('sheerun/vim-polyglot')
call dein#add('2072/PHP-Indenting-for-VIm')

" Improvments Plugins
call dein#add('bkad/camelcasemotion')
call dein#add('kana/vim-smartword')
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-ragtag')

" Syntax Check Plugin
call dein#add('w0rp/ale')

" End Dein
call dein#end()

" Automagically install new dein.vim plugins
if dein#check_install()
    call dein#install()
endif


""" Dein Config End

""" Plugins Config

" Completor Plugin Config
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" BufTabline Config
let g:buftabline_show = 1
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

""" Code Linters

"" Ale Config
let g:ale_lint_on_text_changed = 'never'

" if you don't want linters to run on opening a file
let g:ale_lint_on_entEr = 0

" Choose linters you want to run for that specific FileType
let g:ale_linters = {
	    \   'html': ['tidy'],
	    \}
let g:ale_set_signs=0
let g:ale_open_list=1

" Sneak Plugin Config
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
let g:sneak#s_next = 1
let g:sneak#label = 1

" NerdTree Configs
if has ("win32")
    let NERDTreeQuitOnOpen = 1
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let NERDTreeHijackNetrw = 1
    let NERDTreeWinPos = "right"
endif

" " Lightline Plugin Config
" let g:lightline = {
" 	    \ 'colorscheme': 'PaperColor',
" 	    \ 'active': {
" 	    \   'left': [ ['mode', 'paste'],
" 	    \             ['fugitive', 'readonly', 'filename','bufnum', 'modified'] ],
" 	    \   'right': [ ['filetype'], [ 'lineinfo' ], ['percent'] ]
" 	    \ },
" 	    \ 'component': {
" 	    \   'readonly': '%{&filetype=="help"?"":&readonly?"??":""}',
" 	    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
" 	    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
" 	    \   'ftString': "ft="
" 	    \ },
" 	    \ 'component_visible_condition': {
" 	    \   'readonly': '(&filetype!="help"&& &readonly)',
" 	    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
" 	    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
" 	    \ },
" 	    \ 'separator': { 'left': ' ', 'right': ' ' },
" 	    \ 'subseparator': { 'left': ' ', 'right': ' ' }
" 	    \ }
" let g:lightline.component = {'filetype': 'FileType: %{&ft!=#""?&ft:"Null"}'}

" UndoTree Plugin
let g:undotree_DiffAutoOpen = 0

" UndoTree Custom Mappings
function! g:Undotree_CustomMap()
    nmap <buffer> J <plug>UndotreeGoNextState
    nmap <buffer> K <plug>UndotreeGoPreviousState
    nmap <buffer> o <plug>UndotreeEnter
endfunc

" Winresizer Plugin Config
let g:winresizer_start_key =  '<C-W>r'
if has ("unix")
    " FzF Plugin Config
    let g:fzf_layout = { 'down': '~30%' }
endif

" Set Camelmotion default mappings
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

let g:wordmotion_spaces = '#'

""" Plugins Config End

""" Vim Config

" Add macro on visual
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Set Fontsize
if has ("win32")
    set guifont=Monaco:h10:cDEFAULT
endif

" Add Ctrl+w+hjkl to switch window
nnoremap <left> <c-w>h
nnoremap <down> <c-w>j
nnoremap <up> <c-w>k
nnoremap <right> <c-w>l

" Map ctrl hjkl to buffer navigation, toggle readonly and delete buffer
nnoremap <C-h> :bp<cr>
nnoremap <C-j> :bd!<cr> :echo 'Buffer Deleted'<cr>
nnoremap <C-k> :set ro!<cr> :echo 'Set Readonly Toggle'<cr>
nnoremap <C-l> :bn<cr> :echo 'Buffer Next'<cr>

" Access Buffers Faster With Numbers
nnoremap <F2> :buffers<CR>:buffer<space>

" Map Shift-k to (split) a paragraph to complete shift j (join), also make J behave like gJ
nnoremap K i<cr><Esc>
nnoremap J gJ

" Map jj for fast exit
imap jj <Esc>

" Sane Defaults
filetype on
filetype plugin on
filetype indent on
set splitbelow
set splitright
set autoindent
set showcmd
set hidden
set history=5000
set noswapfile
set gdefault
set nowrap
set mouse=
set viewdir=~/.vim/view/
set viewoptions=cursor,folds,slash,unix
set foldmethod=manual
set ignorecase
set linebreak
set smartcase
set noshowmode
set nu
let @/ = ""

" Clipboard Fix
if has ("nvim")
    set clipboard+=unnamedplus
else
    set clipboard+=unnamed
endif

" Vim Color Settings
set termguicolors
syntax enable
colorscheme base16-ocean

" Fix Syntax speed
syntax sync minlines=100
syntax sync maxlines=240
set synmaxcol=800

" GUI Vim , Make it look like terminal

if has ("gui")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif

" Tabs
set softtabstop=0
set noexpandtab
set shiftwidth=4

" Undo History Fixes
set undofile
if has ("nvim") && has ('unix')
    set undodir=~/.config/nvim/undoHistory/
else
    set undodir=~/.vim/undoHISTORY
endif
set ul=1000

" Move Line up and down mapping
noremap <silent> <c-down> :m '>+1<cr>gv=gv
noremap <silent> <c-up> :m '<-2<cr>gv=gv

" Better Search
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Fix for GUI ColorScheme
if !has('gui_running')
    set t_Co=256
endif

" Re-Open Previously Opened File
nnoremap <Leader><Leader> :e#<CR>

" Set Working Directory to folder , like gf but for folders
nnoremap gF :cd <c-r><c-f><cr>

" Reload vim's config without having to exit vim
if has ("nvim")
    map <leader>r :source ~/.config/nvim/init.vim<cr>
else
    map <leader>r :source ~/_vimrc<cr>
endif

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev share Share
cnoreabbrev w w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev tn tabnew
cnoreabbrev tc tabclose
cnoreabbrev sv vsplit
cnoreabbrev Sv vsplit

""" Vim Config End

""" Functions Config

" Contrast Options
let g:contrastLevels = ['low', 'medium', 'high']
let g:cc = g:contrastLevels[0]
let g:contrastVar = 0
function! ToggleContrast()
    let g:cc = g:contrastLevels[g:contrastVar]
    let g:contrastVar = (g:contrastVar + 1) % len(g:contrastLevels)
    let g:colorNumber = 0
    if g:cc == "high"
	let g:mylist = ["delek","desert","koehler","base16-ir-black", "base16-material", "base16-flat", "base16-phd", "base16-tomorrow-night", "base16-eighties", "base16-dracula", "base16-bright", "base16-macintosh", "base16-monokai", "base16-oceannext"]
    elseif g:cc == "medium"
	let g:mylist = ["base16-atelier-sulphurpool", "base16-harmonic16-dark", "base16-woodland", "base16-materia", "base16-material-palenight", "base16-bespin",]
    elseif g:cc == "low"
	let g:mylist = ["zenburn", "base16-atelier-savanna", "base16-codeschool", "base16-ocean", "base16-onedark", "base16-embers", ]
    endif
endfunction

call ToggleContrast()

"" Color Switcher

" Set Variables
let g:contrast = g:contrastLevels[0]
let g:colorNumber = 0

function! ColorSchemeToggle()
    if exists("g:colorNumber")
	execute 'colorscheme ' . g:mylist[g:colorNumber]
	let g:colorNumber = (g:colorNumber + 1) % len(g:mylist)
    endif
endfunction

nnoremap <F8> :call ColorSchemeToggle()<cr>:execute "colo"<cr>
nnoremap <S-F8> :call ToggleContrast()<cr>:execute 'colorscheme ' . g:mylist[g:colorNumber]<cr>:execute "echom g:cc"<cr>

command! ThemeSwitch :call ColorSchemeToggle()

function! DefaultColors()
    "Sneak Plugins Colors
    call StatusbarColors()
    hi Sneak guifg=red guibg=NONE ctermfg=red ctermbg=NONE
    hi SneakScope guifg=red guibg=NONE ctermfg=red ctermbg=NONE
    hi SneakLabel guifg=red guibg=NONE ctermfg=red ctermbg=NONE
endfunction

" Buffer
function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
endfunction

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

function! ReturnColorScheme()
    return g:colors_name
endfunction

" Call Macro On Visual
function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

""" Functions Config End

""" Autocmd Configs

augroup Colorscheme
    au!
    autocmd ColorScheme * call DefaultColors()
augroup END

augroup Type
    au!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

augroup EnterVim
    au!
    autocmd VimEnter * call DefaultColors()
augroup END

augroup LeavingVim
    au!
    autocmd VimLeave * call Sessioncheck()
augroup END

""" Autocmd End

""" Speed Config

" Toggle Numbers
nnoremap <F3> :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>

" Disable Ruby
let g:loaded_ruby_provider = 1

"" Fix Python settings

" Disable python 2
let g:loaded_python_provider = 1

" Path to python 3
if has ('win32')
    let g:python3_host_prog = 'C:\Program Files (x86)\Python36-32\python'
elseif has ('unix')
    let g:python3_host_prog = '/usr/bin/python3'
endif

""" Speed Config End

""" Custom Commands

if has ('unix')

    command! -range=% Share exe <line1>. ','.<line2>.'w !vpaste ft='.&ft
    command! FindAll call fzf#run(fzf#wrap({'source': 'cat ~/.vifm/fzf-read/locate-file', 'sink': 'e'}))
    command! FindSession call fzf#run(fzf#wrap({'source': 'cd ~/.config/nvim/session && readlink -f *', 'sink': 'source', 'options': '-m +s'}))
    command! ProjectFind call fzf#run(fzf#wrap({'source': 'find . -type f', 'sink': 'e'}))
    command! FindHome call fzf#run(fzf#wrap({'source': 'find . -type f  ! \( -path "*cache*" -o -path "*fonts*" -o -path "*icons*" -o -path "*help*" -o -path "*log*" -o -path "afs" -o -path "var*" -o -path "lib*" -o -path "tmp*" -o -path "proc*" -o -path "*deps*" -o -path "*node*" -o -path "*/src/*" -o -path "*gem*" -o -path "*/ruby/*" \) -maxdepth 7', 'sink': 'e'}))
    command! FZFProject call fzf#run(fzf#wrap({'source': 'cat ~/.config/nvim/Project-Path ', 'sink': 'cd'}))
    command! FZFBookmark call fzf#run(fzf#wrap({'source': "cat ~/.config/nvim/bookmarks | cut -d ' ' -f 1", 'sink': 'e'}))
    command! Mru call fzf#run({
		\  'source':  v:oldfiles,
		\  'sink':    'e',
		\  'options': '-m -x +s',
		\  'down':    '40%'})
    command! -range=% SP  silent execute <line1> . "," . <line2> . "w !curl -F 'sprunge=<-' http://sprunge.us | tr -d '\\n' | pbcopy"
    command! -range=% CL  silent execute <line1> . "," . <line2> . "w !curl -F 'clbin=<-' https://clbin.com | tr -d '\\n' | pbcopy"
    command! -range=% VP  silent execute <line1> . "," . <line2> . "w !curl -F 'text=<-' http://vpaste.net | tr -d '\\n' | pbcopy"
    command! -range=% IX  silent execute <line1> . "," . <line2> . "w !curl -F 'f:1=<-' ix.io | tr -d '\\n' | pbcopy"
    command! -range=% TB  silent execute <line1> . "," . <line2> . "w !nc termbin 9999 | tr -d '\\n' | pbcopy"

    " FZF Mappings
    nnoremap <leader>fp :ProjectFind<cr>
    nnoremap <leader>fa :FindAll<cr>
    nnoremap <leader>fh :FindAll<cr>
    nnoremap <leader>fs :FindSession<cr>
    nnoremap <leader>fr :Mru<cr>
    nnoremap <leader>fb :FZFBookmark<cr>
    nnoremap <leader>p  :FZFProject<cr>
    nnoremap <leader>B :!echo %:~ >> ~/.config/nvim/bookmarks<cr>
    nnoremap <leader>P :!pwd >> ~/.config/nvim/Project-Path<cr>
    nnoremap <silent> <Leader>b :call fzf#run({
		\   'source':  reverse(<sid>buflist()),
		\   'sink':    function('<sid>bufopen'),
		\   'options': '+m',
		\   'down':    len(<sid>buflist()) + 2
		\ })<CR>

endif

""" Custom Commands End

