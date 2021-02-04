FROM registry.fedoraproject.org/fedora-minimal:latest
# Can configure oc and kubectl versions. Default is oc 4.6 with the corresponding kubectl version
# for more info about Kubernetes version used with specific versions of OpenShift
# OpenShift 4.6 (Default)
ARG OPENSHIFT_VERSION=4.6
#
ARG KUBECTL_VERSION=1.19.2
# https://storage.googleapis.com/kubernetes-release/release/stable.txt

# OpenShift 4.5 (Need to provide via --build-arg flags when building)
# docker build ... --build-arg OPENSHIFT_VERSION=4.5 --build-arg KUBECTL_VERSION=1.18.10 ...


# Need tar command
RUN microdnf install -y tar

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
# RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

# Install oc
RUN curl -LO  https://mirror.openshift.com/pub/openshift-v4/clients/oc/${OPENSHIFT_VERSION}/linux/oc.tar.gz && tar -zxf oc.tar.gz
RUN  mv ./oc /usr/local/bin/oc && rm oc.tar.gz

