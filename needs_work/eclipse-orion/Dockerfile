FROM fedora
RUN yum -y install java-1.7.0-openjdk
RUN yum -y update && yum clean all
ADD eclipse-orion-6.0-linux.gtk.x86_64.zip /opt/eclipse-orion
EXPOSE 8080

CMD ["/opt/eclipse-orion/eclipse/orion"]