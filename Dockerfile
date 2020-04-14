FROM ubuntu:18.04 as run
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk wget

WORKDIR /root
RUN wget -nv -q http://mirrors.ocf.berkeley.edu/apache/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz; tar -xf hadoop-2.8.5.tar.gz; rm hadoop-2.8.5.tar.gz; mv hadoop-2.8.5 hadoop
RUN wget -nv -q https://archive.apache.org/dist/spark/spark-2.4.0/spark-2.4.0-bin-without-hadoop.tgz; tar -xf spark-2.4.0-bin-without-hadoop.tgz; rm spark-2.4.0-bin-without-hadoop.tgz; mv spark-2.4.0-bin-without-hadoop spark
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV SPARK_HOME /root/spark

RUN mkdir /root/app
WORKDIR /root/app
ADD init.sh /root/init.sh
ENTRYPOINT ["/root/init.sh"]
