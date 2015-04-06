FROM fedora
MAINTAINER langdon <langdon@fedoraproject.org>
RUN yum -y update
RUN yum -y install java-1.8.0-openjdk zip unzip 
RUN yum clean all

#note: the way eclipse constructs its download links, I can't get the "correct" version dynamically
ENV ORION_VER 8.0
ENV ORION_ADDR http://www.eclipse.org/downloads/download.php?file=/orion/drops/R-8.0-201502161823/eclipse-orion-8.0-linux.gtk.x86_64.zip&r=1

RUN mkdir /opt/eclipse-orion
WORKDIR /opt/eclipse-orion
ADD $ORION_ADDR /opt/eclipse-orion/eclipse-orion-$ORION_VER.zip
RUN unzip eclipse-orion-*.zip

#ADD eclipse /opt/eclipse-orion
ADD orion.conf /opt/eclipse-orion/

RUN sed -i -e 's/serverworkspace/\/orion-serverworkspace/g' eclipse/orion.ini

EXPOSE 8080

#mount this for the files you want to be able to edit locally
VOLUME /host-files

#think of this as like an eclipse workspace, if you want persistence of 
#proj/files created directly in orion, you might want to mount this somewhere
VOLUME /orion-serverworkspace

CMD ["/opt/eclipse-orion/eclipse/orion", "-console"]
