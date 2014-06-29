FROM fedora:20
MAINTAINER "Langdon White" <langdon@redhat.com>

RUN yum -y update; yum clean all
RUN yum -y install git python-devel python-virtualenv gcc-c++ gcc; yum clean all
RUN git clone https://github.com/mozilla-services/syncserver
RUN cd /syncserver && make build

EXPOSE 5000

# Simple startup script to avoid some issues observed with container restart 
#ADD syncserver.ini /syncserver 
#RUN chmod -v +x /run-apache.sh

#CMD ["/run-apache.sh"]
