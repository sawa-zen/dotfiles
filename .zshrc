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
