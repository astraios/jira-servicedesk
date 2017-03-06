# JIRA ServiceDesk

This docker image deploys a JIRA ServiceDesk instance.

## Ports

Are exposed, ports `8080` and `8005`

## Volumes

### Install folder

JIRA is installed, inside the container, in it's default location: `/opt/atlassian/jira`. Mouting a volume here will allow you to tweak the installation.

Attention, JIRA ServiceDesk is not installed during this image build. JIRA's installation will only happen if
the `entrypoint` script finds the install folder empty. This allows you to mount a volume at the install folder.

The installation path can be changed using `ENV` variable.

### Data folder

Data are stored in `/data/jira` instead of the default `/var/atlassian/application-data/jira`. There is no valid explanation to this. I'm just lazy and I don't want to type long path when I mount the docker image's volumes.

The data path can be changed using `ENV` variables

## Environment variables

* `INSTALL_PATH`, default value is `/opt/atlassian/jira`, will be where the application is installed
* `DATA_PATH`, default value is `/data/jira`, will be where the datas will be stored

## Start the container

```
docker run -d -v your/install/path:/opt/atlassian/jira -v your/data/path:/data/jira -p 8080:8080 notuscloud/jira-servicedesk
```