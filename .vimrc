scriptencoding utf-8
:colorscheme molokai

if has('vim_starting')
  filetype plugin off
  filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#rc(expand('~/.vim/bundle'))
" 各種プラグイン
" 再帰的にファイルを列挙し、絞り込んで開く
NeoBundle 'git://github.com/kien/ctrlp.vim.git'
" パッケージマネージャー
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
" ファイルエクスプローラ
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
" 保存時のシンタックスチェック
NeoBundle 'git://github.com/scrooloose/syntastic.git'
" Gist連携
NeoBundle 'git://github.com/mattn/gist-vim.git'
" WebApi(Gist連携用に導入)
NeoBundle 'git://github.com/mattn/webapi-vim'

filetype plugin on
filetype indent on
syntax on  
" シンタックスハイライト
" 行番号表示
set number
" 行頭の余白でTabを打つと'shiftwidth'の数だけインデントする 
set smarttab
" タブの代わりに空白文字を挿入する
set expandtab
set tabstop=4
set shiftwidth=4
" 右下に表示される行・列番号の表示
set ruler
" compatibleオプションをオフにする
set nocompatible
" 検索結果のハイライト表示
set hlsearch

set cursorline


"----------------------------
" ステータスライン
"----------------------------
"--コマンド表示
set showcmd
"--常駐
set laststatus=2
"--ファイル名
set statusline+=%<%F
"--読み込み専用か
set statusline+=%r
"--ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"--現在列/全体列
set statusline+=[C=%c/%{col('$')-1}]
"--現在行/全体行
set statusline+=[L=%l/%L]
"--文字と改行コード表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P



set clipboard+=unnamed 
set clipboard=unnamed
" マウス操作可能に 
set mouse=a

"インサートモード時、移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
