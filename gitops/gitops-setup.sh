#!/bin/sh

# here we just need to apply the argocd directory,
# everything else is preconfigured inside the ArgoCD application
# so the ieee-demo namespace and the exposed traefik dashboard
# will start automatically, and you don't need to do anything else

sudo k3s kubectl apply -k argocd
