echo uploading tars to r2
aws s3 cp $TAR_DIR s3://$S3_BUCKET/voxpopuli_tars/ --recursive --region=us-east-1 --endpoint-url=$S3_ENDPOINT