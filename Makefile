SHELL := /bin/bash
.PHONY: run
ALL: run

install:
	pip install pre-commit
	pre-commit install

lint:
	pre-commit run -a

run:
	@echo open http://localhost:8888 in your browser
	docker run --rm \
	      -p 8888:8888 \
	      -v $PWD/notebook:/home/jovyan/work \
	      --env JUPYTER_ENABLE_LAB=yes \
	      --env JUPYTER_TOKEN=x \
	      --name learn-you-a-haskell \
	      crosscompass/ihaskell-notebook:latest
