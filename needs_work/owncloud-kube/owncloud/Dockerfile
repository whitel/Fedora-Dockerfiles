FROM       fedora:20
MAINTAINER Dusty Mabe <dusty@dustymabe.com>

# Perform updates
RUN yum -y update && yum clean all

# Install owncloud owncloud-httpd owncloud-sqlite rpms
RUN yum install -y owncloud{,-httpd,-sqlite} && yum clean all

# Install SSL module and force SSL to be used by owncloud
RUN yum install -y mod_ssl && yum clean all
RUN sed -i 's/"forcessl" => false,/"forcessl" => true,/' /etc/owncloud/config.php

RUN yum install -y nfs-utils nfs-utils-lib && yum clean all
#RUN mount 172.17.42.1:/mnt/owncloud-data /var/lib/owncloud/data

# Allow connections from everywhere
RUN sed -i 's/Require local/Require all granted/' /etc/httpd/conf.d/owncloud.conf
RUN sed -i "s/'trusted_domains'/#'trusted_domains'/" /etc/owncloud/config.php

# Expose port 443 and set httpd as our entrypoint
EXPOSE 443

#VOLUME ["/var/lib/owncloud/data"]
#ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

#CMD ["/run-owncloud.sh"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#CMD ["-D", "FOREGROUND"]


#ADD run-owncloud.sh /run-owncloud.sh
#RUN chmod u+x /run-owncloud.sh
#CMD ["/run-owncloud.sh"]
