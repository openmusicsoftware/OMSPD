#!/bin/bash
# global config and library file
source travis-build-config.sh

echo "BUILD"
env

if [ "$TRAVIS_OS_NAME" = "osx" ]; then 
  echo "OSX BUILD"
  # build our prerequisite libpd
  cd "${CODE_DIR}/forked-libraries/libpd"
  try  xcodebuild -project libpd.xcodeproj -target libpd-osx -configuration ${BUILD_TYPE}
  
  cd "${CODE_DIR}"
fi