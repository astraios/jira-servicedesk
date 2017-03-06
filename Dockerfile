FROM centos

RUN yum install -y wget
RUN mkdir /install
WORKDIR /install
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-servicedesk-3.3.2-x64.bin

COPY entrypoint.sh /install/.
RUN chmod 755 /install/entrypoint.sh

# Create the data dir
RUN mkdir /data

VOLUME ["/opt/atlassian/jira", "/var/atlassian/application-data/jira"]
EXPOSE 8080 8005

ENTRYPOINT ["/install/entrypoint.sh"]
