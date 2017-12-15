#

```
docker-compose up
```

# Full container demo

## Init cluster & volume
You can execute bellow in one pass and one time
```
# Init gluster nodes
docker exec -ti gluster_node-1_1 sh -c 'gluster peer probe node-2 && gluster peer probe node-3 && gluster peer status'
docker exec -ti gluster_node-2_1 sh -c 'gluster peer probe node-1 && gluster peer probe node-3 && gluster peer status'
docker exec -ti gluster_node-3_1 sh -c 'gluster peer probe node-1 && gluster peer probe node-2 && gluster peer status'

# Init service-a volume
docker exec -ti gluster_node-1_1 sh -c \
'gluster volume create service-a replica 3 node-1:/data/glusterfs/store/service-a node-2:/data/glusterfs/store/service-a node-3:/data/glusterfs/store/service-a'
# Init service-b volume
docker exec -ti gluster_node-1_1 sh -c \
'gluster volume create service-b replica 3 node-1:/data/glusterfs/store/service-b node-2:/data/glusterfs/store/service-b node-3:/data/glusterfs/store/service-b'

# Start volume
docker exec -ti gluster_node-1_1 sh -c 'gluster volume start service-a'
docker exec -ti gluster_node-1_1 sh -c 'gluster volume start service-b'
docker exec -ti gluster_node-1_1 sh -c 'gluster volume info && gluster volume status'

# Mount client volume for service-a
docker exec -ti gluster_service-a-1_1 sh -c 'mkdir -p /mnt/glusterfs/data'
docker exec -ti gluster_service-a-1_1 sh -c 'mount -t glusterfs node-1:/service-a /mnt/glusterfs/data'
docker exec -ti gluster_service-a-2_1 sh -c 'mkdir -p /mnt/glusterfs/data'
docker exec -ti gluster_service-a-2_1 sh -c 'mount -t glusterfs node-1:/service-a /mnt/glusterfs/data'

# Mount client volume for service-b
docker exec -ti gluster_service-b-1_1 sh -c 'mkdir -p /mnt/glusterfs/data'
docker exec -ti gluster_service-b-1_1 sh -c 'mount -t glusterfs node-1:/service-b /mnt/glusterfs/data'
docker exec -ti gluster_service-b-2_1 sh -c 'mkdir -p /mnt/glusterfs/data'
docker exec -ti gluster_service-b-2_1 sh -c 'mount -t glusterfs node-1:/service-b /mnt/glusterfs/data'
```

## Verify data

You can execute bellow in one pass
```
docker exec -ti gluster_service-a-1_1 sh -c 'echo "text added from gluster_service-a-1_1 client" > /mnt/glusterfs/data/distributed_file.txt'
docker exec -ti gluster_service-a-2_1 sh -c 'echo "text added from gluster_service-a-2_1 client" >> /mnt/glusterfs/data/distributed_file.txt'
docker exec -ti gluster_service-b-1_1 sh -c 'echo "text added from gluster_service-b-1_1 client" > /mnt/glusterfs/data/distributed_file.txt'
docker exec -ti gluster_service-b-2_1 sh -c 'echo "text added from gluster_service-b-2_1 client" >> /mnt/glusterfs/data/distributed_file.txt'

echo "== Content file for service a node 1 =="
docker exec -ti gluster_service-a-1_1 sh -c 'cat /mnt/glusterfs/data/distributed_file.txt'
echo
echo "== Content file for service a node 2 =="
docker exec -ti gluster_service-a-2_1 sh -c 'cat /mnt/glusterfs/data/distributed_file.txt'
echo

echo "== Content file for service b node 1 =="
docker exec -ti gluster_service-b-1_1 sh -c 'cat /mnt/glusterfs/data/distributed_file.txt'
echo
echo "== Content file for service b node 1 =="
docker exec -ti gluster_service-b-2_1 sh -c 'cat /mnt/glusterfs/data/distributed_file.txt'
```

# GlusterFS server for docker containers
```
# Init gluster nodes
docker exec -ti gluster_node-1_1 sh -c 'gluster peer probe node-2 && gluster peer probe node-3 && gluster peer status'
docker exec -ti gluster_node-2_1 sh -c 'gluster peer probe node-1 && gluster peer probe node-3 && gluster peer status'
docker exec -ti gluster_node-3_1 sh -c 'gluster peer probe node-1 && gluster peer probe node-2 && gluster peer status'

# Get node IPs
NODE1=$(docker inspect --format "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" gluster_node-1_1)
NODE2=$(docker inspect --format "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" gluster_node-2_1)
NODE3=$(docker inspect --format "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" gluster_node-3_1)

# Init dockerstore volume
docker exec -ti gluster_node-1_1 sh -c \
"gluster volume create dockerstore replica 3 $NODE1:/data/glusterfs/store/dockerstore $NODE2:/data/glusterfs/store/dockerstore $NODE3:/data/glusterfs/store/dockerstore"

# Start volume
docker exec -ti gluster_node-1_1 sh -c 'gluster volume start dockerstore'
docker exec -ti gluster_node-1_1 sh -c 'gluster volume info && gluster volume status'

# Mount from docker
docker plugin install sapk/plugin-gluster
docker volume create --driver sapk/plugin-gluster --opt voluri="$NODE1,$NODE2,$NODE3:dockerstore" --name dockerstore
docker run -v dockerstore:/mnt --rm -ti ubuntu
```


# Reset storage (WARNING LOST ALL DATA)
```
# Running in fish terminal (force bash terminal)
docker stop $(docker ps -a | grep "gluster_" | awk \'{ print $1}\') &&  docker rm $(docker ps -a | grep "gluster_" | awk \'{ print $1}\')
sudo rm -rf /data/docker/gluster-*
```
