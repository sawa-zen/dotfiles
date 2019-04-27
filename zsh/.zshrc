# ZSHの環境変数を設定
export ZSH=$HOME/.oh-my-zsh

# ZSHのテーマを設定
ZSH_THEME="robbyrussell"

# ZSHのプラグインを指定
plugins=(git svn ruby osx bundler brew rails emoji-clock)

# oh-my-zsh.shのシェルを読み込み
source $ZSH/oh-my-zsh.sh

##### ここから個人設定 ######

# grepに色をつける
export GREP_COLOR='1;37;41'
alias grep='grep -E --color=auto'

# lsに色を付ける
alias ls='ls -G'

# ls -lをllにする
alias ll='ls -laG'

# vimをnvimに
alias vim='nvim'

# ファイルの拡張子指定の検索コマンド
function ff (){
    find . -type f -name "*.$1" | xargs grep -n "$2"
}

# Androidのddmsのalias
alias ddms='/Users/sawada/Library/android-sdk-macosx/tools/ddms'

# 一個のペインで使えるリミットの制限をあげる
ulimit -n 10000

# yarnの環境変数
export PATH="$HOME/.yarn/bin:$PATH"

# Android SDK
export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export ANDROID_SDK_ROOT=$ANDROID_HOME

export REACT_EDITOR='vim'

# bin下設定
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sawa-zen/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/sawa-zen/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/sawa-zen/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/sawa-zen/google-cloud-sdk/completion.zsh.inc'; fi

#vim
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR='vim'
eval "$(direnv hook zsh)"

export GOPATH=$HOME/go
export PATH=$HOME/.anyenv/envs/goenv/shims/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# ghqとhubとpecoが必要
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# nvimでdiff
alias vimdiff='nvim -d '

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
