# [Optional]

Create docker swarm cluster (for simulation)

```
docker swarm init
export SWARM_TOKEN=$(docker swarm join-token -q worker)
export SWARM_MASTER=$(docker info | grep -w 'Node Address' | awk '{print $3}')

# docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
docker-compose up -d

for node in $(docker node ls | grep Down | grep "node-" | awk '{print $1}'); do docker node rm "$node"; done
for i in $(seq 3); do docker exec -ti swarmcluster_node-${i}_1 docker swarm join --token ${SWARM_TOKEN} ${SWARM_MASTER}:2377; done

docker run -it -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock dockersamples/visualizer
```
# Launch Home automation

```
#docker service rm home-automation_homeassistant
docker stack deploy --compose-file docker-compose.yml  home-automation
from your brower, go to http://${SWARM_MASTER}:8123
```
