FROM ubuntu:noble-20250714
RUN  apt update -y
RUN  apt install openjdk-21-jre -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.108/bin/apache-tomcat-9.0.108.tar.gz .
RUN tar -xzvf apache-tomcat-9.0.107.tar.gz
RUN mv apache-tomcat-9.0.107/* /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

