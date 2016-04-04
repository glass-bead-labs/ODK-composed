docker-machine start sz-tokyo
docker-machine regenerate-certs sz-tokyo
eval $(docker-machine env sz-tokyo)
HOSTIP=$(docker-machine ip sz-tokyo); docker-compose up -d
exec docker-compose logs
