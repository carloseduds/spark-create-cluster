#!/bin/bash

SPARK_WORKLOAD=$1

echo "SPARK_WORKLOAD: $SPARK_WORKLOAD"

# Ajustar permissões do diretório de logs
echo "Setting permissions for /opt/spark/spark-events..."
chmod -R 777 /opt/spark/spark-events

# Verificar o tipo de workload e iniciar o serviço apropriado
if [ "$SPARK_WORKLOAD" == "master" ]; then
  echo "Starting Spark Master..."
  start-master.sh -p 7077
elif [ "$SPARK_WORKLOAD" == "worker" ]; then
  echo "Starting Spark Worker..."
  start-worker.sh spark://spark-master:7077
elif [ "$SPARK_WORKLOAD" == "history" ]; then
  echo "Starting Spark History Server..."
  start-history-server.sh
else
  echo "Unknown workload: $SPARK_WORKLOAD"
  echo "Usage: $0 {master|worker|history}"
  exit 1
fi
