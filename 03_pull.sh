#!/bin/bash

postgres=registry.gitlab.com/kazuhcurrycw/test/postgres:dap_9.5.5_app
tomcat=registry.gitlab.com/kazuhcurrycw/test/tomcat:dap_8.5.15_app
httpd=registry.gitlab.com/kazuhcurrycw/test/httpd:dap_2.4.6_app

date
docker pull $postgres
date
docker pull $tomcat
date
docker pull $httpd
date

