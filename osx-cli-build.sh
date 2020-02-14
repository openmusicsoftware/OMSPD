#!/bin/bash
# osx build command line
# use this to build from a terminal in OSX

# global config and library file
source travis-build-config.sh

export TRAVIS_OS_NAME="osx"
try "${CODE_DIR}/travis-build-setup.sh"
try "${CODE_DIR}/travis-build.sh"
