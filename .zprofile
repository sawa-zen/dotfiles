# macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# grep時の色付け
GREP_OPTIONS="--color=always";
export GREP_OPTIONS

# lsコマンドに色をつける
export LSCOLORS=gxfxcxdxbxegedabagacad

# mysqlコマンドをどこでも打てるように
export PATH=$PATH:/usr/local/mysql/bin

# svnのコミットコメントエディタをvimに
export SVN_EDITOR=vim

# topotalのdocker設定
export DOCKER_CERT_PATH=/Users/sawadatakayoshi/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

# rbenvの設定
eval "$(rbenv init -)"
