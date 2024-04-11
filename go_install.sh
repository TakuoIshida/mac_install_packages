#!bin/bash
brew update
brew install go
# ファイルでdownloadもできる
# https://go.dev/doc/install

go version

# debugerのinstall
brew install delve
dlv version

# installしたpackageのpathを設定しないとpakcageを実行できない
export PATH=$PATH:$HOME/go/bin