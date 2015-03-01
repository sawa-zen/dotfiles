" Configuration file for vim
set modelines=0		" CVE-2007-2438
set incsearch
set cursorline

set modifiable

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
" タブを表示するときの幅
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" tput colors が 256 になる TERM が設定されているとき
" カラースキーム wombat256 を有効にできます。
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

set number

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'tpope/vim-surround'
NeoBundle 'https://github.com/omega/vim-deckset.git'
NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides.git'   " インデント色付け
NeoBundle 'https://github.com/pangloss/vim-javascript.git' " jsのインデントとかなおすやつ
NeoBundle 'Lokaltog/vim-powerline'            " ステータスライン
NeoBundle 'pekepeke/titanium-vim'             " Titanium
NeoBundle 'localrc.vim' " vimのインデントをディレクトリごとに調整
filetype plugin indent on     " required!
syntax on

"" SuperTab like snippets behavior.
"
let g:neocomplcache_enable_at_startup = 1

NeoBundle 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
	autocmd VimEnter * execute 'NERDTree ./'
endif

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235
let g:indent_guides_enable_on_vim_startup = 1

" 検索時のハイライト
set hlsearch

" Load settings for each location.
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.lvimrc', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

"less補完
NeoBundle 'git://github.com/groenewege/vim-less.git'
autocmd BufNewFile,BufRead *.less set filetype=css

if !has('gui_running')
    set notimeout
    set ttimeout
    set timeoutlen=100
endif
