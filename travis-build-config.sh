#!/bin/bash
# some portions are taken from system scripts for MAPLEPOST 
# written and provided by PJ SLACK

# global configuration file for travis shell scripts

JUCE_VERSION="5.4.7"
# what will we build today
BUILD_TYPE="Debug"

# we use this to determine our absolute path
LIBRARY_SOURCE="${BASH_SOURCE[0]}"

while [ -h "$LIBRARY_SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink

  CODE_DIR="$( cd -P "$( dirname "$LIBRARY_SOURCE" )" && pwd )"
  LIBRARY_SOURCE="$(readlink "$LIBRARY_SOURCE")"

  [[ $LIBRARY_SOURCE != /* ]] && LIBRARY_SOURCE="$CODE_DIR/$LIBRARY_SOURCE" # if $SOURCE was a relative symlink, 
                                                    # we need to resolve it relative to the 
                                                    # path where the symlink file was located
done

CODE_DIR="$( cd -P "$( dirname "$LIBRARY_SOURCE" )" && pwd )"

echo "CODE_DIR= ${CODE_DIR}"

if [ ! -d "${CODE_DIR}/build" ]; then
  mkdir "${CODE_DIR}/build"
fi


# the ubiquitous yell try and die
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

