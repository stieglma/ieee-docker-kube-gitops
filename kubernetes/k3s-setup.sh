#!/bin/sh

wget -q https://github.com/k3s-io/k3s/releases/download/v1.27.1%2Bk3s1/k3s
chmod u+x k3s
sudo ./k3s server

# to use k3s command a little bit nicer, it might be useful
# to move the k3s binary to somewhere in your path, or add your current
# directory to your path, e.g. /usr/local/bin
