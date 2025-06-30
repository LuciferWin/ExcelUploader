FROM tomcat:9-jdk17-openjdk

# Remove default webapps (optional, keeps it clean)
RUN rm -rf /usr/local/tomcat/webapps/*

# Add your WAR to Tomcat webapps directory
COPY app.war /usr/local/tomcat/webapps/ROOT.war

# If you have extra JARs (e.g., JDBC drivers), copy them:
COPY lib/* /usr/local/tomcat/lib/

# Expose default port
EXPOSE 8080

# Start Tomcat (default CMD is fine, but you can be explicit)
CMD ["catalina.sh", "run"]