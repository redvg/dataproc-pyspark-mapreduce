#!/bin/bash

if [ "$#" -ne 2 ]; then
   echo "Usage:  ./create_cluster.sh bucket-name folder-name"
   exit
fi

BUCKET=$1
FOLDER=$2
echo "creating dataproc computing cluster"

gcloud dataproc clusters create my-cluster --zone us-central1-a \
	--master-machine-type n1-standard-1 --master-boot-disk-size 50 \
	--num-workers 2 --worker-machine-type n1-standard-1 \
	--worker-boot-disk-size 50 --network=default \
  --initialization-actions=gs://$BUCKET/$FOLDER/init-script.sh,gs://dataproc-initialization-actions/datalab/datalab.sh
