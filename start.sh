#!/bin/sh

set -e

# Pull v3 tarball
wget https://github.com/openshift/origin/releases/download/20141021-pre/openshift-origin-0.1-a4f33b1-linux-amd64.tar.gz /opt/

# Extract tarball
tar -xvf /opt/openshift-origin-0.1-a4f33b1-linux-amd64.tar.gz -C /usr/bin/

# Change SElinux policy
sed -i '/^SELINUX=/ s/=.*/=permissive/' /etc/selinux/config

# Start docker
systemctl start docker.service

# Enable OpenShift Systemcd
systemctl enable /etc/systemd/system/openshift.service

# Start v3
systemctl start openshift.service
