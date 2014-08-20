FROM fedora
MAINTAINER "Langdon" <langdon@fedoraproject.org>

RUN yum -y update; yum clean all
RUN yum -y install gnutls-utils which libuuid-devel gnutls-devel gnutls-c++ gcc-c++ gcc tar gunzip make cmake python-pip wget; yum clean all

ADD . /src

WORKDIR /src
#RUN wget http://taskwarrior.org/download/taskd-1.0.0.tar.gz

#make install
RUN tar xzf taskd-1.0.0.tar.gz
WORKDIR taskd-1.0.0

RUN cmake .
RUN make
RUN make install

#config
ENV TASKDDATA /var/taskd
RUN mkdir -p $TASKDDATA
RUN taskd init

WORKDIR pki
RUN ./generate
RUN cp client.cert.pem client.key.pem server.cert.pem server.key.pem server.crl.pem ca.cert.pem $TASKDDATA

RUN taskd config --force client.cert $TASKDDATA/client.cert.pem
RUN taskd config --force client.key $TASKDDATA/client.key.pem
RUN taskd config --force server.cert $TASKDDATA/server.cert.pem
RUN taskd config --force server.key $TASKDDATA/server.key.pem
RUN taskd config --force server.crl $TASKDDATA/server.crl.pem
RUN taskd config --force ca.cert $TASKDDATA/ca.cert.pem

WORKDIR /var/taskd
RUN taskd config --force log /var/log/taskd.log
RUN taskd config --force pid.file $PWD/taskd.pid
RUN taskd config --force server `hostname`:53589
RUN taskd config --force client.allow '^task [2-9]'

EXPOSE 53589

CMD taskd server --data $TASKDDATA
