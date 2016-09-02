FROM java:8

# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apt-utils
RUN apt-get -y install wget
RUN apt-get -y install vim
RUN apt-get -y install curl git
RUN apt-get -y install php5-cli php5-common php-apc php-pear php5-xdebug php5 php5-dev
RUN apt-get -y install php5-xsl
RUN apt-get -y install php5-intl
RUN apt-get -y install php5-mysqlnd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install phpunit
RUN wget https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit

# Install and update pear
RUN wget http://pear.php.net/go-pear.phar
RUN php go-pear.phar
RUN pear upgrade pear
RUN pear upgrade

# Install Codesniffer
RUN pear install --alldeps php_codesniffer

# Install pdepend
RUN apt-get -y install pdepend

# Install phpdox
RUN apt-get -y install phpdox

# Install phploc
RUN apt-get -y install phploc

# Install phpmd
RUN apt-get -y install phpmd

# Install phpcpd
RUN apt-get -y install phpcpd

COPY run-slave.sh /opt/jenkins/run-slave.sh
RUN chmod 700 /opt/jenkins/run-slave.sh

WORKDIR /opt/jenkins/

CMD /opt/jenkins/run-slave.sh
