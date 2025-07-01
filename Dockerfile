# Use OpenJDK 23 base image
FROM openjdk:23-jdk-slim as build

# Set environment variables for Tomcat and JDK
ENV CATALINA_HOME=/opt/tomcat
ENV JAVA_HOME=/usr/local/openjdk-23

# Install Tomcat 9.0
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz && \
    tar -xvzf apache-tomcat-9.0.58.tar.gz -C /opt && \
    mv /opt/apache-tomcat-9.0.58 /opt/tomcat && \
    rm apache-tomcat-9.0.58.tar.gz

# Copy your WAR and JAR files to the Tomcat webapps folder
COPY target/your-project.war $CATALINA_HOME/webapps/
COPY lib/ /opt/tomcat/lib/

# Expose port 8080 (Tomcat default port)
EXPOSE 8080

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
