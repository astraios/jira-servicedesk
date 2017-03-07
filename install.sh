#!/bin/sh

# This script will install JIRA ServiceDesk a first time to prepare the image

# PARAMETERS
INSTALL_PATH=${INSTALL_PATH:-/install/tmpinstall}
DATA_PATH=${DATA_PATH:-/install/tmpdata}
ME=`basename "$0"`

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
tar cjf install.tar.bz2 tmpinstall
tar cjf data.tar.bz2 tmpdata
echo "Cleaning the install" 
rm -rf /install/tmpinstall
rm -rf /install/tmpdata
