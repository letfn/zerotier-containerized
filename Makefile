SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build defn/zerotier-containerized
	docker build -t defn/zerotier-containerized .

push: # Push defn/zerotier-containerized
	docker push defn/zerotier-containerized

bash: # Run bash shell with defn/zerotier-containerized
	docker run --rm -ti --entrypoint bash defn/zerotier-containerized
