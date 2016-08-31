# Xubuntu 14.04


## apt-get

```
sudo bash

add-apt-repository -y ppa:webupd8team/java

add-apt-repository -y ppa:webupd8team/sublime-text-3

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list

sh -c 'echo "deb http://archive.canonical.com/ trusty partner" >> /etc/apt/sources.list'

apt-get update

apt-get install -y mongodb-org oracle-java7-installer oracle-java8-installer nodejs openssh-server vim git zip bzip2 fontconfig curl make python-software-properties apache2 mysql-server php5 libapache2-mod-php5 libapache2-mod-auth-mysql php5-mysql php5-gd php5-curl php5-dev php-pear git subversion chromium-browser libreoffice meld virtualbox vim sublime-text-installer mysql-workbench filezilla synaptic ubuntu-restricted-extras libcurl4-openssl-dev libxml2-dev r-base keepassx cups-pdf devscripts daemon libjpeg62 php5-xdebug

# install ownCloud
sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
apt-get update
apt-get install owncloud-client

# config Apache2
a2enmod php5
a2enmod rewrite

# Java
update-java-alternatives -s java-8-oracle

# Composer (verify instructions here https://getcomposer.org/download/)
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '41e71d86b40f28e771d4bb662b997f79625196afcca95a5abf44391188c695c6c1456e16154c75a211d238cc3bc5cb47') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# Drush follow steps here http://docs.drush.org/en/master/install-alternative/

# nodeJS modules
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install -y nodejs
npm install npm -g
npm install -g grunt-cli less connect uglify-js jshint bower yo

# we maybe need to to that to be able to run grunt without sudo
# chown -R $USER /usr/local

# Configure Flash for Chromium
apt-get install -y pepperflashplugin-nonfree
update-pepperflashplugin-nonfree --install

# Remove unused programs
apt-get -y remove abiword gnumeric mousepad thunderbird

apt-get clean
apt-get upgrade
```

# Ubuntu 16.04


## apt-get

```
sudo bash

add-apt-repository -y ppa:webupd8team/java

add-apt-repository -y ppa:webupd8team/sublime-text-3

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list

sh -c 'echo "deb http://archive.canonical.com/ trusty partner" >> /etc/apt/sources.list'

apt-get update

apt-get install -y mongodb-org oracle-java8-installer openssh-server vim git zip bzip2 fontconfig curl make python-software-properties apache2 mysql-server php-fpm php-mysql php-gd php-xml php-curl php-dev php-xdebug libapache2-mod-php meld sublime-text-installer mysql-workbench filezilla ubuntu-restricted-extras libcurl4-openssl-dev libxml2-dev r-base keepassx cups-pdf devscripts daemon libjpeg62 gdebi-core ruby ruby-dev

# install ownCloud
wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_16.04/Release.key
apt-key add - < Release.key
sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_16.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
apt-get update
apt-get install owncloud-client

# config Apache2
a2enmod rewrite
service apache2 restart

# Java
update-java-alternatives -s java-8-oracle

# nodeJS modules
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

# Php
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# Drush follow steps here http://docs.drush.org/en/master/install-alternative/

# Docker
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' | sudo tee /etc/apt/sources.list.d/docker.list
apt-get install -y docker-engine
service docker start
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# mongodb service
# https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04

```

## Download manually

* [idea](http://www.jetbrains.com/idea/download)
* [phpstorm](http://www.jetbrains.com/phpstorm/download)
* [maven3](http://maven.apache.org/download.cgi)
* [robomongo](http://robomongo.org/download)
* [rstudio](https://www.rstudio.com/products/rstudio/)
* [owncloud-client](https://software.opensuse.org/download/package?project=isv:ownCloud:desktop&package=owncloud-client)
* [slack](https://slack.com/downloads)
* [docker-engine](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
* [docker-compose](https://docs.docker.com/compose/install/)

For example:

```
# uncompress these archives to ~/programs
/programs$ ls
/programs$ ls idea-IU-135.690  maven-3.2.1  PhpStorm-133.982

/programs$ ln -s maven-3.2.1 maven
/programs$ sudo ln -s ~/programs/maven/bin/mvn /usr/bin/mvn

/programs$ ln -s idea-IU-135.690 idea
/programs$ sudo ln -s ~/programs/idea/bin/idea.sh /usr/bin/idea.sh

/programs$ ln -s PhpStorm-133.982 PhpStorm
/programs$ sudo ln -s ~/programs/PhpStorm/bin/phpstorm.sh /usr/bin/phpstorm.sh
```


## Config

### SSD

For SSD disk ([https://sites.google.com/site/easylinuxtipsproject/ssd#TOC-After-the-installation:-noatime](https://sites.google.com/site/easylinuxtipsproject/ssd#TOC-After-the-installation:-noatime))

### Security

Turn on firewall

### Git

```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

### PHP

**/etc/php5/apache2/php.ini**

```
memory_limit = 1024M
max_execution_time = 60
```

### Apache

**/etc/apache2/apache2.conf**

```
# change AllowOverride None to All
<Directory /var/www/>
  Options Indexes FollowSymLinks
  AllowOverride All
  Require all granted
</Directory>
```

### MySQL

**/etc/mysql/my.cnf**

```
[mysqld]
default-storage-engine=INNODB
innodb_file_per_table

# see http://askubuntu.com/questions/127264/cant-start-mysql-mysql-respawning-too-fast-stopped
#default-character-set=utf8
#default-collation=utf8_bin
character_set_server=utf8
collation_server=utf8_bin

max_allowed_packet=1G
```

### IDE

[Inotify Watches Limit](http://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit)

**/etc/sysctl.conf**

```
fs.inotify.max_user_watches = 524288
```

```
sudo sysctl -p
```
