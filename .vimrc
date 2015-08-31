scriptencodin utf-8
:colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
"--------------------------------------------------------------------------------
" plugins 
"--------------------------------------------------------------------------------
if has('vim_starting')
  filetype plugin off
  filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#begin(expand('~/.vim/bundle'))
" 各種プラグイン
" 再帰的にファイルを列挙し、絞り込んで開く
" NeoBundle 'git://github.com/kien/ctrlp.vim.git'
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
" ファイル操作
NeoBundle 'Shougo/vimproc'

NeoBundle 'Shougo/vimfiler'
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
" 候補群を絞り込んでアクション
NeoBundle 'Shougo/unite.vim'

NeoBundle 'git://github.com/Shougo/neomru.vim'

NeoBundle 'h1mesuke/unite-outline'

NeoBundle 'rking/ag.vim'
" スクロールをスムーズに
NeoBundle 'yuroyoro/smooth_scroll.vim'

" NeoBundle 'Shougo/neocomplcache.vim'

" NeoBundle 'myhere/vim-nodejs-complete'

NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}
let s:hooks = neobundle#get_hooks("jedi-vim")

NeoBundle 'tpope/vim-fugitive.git'

" NeoBundleLazy "miyakogi/vim-virtualenv", {
"       \ "autoload": {
"       \   "filetypes": ["python", "python3", "djangohtml"]
"       \ }}

" git client
NeoBundle 'gregsexton/gitv.git'

call neobundle#end()

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
set cursorline " カーソル行をハイライト
hi CursorLine   term=reverse cterm=none ctermbg=17
set autoread "書き換えられたら、自動で再読み込み
set nobackup "バックアップを作らない
set writebackup "保存時のみバックアップを作成
set backupext=.bk "バックアップファイルの拡張子
set clipboard=unnamed
set history=100 "コマンド履歴数
set mouse=a "マウス操作可能に 
set scrolloff=5 "スクロール時に5行余裕確保
set textwidth=0
set notitle "vimを使ってくれて,ありが(ry
set vb t_vb= "ビープ消去
set ttyfast "ウィンドウをスクロールでなく再描画
set lazyredraw "スクリプト実行中に画面を描画しない
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
"set showcmd "コマンド表示
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
" 9でも行末移動
" nmap 9 $
" コマンドのみ ;を;に
"  noremap ; :
" insert modeから
inoremap jj <Esc>
" バッファ移動
map <F2> <ESC>;bp<CR>
map <F3> <ESC>;bn<CR>
" 検索ハイライト無効
nmap <Esc><Esc> :nohlsearch<CR>

let mapleader = ']'

" F5キーでコマンド履歴、F6キーで検索履歴
:nnoremap <F5> <Esc>q:
:nnoremap <F6> <Esc>q/
" 無効化
:nnoremap q: <Nop>
:nnoremap q/ <Nop>
:nnoremap q? <Nop>

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
" Python
let g:syntastic_python_checkers = ['pep8', 'pyflakes']
"--------------------------------------------------------------------------------
" plugins setting
"--------------------------------------------------------------------------------

"  imap <silent><buffer> <ESC><ESC> <ESC>
" YankRing
:nnoremap <silent> <F7> :YRShow<CR>  
:let g:yankring_max_history = 10    "記録する履歴の件数を10件に制限
:let g:yankring_window_height = 13  "履歴全件合わせてウィンドウの高さ調節

" Unite
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" 履歴数
let g:unite_source_file_mru_limit = 20

" unite grep に ag(The Silver Searcher) を使う
" if executable('ag')
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"   let g:unite_source_grep_recursive_opt = ''
"  endif

let g:unite_enable_start_insert = 1 " uniteバッファを常にインサートモードで起動
let g:unite_cursor_line_highlight = 'CursorLine'
let g:unite_abbr_highlight = 'StatusLine'
nnoremap [unite] <Nop>
nmap f [unite]
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=files buffer_tab file_rec file file_mru<CR>
nnoremap <silent> [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite -no-split -buffer-name=files file<CR>
nnoremap <silent> [unite]m :<C-u>Unite -no-split buffer file_mru<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
nnoremap <silent> [unite]r  :<C-u>UniteResume search-buffer<CR>
" ファイルを開く時、ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit outline<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了
  nmap <buffer> <ESC>  <Plug>(unite_exit)
endfunction

" neocomplcache
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" lightline

let g:lightline = {
        \ 'colorscheme': 'landscape',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" VimFiler
:let g:vimfiler_as_default_explorer = 1

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" jedi
" バッファじゃなくてタブで
" let g:jedi#use_tabs_not_buffers = 1

"--------------------------------------------------------------------------------
" misc
"--------------------------------------------------------------------------------
"最後の編集位置にカーソルを自動的に移動
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" \wでカーソル行のURLをブラウザで開く
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

map <Leader>w :call HandleURI()<CR>

"戦闘力計測
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
