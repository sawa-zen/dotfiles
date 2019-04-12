""""""""""""""""""""
" Basic Setting for Vim
""""""""""""""""""""

filetype off
filetype plugin indent off
" swapファイルを生成しない
set noswapfile

" マウスを有効にする
set mouse=a

" シンタックスハイライトを許可
syntax enable

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

" スペルチェック
set spell
set spelllang=en,cjk
hi clear SpellBad
hi SpellBad cterm=underline

" 行末の余分なスペースを保存時に削除
autocmd BufWritePre * :%s/\s\+$//ge

" エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 1

" Vimの描画更新タイミングを100msに
set updatetime=100

" " clip board
set clipboard=unnamed

" crip.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1

"Python3 support
let g:python_host_prog = expand('$HOME') . '/.anyenv/envs/pyenv/shims/python2'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3.6'

" typesript
autocmd BufRead,BufNewFile *.ts,*.tsx set filetype=typescript
autocmd FileType typescript setlocal completeopt-=menu
autocmd BufEnter * :syntax sync minlines=200
autocmd FileType typescript nmap <Leader>e <Plug>(TsuquyomiRenameSymbol)
let g:tsuquyomi_definition_split = 3

" Vue
autocmd BufNewFile,BufRead *.{vue*} set filetype=html

""""""""""""""""""""


""""""""""""""""""""
" dein
""""""""""""""""""""

"" Deoplete:
function! DeopleteConfig()
  call deoplete#custom#source('ternjs', 'rank', 0)
endfunction

if &compatible
  set nocompatible               " Be iMproved
endif

" dein.vimのclone先を指定
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" dein関連設定ファイルの場所
let s:dein_dir = expand('~/dotfiles/nvim/dein')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:dein_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:dein_dir . '/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" カラースキームを設定
colorscheme molokai



""""""""""""""""""""
" deoplete
""""""""""""""""""""

" Tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:deoplete#omni_input_patterns = {}
let g:deoplete#omni_input_patterns.javascript =
                    \'[^. \t0-9]\.([a-zA-Z_]\w*)?'

let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#auto_refresh_delay = 100
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'



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
" let g:airline_theme='badwolf'
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


""""""""""""""""""""
" tsuquyomi
""""""""""""""""""""

let g:tsuquyomi_disable_quickfix = 1

""""""""""""""""""""


""""""""""""""""""""
" glsl
""""""""""""""""""""

autocmd! BufNewFile,BufRead *.glsl set ft=glsl

""""""""""""""""""""
