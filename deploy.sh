docker service rm sillyhat_elasticsearch sillyhat_kibana sillyhat_logstash
docker stack deploy -c docker-compose.yml sillyhat

docker service update --force sillyhat_logstash

docker service rm sillyhat_logstash
docker stack deploy -c docker-compose.yml sillyhat

sudo bin/elasticsearch-plugin install logstash-output-slack