#!/bin/sh

if [ "$#" -ne 2 ]; then
   echo "Usage:  ./upload_to_bucket.sh bucket-name folder-name"
   exit
fi

BUCKET=$1
FOLDER=$2
echo "replacing bucket and folder references and copying to gs://$BUCKET/$FOLDER"

# replace
TEMP=tmp
rm -rf $TEMP
mkdir $TEMP
for FILE in $(ls -1 *.py *.ipynb init*.sh input*.txt); do
    echo $FILE
    cat $FILE | sed "s/BUCKET_NAME/$BUCKET/g" | sed "s/USER_NAME/$USER/g" > $TEMP/$FILE
done

# first the originals, then the modified
gsutil -m cp * gs://$BUCKET/$FOLDER
gsutil -m cp $TEMP/* gs://$BUCKET/$FOLDER

# this allows you to look at the .py file in a browser
gsutil -m setmeta -h "Content-Type:text/plain" gs://$BUCKET/$FOLDER/*.py
