FROM tomcat:jdk8
COPY target/OMS.war /usr/local/tomcat/webapps/
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /usr/local/tomcat/wait
ADD start.sh /
RUN chmod +x /start.sh 
RUN chmod +x /usr/local/tomcat/wait
CMD ["/start.sh"]
