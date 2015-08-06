""""""""""""""""""""
" NeoBundle
""""""""""""""""""""

" NeoBundleを最初に読み込むように設定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" NeoBundleのインストールしたもの一覧
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
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
NeoBundle 'bling/vim-airline' " ステータスバー
NeoBundle 'tpope/vim-fugitive' " branch表示
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'digitaltoad/vim-jade' " jadeのハイライト
call neobundle#end()

" ファイルタイプの自動検出、ファイルタイプ用の
" プラグインとインデント設定を自動読み込み
filetype plugin indent on

" インストールしていないものが無いかチェックして
" されてないものをインストールするように促す
NeoBundleCheck

""""""""""""""""""""



""""""""""""""""""""
" Basic Setting for Vim
""""""""""""""""""""

" シンタックスハイライトを許可
syntax enable

" カラーはmolokaiを使用
colorscheme molokai

" エンコーディングをutf-8に自動設定
set encoding=utf-8

" インサートモード時にバックスペースを使う
set backspace=indent,eol,start

" 行数の表示
set number

" 検索時のハイライト
set hlsearch
" 検索入力開始から検索させる
set incsearch

" タブはスペースで打つように
set expandtab
" 改行時に自動でインデント
set autoindent
" インデントをスペース2つに
set tabstop=2
set shiftwidth=2

" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
hi NonText guibg=NONE guifg=DarkGreen
hi SpecialKey ctermfg=235

" 行を強調表示
set cursorline
" 列を強調表示
set cursorcolumn

" 文字列の自動改行を禁止
set textwidth=0
" 80文字で赤線
if exists('&colorcolumn')
  set colorcolumn=+1
  autocmd FileType sh,perl,vim,ruby,python,javascript setlocal textwidth=80
endif

" Macのクリップボードにヤンク
set clipboard=unnamed,autoselect

" マウス操作を使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" 行末の余分なスペースを保存時に削除
autocmd BufWritePre * :%s/\s\+$//ge

" JavaScriptの構文チェックはeslintで行う
let g:syntastic_javascript_checkers = ['eslint']
" ファイル保存時にsyntaxチェック
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['javascript'],
  \ 'passive_filetypes': ['html']
  \}
let g:syntastic_auto_loc_list = 1

""""""""""""""""""""



""""""""""""""""""""
" Hilight for Some Languages
""""""""""""""""""""

" mdファイルをmarkdownファイルとして認識させる
au BufNewFile,BufRead *.md :set filetype=markdown

""""""""""""""""""""



""""""""""""""""""""
" NERDTree
""""""""""""""""""""

" デフォルトで隠しファイルを表示
let NERDTreeShowHidden = 1

" ファイルを指定していない状態で
" vimを開いた時は表示する
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
	autocmd VimEnter * execute 'NERDTree ./'
endif

" NERDTreeの基本幅を20文字分に
let g:NERDTreeWinSize=20

""""""""""""""""""""



""""""""""""""""""""
" neocomplcache
""""""""""""""""""""

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

""""""""""""""""""""



""""""""""""""""""""
" airline
""""""""""""""""""""

" ステータスラインは下から2行まで
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Ricty\ Regular\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:airline_theme='badwolf'
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline_linecolumn_prefix = '⭡'
let g:airline_branch_prefix = '⭠ '
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'
let g:airline#extensions#readonly#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline_section_b =
      \ '%{airline#extensions#branch#get_head()}' .
      \ '%{""!=airline#extensions#branch#get_head()?("  " . g:airline_left_alt_sep . " "):""}' .
      \ '%t%( %M%)'
let g:airline_section_c = ''
""""""""""""""""""""
