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
  
  try cd "${CODE_DIR}"
  # run the projucer
  try "${CODE_DIR}/build/JUCE/Projucer.app/Contents/MacOS/Projucer" --resave "OMSPD.jucer"
  # build the project
  try cd "${CODE_DIR}/Builds/MacOSX"
  try xcodebuild -project OMSPD.xcodeproj -alltargets -configuration ${BUILD_TYPE} 

fi