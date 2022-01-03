
# Simple Node API exposed via K8s Service 

- [Simple Node API exposed via K8s Service](#simple-node-api-exposed-via-k8s-service)
  - [Typescript](#typescript)
    - [Install dependencies](#install-dependencies)
    - [Run the service](#run-the-service)
    - [Compile the typescript](#compile-the-typescript)
  - [Docker](#docker)
    - [Build image](#build-image)
    - [Run image locally](#run-image-locally)
    - [Push the image](#push-the-image)
  - [Kubernetes](#kubernetes)
    - [Deploy Deployment and Service](#deploy-deployment-and-service)
    - [Expose Service](#expose-service)
    - [Access the service](#access-the-service)
    - [View logs of all pods and follow](#view-logs-of-all-pods-and-follow)
  - [References](#references)

## Typescript

### Install dependencies
```bash
npm run init
```

### Run the service
```bash
npm run dev
```
### Compile the typescript
```bash
npm run compile
```

## Docker
### Build image

```bash
npm run docker:build
```
### Run image locally
```bash
npm run docker:run
```

### Push the image
Ensure you are logged in using docker CLI with command `docker login` and password (or PAT token if you have 2FA).
```bash
docker push onlyutkarsh/k8s-nodejs-api:latest
```

## Kubernetes

### Deploy Deployment and Service

```bash
$ cd k8s/
$ kubectl apply -f deployment.yml
$ kubectl apply -f service.yml
```
### Expose Service

```bash
minikube service mynodeapi-svc --url
```
You will see the URL something like `http://192.168.64.3:32176`

### Access the service

```bash
curl -X POST \
 -H "Content-Type: application/json" \
 -d '{ "id" : "5" }' \
http://192.168.64.3:32176/api/dummy
```

### View logs of all pods and follow

```bash
k logs -f -l app=pod-k8s-nodejs-api
```

## References

- https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
- https://auth0.com/blog/node-js-and-typescript-tutorial-build-a-crud-api/
