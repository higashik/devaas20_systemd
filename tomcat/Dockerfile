#FROM registry.gitlab.com/kazuhcurrycw/test/tomcat:dap_8.5.15
FROM commonregistry:5000/tomcat:dap_8.5.15

COPY tomcat8 /etc/default/

COPY postgresql-42.2.2.jar /opt/tomcat8/lib/

COPY conf/context.xml /opt/tomcat8/conf/

COPY webapps/DBTest /opt/tomcat8/webapps/DBTest/

RUN chown -R tomcat8:tomcat8 /opt/tomcat8/

