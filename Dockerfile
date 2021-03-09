FROM tomcat:jdk8
COPY target/OMS.war /usr/local/tomcat/webapps/
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /usr/local/tomcat/wait
RUN chmod 755 /usr/local/tomcat/wait
CMD ["/usr/local/tomcat/wait", "&&", "catalina.sh", "run"]
