#!/bin/sh
set -e

export $(printenv | grep -E 'R2|PROJECT|BACKUP' | xargs)

FILENAME="${PROJECT_NAME}_${BACKUP_DIR_NAME}.tar"

echo "[$(date)] Archiving $BACKUP_DIR_PATH..."
tar -cf /tmp/$FILENAME $BACKUP_DIR_PATH

echo "[$(date)] Uploading $FILENAME..."
AWS_ACCESS_KEY_ID=$R2_ACCESS_KEY \
AWS_SECRET_ACCESS_KEY=$R2_SECRET_KEY \
aws s3 cp /tmp/$FILENAME s3://${R2_BUCKET}/${FILENAME} \
  --endpoint-url $R2_ENDPOINT \
  --region auto

rm /tmp/$FILENAME
echo "[$(date)] Done: $FILENAME"
