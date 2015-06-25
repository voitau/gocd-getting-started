FROM tispr/gocd-agent-dind:15.1

RUN apt-get update && apt-get install -y git maven

ADD autoregister.properties /var/lib/go-agent/config/

# Allow communication with an insecure registry
ENV DOCKER_DAEMON_ARGS="--insecure-registry=192.168.59.103:5000"