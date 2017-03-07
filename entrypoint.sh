#!/bin/sh

# JIRA - ServiceDesk
# Docker image entrypoint

# PARAMETERS
export INSTALL_PATH=${INSTALL_PATH:-/opt/atlassian/jira}
export DATA_PATH=${DATA_PATH:-/var/atlassian/jira} # The default DATA_PATH is /var/atlassian/application-data/jira
export JRE_HOME=${INSTALL_PATH}/jre
export JIRA_HOME=${DATA_PATH}

# This script will
# 1 - Install JIRA Service Desk in its install path if no installation is detected
# 2 - Start JIRA Service Desk

# Check if JIRA is installed
# If not, generate install inputs
# And execute the installer
if [ $(ls ${INSTALL_PATH} | wc -l) == "0" ]; 
then
  echo "Jira is not installed..."
  cd /install
  tar xvf install.tar.bz2
  tar xvf data.tar.bz2
  rsync -aHv --progress tmpinstall/ ${INSTALL_PATH}/
  rsync -aHv --progressv tmpdata/ ${DATA_PATH}/
  chown -Rv jira: ${DATA_PATH}
  rm -rf tmpinstall
  rm -rf tmpdata
  cd -
fi

# Start JIRA
${INSTALL_PATH}/bin/start-jira.sh -fg
