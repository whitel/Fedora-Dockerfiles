dockerfiles-fedora-taskserver
=========================

Fedora dockerfile for running a TaskWarrior TaskServer

To build:

Copy the sources down and do the build-

    # docker build -rm -t <username>/taskserver .

To run (if port 53589 is open on your host):

    # docker run -d -p 53589:53589 <username>/python

or to assign a random port that maps to port 53589 on the container:

    # docker run -d -p 53589 <username>/python
definitely worth considering pushing the container log directory to your container host to monitor the logging e.g.

    # docker run -d -p 53589 -v ~/taskserver/logs:/var/log <username>/python

To the port that the container is listening on:

    # docker ps

