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

#Day 2
docker run -i -t --name first_image ubuntu /bin/bash

apt-get -yqq update
apt-get -y install apache2
exit

docker commit -m "Image with apache installed" -a "Ivan Zvieriev" first_image ivanzvieriev/first_image
docker push ivanzvieriev/first_image

docker start first_image
docker attach first_image
vim
apt-get install vim

docker commit -m "Image with apache installed + vim" -a "Ivan Zvieriev" first_image ivanzvieriev/first_image:apache_vim
docker push ivanzvieriev/first_image

docker images
docker rmi ivanzvieriev/first_image
docker rmi ivanzvieriev/first_image:apache_vim

#optional
docker run -i -t ivanzvieriev/first_image:apache_vim /bin/bash

docker rmi -f (docker images -a -q)

cd static_web
docker build --tag ivanzvieriev/static_web .

docker images
docker history ivanzvieriev/static_web
docker push ivanzvieriev/static_web
#(check on dockerhub)

docker run -d -p 80 --name static_web ivanzvieriev/static_web nginx -g "daemon off;"
docker port static_web
#http://localhost:32768/ (check in browser)

# Extend our Dockerfile with lines
# RUN echo 'New line’ >> /var/www/html/index.html

docker build --tag ivanzvieriev/static_web:v2 .
docker push ivanzvieriev/static_web:v2
docker run -d -p 80 --name static_web2 ivanzvieriev/static_web:v2 nginx -g "daemon off;"

docker run -d -p 80:80 --name static_web3 ivanzvieriev/static_web:v2 nginx -g "daemon off;"
# check in browser - localhost

#Modify version in the Dockerfile
docker build --tag ivanzvieriev/static_web:v3 .

cd copy_static_web
docker build --tag ivanzvieriev/copy_static_web .
docker stop (docker ps -a -q)

# github.com
# create repository git_web
# git clone https://github.com/ivan-zvieriev/git_web.git
# copy Docker and index.html files
git status
git add .
git commit -m "Adding index.html and Dockerfile"
git push

docker build --tag ivanzvieriev/git_web https://github.com/ivan-zvieriev/git_web.git
docker stop (docker ps -q)
docker run -d -p 80:80 --name git_web ivanzvieriev/git_web nginx -g "daemon off;"
docker push ivanzvieriev/git_web

# Go to repository git_web
# Authorize github
# Configure auto_build
#
# Modify and push changes to both Dockerfile and index.html
# Verify that automated build has been triggered

# Modify index.html
git add .
git commit -m „Preparing release 1.0.2”
git push
git tag 1.0.2
git push origin --tags
