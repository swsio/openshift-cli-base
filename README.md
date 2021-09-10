# docker openshift cli base

## Scope

A simple docker container that has everything required to access OpenShift 4.x clusters

## Usage
This container is designed to be a parent container and not run directly:

It does the following for child containers:

- Provides both the  `oc` cli for specific versions of OpenShift 4.x

- Copies all scripts in a **scripts** folder in the  child containers build env to the **scripts** folder in the child image.

The Dockerfile for a child container just needs the **FROM** statement:

```
FROM quay.io/agileio/openshift-cli-base:latest
```

## Building the image

- To build the OpenShift 4.7 version of the image run the following command:
```
docker build -t <your image tag> .
```
- To build the OpenShift 4.6 version of the image run the following command:
```
docker build -t <your image tag> --build-arg OPENSHIFT_VERSION=4.6 .
```
