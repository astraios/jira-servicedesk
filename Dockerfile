FROM centos

# Fetch Install binary
RUN yum install -y wget
RUN mkdir /install
WORKDIR /install
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-servicedesk-3.3.2-x64.bin

# Add the entrypoint
COPY entrypoint.sh /install/.
RUN chmod 755 /install/entrypoint.sh

# Create the data dir
RUN mkdir /data

# Volumes and Ports
VOLUME ["/opt/atlassian/jira", "/var/atlassian/application-data/jira"]
EXPOSE 8080 8005

# Entrypoint
ENTRYPOINT ["/install/entrypoint.sh"]
