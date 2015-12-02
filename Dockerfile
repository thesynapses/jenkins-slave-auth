FROM java:8

# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y phpunit

COPY run-slave.sh /opt/jenkins/run-slave.sh
RUN chmod 700 /opt/jenkins/run-slave.sh

WORKDIR /opt/jenkins/

CMD /opt/jenkins/run-slave.sh
