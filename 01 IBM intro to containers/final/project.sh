cd /home/project
git clone https://github.com/ajp-io/guestbook.git
cd guestbook
cd v1/guestbook

cat Dockerfile
export MY_NAMESPACE=sn-labs-$USERNAME

echo $MY_NAMESPACE
# sn-labs-ksetdekov

docker build . -t us.icr.io/$MY_NAMESPACE/guestbook:v1
docker push us.icr.io/$MY_NAMESPACE/guestbook:v1
ibmcloud cr images

# Deploy guestbook app from the OpenShift internal registry
oc tag us.icr.io/$MY_NAMESPACE/guestbook:v1 guestbook:v1 --reference-policy=local --scheduled

# Update guestbook

docker build . -t us.icr.io/$MY_NAMESPACE/guestbook:v1 && docker push us.icr.io/$MY_NAMESPACE/guestbook:v1
oc import-image guestbook:v1 --from=us.icr.io/$MY_NAMESPACE/guestbook:v1 --confirm

# Deploy Redis master and slave

cd ../../v2
oc apply -f redis-master-deployment.yaml
oc get deployments
oc get pods

oc apply -f redis-master-service.yaml
oc apply -f redis-slave-deployment.yaml
oc get deployments
oc get pods
oc apply -f redis-slave-service.yaml

# Deploy v2 guestbook app

cd analyzer
docker build . -t us.icr.io/$MY_NAMESPACE/analyzer:v1 && docker push us.icr.io/$MY_NAMESPACE/analyzer:v1
cd ..
oc apply -f analyzer-deployment.yaml
oc apply -f analyzer-service.yaml
