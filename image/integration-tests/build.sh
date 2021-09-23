aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com
docker build -t as3-integration-tests:latest .
docker tag as3-integration-tests:latest  "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/as3-integration-tests:latest
docker push "$AWS_ACCOUNT_ID".dkr.ecr.us-east-2.amazonaws.com/as3-integration-tests:latest