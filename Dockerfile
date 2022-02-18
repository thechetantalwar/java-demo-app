FROM thechetantalwar/tomcat:8.5.57
WORKDIR /opt/tomcat/apache-tomcat-8.5.57/
COPY target/thinknyx.war webapps/
