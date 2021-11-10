tag=$1
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com
docker build --no-cache -t accumulo-s3:"$tag" .
docker tag accumulo-s3:"$tag"  "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/accumulo-s3:"$tag"
docker push "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/accumulo-s3:"$tag"