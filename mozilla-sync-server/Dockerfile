FROM fedora:20
MAINTAINER "Langdon White" <langdon@redhat.com>

RUN yum -y update; yum clean all
RUN yum -y install git python-devel python-virtualenv gcc-c++ gcc make which sqlite; yum clean all

EXPOSE 5000

# Simple startup script to avoid some issues observed with container restart 
ADD syncserver.ini / 
ADD build-run-sync-server.sh /
RUN chmod -v +x /build-run-sync-server.sh

CMD ["/build-run-sync-server.sh"]

