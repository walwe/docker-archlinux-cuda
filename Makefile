NAMESPACE=$(shell basename `pwd`)
DOCKER_REGISTRY=walwe
.RECIPEPREFIX != ps

VERSION=latest
DOCKER_FILE=Dockerfile

default: build

build:
    docker build --tag ${DOCKER_REGISTRY}/${NAMESPACE}:${VERSION} -f ${DOCKER_FILE} .

force-build:
    docker build --no-cache --tag ${DOCKER_REGISTRY}/${NAMESPACE}:${VERSION} -f ${DOCKER_FILE} .

push:
    docker push ${DOCKER_REGISTRY}/${NAMESPACE}:${VERSION}

run:
    docker run --name ${NAMESPACE} -ti ${DOCKER_REGISTRY}/${NAMESPACE}:${VERSION}

clean:
    docker rm ${NAMESPACE}
.PHONY: clean push force-build