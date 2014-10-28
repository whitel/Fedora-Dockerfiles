FROM fedora
RUN yum -y install java-1.7.0-openjdk
RUN yum -y update && yum clean all
ADD eclipse-orion-6.0-linux.gtk.x86_64.tgz /opt/eclipse-orion/
#ADD eclipse /opt/eclipse-orion

#currently, because of fun with user perms and docker, this doesn't matter, you have to run it priv
#CMD groupadd --gid 1000 orion && useradd --uid 1000 --gid 1000 -M -d /opt/eclipse-orion orion
#CMD chown -R orion:orion /opt/eclipse-orion
#USER orion

EXPOSE 8080

#mount this for the files you want to be able to edit locally
VOLUME /host-files
#think of this as like an eclipse workspace, if you want persistence of 
#proj/files created directly in orion, you might want to mount this somewhere
VOLUME /orion-serverworkspace

CMD ["/opt/eclipse-orion/eclipse/orion", "-console"]
