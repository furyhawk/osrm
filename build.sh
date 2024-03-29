#!/bin/sh

# We've placed the Dockerfile under docker/ so that the generically named
# hooks/ directory doesn't pollute the main directory.  Because we need to
# COPY the source into the container, we need to use some -f gymnastics to
# ensure that "COPY . /src" is referring to the repo root, not the directory
# that contains the Dockerfile.
# This script gets executed with a pwd of wherever the Dockerfile is.
docker build --build-arg BUILD_CONCURRENCY=${CONCURRENCY:-1} --build-arg DOCKER_TAG=${DOCKER_TAG:-latest} -t ${IMAGE_NAME:-osrm} -f Dockerfile.backend .