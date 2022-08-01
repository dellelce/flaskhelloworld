IMAGE :=   ghcr.io/dellelce/pyhelloworld

help:
	@echo No help

build:
	@docker build -t $(IMAGE) .

push:
	@docker push $(IMAGE)
