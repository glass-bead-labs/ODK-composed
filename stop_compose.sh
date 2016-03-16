eval $(docker-machine env sz-tokyo)
HOSTIP=$(docker-machine ip sz-tokyo) docker-compose stop
