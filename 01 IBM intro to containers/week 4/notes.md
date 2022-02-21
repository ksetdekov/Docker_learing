# Kubernetes ecosystem

## Kubernetes ecosystem overview

1. K is not an all-inclusive platform
2. ecoysystem provides many services that K doesnt have

[https://github.com/cncf/trailmap](https://github.com/cncf/trailmap) - this is a Cloud native computing foundation

landscape [https://landscape.cncf.io](https://landscape.cncf.io)

## Red Hat OpenShift

1. hybrid cloud, entrerpirse Kubernetes application platform, tooling around the complete lifecycle of applications
    1. orchestrate containers
    2. build
    3. CI/CD
    4. monitoring
    5. logging
2. red hat linux $\rightarrow$ kubernets $\rightarrow$ cluster services $\rightarrow$ platform services, application services, developer services

3. OKD - Upstream Kubernetes distribution embedded in OpenShift (analogy - kubernetes is a kernel, openshift is a distribution)

## Red Had OpenShift and Kubernetes

1. Similar Openshift buitlt with kubernetes, open source
2. differences - OpenShift - commercial product, some more user conveniences + more in cli

## Builds

cloud native -> calls for automation.

Asks for CI/CD

Build - process of transforming input (like code) into resultant objects (like container)

BuildConfig defines the process of the build to follow

Build can automate a docker.

### approaches

#### Docker

* repo + Dockerfile + artefacts
* invokes Docker build
* pushes image to internal registry

#### Source-to-image (S2I)

building reproducible container images.

Aggregate builder image + code

#### Custom build

advanced.

* define a builder image

* custom builder images are Docker images that contain the logic needed to transform input into expected output

### build triggers

* webhook
  * send a request to OS container platform API

* image change
  * new version of an image available
  * useful for keeping base imgaes up to date

* configuration change
  * build when a new BuildConfig is created

### ImageStream

abstraction for referencing image within OpenShift. Do not contain image data, but merely pointers. Digests are immutable for each image, image streams can change. The source images that ImageStreams point to can be stored in the internal registry, external registries, or other ImageStreams.

## Operators

1. powerful tool

2. CRDs custom resourse definitions (new endpoint in K API)

3. Can be installed in clusters

4. Once installed, can be accessed with kubectl

5. Dont change state $\rightarrow$ need custom controllers

6. Custom controller + custorm resouses = Operator pattern

7. A proxy for manual tasks of a human operator.

Example:

1. Deploy an application

2. Create a and restore backup states.

OperatorHub - in OpenShift Container Platfors.

Types:

1. Red Hat
2. Certified
3. Community
4. Custom

## Istio

Service mesh. Helps (connect, sercure, control and observe)

Challenges with microservices:

1. Security
2. Canary deployments
3. A/B testing
4. Cascading failures possible

    1. Retries
    2. Circuit breaking

Traffic managed, security, observability.

## Practice quiz

1. Which of the following are Red Hat OpenShift build strategies? Select the three that apply. - custom, docker, source-to-image, not github webhook

2. Which of the following are needed to create an operator? Select the two that apply. - custom resources + controller

3. Istio’s observability features allow you to route users to different versions of a service in order to perform A/B testing or canary deployments. - false

4. Which of the following are true of image streams? Select the two that apply. - help with image management, do not contain image data but pointers

5. The Cloud Native Computing Foundation hosts Kubernetes and all the tools in the Kubernetes ecosystem. - true

## quiz

1. Which of the following most accurately describes the relationship between Red Hat OpenShift and Kubernetes?  - OpenShift packages Kubernetes with additional tooling to make developers and administrators more successful.

2. Which of the following are Red Hat OpenShift build triggers? Select the three that apply.  - image change, configuration change, webhook

3. Which of the following are possible with Istio service mesh? Select the three that apply. - encrypt, setting policies, and Routing traffic to two versions of a microservice

4. Which of the following are types of operators available in OperatorHub? Select the three that apply. - community, red hat, certified

5. Image streams can point to images in which of the following locations. Select the four that apply. - Private external registries, public ext registries, openshift internal registry, other image streams

6. What is the Istio service mesh NOT used for? Select all that apply. - Encrypt Kubernetes secrets

7. Kubernetes is the sole project inhosted by the CNCF. - false

8. OpenShift can be run in which of the following environments? Select the four that apply. - public, private, on premise, hybrid cloud

9. What is the open source upstream version of OpenShift called? - OKD - openshift origin

10. Which of the following build strategies injects application source code into builder images without having to write a Dockerfile? - Source-to-image

11. Image streams contain complete image data. - false
