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

## Rolling updates

* a way to roll out app changes in an automated and controlled fashion throughout pods
* work with pod templates as deploymetns
* allow for rollback if something goes wrong

### how to rolling update prepare

1. add liveness and readiness probes to deployments (deployments will be marked as alive appropriately)
2. add rolling update strategy to my YAML file

```YAML

spec:
    minReadySeconds: 5
    strategy:
        type: RollingUpdage
        rollingUpdate:
            maxUnavalable: 50%
            maxSurge: 2
```

minReadySeconds - wait for some seconds befor updating

1. upload image to Docker HUB

    ```bash
    docker build -t hello-kubernetes
    docker tag hello-kubernetes upkar/hello-kubernetes:2.0
    docker push upkar/hello-kubernetes:2.0
    ```

2. Apply this image to deployment

    ```bash
    kubectl get deployments
    kubectl set image deployments/hello-kubernetes hello-kubernetes=upkar/hello-kubernetes:2.0
    ```

3. check rollout status

    ```bash
    kubectl rollout status deployments/hello-kubernetes
    ```

    successfully rolled out

    ```bash
    k describe pods
    ```

4. undo the rollout

    ```bash
    k rollout undo deployments/hello-kubernetes
    k get pods
    k rollout status deployments/hello-kubernetes
    k describe pods
    ```

## configmaps and secrets

separete configs from code and keys/ids/passwords

creatign configmaps:

1. string literal

    ```bash
    k create configmap my-config --from-literal=MESSAGE="hello from firs configmap"
    ```

    add env to deployment descriptor

    ```YAML
    env:
    - name: MESSAGE
        valueFrom:
            configMapKeyRef:
                name: my-config
                key: MESSAGE
    ```

    list all configs in cluster

    ```bash
    k get configmaps
    k describe configmap my-config

2. using properties
3. existing key=value file

    ```bash
    cat my.properties

    # MESSAGE=hello from my.properties file

    k create cm my-config --from-file=my.properties
    ```

    ```YAML
    env:
    - name: MESSAGE
        valueFrom:
            configMapKeyRef:
                name: my-config
                key: MESSAGE
    ```

4. privide a ConfigMap YAML descriptor file

    ```bash
    k get cm
    # nothing yet
    cat my-config.yaml
    ```

    ```YAML
    data:
        my.properties: MESSAGE=hello from the my.properties file
    kind: ConfigMap
    metadata:
        name: my-config
        namespace: default
    ```

    ```bash
    k apply -f my-config.yaml
    k describe cm my-config
    ```

can be addressed as env variables or as a volume

get properties from them

```bash
k get configmaps
k describe configmap my-config
```

### secrets

#### simple secrets

```bash
k create secret genereic api-creds --from-literal=myapikey
k get secret
k describe secret api-creds
k get secret api-creds -o yaml 
# print secret
```

add one more env

```YAML
env:
- name: API_CREDS
    valueFrom:
        secretMapKeyRef:
            name: api-creds
            key: key
```

using secrets - process.env.API_CREDS

#### volumne secrets

```bash
k create secret generec api-creds --from-literal=key=myseperkey
```

need volume setup to use it

## service binding

bind a service to deployment

* bind an IBM Cloud service to Kubernetes cluster
* service credentials are available as Secrets to any application deployed on the cluser
* mounting the Kubernetes Secret as a volume to 