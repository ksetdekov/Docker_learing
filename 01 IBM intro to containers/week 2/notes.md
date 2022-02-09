# Kubernetes architecture

labs are here [https://github.com/ibm-developer-skills-network/CC201](https://github.com/ibm-developer-skills-network/CC201)

## container orchestration

Kubernetes:

* opensource
* countainer orchestration
* declarative management support (set desired states)
* has s growing ecosystem
* widely available

IT is not:

* platform as a service
* no limit to apps
* does not deploy source code or build applicatons
* does not prescribe logging, monitoring or alerting solution
* doesnt provide build-in middleware, DB, or other services

## Kubernetes objects

1. Labels and selectors

    1. labels

        * key/value pairs
        * intended for ID of objects
        * not unique
        * group objects

    2. selectors

        * id and select groups of objects

## basic kubernetes objects

1. pod

simple unit, represents a process running in your cluster
replicating pods - scale application horizontally.

yaml file - defines a simple pod

```yaml
kind: Pod
spec: 
    containers:
    - name: nginx
     images: nginx:1.7.9
     pors:
     - containerPort: 80
```

2. ReplicaSet

```yaml
kind: ReplicaSet
spec: 
    replicat: 3 # how many
    selector: # coure grouping primitives
    
    template:
        spec:
            containers:
```

3. deployment

provides updates for pods. Identical almost to replica sets. Deployments more robust. Minimalist - look like replicaSet

Suitable to stateless applicaiton. Can have rolling updates

## Kubernetes CLI

Kubernetes CLI - Kubectl.
Commands:

* imperative commands - quick to create, update, and delete Kubernetes objects, easy to learn, doesnt provide audit trail, not very flexible

```bash
kubectl run nginx --image nginx
```

### imperative command

```bash
kubectl create -f nginx.yaml
```

use configuration template

### eclarative commands

* configuration files define one or more objects
* no operation is specified
  * needed operationns are inferred by kubectsl
* works on files and directories
* configuration files define desired state and kubernetes actualizes that state

Declarative object configuration commands work better on directories, whereas imperative object configuration commands work better on files.

basinc cubecontrol apply command

```bash
kubectl apply -f nginx/
```

configuration files define one or more objects

no operation is specified

this is preferred method for production system

```bash
kubectl apply -f file.yaml
```

When you create resources, you'll want to view them. The "get" and "describe" commands enable you to do this. The "get" command lists one or many resources, while the "describe" command shows details about a specific resource or group of resources.

```bash
kubectl get deployments --namespace kube-system
kubects describe deployment kube-dns amd64 --namespace kube-system
```

## practice quiz

1. Which of the following is not handled by Kubernetes? - automating app integration

2. Which of the following two are container runtimes? Select all that apply. - docker, cri-o

3. A namespace is a Kubernetes object that can be used to segregate a cluster by team or project. - true

4. A Deployment is a Kubernetes object that provides updates to which of the following? - 
Pods and ReplicaSets

5. Which kubectl command creates an object using the details in the pod.json file? - 
kubectl create -f pod.json


## quiz

1. Which of the following four statements describes what Kubernetes is? Select all that apply. - all but registry for images

2. Which of the following components is part of the Kubernetes control plane? - etcd

3. Kubernetes objects - configmaps, namespaces (not kubelets, not clusters)

4. Which Kubernetes object represents a single instance of processes running in a container? - pod

5. In this sample kubectl command, what does create do? kubectl create -f nginx.yaml - it creates an object using the details in the nginx.yaml file

6. Which of the following statements describes what Kubernetes is? - 
A container orchestration platform 

7. Which of the following two are container runtimes? Select all that apply.  - crio, docker

8. Which of the following Kubernetes objects can you use to segregate a cluster by team or project? - namespace

9. Which Kubernetes object provides updates to Pods and ReplicaSets? - deployments

10. In this sample kubectl command, what does create do?   kubectl create -f pod.json  - 
It creates an object using the details in the pod.json file.
