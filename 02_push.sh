#!/bin/bash

postgres_to=registry.gitlab.com/kazuhcurrycw/test/postgres:dap_9.5.5_app

tomcat_to=registry.gitlab.com/kazuhcurrycw/test/tomcat:dap_8.5.15_app

httpd_to=registry.gitlab.com/kazuhcurrycw/test/httpd:dap_2.4.6_app

docker login registry.gitlab.com

echo "## push $postgres_to"
docker push $postgres_to

echo "## push $tomcat_to"
docker push $tomcat_to

echo "## push $httpd_to"
docker push $httpd_to

