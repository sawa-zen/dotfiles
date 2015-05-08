" Configuration file for vim
set modelines=0		" CVE-2007-2438
set incsearch
set cursorline

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" インデントをスペース4つに
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" 行を強調表示
set cursorline
" 列を強調表示
set cursorcolumn

" 80文字で赤線
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=+1
  autocmd FileType sh,perl,vim,ruby,python,javascript setlocal textwidth=80
endif


" 開いたソースを自動で折りたたみ
autocmd FileType javascript :set foldmethod=indent
autocmd FileType javascript :set foldlevel=1
autocmd FileType javascript :set foldnestmax=2

" Macのクリップボードにヤンク
set clipboard=unnamed,autoselect

" tput colors が 256 になる TERM が設定されているとき
" カラースキーム wombat255 を有効にできます。
if &t_Co >= 256 || has("gui_running")
  "colorscheme wombat256
endif

" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" tput colors が 8 になる TERM が設定されているとき
" カラースキーム ap_dark8 を有効にできます。
if &t_Co == 8
  colorscheme ap_dark8
endif
colorscheme molokai

" 構文強調を有効にします。
" :syntax on はファイル形式検出も有効にします。
if &t_Co > 2 || has("gui_running")
  syntax on
endif

set nocompatible               " be iMproved
filetype off

" 行数の表示
set number


" ============= NeoBundle ============= "
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
" プラグイン達
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'lilydjwg/colorizer' " カラーコードを色付きでハイライト
NeoBundle 'pekepeke/titanium-vim'             " Titanium
NeoBundle 'localrc.vim' " vimのインデントをディレクトリごとに調整
NeoBundle 'scrooloose/syntastic.git' " 構文エラーを自動で出力
NeoBundle 'grep.vim' " grepを便利にしてくれる子
NeoBundle 'airblade/vim-gitgutter' " gitの差分を表示するぜ
NeoBundle 'thinca/vim-quickrun' " quickrunの実行
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
filetype plugin indent on     " required!
call neobundle#end()
syntax on
" ====================================== "
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif



" =================== ステータスバー =======================
" letirline_section_a = airline#section#create(['mode','','branch'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Ricty\ Regular\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:airline_theme='badwolf'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_linecolumn_prefix = '▶'
"let g:airline_branch_prefix = '▶'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" /=Airline }}}1
" ==========================================


" NERDtree設定
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
	autocmd VimEnter * execute 'NERDTree ./'
endif
let g:NERDTreeWinSize=20


" 検索時のハイライト
set hlsearch

" ファイル保存時にsyntaxチェック
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['javascript'],
  \ 'passive_filetypes': ['html']
  \}
let g:syntastic_auto_loc_list = 1


" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
hi NonText guibg=NONE guifg=DarkGreen
hi SpecialKey ctermfg=235

" mdファイルをmarkdownファイルとして認識させる
au BufNewFile,BufRead *.md :set filetype=markdown



" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

let g:syntastic_javascript_checkers = ['eslint']
