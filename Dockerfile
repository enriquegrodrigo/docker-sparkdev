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

COPY sbtopts /opt/sbt/conf/sbtopts

VOLUME /sbtlib

#Initialize sbt (initial downloads)

RUN cd /tmp/ && \
	mkdir /tmp/sbtinit && \
	sbt	
	

###################
#Installs Spark 2.2 
###################


RUN cd /opt/ && \
	wget  http://ftp.cixug.es/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz -O spark-2.2.0-bin-hadoop2.7.tgz && \
	tar -xvf spark-2.2.0-bin-hadoop2.7.tgz && \
	rm spark-2.2.0-bin-hadoop2.7.tgz

ENV PATH "$PATH:/opt/spark-2.2.0-bin-hadoop2.7/bin"


###################
#Installs Spark 2.2 
###################

VOLUME /home/work/project 

WORKDIR /home/work/project

EXPOSE 4040

CMD ["spark-shell"]
	
