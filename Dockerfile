FROM centos:latest

MAINTAINER cousins <bkasodariya@gmail.com> 

ENV	HOME /root 
ENV	LANG en_US.UTF-8 
ENV	LC_ALL en_US.UTF-8

RUN yum update -y

RUN yum install -y curl; yum upgrade -y; yum update -y;  yum clean all

ENV JDK_VERSION 8u11 ENV JDK_BUILD_VERSION b12 RUN curl -LO "http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-$JDK_BUILD_VERSION/jdk-$JDK_VERSION-linux-x64.rpm" -H 'Cookie: oraclelicense=accept-securebackup-cookie' && rpm -i jdk-$JDK_VERSION-linux-x64.rpm; rm -f jdk-$JDK_VERSION-linux-x64.rpm; yum clean all

ENV JAVA_HOME /usr/java/default

RUN yum update -y && yum install -y unzip

RUN curl -O https://downloads.typesafe.com/typesafe-activator/1.3.12/typesafe-activator-1.3.12.zip

RUN unzip typesafe-activator-1.3.12.zip -d / && rm typesafe-activator-1.3.12.zip && chmod a+x /activator-dist-1.3.12/bin/activator

ENV PATH $PATH:/activator-dist-1.3.12/bin

EXPOSE 9000 8888 

RUN mkdir /app

WORKDIR /app

CMD ["activator", "run"]