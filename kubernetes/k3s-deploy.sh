#!/bin/sh

# All commands in here use the kubectl + kubeconfig included within k3s, and therefore we need
# sudo to execute the commands, instead of doing that, you can also create your own kubeconfig
# and run a local kubectl, so that you don't need sudo

# create the namespace in which we want to deploy the application
sudo k3s kubectl create ns ieee-manual-demo

# create the deployment (1/2)
sudo k3s kubectl create deployment slides --image=ieee-demo-slides:latest -n ieee-manual-demo

# create the deployment (2/2)
# the pod will fail to start as long as we reference a local image and
# don't change the imagePullPolicy from Always to Never, so we do that here
# this is to showcase that you can extract all kinds of things via kubectl and jsonpath
CONTAINER_NAME=$(sudo k3s kubectl get deployment slides -n ieee-manual-demo -o=jsonpath='{.spec.template.spec.containers[0].name}')
sudo --preserve-env=CONTAINER_NAME k3s kubectl patch deployment slides -p '{"spec": {"template": {"spec":{"containers":[{"name":"'${CONTAINER_NAME}'","imagePullPolicy":"Never"}]}}}}' -n ieee-manual-demo

# create the service for exposing the application
sudo k3s kubectl expose deployment slides -n ieee-manual-demo --port=8080

# create the ingress resources so that we have an endpoint outside of the cluster
sudo k3s kubectl apply -f ingress.yaml
