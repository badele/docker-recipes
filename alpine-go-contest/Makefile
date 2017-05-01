all: help

help:
	@grep '##' Makefile

deps: ## Get dependencies
	cd $PRIVATE/go-contest/ go get ./...

build: ## Build environment
	docker run --rm -v "${PRIVATE}/go-contest":/usr/src/myapp -w /usr/src/myapp golang:1.8 bash -c 'make build'
	cp ${PRIVATE}/go-contest/create_database.sql .
	cp ${PRIVATE}/go-contest/go-contest .
	docker build . -t badele/alpine-go-contest:latest

push:
	echo "Please enter docker login password :"
	docker login --username=badele
	docker push badele/alpine-go-contest:latest
