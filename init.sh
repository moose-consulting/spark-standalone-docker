#!/bin/bash
set -x
export PATH="$PATH:$SPARK_HOME/bin"

APP_CLASS=$1
shift
PACKAGES=$1
shift
echo "Running class $APP_CLASS with arguments: $@"

echo "Launching Spark Master"
nocache /opt/spark/sbin/start-master.sh

echo "Launching Spark Worker"
nocache /opt/spark/sbin/start-slave.sh spark://$HOSTNAME:7077

echo "Running Spark Submit"
nocache spark-submit --deploy-mode client --master spark://$HOSTNAME:7077 --class $APP_CLASS --packages $PACKAGES /root/app/run.jar "$@"
