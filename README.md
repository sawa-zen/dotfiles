# Dotfiles

```bash
$ curl -L http://bit.ly/dot-sawa-zen
```

<!-- ## NeoBundleのインストール -->
<!-- ```terminal -->
<!-- mkdir -p ~/.vim/bundle -->
<!-- git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim -->
<!-- ``` -->
<!-- vimの画面でNeoBundleのプラグインをインストール -->
<!-- ```vim -->
<!-- :NeoBundleInstall -->
<!-- ``` -->
<!--  -->
<!-- ## NeoCompleteの準備 -->
<!--  -->
<!-- vimを入れなおす -->
<!--  -->
<!-- ```bash -->
<!-- $ brew uninstall vim -->
<!-- $ brew install vim --with-lua -->
<!-- ``` -->
<!--  -->
<!-- ## Rictyフォントの用意 -->
<!--  -->
<!-- 1. Rictyフォントをインストール -->
<!--  -->
<!--   ```bash -->
<!-- $ brew tap sanemat/font -->
<!-- $ brew install ricty -->
<!-- … -->
<!-- $ cp -f /usr/local/Cellar/ricty/x.x.x/share/fonts/Ricty*.ttf ~/Library/Fonts/ -->
<!--   ``` -->
<!--  -->
<!-- 1. Rictyをairlineに合うようにパッチを当てる -->
<!--  -->
<!--   ```bash -->
<!-- $ git clone git@github.com:Lokaltog/vim-powerline.git -->
<!-- $ cd vim-powerline -->
<!-- $ cp ~/Library/Fonts/Ricty-Regular.ttf ./fontpatcher/ -->
<!-- $ fontforge -lang=py -script fontpatcher Ricty-Regular.ttf -->
<!--   ``` -->
<!--  -->
<!-- 1. ターミナルのfontを`Ricty for Powerline`に変更 -->
<!-- 1. 三角が合うように`Non-ASCII Font`調整 -->
<!--  -->
<!-- ## vimdiffの設定 -->
<!--  -->
<!-- 1. `/usr/local/bin/git_diff_wrapper`を生成して以下を記述 -->
<!--   ```bash -->
<!-- #!/bin/sh -->
<!-- vimdiff "$2" "$5" -->
<!--   ``` -->
<!--  -->
<!-- 1. 実行権限の付与 -->
<!--   ```bash -->
<!-- $ chmod +x /usr/local/bin/git_diff_wrapper -->
<!--   ``` -->
