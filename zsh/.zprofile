# grep時の色付け
GREP_OPTIONS="--color=always";
export GREP_OPTIONS

# lsコマンドに色をつける
export LSCOLORS=gxfxcxdxbxegedabagacad

# Setting PATH for Python 3.6
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
