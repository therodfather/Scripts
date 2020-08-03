#!/bin/bash

apt update && apt upgrade -y

wget https://github.com/prometheus/prometheus/releases/download/v2.20.0/prometheus-2.20.0.linux-amd64.tar.gz && tar -xzf prometheus-2.20.0.linux-amd64.tar.gz

cd prometheus-2.20.0.linux-amd64

./prometheus
