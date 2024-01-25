#!bin/bash
brew install go
# ファイルでdownloadもできる
# https://go.dev/doc/install

go version
# installしたpackageのpathを設定しないとpakcageを実行できない
export PATH=$PATH:$HOME/go/bin