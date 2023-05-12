# ieee-docker-kube-gitops

Demo Repository for a presentation at the University of Passau

- Everything in this repository is aimed to run on localhost, you don't need a separate server to try out anything mentioned in the demo
- The shell scripts are a documentation for how certain commands can/should be executed
- The slides are built with [marp](https://marp.app/) and always provide a short introduction
  into the topics before trying it out in a demo, following topics are included:
    - What is Docker / building & running Docker containers
    - Orchestrating Docker Containers with Kubernetes
    - Introducing GitOps to manage applications running in Kubernetes

## Warning: the examples are intentially kept simple, don't deploy on publically available environments

Especially: don't use the example ArgoCD configuration in a publically available environment,
it is not configured in a secure way. If you want to use ArgoCD in public environments you will need:
- Secret Management (don't put real credentials into plain Kubernetes secrets, use [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets), or [HashiCorp Vault](https://www.vaultproject.io/) instead)
- Proper SSL Certificates (e.g. [cert-manager](https://github.com/cert-manager/cert-manager) configured with letsencrypt) + [ExternalDNS](https://github.com/kubernetes-sigs/external-dns)
- A disabled admin user + proper RBAC Configuration
- Some kind of monitoring, to see when things go bad
