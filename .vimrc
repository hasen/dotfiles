"vi互換にしない
set nocompatible
filetype off

"pathの追加
"初期化 引数pluginをinstallする基準となるpath
if has('vim_starting')
  set runtimepath+=~/projects/dotfiles/.vim/neobundle.vim
  call neobundle#rc(expand('~/projects/dotfiles/.vim/.bundle/'))
endif

"NeoBundle 'Shougo/clang_complete.git'
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/vim-vcs.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vinarise.git'
NeoBundle 'Shougo/unite-ssh.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'petdance/vim-perl'
"Shift+kでperldocがひける
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'taka84u9/unite-git'
"NeoBundle 'ujihisa/unite-colrscheme'
"NeoBundle 'alpaca-tc/alpaca_powertabline'
"NeoBundle 'Lokaltog/powerline',{'rtp':'powerline/bindings/vim'}
NeoBundle 'moznion/unite-git-conflict.vim'
NeoBundle 'heavenshell/unite-zf.git'
NeoBundle 'kannokanno/unite-todo.git'
NeoBundle 't9md/vim-unite-ack.git'
NeoBundle 'rking/ag.vim'
"NeoBundle 'https://bitbhucket.org/ns9tks/vim-fuzzyfinder'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/calendar-vim'
"NeoBundle 'mattn/ctrlp-hotentry'
"NeoBundle 'mattn/ctrlp-google'
"(:help fugitiveで確認)
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'itchyny/lightline.vim'

filetype plugin on
filetype indent on

"font
set encoding=utf-8
set fileencoding=utf-8
"set guifont=Ricty_for_Powerline:h10
set guifont=Ricty:h10
"let g:Powerline_symbols='fancy'

"popupの背景色
hi Pmenu      ctermbg=0
hi pmenuSel   ctermbg=4
hi PmenuSbar  ctermbg=2
hi PmenuThumb ctermfg=3

"unite.vimの設定
"起動時にインサートモードで開始しない
let g:unite_enable_start_insert=0
let g:unite_enable_split_vertically=0
let g:unite_winwidth=25

"<Nop>は空マップ(:help <nop>で確認)
nnoremap [unite] <Nop>
nmap     <Leader>u [unite]
autocmd  FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
autocmd  FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
nnoremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
"nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
"nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
"nnoremap <silent> [unite]c :<C-u>Unite<Space>-auto-preview<Space>colorscheme<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

"neocomplchacheの設定
"disable AutoComplPop
let g:acp_enableAtStartup=0
"use neocomplcache
let g:neocomplcache_enable_at_startup=1
"set minimum syntax keyword length
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'
let g:neocomplcache_enable_ignore_case=1
"use smartcase
let g:neocomplcache_enable_smart_case=1
"use camel case completion
let g:neocomplcache_enable_camel_case_completion=1
"use underbar completion
let g:neocomplcache_enable_underbar_completion=1
"select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"close with <CR>
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
"Plugin key_mappings
imap <C-k><Plug>(neosnippet_expand_or_jump)
smap <C-k><Plug>(neosnippet_expand_or_jump)
let g:neocomplcache_ctags_arguments_list={
  \ 'perl' : '-R -h ".pm"'
  \ }

"vim-ref用のpathを設定する
let g:ref_phpmanual_path=$HOME.'/projects/dotfiles/.vim/dict/php-chunked-xhtml'
let g:neocomplcache_snippets_disable_runtime_snippets=1
let g:neocomplcache_snippets_dir="~/projects/dotfiles/.vim/snippets"
let g:neocomplcache_dictionary_filetype_lists={
  \ 'default' : '',
  \ 'perl'    : $HOME . '/projects/dotfiles/.vim/dict/perl.dict'
  \ }

"define keyword
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns={}
endif
let g:neocomplcache_keyword_patterns['default']='\h\w*'
let g:neocomplcache_delimiter_patterns['php']=['->', '::', '\']

"file type
if !exists('g:neocomplcache_same_filetype_lists')
  let g:neocomplcache_same_filetype_lists={}
endif

"for snippets
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
imap <expr><C-k> pumvisible() ? "\<C-n>" :neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"
smap <expr><C-k> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-k>"

"for snippet_complete marker
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"unite-grepのバックエンドをagに切り替える
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup'
let g:unite_source_grep_recursive_opt=''
let g:unite_source_grep_max_candidates=200
vnoremap /g y:Unite grep::-iHRn:<C-r>=escape(@",'\\.*$^[]')<CR><CR>

"quickrunの設定(\+rで実行)
nmap <Leader>r <plug>(quickrun)

"easy-motionのprefixを指定
let g:EasyMotion_leader_key='<SPACE>e'
"spolu/dwm.vim(ウィンド型タイルマネージャ)の設定
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
nmap <M-r> <Plug>DWMRotateCounterclockwise
nmap <M-t> <Plug>DWMRotateClockwise
nmap <C-n> <Plug>DWMNew
nmap <C-n> <Plug>DWMClose
nmap <C-@> <Plug>DWMFocus
nmap <C-Space> <Plug>DWMFocus
nmap <C-l> <Plug>DWMGrowMaster
nmap <C-h> <Plug>DWMShrinkMaster
"Unite設定
noremap zp :Unite buffer_tab file_mru<CR>
noremap zn :UniteWithBufferDir -buffer-name=files file file/new<CR>
noremap zf :Unite file<CR>

"ファイル変更があった場合、自動再読み込み
set autoread

"コマンドラインモードにおける補完機能を有効にする
set wildmenu wildmode=list:full

"Ctrl+nでファイルを切り替える 切り替える前にファイルを保存する
"nmap :update:bn
"imap :update:bn
"vmap :update:bn
"cmap :update:bn

"常にステータスラインを表示する
set laststatus=2
set statusline=\ \ %F%r\ [%{&fenc}][%{&ff}]%=row:\ %l\ col:\ %c\ %5p%%\ \ \ \ \ 

"シンタックスハイライトを有効にする
syntax on
"該当箇所の背景色を変化させる
set hlsearch
"cursorlineを表示する
"set cursorline

"カラー設定を行う
"highlight Normal ctermbg=none ctermfg=white
highlight StatusLine term=none cterm=none ctermfg=0 ctermbg=255
"highlight CursorLine term=none cterm=none ctermfg=none  ctermbg=grey

"lightlineの設定を行う
"let g:lightline = {
"      \ 'colorscheme': 'solarized',
"      \ 'mode_map': { 'c': 'NORMAL' },
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
"      \ },
"      \ 'component_function': {
"      \   'modified': 'MyModified',
"      \   'readonly': 'MyReadonly',
"      \   'fugitive': 'MyFugitive',
"      \   'filename': 'MyFilename',
"      \   'fileformat': 'MyFileformat',
"      \   'filetype': 'MyFiletype',
"      \   'fileencoding': 'MyFileencoding',
"      \   'mode': 'MyMode',
"      \ }
"
"function! MyModified()
"     return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"endfunction
"  
"function! MyReadonly()
"    return &ft !~? 'help\|vimfiler\|gundo' && ''
"endfunction
"    
"function! MyFilename()
"    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
"            \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
"            \  &ft == 'unite' ? unite#get_status_string() : 
"            \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') : 
"            \ '' != expand('%t') ? expand('%t') : '[No Name]') .
"            \ ('' != MyModified() ? ' ' . MyModified() : '')
"endfunction
"      
"function! MyFugitive()
"    return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ' '.fugitive#head() : ''
"endfunction
"        
"function! MyFileformat()
"    return winwidth('.') > 70 ? &fileformat : ''
"endfunction
"          
"function! MyFiletype()
"    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
"endfunction
"            
"function! MyFileencoding()
"    return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
"endfunction
"              
"function! MyMode()
"    return winwidth('.') > 60 ? lightline#mode() : ''
"endfunction
"}

"新しい行のインデントを現在行と同じにする
set autoindent
set smartindent

"insert_mode時、status_lineの色を変更
let g:hi_insert='highlight StatusLine ctermfg=0 ctermbg=190 cterm=none'
if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd=''
function! s:StatusLine(mode)
if a:mode == 'Enter'
  silent! let s:slhlcmd='highlight ' . s:GetHighlight('StatusLine')
  silent exec g:hi_insert
else
  highlight clear StatusLine
  silent exec s:slhlcmd
endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl=substitute(hl, '[\r\n]', '', 'g')
  let hl=substitute(hl, 'xxx', '', '')
return hl
endfunction

"全角スペースを表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vim_backup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
"set browsedir=buffer 

"クリップボードをWindowsと連携
"set clipboard=unnamed

"スワップファイル用のディレクトリ
"set directory=$HOME/vimbackup

"行頭の余白内でTabを打ち込むと'shiftwidth'の数だけインデントする
set smarttab

"タブの代わりに空白文字を挿入する
set expandtab

"ファイル内の <Tab> が対応する空白の数
set tabstop=2

"シフト移動幅
set shiftwidth=2

"変更中のファイルでも、保存しないで他のファイルを表示
"set hidden

"インクリメンタルサーチを行う
set incsearch

"listで表示される文字のフォーマットを指定する
set listchars=tab:>\

"行番号を表示する
set number

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch matchtime=1

"検索時に大文字を含んでいたら大/小を区別
set ignorecase
set smartcase

"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]

"検索をファイルの先頭へループしない
"set nowrapscan

"モードを非表示に
set noshowmode

"特定のディレクトリ以下だけの設定
"autocmd BufNewfile,BufRead /path/to/project/*.php set noexpandtab

"コマンドラインの高さ
set cmdheight=2
set laststatus=2

"ESCキーの待ちをなくす
let &t_SI .= "\e[?7727h"
let &t_EI .= "\e[?7727l"
inoremap <special> <Esc>O[ <Esc>

"無限undo
if has( 'persistent_undo' )
    set undodir=~/.vim/undo
    set undofile
endif   

"カーソルを自動的に括弧の中へ
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
imap // //<Left>
imap /// ///<Left>
