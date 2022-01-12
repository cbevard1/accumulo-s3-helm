tag=$1
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 347653770938.dkr.ecr.us-east-2.amazonaws.com
docker build -t accumulo-s3:"$tag" .
docker tag accumulo-s3:"$tag"  347653770938.dkr.ecr.us-east-2.amazonaws.com/accumulo-s3:"$tag"
docker push 347653770938.dkr.ecr.us-east-2.amazonaws.com/accumulo-s3:"$tag"