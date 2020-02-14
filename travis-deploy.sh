#!/bin/bash
# global config and library file
source travis-build-config.sh

echo "DEPLOY"
if [ "$TRAVIS_OS_NAME" = "osx" ]; then 
  echo "OSX DEPLOY PACKAGER"
  try cd "${CODE_DIR}"
  #package up our build
  try ditto -ck --rsrc --sequesterRsrc "${CODE_DIR}/Builds/MacOSX/build/${BUILD_TYPE}/OMSPD.app" "${CODE_DIR}/build/OMSPD.app.zip"
  try ditto -ck --rsrc --sequesterRsrc "${CODE_DIR}/Builds/MacOSX/build/${BUILD_TYPE}/OMSPD.component" "${CODE_DIR}/build/OMSPD.component.zip"
  try ditto -ck --rsrc --sequesterRsrc "${CODE_DIR}/Builds/MacOSX/build/${BUILD_TYPE}/OMSPD.vst3" "${CODE_DIR}/build/OMSPD.vst3.zip"

fi
env

