#!/bin/bash
yum update -y

# Install Docker
amazon-linux-extras enable docker
yum install -y docker
systemctl start docker
systemctl enable docker

# Run Prometheus
docker run -d \
  --name prometheus \
  -p 9090:9090 \
  prom/prometheus

# Run Grafana
docker run -d \
  --name grafana \
  -p 3000:3000 \
  grafana/grafana

# Run Blackbox Exporter
docker run -d \
  --name blackbox \
  -p 9115:9115 \
  prom/blackbox-exporter
