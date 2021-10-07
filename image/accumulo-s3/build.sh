aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 347653770938.dkr.ecr.us-east-2.amazonaws.com
docker build -t accumulo-s3:0.0.1 .
#docker tag accumulo-s3:latest  347653770938.dkr.ecr.us-east-2.amazonaws.com/accumulo-s3:latest
#docker push 347653770938.dkr.ecr.us-east-2.amazonaws.com/accumulo-s3:latest