""""""""""""""""""""
" NeoBundle
""""""""""""""""""""

" NeoBundleを最初に読み込むように設定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" NeoBundleのインストールしたもの一覧
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
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
NeoBundle 'mattn/emmet-vim' " emmet
NeoBundle 'digitaltoad/vim-jade' " jadeのハイライト
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }
NeoBundle 'Quramy/tsuquyomi' " typescriptのサーバー
NeoBundle 'leafgarland/typescript-vim' " typescriptのsyntax
NeoBundle 'mattn/emmet-vim' " emmet
NeoBundle 'tikhomirov/vim-glsl' " GLSL
NeoBundle 'tomtom/tcomment_vim' " コメントアウト
NeoBundle 'editorconfig/editorconfig-vim' " エディターコンフィグ
NeoBundle "ctrlpvim/ctrlp.vim" " ファイル検索
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

" カラースキームを設定
colorscheme iceberg

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

" 括弧の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

let g:typescript_compiler_options = '-sourcemap'

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" 行末の余分なスペースを保存時に削除
autocmd BufWritePre * :%s/\s\+$//ge

" JavaScriptの構文チェックはeslintで行う
let g:syntastic_javascript_checkers = ['eslint']
" ファイル保存時にsyntaxチェック
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['javascript'],
  \ 'passive_filetypes': ['html', 'typescript']
  \}
let g:syntastic_auto_loc_list = 1
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}

" crip.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""""""""""""""""""""



""""""""""""""""""""
" Hilight for Some Languages
""""""""""""""""""""

" mdファイルをmarkdownファイルとして認識させる
au BufNewFile,BufRead *.md :set filetype=markdown

""""""""""""""""""""


""""""""""""""""""""
" tcomment
" コメントアウトプラグイン
""""""""""""""""""""
if !exists('g:tcomment_types')
	let g:tcomment_types = {}
endif
let g:tcomment_types['typescript'] = '// %s'
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
" neosnippet
""""""""""""""""""""
" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)


""""""""""""""""""""
" neocomplete
""""""""""""""""""""
set nocompatible
set completeopt+=menuone
set rtp+=~/work/neocomplete.vim/
set rtp+=~/work/vimproc.vim/
set rtp+=~/.cache/neobundle/tsuquyomi/

filetype plugin indent on
let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'

""""""""""""""""""""
" airline
""""""""""""""""""""

" ステータスラインは下から2行まで
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

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
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⭠'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮂'
let g:airline#extensions#readonly#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline_section_b =
      \ '%{airline#extensions#branch#get_head()}' .
      \ '%{""!=airline#extensions#branch#get_head()?("  " . g:airline_left_alt_sep . " "):""}' .
      \ '%t%( %M%)'
let g:airline_section_c = ''
""""""""""""""""""""
