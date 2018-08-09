# dataproc-pyspark-mapreduce
GCP Dataproc mapreduce sample with PySpark


## upload_to_bucket.sh
uploads init scripts, inputs and py stuff to cloud storage bucket \
usage ... bucket-name folder-name \
init scripts must have 'init' prefix \
input txt must have 'input' prefix \

## init_script.sh
installs py api client \
just an illustration, not needed here \

## create_cluster.sh
create computing cluster \
uses basic config (1 master, 2 worker nodes..) \
runs 2 initialization scripts: \
init_script.sh see above \
datalab.sh from gcp \
for more templates see https://github.com/GoogleCloudPlatform/dataproc-initialization-actions \

## how to
run upload.sh \
run create_cluster.sh
