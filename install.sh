#!/bin/sh

# This script will install JIRA ServiceDesk a first time to prepare the image

# PARAMETERS
INSTALL_PATH=${INSTALL_PATH:-/opt/atlassian/jira}
DATA_PATH=${DATA_PATH:-/var/atlassian/jira}

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

# Archive the setup
echo "Archiving the install"
cd ${INSTALL_PATH}/../. ; tar cjf install.tar.bz2 jira ; mv install.tar.bz2 /install
cd ${DATA_PATH}/../. ; tar cjf data.tar.bz2 jira ; mv data.tar.bz2 /install
echo "Cleaning the install" 
rm -rf ${INSTALL_PATH}/*
rm -rf ${DATA_PATH}/*
