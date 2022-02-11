# working with kubectl

```bash
kubectl version

cd /home/project

# clone git 
[ ! -d 'CC201' ] && git clone https://github.com/ibm-developer-skills-network/CC201.git


cd CC201/labs/2_IntroKubernetes/

# get cluster info
kubectl config get-clusters
kubectl config get-contexts

# Export your namespace as an environment variable so that it can be used in subsequent commands.
export MY_NAMESPACE=sn-labs-$USERNAME
```

Build and push the image again, as it may have been deleted automatically since you completed the first lab.


```docker
FROM node:9.4.0-alpine
COPY app.js .
COPY package.json .
RUN npm install &&\
    apk update &&\
    apk upgrade
EXPOSE  8080
CMD node app.js

```

```bash
docker build -t us.icr.io/$MY_NAMESPACE/hello-world:1 . && docker push us.icr.io/$MY_NAMESPACE/hello-world:1

# Run the hello-world image as a container in Kubernetes.

kubectl run hello-world --image us.icr.io/$MY_NAMESPACE/hello-world:1 --overrides='{"spec":{"template":{"spec":{"imagePullSecrets":[{"name":"icr"}]}}}}'

# The --overrides option here enables us to specify the needed credentials to pull this image from IBM Cloud Container Registry. Note that this is an imperative command, as we told Kubernetes explicitly what to do: run hello-world.

kubectl get pods
kubectl get pods -o wide
# more detail
kubectl describe pod hello-world

# delete
kubectl delete pod hello-world
kubectl get pods
```

## create pod with imperative object configuration

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hello-world
spec:
  containers:
  - name: hello-world
    image: us.icr.io/sn-labs-ksetdekov/hello-world:1
    ports:
    - containerPort: 8080
  imagePullSecrets:
  - name: icr

```

get namespaces

```bash
ibmcloud cr namespaces
kubectl create -f hello-world-create.yaml
kubectl get pods

```

## Create a Pod with a declarative command
