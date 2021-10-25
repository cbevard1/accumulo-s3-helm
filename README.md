# accumulo-s3-helm

helm install zookeeper bitnami/zookeeper --set replicaCount=3,fourlwCommandsWhitelist="srvr\, mntr\, ruok\, stat\, cons" -n accumulo
