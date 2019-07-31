#!/bin/bash

# Project.
export PROJECT_NAME=api
export PROJECT_TAG=2.3.1 # Same as the release that will be fetched (v2.3.0+ only): https://github.com/directus/api/releases
export PROJECT_TAG_ALIASES=latest # Remove if it's not the latest version.

# Docker Hub credentials.
export DOCKER_USERNAME=ministryofprogramming
export DOCKER_PASSWORD=<password-here>

# Build the API image.
./build.sh
