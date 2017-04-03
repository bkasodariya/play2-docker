FROM ubuntu:16.10

MAINTAINER cousins <bkasodariya@gmail.com> 

RUN yum update -y

RUN yum install -y wget && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u11-b12/jdk-8u11-linux-x64.rpm

RUN rpm -ivh jdk-8u11-linux-x64.rpm && rm jdk-8u11-linux-x64.rpm

RUN yum update -y && yum install -y unzip

RUN curl -O https://downloads.typesafe.com/typesafe-activator/1.3.12/typesafe-activator-1.3.12.zip

RUN unzip typesafe-activator-1.3.12.zip -d / && rm typesafe-activator-1.3.12.zip && chmod a+x /activator-1.3.12/activator

ENV PATH $PATH:/activator-1.3.12 EXPOSE 9000 8888 RUN mkdir /app

WORKDIR /app

CMD ["activator", "run"]