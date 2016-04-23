"--------------------------
" .vimrc settings by kanae
"---------------------------

"---------------------------
" Start dein Settings
"---------------------------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
 
  " プラグインリストを収めた TOML ファイル
 let s:toml_file = expand('~/dotfiles/dein.toml')
"  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml_file,{'lazy': 0})
 " call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"-------------------------
" End dein Settings
"-------------------------


"---------------------------
" for plugin Settings
"---------------------------

" for tyru/caw.vim.git お手軽コメントアウト
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)
" for Shougo/neocomplete.vim 補完
let g:neocomplete#enable_at_startup = 1
" for vim-scripts/JavaScript-Indent js-indent
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1 
" for terryma/vim-multiple-cursors 
let g:multi_cursor_use_default_mapping=0

"-------------------------
" End Neobundle Settings.
"-------------------------

" Common -----------------
colorscheme hybrid
autocmd Vimenter * NERDTree ./
" Indent -----------------
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
" StatusLine -------------
set laststatus=2
" File -------------------
set autoread
syntax on
au BufNewFile,BufRead *twig set filetype=html
" Assist imputting -------
set backspace=indent,eol,start
" Search -----------------
set hlsearch   " 検索文字列をハイライトする 
" View -------------------
set cursorline
set number
set expandtab
set ignorecase

"-------------------------
" my config
"-------------------------
inoremap <C-c> <esc>
vnoremap <silent> <C-p> "0p<CR>
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
set clipboard+=unnamed

" for US Keyboard ----------
nnoremap ; :
nnoremap : ;
