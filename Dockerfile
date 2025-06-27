# 1. Base image with Java 11 + Tomcat 9.0
# This image provides a pre-configured Tomcat server with Java 11.
FROM tomcat:9.0-jdk11

# 2. Remove default Tomcat web applications (optional, but cleaner)
# This prevents Render from deploying the default Tomcat example apps.
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Copy your WAR file for deployment
# Copy your ROOT.war file from your local repository into Tomcat's webapps directory.
# Tomcat automatically detects and deploys WAR files placed here.
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# 4. Expose the web port
# This informs Docker that the container will listen on port 8080.
# Render's default web service port is 10000, but Tomcat defaults to 8080.
# We will tell Render to use port 8080 in Step 3.
EXPOSE 8080

# 5. Run Tomcat in the foreground
# This command starts the Tomcat server. Render expects your main process
# to run in the foreground to keep the container alive.
CMD ["catalina.sh", "run"]