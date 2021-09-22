aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 347653770938.dkr.ecr.us-east-2.amazonaws.com
docker build -t as3-integration-tests:latest .
docker tag as3-integration-tests:latest  347653770938.dkr.ecr.us-east-2.amazonaws.com/as3-integration-tests:latest
docker push 347653770938.dkr.ecr.us-east-2.amazonaws.com/as3-integration-tests:latest