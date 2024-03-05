docker build . -t voxpopulidownloader
docker run -it -e ROOT=/downloaded -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e S3_ENDPOINT=$S3_ENDPOINT -e S3_BUCKET=$S3_BUCKET -v $(pwd)/downloaded:/downloaded voxpopulidownloader
