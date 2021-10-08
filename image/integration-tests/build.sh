tag=$1
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com
docker build --no-cache -t acc-s3-intg:"$tag" .
docker tag acc-s3-intg:"$tag"  "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/acc-s3-intg:"$tag"
docker push "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/acc-s3-intg:"$tag"