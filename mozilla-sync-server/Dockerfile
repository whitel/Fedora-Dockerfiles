FROM fedora:20
MAINTAINER "Langdon White" <langdon@redhat.com>

RUN yum -y update; yum clean all
RUN yum -y install git python-devel python-virtualenv gcc-c++ gcc make which sqlite; yum clean all

# Set up the Sync Server
 
RUN adduser --create-home app
 
USER app
 
WORKDIR /home/app
RUN git clone https://github.com/mozilla-services/syncserver \
-b single-threaded-dev-server
 
WORKDIR /home/app/syncserver
RUN make build
 
EXPOSE 5000
 
RUN sed -i -e s/DebugCaptureSender/StdOutSender/ syncserver/__init__.py
RUN sed -i -e s/\#sqluri/sqluri/ syncserver.ini
 
ENTRYPOINT ["/usr/bin/make", "serve"]


# Simple startup script to avoid some issues observed with container restart 
#ADD syncserver.ini / 
#ADD build-run-sync-server.sh /
#RUN chmod -v +x /build-run-sync-server.sh

#CMD ["/build-run-sync-server.sh"]

