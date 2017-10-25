FROM openjdk:8u141-jdk

###################
#Installs scala 2.11
###################

RUN cd /opt/ && \
	wget https://downloads.lightbend.com/scala/2.11.11/scala-2.11.11.tgz -O scala-2.11.11.tgz && \
	tar -xvf scala-2.11.11.tgz && \
	rm scala-2.11.11.tgz
	
ENV PATH "$PATH:/opt/scala-2.11.11/bin"

###################
#Installs SBT 0.13
###################

RUN cd /opt/ && \
	wget https://cocl.us/sbt01316tgz -O sbt.tar && \
	tar -xvf sbt.tar && \
	rm sbt.tar 

ENV PATH "$PATH:/opt/sbt/bin"

#Initialize sbt (initial downloads)

VOLUME /sbtlib

RUN echo "-Dsbt.ivy.home=/sbtlib/"

RUN cd /tmp/ && \
	mkdir /tmp/sbtinit && \
	sbt	
	

#Installs sbt


