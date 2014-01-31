scriptencodin utf-8
:colorscheme molokai
"--------------------------------------------------------------------------------
" plugins 
"--------------------------------------------------------------------------------
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
" statusline装飾
NeoBundle 'git://github.com/itchyny/lightline.vim'
" vimからコード実行
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
" 履歴管理
NeoBundle 'YankRing.vim'
" 高機能整形
NeoBundle 'Align'
" SQL整形
NeoBundle 'SQLUtilities'
"--------------------------------------------------------------------------------
" basic
"--------------------------------------------------------------------------------
" plugins 
filetype plugin on
filetype indent on
syntax on  "シンタックスハイライト
set number "行番号表示
set smarttab "行頭の余白でTabを打つと'shiftwidth'の数だけインデントする 
"タブの代わりに空白文字を挿入する
set expandtab
set tabstop=4
set shiftwidth=4
set nocompatible "compatibleオプションをオフにする
set hlsearch "検索結果のハイライト表示
set autoindent "オートインデント
set cursorline
set autoread "書き換えられたら、自動で再読み込み
set clipboard=unnamed
set mouse=a "マウス操作可能に 
set scrolloff=5 "5行余裕確保
set textwidth=0
set notitle "vimを使ってくれて,ありが(ry
set vb t_vb= "ビープ消去
"-------------------------------------------------------------------------------- 
" vimrc reload
" --------------------------------------------------------------------------------
" 自動 
augroup MyAutoCmd
    autocmd!
augroup END
autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
" 手動
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
"--------------------------------------------------------------------------------
" status line
"--------------------------------------------------------------------------------
set showcmd "コマンド表示
set laststatus=2 "常駐
" lightlineの色変更即時反映
if has('unix') && !has('gui_runnning')
    inoremap<silent> <ESC> <ESC>
    inoremap<silent> <C-[> <ESC>
endif
"--------------------------------------------------------------------------------
" key mapping 
"--------------------------------------------------------------------------------
"インサートモード時、移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
" コマンドのみ ;を;に
noremap ; :
"--------------------------------------------------------------------------------
" syntax check 
"--------------------------------------------------------------------------------
"Ruby
augroup rbsyntaxcheck
    autocmd!
    autocmd BufWrite *.rb w !ruby -c
augroup END
"PHP
augroup phpsyntaxcheck
    autocmd!
    autocmd BufWrite *.php w !php -l
augroup END
"--------------------------------------------------------------------------------
" plugin setting
"--------------------------------------------------------------------------------
" YankRing
:nnoremap <silent> <F7> :YRShow<CR>  
:let g:yankring_max_history = 10    "記録する履歴の件数を10件に制限
:let g:yankring_window_height = 13  "履歴全件合わせてウィンドウの高さ調節
"--------------------------------------------------------------------------------
" misc
"--------------------------------------------------------------------------------
"最後の編集位置にカーソルを自動的に移動
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"Scouter
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
