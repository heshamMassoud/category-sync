#!/usr/bin/env bash

set -e
REGISTRY='heshamm'
NAME='jenkins-job-prototype'
TAG='production'
IMAGE="${REGISTRY}/${NAME}:${TAG}"
docker pull ${IMAGE}
# ensure the exited container is removed (workaround for https://github.com/docker/docker/issues/20744)
docker rm ${NAME} || true
docker run