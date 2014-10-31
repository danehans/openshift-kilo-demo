FROM fedora:20
MAINTAINER Daneyon Hansen <danehans@cisco.com>

RUN yum install -y docker-io wget 

# Add v3 Service
ADD openshift.service /etc/systemd/system/openshift.service

CMD ["/start.sh"]
