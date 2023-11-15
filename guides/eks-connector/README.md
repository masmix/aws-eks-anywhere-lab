# About EKS Connector

EKS Connector is a solution to provide cluster visibility in the AWS EKS Console.

# Requirements

- EKS-A cluster installed 
- kubectl cli installed
- helm cli installed

# IAM Roles configuration

[Please follow IAM Roles configuration readme](../../../eks-anywhere/eks-connector/aws/README.md)

# EKS Connector installation

1. Copy [files](../../../eks-anywhere/eks-connector/k8s-manifests) to admin machine.

2. Create namespace 

```sh
kubectl create ns eks-connector 
```

3. Change namespace to eks-connector

```sh
kubectl config set-context --current --namespace=eks-connector
```
4. Register cluster at AWS EKS Console
5. Open https://console.aws.amazon.com/eks/home
6. Click dropdown button 'Add Cluster
![Example](images/eks-add-cluster-register.png)
7. Enter Data in 'Register cluster' formular
- Name of cluster
- In 'Provider' dropdown choose 'EKS Anywhere'
- In 'EKS connector role' choose previously created ' 'AmazonEKSConnectorAgentRole'
- Fill tags with your tagging convention
- Click 'Register' button

8. Copy script to clipboard
![Example](images/eks-connector-registration-step.png)

Example:

```sh
helm install eks-connector \
--namespace eks-connector \
oci://public.ecr.aws/eks-connector/eks-connector-chart \
--set eks.activationCode=XXXXXXX \
--set eks.activationId=XXXXXXXXX \
--set eks.agentRegion=eu-west-2
```

9. Execute script in EKS-A cluster cli console

Example ouput:

```
Pulled: public.ecr.aws/eks-connector/eks-connector-chart:0.0.9
Digest: sha256:5a6d13f2e09215a89cd44b800813e35f61c11b67b0c1ae82b722b90d93e8c8f8
NAME: eks-connector
LAST DEPLOYED: Wed Nov 15 09:50:13 2023
NAMESPACE: eks-connector
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

10. Verify EKS Connector deployment 

```sh
kubectl get all
```

Example Ouput:

```
NAME                  READY   STATUS    RESTARTS   AGE
pod/eks-connector-0   2/2     Running   0          54s

NAME                             READY   AGE
statefulset.apps/eks-connector   1/1     54s
```

11. check if exists
- [eks-connector-clusterrole.yaml](../../../eks-anywhere/eks-connector/k8s-manifests/eks-connector-clusterrole.yaml)
- [eks-connector-console-dashboard-full-access-group.yaml](../../../eks-anywhere/eks-connector/k8s-manifests/eks-connector-console-dashboard-full-access-group.yaml)

12. Replace with yor user ARN
- [eks-connector-clusterrole.yaml](../../../eks-anywhere/eks-connector/k8s-manifests/eks-connector-clusterrole.yaml) - line 27
- [eks-connector-console-dashboard-full-access-group.yaml](../../../eks-anywhere/eks-connector/k8s-manifests/eks-connector-console-dashboard-full-access-group.yaml) - line 114

13. Apply manifests

```sh
kubectl apply -f eks-connector-clusterrole.yaml
kubectl apply -f eks-connector-console-dashboard-full-access-group.yaml
```

14. Check if kubernetes resources appears in the AWS EKS Console

![AWS EKS Console](images/eks-registered-cluster.png)









After correct installation you should see your EKS-A kubernetes resources.

![EKS Anywhere cluster resources AWS console view](images/eks-registered-cluster.png)