# ZSHの環境変数を設定
export ZSH=$HOME/.oh-my-zsh

# ZSHのテーマを設定
ZSH_THEME="robbyrussell"

# ZSHのプラグインを指定
plugins=(git svn ruby osx bundler brew rails emoji-clock)

# oh-my-zsh.shのシェルを読み込み
source $ZSH/oh-my-zsh.sh

##### ここから個人設定 ######

# nvmの読み込み
source ~/.nvm/nvm.sh
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

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
alias tttt='ti build -p ios -T simulator --log-level debug --retina --tall --sim-64bit'

# ファイルの拡張子指定の検索コマンド
function ff (){
    find . -type f -name "*.$1" | xargs grep -n "$2"
}

# Androidのddmsのalias
alias ddms='/Users/sawada/Library/android-sdk-macosx/tools/ddms'

# 一個のペインで使えるリミットの制限をあげる
ulimit -n 10000

# PATHを通すおまじない
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
