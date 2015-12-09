FROM java:8

# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apt-utils
RUN apt-get -y install vim
RUN apt-get -y install phpunit
RUN apt-get -y install phpunit-dbunit
RUN wget http://pear.php.net/go-pear.phar
RUN php go-pear.phar
RUN pear upgrade pear
RUN pear upgrade
RUN pear install --alldeps php_codesniffer
RUN apt-get -y install phploc
RUN apt-get -y install pdepend
RUN apt-get -y install phpmd
RUN apt-get -y install phpcpd
RUN apt-get -y install phpdox
RUN apt-get -y install curl php5-cli git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY run-slave.sh /opt/jenkins/run-slave.sh
RUN chmod 700 /opt/jenkins/run-slave.sh

WORKDIR /opt/jenkins/

CMD /opt/jenkins/run-slave.sh

