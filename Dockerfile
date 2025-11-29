FROM ubuntu:20.04

WORKDIR /boxfuse

RUN apt update
RUN apt install tzdata -y
RUN apt install default-jdk maven git tomcat9 -y

RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /boxfuse

RUN mvn package -DskipTests
RUN mv ./target/hello-1.0.war /var/lib/tomcat9/webapps/hello.war

EXPOSE 8080

CMD ["/usr/libexec/tomcat9/tomcat-start.sh"]