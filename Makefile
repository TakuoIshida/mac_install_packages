init:
	brew install sqlc
	brew install protobuf && which protoc

install-aws-cli:
	curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
	sudo installer -pkg AWSCLIV2.pkg -target /
	which aws
	aws --version
	rm AWSCLIV2.pkg
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

install-go:
	brew install go
	go version

install-debuger:
	brew install delve
	dlv version

install-air:
	go install github.com/air-verse/air@latest
	air -v

install-mockgen:
	go install go.uber.org/mock/mockgen@latest
	mockgen --version

install-migration:
	brew install golang-migrate
	migrate -version

set-path: #optional
	echo "export PATH=$PATH:$(go env GOPATH)/bin" >> "$HOME/.zshrc"