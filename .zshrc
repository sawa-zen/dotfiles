# ZSHの環境変数を設定
export ZSH=$HOME/.oh-my-zsh

# ZSHのテーマを設定
ZSH_THEME="robbyrussell"

# ZSHのプラグインを指定
plugins=(git svn ruby osx bundler brew rails emoji-clock)

# User configuration
export PATH="/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin/:/Users/$HOME/.gem/ruby/2.0.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/opt/ImageMagick/bin:/developer/android-sdks/tools"

# oh-my-zsh.shのシェルを読み込み
source $ZSH/oh-my-zsh.sh

##### ここから個人設定 ######

# nvmの読み込み
source ~/.nvm/nvm.sh
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

# lsに色を付ける
alias ls='ls -G'

# ls -lをllにする
alias ll='ls -laG'

# アンドロイドシミュレータ
alias aaaa="ti build -p android -C 'Samsung Galaxy S4 - 4.4.4 - API 19 - 1080x1920'"

# アンドロイド実機デバック
alias aaaad="titanium build -p android --log-level trace --target device"

# titanium Retina 4.5-inch
alias tttt='ti build -p ios -C 559E0D73-1F3A-443D-96EE-0053211F7430 --log-level debug'

# ファイルの拡張子指定の検索コマンド
function ff (){
    find . -type f -name "*.$1" | xargs grep -n "$2"
}

# tmuxのwindowに名前をつける
function title {
    echo -ne "\033]0;"$*"\007"
}
