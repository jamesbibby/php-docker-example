GROUP := sample
NAME := php-app
VERSION ?= $(shell git rev-parse --short HEAD)  #tagged with the short-sha
export

.PHONY: all build docker tag

all: build

build: docker

docker:
	# The following could be used to have a temporary docker container run a composer install
	# The container would be removed when complete, but the install would remain due to the mapped
	# volume.   This pattern is called a build container which allows you to leave bulky things
	# out of the final runtime container
	# docker run --rm -it \
	#	-v $(shell pwd)/app:/app \
	#	composer/composer:php5 \
	#	install

	# build the current dir Dockerfile and name it group/name
	docker build -t $(GROUP)/$(NAME) .
