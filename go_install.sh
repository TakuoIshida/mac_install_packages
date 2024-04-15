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
air -v

# go のmigration toolのinstall
brew install golang-migrate
migrate -version

#mockgenのinstall
go install go.uber.org/mock/mockgen@latest
go install github.com/sanposhiho/gomockhandler@latest

# installしたpackageのpathを設定しないとpakcageを実行できない
echo "export PATH=$PATH:$(go env GOPATH)/bin" >> "$HOME/.zshrc"
