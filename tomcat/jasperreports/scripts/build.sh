#!/bin/bash

# Catch errors and undefined variables
set -euo pipefail

# Install extra packages
yum install -y unzip

# Set necessary environment variables to execute js-ant
export JAVA_HOME="/usr/lib/jvm/jre"

# Extract the compressed bundle
unzip "${UPLOADS_DIR}/*js-jrs*.zip" -d "$UPLOADS_DIR"

# This is the path to the config file
readonly BUILDOMATIC_DIR="$(cd ${UPLOADS_DIR}/**/buildomatic; pwd)"
readonly CONF="${BUILDOMATIC_DIR}/default_master.properties"

# Use postgresql config file template. For this simple example both mysql and
# postgresql are valid template files
cp "${BUILDOMATIC_DIR}/sample_conf/postgresql_master.properties" "$CONF"

# Replace config file template variables with the actual value
sed -i -e "s%^appServerDir = .*%appServerDir = /etc/tomcat%" "$CONF"
sed -i -e "s%^[ #]*CATALINA_HOME.*%CATALINA_HOME = /usr/share/tomcat%" "$CONF"
sed -i -e "s%^[ #]*CATALINA_BASE.*%CATALINA_BASE = /var/lib/tomcat%" "$CONF"


cd "$BUILDOMATIC_DIR"
# Extract .war
./js-ant deploy-webapp-ce
