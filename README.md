# Introduction
This guide shows how to setup delivery pipeline for GoCD with GoCD using Docker.

# Contributing
If you think something here should have been done differently, you are very welcome to contribute.

# Setup
## Docker Registry
Docker Registry is required to keep custom version of GoCD Server and Agent locally.
### Insecure registry
In order to communicate with an insecure registry, the Docker daemon requires --insecure-registry parameter. Boot2docker example:

    $ boot2docker ssh "echo $'EXTRA_ARGS=\"--insecure-registry 192.168.59.103:5000\"' | sudo tee -a /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"
More details on configuring this parameter and many others available here: [Deploying a registry server](https://docs.docker.com/registry/deploying/).

### Run
Using deprecated Docker Registry v1.0 now.

    $ docker run -d -p 5000:5000 registry

All further steps, including custom Dockerfiles, assume that registry is available at: `192.168.59.103:5000`.

## GoCD Server
### Install minimal set of plugins

    $ ./gocd-server-custom/init.sh

Two plugins included by default:

* script executor
* docker material poller

### Build and run
    $ docker build -t myorg/gocd-server gocd-server-custom/
    $ docker run -d -p 8153:8153 -p 8154:8154 myorg/gocd-server

## GoCD Agent
### Build and run
    $ docker build -t myorg/gocd-agent gocd-agent-custom/
    $ docker run --privileged -d -e GO_SERVER=192.168.59.103 myorg/gocd-agent

# Using GoCD delivery pipeline
Admin Console is available at: [http://192.168.59.103:8153/go](http://192.168.59.103:8153/go)

## Pipeline group: gocd
### Pipeline: gocd-server-build
Materials:

* github repository with source with Dockerfiles (this repository).
Stages:

* server-config - fetches current GoCD server configuration
* build-image - build Docker image of GoCD server with a new configuration, tags and pushes to local Docker GoCD registry

### Pipeline: gocd-server-deploy
Materials:

* docker image of custom gocd-server
Stages:

* deploy - no actual deploy, used as a reference to show trigger on Docker image update
