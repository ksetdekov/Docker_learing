# managing kubernets applications

## replica sets

it is - 

* managing pods
* maintain desired states
* can pick a pod and add it to deployment
* it supersedes replicacontroller

replica set is created when deployment is crated

loosely coupled yet interconnected.
uses labels inside yaml to have a potential list of pods based on labels

```bash
kubectl get replicaset
```

if we describe pod - learn who controls it - which replica set

```bash
kubectl describe pod hello-kubenetes-....

# controllded by ReplicaSet/hello-kubernetes-....
```

create by applying yaml with kind: ReplicaSet with spec: replicas: n

```bash
k create -f replicas.yaml

k get pods
k get rs
# equals kubectl get replicaset

kubectl get deploy # get deployment
# set replicas n

kubectl scale deply hello0kubernetes --replicas=3

kubectl get pods
```

How to check? - delete pod and check

```bash
k get pods
k delete pod hello...
k get pods
```