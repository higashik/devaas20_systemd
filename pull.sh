#!/bin/bash

centos=registry.gitlab.com/kazuhcurrycw/test/centos:dap_7.3.1611
postgres=registry.gitlab.com/kazuhcurrycw/test/postgres:dap_9.5.5
tomcat=registry.gitlab.com/kazuhcurrycw/test/tomcat:dap_8.5.15
httpd=registry.gitlab.com/kazuhcurrycw/test/httpd:dap_2.4.6

date
docker pull $centos
date
docker pull $postgres
date
docker pull $tomcat
date
docker pull $httpd
date
