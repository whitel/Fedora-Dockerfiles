FROM scollier/sshd
MAINTAINER langdon <langdon@fedoraproject.org>
#probably not real useful for anyone else

# Install the appropriate software
RUN yum -y update; yum clean all
RUN yum -y install irssi tmux perl-libwww-perl wget

RUN usermod -l lwhite user
RUN usermod -md /home/lwhite lwhite
RUN groupmod -n lwhite user
RUN usermod -G wheel -a lwhite 

#USER lwhite
WORKDIR /home/lwhite/
RUN mkdir /home/lwhite/.ssh
ADD authorized_keys /home/lwhite/.ssh/authorized_keys
RUN chmod 0500 /home/lwhite/.ssh
RUN chmod 0400 /home/lwhite/.ssh/*
ADD irssi.tar /home/lwhite
ADD bashrc /home/lwhite/.bashrc
RUN chown -R lwhite:lwhite /home/lwhite

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
