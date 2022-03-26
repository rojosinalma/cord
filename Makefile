# BASE VARS
REPO 					:= rojosinalma
IMG_NAME 			:= cord
IMG_TAG 			:= local
IMG_FULL_NAME := ${REPO}/${IMG_NAME}

.PHONY: build push build-and-push sh run

build:
	@docker build -t ${IMG_FULL_NAME}:${IMG_TAG} .

# Just push
push:
	@docker push ${IMG_FULL_NAME}:${IMG_TAG}

# For GHA
build-and-push:
	@docker build \
		-t ${IMG_FULL_NAME}:latest . \
		--compress \
		--cache-from type=local,src=/tmp/.buildx-cache \
		--cache-to type=local,dest=/tmp/.buildx-cache-new \
		--push

# Open a terminal in the image
sh:
	@docker run -it --rm ${IMG_FULL_NAME}:${IMG_TAG} ash

run:
	@docker run -it --rm  -v `pwd`:/app/f1x ${IMG_FULL_NAME}:${IMG_TAG}
