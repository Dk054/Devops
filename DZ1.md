Задача 1
sudo docker images
sudo docker rmi -f b9d1c8159cd0

sudo docker login -u dk054
sudo docker build -t dk054/custom-nginx:1.0.0 .
sudo docker push dk054/custom-nginx:1.0.0

https://hub.docker.com/repository/docker/dk054/custom-nginx/tags/1.0.0/sha256-73402190b0857ea96916f12d3caefd47f68b578ef32e7924a3696c88d11e84f7