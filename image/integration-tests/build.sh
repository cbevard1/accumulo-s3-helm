aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com
docker build -t acc-s3-intg:latest .
docker tag acc-s3-intg:latest  "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/acc-s3-intg:latest
docker push "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/acc-s3-intg:latest