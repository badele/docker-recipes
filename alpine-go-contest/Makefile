all: help

help:
	@grep '##' Makefile

deps: ## Get dependencies
	cd $PRIVATE/go-contest/ go get ./...

build: ## Build environment
	cd ${PRIVATE}/go-contest/ && go build -o go-contest
	cp ${PRIVATE}/go-contest/go-contest .
	cp ${PRIVATE}/go-contest/config.sh .
	docker build .
