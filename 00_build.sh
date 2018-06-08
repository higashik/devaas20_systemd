#!/bin/bash

postgres_to=registry.gitlab.com/kazuhcurrycw/test/postgres:dap_9.5.5_app

tomcat_to=registry.gitlab.com/kazuhcurrycw/test/tomcat:dap_8.5.15_app

httpd_to=registry.gitlab.com/kazuhcurrycw/test/httpd:dap_2.4.6_app

docker build -t $postgres_to ./postgres/

docker build -t $tomcat_to ./tomcat/

docker build -t $httpd_to ./httpd/

