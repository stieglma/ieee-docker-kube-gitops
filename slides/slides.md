---
marp: true
theme: gaia
class:
footer: "© IKOR | Thomas Stieglmaier | Docker & Kubernetes - GitOps for Everyone"
---

<!-- dark background
<style>
    section {
        font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
        background-color:  #00214A;
        color: #FFFFFF;
    }
    a {
        color: #7190C9;
    }
    footer {
        font-size: 12px;
    }
</style>-->

<!-- light background-->
<style>
    section {
        font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
        background-color:  #FFFFFF;
        color: #00214A;
    }
    a {
        color: #0057B7;
    }
    footer {
        font-size: 12px;
    }
</style>
<!-- _class: lead -->

# Docker & Kubernetes

##### GitOps for Everyone

---

<!-- _class: lead -->

**_Docker_** - Use Cases, Dockerfiles
**_Kubernetes_** - Architecture, (local) Setup
**_GitOps_** - Principles, Tools
**_"Home-Lab"_** - Working with the tool stack

---

<!-- _class: lead -->

# Docker

---

<!-- paginate: true -->
<style>
    section {
        text-align: left
    }
</style>

# Docker - What is it?

<br>

- Don't mix Docker with Docker Inc
- Open-Source Platform for creating and deploying containerized applications
- Containers are isolated environments containing all dependencies for executing a (single) application

---

# Docker - Why use it?

<br>

- **Simplicity**: Create & deploy applications quicker and easier
- **Consistency**: Similar environments for all purposes
- **Portability**: Runs (almost) everywhere
- **Security**: Small containers have a smaller attack surface
- **Spread**: Plenty of resources, important for allmost all companies

---

# Docker - What about VMs?

- Both give you an isolated environment where you can run stuff
- But containers are:
  - Usually much faster to spin up
  - Less resource intensive (no full virtualization, reuse of the host kernel)
  - Built to run **_ONE_** application

---

# Docker - How to use it?

- Install a Container Runtime
  - Windows: Docker Desktop or Rancher Desktop
  - Linux / Ubuntu: docker or nerdctl on top of containerd
- Use existing Dockerfiles from [dockerhub](https://hub.docker.com)
- Write own Dockerfiles
- Run docker images in a container runtime

---

# Docker - What is an Image?

- An immutable blueprint to create containers
- It consists of different layers
  - A _"parent"_ or _"base"_ image
  - A various number of _"customization layers"_
  - At runtime:
    - all layers are composed into a virtual file system
    - the changes done at runtime are stored in an ephmeral _"Container Layer"_

---

# Docker - Practice / Tooling

<br>

- Create a Dockerfile
- Create a docker-compose file for easier management
- Run this presentation in docker

---

# Docker - Summary

- Good:
  - All dependencies included in docker image
  - Clean way of running applications
- Bad:
  - Orchestration of multiple applications can be complicated
  - Running / Updating containers needs manual interaction

---

<!-- _class: lead -->

# Kubernetes

---

# Kubernetes - What is it?

<br>

- Open-Source container orchestration platform
- Main focus: Multi-Node Environments
- Easily scalable
- Fault tolerance

---

# Kubernetes - Why use it?

<br>

- Flexibility
- Reliability
- Declarative configuration
- Huge community / industry standard

---

# Kubernetes - How to use it?

<br>

- Choose a distribution
- Deploy applications
- Profit?

---

<!-- _class: lead -->

# Choose a Distribution ?!?

---

<!-- _class: lead -->

# Choose a Distribution ?!?

kubeadm, Kubespray, Kops, Minikube, Rancher 2, K3d, Microk8s, OKD, Minishift, k0s, k3s, Tanzu, ...

---

# Kubernetes - k3s

<br>

- Single, lightweight binary
- Easy to install / customize
- Well documented
- All necessary components already included

---

# Kubernetes - Important Resources

<br>

- ConfigMap
- Secret
- Service
- Deployment / StatefulSet / DaemonSet
- Ingress

---

# Kubernetes - Practice

<br>

- Convert docker-compose deployment to kubernetes resources
- Run in (local) cluster
- Access the presentation, served from the kubernetes cluster

---

# Kubernetes - Summary

- Good:
  - Port management is much nicer than with docker-compose
  - Kubernetes tooling provides plenty of features out-of-the-box
  - Huge community, lots of documentation on the web
- Bad:
  - Steep learning curve, many things need to be known
  - Running / Updating containers needs manual interaction

---

<!-- _class: lead -->

# GitOps

---

# GitOps - Principles

<br>

- Everything necessary to describe an application has to be in git
- Never change deployments manually
- One specification of an application in git will always behave the same

---

# GitOps - Example Toolstack

<br>

- ArgoCD
- Sealed Secrets
- External DNS
- Cert-Manager
- Monitoring (Prometheus, Grafana, Loki)

---

# GitOps - Practice

<br>
<br>

- Setup GitOps Environment
- Migrate manual k8s deployment to the git repo

---

# GitOps - Summary

- Good:
  - All changes can be made via commits to a git repository
  - Setting up from scratch (e.g. after an outage) is extremely fast
  - Once setup, (relatively) easy to use
- Bad:
  - Learning curve doesn't get better with more tools

---

<!-- _class: lead -->

# Home Lab

---

# Home Lab - What do I use?

- 1 Windows VM 😞
- 1 Single Node Kubernetes Cluster (k3s)
  - Home Assistant
  - Duplicati (Backups)
  - Omada Controller (TP-Link Alternative to Ubiquity)
  - Continuous Speedtesting
  - Adguard (DNS Adblocker)

---

# Home Lab - Why do I use it?

- Some parts are just necessary (Home Assistant, Omada Controller, Authentication)
- GitHub Repo
  - Less stuff to backup
  - faster new setup in case of outages
- Kubernetes
  - Extremely fault tolerant
  - everything starts without problems e.g. after power Outages

---

<!-- _class: lead -->

# Questions
