#!/bin/sh

wget -q https://github.com/k3s-io/k3s/releases/download/v1.27.1%2Bk3s1/k3s
chmod u+x k3s
sudo ./k3s server
