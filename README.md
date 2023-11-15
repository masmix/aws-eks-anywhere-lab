# Goal

The aim of this repository is to empower individuals in honing their DevOps skills by deploying an [AWS EKS Anywhere](https://github.com/aws/eks-anywhere) cluster either locally or on a virtual machine. This setup enables connectivity to the AWS EKS console via the AWS EKS Connector.

# About

[EKS Anywhere](https://aws.amazon.com/eks/eks-anywhere/) simplifies the deployment of a custom Kubernetes distribution known as EKS Distro.

It can be deployed on:
- vSphere 
- Bare Metal 
- Snow 
- CloudStack 
- Nutanix 
- Docker at any type virtual machine (dev only) - provided within this repository

# Technologies

- AWS EKS Anywhere
- Kind
- Helm

# Prerequisities

- aws cli installed and configured
- scp and ssh cli
- environment to create and virtual machine i.e. Vagrant, Virtual Box, VMWare, GCP or Azure Cloud

# Virtual Machine minimal requirements

- 2 vCPU
- 4 GB RAM
- 30 GB HDD to main system
- OS Ubuntu 22.04 LTS 

# AWS Environment configuration

Please follow
[AWS Configuration ](scripts/aws/README.md)

# Deploy EKS Anywhere

Copy from this repository into EKS-A machine via scp command following files:
- [bootstrap-eks-a-cluster.sh](bootstrap-eks-a-cluster.sh)
- [k8s-manifests](k8s-manifests)

Please ssh into VM and execute [EKS-a bootstrap script](bootstrap-eks-a-cluster.sh) script.

```sh
bash bootstrap-eks-a-cluster.sh
```

At the first time please consider copy and past part of the script to see potential problems and fix it.

# Test Sample application

Still at the same session at the virtual machine run:

```sh
kubectl get all
```

Expected output should looks similar 

```sh
NAME                               READY   STATUS    RESTARTS   AGE
pod/hello-eks-a-686848645b-hsvvj   1/1     Running   0          8s

NAME                  TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/hello-eks-a   NodePort    10.104.194.237   <none>        80:30721/TCP   8s
service/kubernetes    ClusterIP   10.96.0.1        <none>        443/TCP        46m

NAME                          READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/hello-eks-a   1/1     1            1           9s

NAME                                     DESIRED   CURRENT   READY   AGE
replicaset.apps/hello-eks-a-686848645b   1         1         1       8s
```

# Install and configure eks-connector 

EKS Connector is a solution to provide cluster visibility in the AWS EKS Console.

# Install and configure EKS Connector

Please follow
[EKS Connector ](guides/eks-connector/README.md)
installation guide.

# Delete

Just delete virtual machine where EKS-A is installed.

# Credits
[Softserve company](https://www.softserveinc.com/en-us)

[Plurasight Cloud Guru platform](https://learn.acloud.guru/cloud-playground/cloud-sandboxes)