#!/bin/sh

# JIRA - ServiceDesk
# Docker image entrypoint

# PARAMETERS
INSTALL_PATH=${INSTALL_PATH:-/opt/atlassian/jira}
# The default DATA_PATH is /var/atlassian/application-data/jira
DATA_PATH=${DATA_PATH:-/data/jira}
ME=`basename "$0"`

# This script will
# 1 - Install JIRA Service Desk in its install path if no installation is detected
# 2 - Start JIRA Service Desk

# Check if JIRA is installed
# If not, generate install inputs
# And execute the installer
if [ $(ls ${INSTALL_PATH} | wc -l) == "0" ]; 
then
  echo "Jira is not installed..."
  cat << EOF | sh /install/atlassian-servicedesk-3.3.2-x64.bin
o
2
${INSTALL_PATH}
${DATA_PATH}
1
n
i
n
EOF
fi

# Start JIRA
${INSTALL_PATH}/bin/start-jira.sh -fg
