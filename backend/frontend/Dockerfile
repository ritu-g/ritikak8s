FROM tomcat:9.0-slim
WORKDIR /opt
# Set environment variables (consider injecting from outside)
ENV APP_HOME=/usr/local/tomcat
ENV PORT=8080
# Copy application WAR
ADD https://piyubucket.s3.amazonaws.com/student.war $APP_HOME/webapps/
# Copy database connector
ADD  https://piyubucket.s3.amazonaws.com/mysql-connector.jar $APP_HOME/lib
# Copy configuration
COPY config /opt
RUN sed -i '20r /opt/config' /usr/local/tomcat/conf/context.xml
EXPOSE $PORT
CMD ["catalina.sh", "run"]