#!/bin/bash

# Project.
export PROJECT_NAME=app
export PROJECT_TAG=7.3.1 # Same as the release that will be fetched: https://github.com/directus/app/releases
export PROJECT_TAG_ALIASES=latest # Remove if it's not the latest version.

# Docker Hub credentials.
export DOCKER_USERNAME=ministryofprogramming
export DOCKER_PASSWORD=<password-here>

# Build the APP image.
./build.sh