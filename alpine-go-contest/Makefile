all: help

help:
	@grep '##' Makefile

deps: ## Get dependencies
	cd $PRIVATE/go-contest/ go get ./...

build: ## Build environment
	cd ${PRIVATE}/go-contest/ && go build -a -v -o go-contest main.go
	cp ${PRIVATE}/go-contest/create_database.sql .
	cp ${PRIVATE}/go-contest/go-contest .
	docker build . -t badele/alpine-go-contest:latest

push:
	echo "Please enter docker login password :"
	docker login --username=badele
	docker push badele/alpine-go-contest:latest
