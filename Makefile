IMAGE_NAME = "didstopia/freebsd-cross"

build:
	@docker build -t $(IMAGE_NAME) .

test: build
	@docker run --rm -it $(IMAGE_NAME) uname -a
