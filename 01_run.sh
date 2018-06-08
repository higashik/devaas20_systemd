#!/bin/bash

#centos=registry.gitlab.com/kazuhcurrycw/test/centos:dap_7.3.1611
postgres=registry.gitlab.com/kazuhcurrycw/test/postgres:dap_9.5.5_app
tomcat=registry.gitlab.com/kazuhcurrycw/test/tomcat:dap_8.5.15_app
httpd=registry.gitlab.com/kazuhcurrycw/test/httpd:dap_2.4.6_app
NW="--net tsnw"

# NW
docker network create $NW

# centos
#docker run -d -it -v /etc/localtime:/etc/localtime:ro $NW --name centos -p 40022:22 $centos

# httpd
docker run -d -it -v /etc/localtime:/etc/localtime:ro $NW --name httpd -p 10080:80 -p 10022:22 $httpd

# tomcat
docker run -d -it -v /etc/localtime:/etc/localtime:ro $NW --name tomcat -p 20022:22 -p 28009:8009 -p 28080:8080 $tomcat

# postgres
docker run -d -it -v /etc/localtime:/etc/localtime:ro $NW --name postgres -p 30022:22 -p 35432:5432 $postgres

