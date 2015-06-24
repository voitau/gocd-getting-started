FROM voitau/gocd-agent-dind

RUN apt-get update && apt-get install -y git maven

ADD autoregister.properties /var/lib/go-agent/config/