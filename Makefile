IMAGE :=   ghcr.io/dellelce/helloworldpy

help:
	@echo No help

build:
	@docker build -t $(IMAGE) .

push:
	@docker push $(IMAGE)
