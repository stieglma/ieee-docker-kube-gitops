#!/bin/sh


# first import locally created image
# usually this would be e.g. on dockerhub, github or something similar
docker save ieee-demo-slides:latest | sudo k3s ctr images import -
