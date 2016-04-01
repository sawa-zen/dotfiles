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

# アンドロイドシミュレータ
alias aaaa="ti build -p android -C 'Samsung Galaxy S4 - 4.4.4 - API 19 - 1080x1920'"

# アンドロイド実機デバック
alias aaaad="titanium build -p android --log-level trace --target device"

# titanium Retina 4.5-inch
alias tttt='ti build -p ios -T simulator --log-level debug --device-id AA4A38E8-41D6-4E40-9B79-C7523707D5E5'

# ファイルの拡張子指定の検索コマンド
function ff (){
    find . -type f -name "*.$1" | xargs grep -n "$2"
}

# Androidのddmsのalias
alias ddms='/Users/sawada/Library/android-sdk-macosx/tools/ddms'

# 一個のペインで使えるリミットの制限をあげる
ulimit -n 10000

# rbenvのPATHを通すおまじない
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodebrewのパスを通す
export PATH=$HOME/.nodebrew/current/bin:$PATH

# FLASH開発のためのFLEXのパスを通す
PATH=$PATH:~/develop/SDKs/flex_4/bin
