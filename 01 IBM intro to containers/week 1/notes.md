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

```
docker push my-app:v1
```