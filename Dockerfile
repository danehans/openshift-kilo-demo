FROM danehans/f20-dind
MAINTAINER Daneyon Hansen <danehans@cisco.com>

RUN yum install -y wget 

# Pull v3 tarball
RUN wget https://github.com/openshift/origin/releases/download/20141021-pre/openshift-origin-0.1-a4f33b1-linux-amd64.tar.gz

# Extract tarball
RUN tar -xvf openshift-origin-0.1-a4f33b1-linux-amd64.tar.gz -C /usr/bin/

# Add v3 Service
ADD openshift.service /etc/systemd/system/openshift.service

# Enable OpenShift Systemd
RUN systemctl enable /etc/systemd/system/openshift.service

# Start
CMD ["/usr/sbin/init"]
