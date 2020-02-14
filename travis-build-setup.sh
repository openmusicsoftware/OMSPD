#!/bin/bash

# global config and library file
source travis-build-config.sh

JUCE_OSX_URL="https://github.com/WeAreROLI/JUCE/releases/download/${JUCE_VERSION}/juce-${JUCE_VERSION}-osx.zip"

echo "********  BUILD-SETUP ***************"
env

if [ "$TRAVIS_OS_NAME" = "osx" ]; then 
  echo "OSX BUILD SETUP"
  
  try cd build
  try wget ${JUCE_OSX_URL}
  try ditto -xk "juce-${JUCE_VERSION}-osx.zip" ./ 

fi
