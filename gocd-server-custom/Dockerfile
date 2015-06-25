FROM tispr/gocd-server:15.1

RUN apt-get update && apt-get install -y git

ADD cruise-config.xml /etc/go/
RUN chown -R go:go /etc/go/*

ADD plugins/* /home/go/plugins/
RUN chown -R go:go /home/go/plugins/