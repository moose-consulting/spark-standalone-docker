# Description

Launches a single-container standalone spark cluster, and submits a fat JAR to run in client mode. 

# Usage

1. Place fat jar at `/root/app/run.jar`.
2. Pass class name as first argument, all remaining arguments are passed to your spark app. 

```
docker run -d --mount type=bind,source=$PATH_TO_JAR,target=/root/app mooseconsulting/spark-standalone CLASS_NAME ARG1 ARG2 ...
```
