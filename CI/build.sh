#!/bin/sh
# build script to drive compilation and build tools
# In this case this is driving compilation of a Java project using Apache Maven
# but it could just as will be another language.

function usage() {
  echo "Usage: $0 <Java Maven Project Path>"
  echo "       Java Maven Project Path - fully qualified path to java project"
  exit 1
}

[ $# -ne 1 ] && { usage; }

MVN_PATH="$1"
ROOT_DIR=$(dirname `pwd`/$0)
#ROOT_DIR=$(dirname $0)

[ ! -f "${MVN_PATH}/pom.xml" ] && { echo "Error - path provided is not a valid Maven project"; usage; }
cd ${MVN_PATH}

# create log directory
[ ! -d ${ROOT_DIR}/log ] && { mkdir ${ROOT_DIR}/log; }

# compilation
echo ""
echo "Compiling source"
mvn compile > ${ROOT_DIR}/log/compile.log 2>&1

# test for error return value and exit after reporting error
[ $? -ne 0 ] && { echo "compile failed - refer to log file: ${ROOT_DIR}/log/compile.log"; exit 1; }

echo "[ SUCCESSFULL ]"

# create docs
echo ""
echo "Building docs"
mvn javadoc:javadoc > ${ROOT_DIR}/log/javadoc.log 2>&1

# test for error return value but don't exit after reporting error
[ $? -ne 0 ] && { echo "[ FAILED ]"; echo "javadoc build failed - refer to log file: ${ROOT_DIR}/log/javadoc.log"; }

# now run quality tools

# deploy and run checkstyle tool
echo ""
echo "Running checkstyle tool"
# create tools package directory if it doesn't alread exist
[ ! -d "${ROOT_DIR}/tools/pkg" ] && { mkdir "${ROOT_DIR}/tools/pkg"; }

# run tool
${ROOT_DIR}/tools/checkstyle.sh "${ROOT_DIR}/tools/pkg" "${MVN_PATH}/src/main/java" > ${ROOT_DIR}/log/checkstyle.log 2>&1
[ $? -ne 0 ] && { echo "[ FAILED ]"; echo "checkstyle failed or produced style errors - refer to log file: ${ROOT_DIR}/log/checkstyle.log"; }
