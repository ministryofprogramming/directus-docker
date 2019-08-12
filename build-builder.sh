#!/bin/bash

# Project.
export PROJECT_NAME=builder
export PROJECT_TAG=1.0.2 # Update version before running the build script.
export PROJECT_TAG_ALIASES=latest # Remove if it's not the latest version.

# Docker Hub credentials.
export DOCKER_USERNAME=ministryofprogramming
export DOCKER_PASSWORD=<password-here>

# Build the builder image.
./build.sh
