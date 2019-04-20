#!/bin/sh
# test script to drive and test tools
# In this case this is driving testing of a Java project using Apache Maven
# but it could just as will be another language.

function usage() {
  echo "Usage: $0 <Java Maven Project Path>"
  exit 1
}

[ $# -ne 1 ] && { usage; }

MVN_PATH="$1"
echo "$MVN_PATH"

[ ! -f "${MVN_PATH}/pom.xml" ] && { echo "Error - path provided is not a valid Maven project"; usage; }
cd ${MVN_PATH}

mvn test
