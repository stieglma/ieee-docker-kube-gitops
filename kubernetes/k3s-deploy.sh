#!/bin/sh

sudo k3s kubectl create ns ieee-manual-demo
sudo k3s kubectl create deployment slides --image=ieee-demo-slides:latest -n ieee-manual-demo
CONTAINER_NAME=$(sudo ../k3s kubectl get deployment slides -n ieee-manual-demo -o=jsonpath='{.spec.template.spec.containers[0].name}')
sudo --preserve-env=CONTAINER_NAME k3s kubectl patch deployment slides -p '{"spec": {"template": {"spec":{"containers":[{"name":"'${CONTAINER_NAME}'","imagePullPolicy":"Never"}]}}}}' -n ieee-manual-demo
sudo k3s kubectl expose deployment slides -n ieee-manual-demo --port=8080
sudo k3s kubectl apply -f ingress.yaml
