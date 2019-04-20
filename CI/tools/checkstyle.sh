#!/bin/sh
# download, install and run checkstyle

function usage() {
  echo "Usage: $0 <Package directory> <Java project source directory>"
  echo "       Package directory is the location to deploy tool"
  echo "       Java project source directory is fully qualified path to scan"
  exit 1
}

[ $# -ne 2 ] && { usage; }

PKG_DIR=$1
JAVA_PROJ_SRC=$2

[ ! -d "${PKG_DIR}" ] || [ ! -d "${JAVA_PROJ_SRC}" ] && { usage; }

# change directory to  installation directory
cd ${PKG_DIR}

# download and build tool if its not already downloaded
if [ ! -d "checkstyle" ]; then
  git clone https://github.com/checkstyle/checkstyle.git
  cd checkstyle
  mvn clean compile
else
  cd checkstyle
fi

# run tool
mvn exec:java -Dexec.mainClass="com.puppycrawl.tools.checkstyle.Main" -Dexec.args="-c /sun_checks.xml ${JAVA_PROJ_SRC}"
