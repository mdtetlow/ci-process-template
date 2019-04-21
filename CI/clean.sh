#!/bin/sh
# clean script clean java project and ci tenp files

function usage() {
  echo "Usage: $0 <Java Maven Project Path>"
  exit 1
}

[ $# -ne 1 ] && { usage; }

MVN_PATH="$1"
ROOT_DIR=$(dirname `pwd`/$0)

[ ! -f "${MVN_PATH}/pom.xml" ] && { echo "Error - path provided is not a valid Maven project"; usage; }
cd ${MVN_PATH}

mvn clean

cd ${ROOT_DIR}

ARTEFACTS="tools/pkg ./*.tar.gz log ${MVN_PATH}/checkstyle"
echo "Removing CI artefacts: $ARTEFACTS"
for a in ${ARTEFACTS}
do
  echo "  Removing ${a}"
  rm -rf "${a}"
done
