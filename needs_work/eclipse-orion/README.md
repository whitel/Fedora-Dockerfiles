dockerfiles-eclipse-orion
========================

Fedora dockerfile for running an Eclipse Orion server (http://www.eclipse.org/orion/)

Tested on Docker 0.8.0

Full Docker manualt can be fetched from http://docker.io

Installation
----

Copy the sources and run the build process:

    $ docker build --rm -t <username>/eclipse-orion .

Running
----

NATting external host 80 port to internal port 80 on container:

    $ docker run --privileged -d -p 8080:8080 \
	-v <where-my-local-projects-are>:/host-files \
	-v <where-my-orion-workspace-should-be>:/orion-serverworkspace \
    	<username>/eclipse-orion

References for the "variables" above
-----

* local-projects: https://wiki.eclipse.org/Orion/Server_admin_guide#Configuring_paths_where_users_can_store_files
* workspace: https://wiki.eclipse.org/Orion/Server_admin_guide#Changing_the_server_workspace


