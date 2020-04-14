#!/bin/bash
export PATH="$PATH:$SPARK_HOME/bin"
export SPARK_DIST_CLASSPATH="$(/root/hadoop/bin/hadoop classpath):$SPARK_HOME/jars"

APP_CLASS=$1
shift
echo "Running class $APP_CLASS with arguments: $@"

echo "Launching Spark Master"
/root/spark/sbin/start-master.sh

echo "Launching Spark Worker"
/root/spark/sbin/start-slave.sh spark://$HOSTNAME:7077

echo "Running Spark Submit"
spark-submit --deploy-mode client --master spark://$HOSTNAME:7077 --class $APP_CLASS /root/app/run.jar "$@"
