#! /bin/bash

sudo docker run -dit --name prometheus --restart=always -p 9090:9090 -v ./config/:/etc/prometheus prom/prometheus