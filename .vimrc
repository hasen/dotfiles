"Vimをなるべくvi互換にする
set nocompatible

filetype off

"pathの追加
"初期化 引数pluginをinstallする基準となるpath
if has('vim_starting')
  set runtimepath+=~/projects/dotfiles/.vim/.bundle/neobundle.vim
  call neobundle#rc(expand('~/projects/dotfiles/.vim/.bundle/'))
endif

"NeoBundle 'Shougo/clang_complete.git'
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vim-vcs.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'shougo/vimshell.git'
NeoBundle 'Shougo/vinarise.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'taka84u9/unite-git'
"NeoBundle 'ujihisa/unite-colrscheme'
NeoBundle 'alpaca-tc/alpaca_powertabline'
"NeoBundle 'Lokaltog/powerline',{'rtp':'powerline/bindings/vim'}
NeoBundle 'moznion/unite-git-conflict.vim'

filetype plugin indent on
filetype indent on

"font
set encoding=utf-8
set fileencoding=utf-8
set guifont=Ricty_for_Powerline:h10
set guifont=Ricty:h10
let g:Powerline_symbols='fancy'

"unite.vimの設定
let g:unite_enable_start_insert=1
let g:unite_enable_split_vertically=1
let g:unite_winwidth=25
nnoremap [unite] <Nop>
nmap <Leader>f [unite]
autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
nnoremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
nnoremap <silent> [unite]c :<C-u>Unite<Space>-auto-preview<Space>colorscheme<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>

"easy-motionのprefixを指定
let g:EasyMotion_leader_key='<SPACE>e'

"backupを有効にする
"set backup
"set backupdir=~/Documents/vim_backups/

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
set statusline=%F%r

"シンタックスハイライトを有効にする
syntax on
set nohlsearch
"set cursorline

"カラー設定を行う
"highlight Normal ctermbg=none ctermfg=white
highlight StatusLine term=none cterm=none ctermfg=none ctermbg=grey
"highlight CursorLine term=none cterm=none ctermfg=none  ctermbg=grey

"新しい行のインデントを現在行と同じにする
set autoindent
set smartindent

"バックアップファイルを作るディレクトリ
"set backupdir=$HOME/vimbackup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
"set browsedir=buffer 

"クリップボードをWindowsと連携
"set clipboard=unnamed

"Vi互換をオフ
"set nocompatible

"スワップファイル用のディレクトリ
"set directory=$HOME/vimbackup

"タブの代わりに空白文字を挿入する
set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示
"set hidden

"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示する
"set list

"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<

"行番号を表示する
set number

"シフト移動幅
"set shiftwidth=4

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"新しい行を作ったときに高度な自動インデントを行う
"set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
"set smarttab

"ファイル内の <Tab> が対応する空白の数
"set tabstop=4

"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]

"検索をファイルの先頭へループしない
"set nowrapscan

