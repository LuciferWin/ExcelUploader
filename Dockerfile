# Use Render-friendly Tomcat base image with Java 17
FROM docker.io/library/tomcat:9.0-jre17-temurin-jammy

# Remove default Tomcat apps to free resources
RUN rm -rf /usr/local/tomcat/webapps/*

# Create directory for manual JAR dependencies
RUN mkdir -p /usr/local/tomcat/lib

# Copy your manual JAR dependencies
COPY ./lib/*.jar /usr/local/tomcat/lib/

# Copy WAR file and deploy as root application
# (Replace 'yourapp.war' with your actual filename)
COPY ./webapps/yourapp.war /usr/local/tomcat/webapps/ROOT.war

# Fix file permissions (critical for Render)
RUN chmod -R 755 /usr/local/tomcat

# Expose port 8080 (default Tomcat port)
EXPOSE 8080

# Start Tomcat with security optimizations
CMD ["catalina.sh", "run"]