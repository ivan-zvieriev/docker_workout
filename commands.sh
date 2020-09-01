docker info

docker help

docker help run

docker run --name Adam -i -t ubuntu /bin/bash
# run starts a new container
# --name - gives the name for the container
# -i leaves STDIN open for the container
# -t attaches pseudo terminal for the container
# ubuntu - base image for container
# /bin/bash – command to be run in the container

hostname
cat /etc/hosts
ps -aux
apt-get update
apt-get install vim
exit

docker ps

docker ps -a

docker ps -a -q

docker start Adam
docker ps

docker stop Adam
docker ps
docker ps -a

docker start Adam
docker attach Adam

docker run --name d_container -d ubuntu /bin/bash -c "while true;do echo hello world;sleep 1;done"
docker ps

docker logs d_container
docker logs -f d_container
docker logs -ft d_container
docker logs --tail 3 -ft d_container

docker top d_container

docker stats d_container

docker exec -d d_container touch /etc/new_config_file
docker exec -i -t d_container /bin/bash
ls -alh /etc | grep new_

docker stop d_container (sends SIGTERM )

docker start d_container
docker restart d_container

docker kill d_container (sends SIGKILL)

docker stop (docker ps -q)

docker run --restart=always --name=phoenix_container -d ubuntu /bin/bash -c "echo hello world;exit"

docker run --restart=on-failure:3 --name=trinity -d ubuntu /bin/bash -c "echo hello world;sleep 15;exit 1"

docker inspect d_container

docker inspect -f='{{.State.Running}}' d_container

docker inspect --format='{{.State.Running}}' d_container

docker inspect --format='{{.State.Running}}' d_container Adam

docker inspect --format='{{.Name}} | {{.State.Running}} | {{.State.Status}}' d_container Adam

docker rm Adam

docker rm -f (docker ps -a -q)

docker run -i -t -v /data --name data_container ubuntu /bin/bash
cd data
touch data1.txt
exit

docker inspect data_container

docker start data_container
docker attach data_container
cd data
ls

docker rm data_container
docker volume ls
docker volume inspect <id>

docker run -i -t --name data_container2 -v=<Mountpoint>:/data ubuntu

docker images

docker login

docker pull ubuntu:18.04

docker run -i -t --name=specific_ubuntu ubuntu:18.04 /bin/bash

docker images ubuntu

docker search activemq

docker pull webcenter/activemq

docker run -i -t webcenter/activemq /bin/bash
