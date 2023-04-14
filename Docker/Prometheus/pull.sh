#! /bin/bash
sudo docker network create --subnet=10.5.0.0/16 prometheus

sudo docker-compose -f docker-compose.yml up
#sudo docker run -dit --name prometheus --restart=always -p 9090:9090 -v ./config/:/etc/prometheus prom/prometheus