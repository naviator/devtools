.PHONY: build rebuild debug run
.DEFAULT_GOAL := run

include .env

run:
	@${OCI} run -it --rm \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /dev/dri:/dev/dri \
		--shm-size="1gb" \
		--security-opt label=disable \
		$$(${OCI} build -q .) \
		/bin/bash

debug:
	@${OCI} run -it --rm ${CONTAINER} bash

build:
	${OCI} build -t ${CONTAINER} .

rebuild:
	${OCI} build --no-cache -t ${CONTAINER} .

.env:
	echo "OCI=podman" > .env
	echo "CONTAINER=`basename $(CURDIR)`_`< /dev/urandom tr -dc a-z-0-9 | head -c$${1:-8};echo;`" >> .env