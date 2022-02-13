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

## autoscaling

replica sets - set number of pods. we want to do in automatically.
Use HPA (horizontal pod autoscaler) - by desired CPU or memory.

we can auto scale deployment or a ReplicaSet using kubectl

```bash
kubectl get pods
kubectl get rs
kubectl autoscaler deploy hello-kubernetes --min=2 --max=5 --cpu-percent=10

# check 
k get pods
k describe rs hello-kubernetes
# weill have replicas number
```

alternative - craete a yaml file and describe desired autoscale behavior,

```yaml
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
    name: hello-kubernetes
    namespace: default
spec:
    maxReplicas: 5
    minReplicas: 2
    scaleTargetRef:
        apiVersion: apps/v1
        kind: Deployment
        name: hello-kubernetes
    targetCPUUtilizationPercentage: 10
```

possible but ```kubectl autoscaler deploy hello-kubernetes --min=2 --max=5 --cpu-percent=10```
is simpler
