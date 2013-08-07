"Vimをなるべくvi互換にする
set nocompatible
filetype off
"pathの追加
"初期化 引数pluginをinstallする基準となるpath
if has('vim_starting')
  set runtimepath+=./.vim/.bundle/neobundle.vim
  call neobundle#rc(expand('./.vim/.bundle/'))
endif
NeoBundle 'git://github.com/Shougo/clang_complete.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/thinca/vim-quickrun'
NeoBundle 'git://github.com/taka84u9/vim-ref-ri'

filetype plugin indent on
filetype indent on

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

