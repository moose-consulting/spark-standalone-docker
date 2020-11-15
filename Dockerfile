FROM openjdk:8-slim

RUN apt-get update && \
    apt-get install -y wget nocache procps && \
    rm -rf /var/lib/apt/lists/*
    
WORKDIR /opt

RUN wget -nv -q https://archive.apache.org/dist/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz && \
    tar -xf spark-3.0.1-bin-hadoop3.2.tgz && \
    rm spark-3.0.1-bin-hadoop3.2.tgz && \
    mv spark-3.0.1-bin-hadoop3.2 spark


ENV SPARK_HOME /opt/spark

RUN wget -P /opt/spark/jars -q https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar 
RUN wget -P /opt/spark/jars -q https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.375/aws-java-sdk-bundle-1.11.375.jar

RUN mkdir /root/app
WORKDIR /root/app
ADD init.sh /root/init.sh
ENTRYPOINT ["/root/init.sh"]
