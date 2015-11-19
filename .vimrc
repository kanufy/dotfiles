"---------------------------
"  .vimrc settings by kanae
"---------------------------

"---------------------------
"start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
"NERDTree
NeoBundle 'scrooloose/nerdtree'
"Autoclose
NeoBundle 'Townk/vim-autoclose'
"お手軽コメントアウト
NeoBundle 'tyru/caw.vim.git'
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)
"補完
NeoBundle 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
"js-indent
NeoBundle 'vim-scripts/JavaScript-Indent'
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1 
"twig syntax
NeoBundle 'evidens/vim-twig'
"multi-cursors
NeoBundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
"color
NeoBundle 'kanufy/vim-hybrid'


call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

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
