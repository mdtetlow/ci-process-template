#!/bin/sh
# packaging script to drive and package tools
# In this case this is driving packaging of a Java project using Apache Maven
# but it could just as will be another language.

function usage() {
  echo "Usage: $0 <Java Maven Project Path>"
  echo "       Java Maven Project Path - fully qualified path to java project"
  exit 1
}

[ $# -ne 1 ] && { usage; }

MVN_PATH="$1"
ROOT_DIR=$(dirname `pwd`/$0)
OUT_DIR="${ROOT_DIR}/pkg"
JAR_SUFFIX="1.0-SNAPSHOT"

[ ! -f "${MVN_PATH}/pom.xml" ] && { echo "Error - path provided is not a valid Maven project"; usage; }
cd ${MVN_PATH}

# Maven prackage will produce the Java project jar
echo ""
echo "Running Maven package"
mvn package > ${ROOT_DIR}/log/package.log 2>&1

# test for error return value and exit after reporting error
[ $? -ne 0 ] && { echo "package failed - refer to log file: ${ROOT_DIR}/log/package.log"; exit 1; }

echo "[ SUCCESSFULL ]"

# now packaage up java artitifacts into the project tar bundle
echo ""
echo "Producing project archive"
PROJECT_PACKAGE_NAME=$(basename ${MVN_PATH})
cd ${ROOT_DIR}
mkdir -p temp/lib
cd temp
cp "${MVN_PATH}/target/${PROJECT_PACKAGE_NAME}-1.0-SNAPSHOT.jar" lib
cp -r "${MVN_PATH}/target/site/apidocs" docs
tar -cf - lib docs | gzip > "../${PROJECT_PACKAGE_NAME}.tar.gz"
cd ..
rm -rf temp

if [ -f "${PROJECT_PACKAGE_NAME}.tar.gz" ]; then
  echo "[ SUCCESSFULL ]"
  echo "Output: ${PROJECT_PACKAGE_NAME}.tar.gz"
else
  echo "[ FAILED ]"
fi
