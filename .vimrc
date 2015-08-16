
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

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------
set cursorline
autocmd Vimenter * NERDTree ./
set number
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set ignorecase
set laststatus=2
set hlsearch   " 検索文字列をハイライトする "
set mouse=a
syntax on
inoremap <C-c> <esc>
vnoremap <silent> <C-p> "0p<CR>
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
set autoindent
set clipboard+=unnamed
au BufNewFile,BufRead *twig set filetype=html
set backspace=indent,eol,start
