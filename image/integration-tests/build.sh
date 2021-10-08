aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com
docker build -t acc-s3-intg:2.0.2 .
docker tag acc-s3-intg:2.0.2  "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/acc-s3-intg:2.0.2
docker push "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/acc-s3-intg:2.0.2