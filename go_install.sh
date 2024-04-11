#!bin/bash
brew update
brew install go
# ファイルでdownloadもできる
# https://go.dev/doc/install

go version

# debugerのinstall
brew install delve
dlv version

# live reloadのinstall
go install github.com/cosmtrek/air@latest
export PATH=$PATH:$(go env GOPATH)/bin
air -v

# installしたpackageのpathを設定しないとpakcageを実行できない
export PATH=$PATH:$HOME/go/bin