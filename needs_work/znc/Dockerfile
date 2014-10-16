FROM       fedora
MAINTAINER langdon

RUN yum -y update 
RUN yum install -y znc && yum clean all

RUN useradd -d /var/znc znc
VOLUME ["/var/znc"]
EXPOSE 6000

