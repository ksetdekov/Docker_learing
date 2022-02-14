# Scaling and Updating Applications

## goals

* Scale an application with a ReplicaSet
* Apply rolling updates to an application
* Use a ConfigMap to store application configuration

MY_NAMESPACE=sn-labs-ksetdekov

Build and push the image again, as it may have been deleted automatically since you completed the first lab.

```bash
docker build -t us.icr.io/$MY_NAMESPACE/hello-world:1 . && docker push us.icr.io/$MY_NAMESPACE/hello-world:1
```

Deploy the application to Kubernetes

use - deployments.yaml

```bash
kubectl apply -f deployment.yaml
kubectl get pods
kubectl expose deployment/hello-world

# other term 
kubectl proxy

# original
curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy

kubectl scale deployment hello-world --replicas=3

# try many
for i in `seq 10`; do curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy; done

kubectl scale deployment hello-world --replicas=1
```

## performing rolling updates

edit file

```bash
docker build -t us.icr.io/$MY_NAMESPACE/hello-world:2 . && docker push us.icr.io/$MY_NAMESPACE/hello-world:2

# list images
ibmcloud cr images

# update
kubectl set image deployment/hello-world hello-world=us.icr.io/$MY_NAMESPACE/hello-world:2

# check rollout
kubectl rollout status deployment/hello-world

# which tag
kubectl get deployments -o wide

# see that different
curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy

# undo
kubectl rollout undo deployment/hello-world
kubectl get deployments -o wide
```

## Using a ConfigMap to store configuration

Create a ConfigMap that contains a new message.

```bash
kubectl create configmap app-config --from-literal=MESSAGE="This message came from a ConfigMap!"
```

в новом файле есть добавлено

```yaml
spec:
      containers:
      - name: hello-world
        image: us.icr.io/sn-labs-ksetdekov/hello-world:3
        ports:
        - containerPort: 8080
        envFrom:
        - configMapRef:
            name: app-config
      imagePullSecrets:
        - name: icr
```

```bash
docker build -t us.icr.io/$MY_NAMESPACE/hello-world:3 . && docker push us.icr.io/$MY_NAMESPACE/hello-world:3

kubectl apply -f deployment-configmap-env-var.yaml
curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy

kubectl delete configmap app-config && kubectl create configmap app-config --from-literal=MESSAGE="This message is different, and you didn't have to rebuild the image!"

kubectl rollout restart deployment hello-world
curl -L localhost:8001/api/v1/namespaces/sn-labs-$USERNAME/services/hello-world/proxy

#delete deployment
kubectl delete -f deployment-configmap-env-var.yaml

# delete service
kubectl delete service hello-world
```
