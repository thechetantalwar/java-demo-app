FROM thechetantalwar/tomcat:8.5.57
RUN apt-get install maven -y && mkdir /app
WORKDIR /app
COPY . .
RUN mvn package
WORKDIR /opt/tomcat/apache-tomcat-8.5.57/
RUN cp /app/target/thinknyx.war webapps/
