# Writing and running firsts countainers

## Docker file - run it

```bash
docker build -t my-app:v1 .
```

## add tags

```bash
docker tag my-app:v1 second-app:v1
```

it applies tag - images are identical

## push - publish

```bash
docker push my-app:v1
```

## cloud countainer registry namespace

1. get trial [here](https://cloud.ibm.com/registration/trial )

[IBM Cloud catalog](https://cloud.ibm.com/catalog?utm_medium=Exinfluencer&utm_source=Exinfluencer&utm_content=000026UJ&utm_term=10006555&utm_id=NA-SkillsNetwork-Channel-SkillsNetworkCoursescc20117568655-2021-01-01)

## quiz

1. What does the Docker CLI run command do? - It runs an image as a container.
2. In this sample Dockerfile, what does the COPY instruction do? - It copies the contents of the current directory into the /app directory of the image as a new layer.
3. It is possible for containers to use the features and resources of the host operating system. - true
4. Which command names an image “my-app” and tags it “v1”? - docker build -t my-app:v1 .
5. You can use the Docker COPY instruction to copy files both from your local machine and from remote URLs. - false

## quiz 2

1. Which of the following are benefits of containers? - Containers provide a standardized way to package and ship software.
2. image - A read-only file that contains the source code, libraries, and dependencies that are needed to run an application.
3. from - It defines the base image, which in this case is Ubuntu version 18.04.
4. What does the docker build command do? - uses dockerfile to create
5. You can use the Docker COPY instruction to copy files from your local machine to an image. - true
6. What does the Docker CLI build command do? - It builds an image from a Dockerfile.
7. Containers include a guest operating system in every instance. - false
8. In this sample docker build command, what does the -t option do?
``` docker build -t my-app:v1 . ``` - It gives the image the name “my-app” and the tag “v1”.
9. You use the docker push command to distribute an image to a registry. - true
