# Xubuntu 14.04


## apt-get

```
sudo bash

add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:chris-lea/node.js
add-apt-repository -y ppa:webupd8team/sublime-text-3

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list

sh -c 'echo "deb http://archive.canonical.com/ trusty partner" >> /etc/apt/sources.list'

apt-get update

apt-get install -y mongodb-org oracle-java7-installer oracle-java8-installer nodejs openssh-server vim git zip bzip2 fontconfig curl make python-software-properties apache2 mysql-server php5 libapache2-mod-php5 libapache2-mod-auth-mysql php5-mysql php5-gd php5-curl php5-dev php-pear git subversion chromium-browser libreoffice meld virtualbox vim sublime-text-installer mysql-workbench filezilla synaptic ubuntu-restricted-extras nautilus-dropbox libcurl4-openssl-dev libxml2-dev r-base keepassx cups-pdf devscripts daemon

# config Apache2
a2enmod php5
a2enmod rewrite

# Java
update-java-alternatives -s java-8-oracle

# Drush
pear channel-discover pear.drush.org
pear install drush/drush

# nodeJS modules
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

## Download manually

* [idea](http://www.jetbrains.com/idea/download)
* [phpstorm](http://www.jetbrains.com/phpstorm/download)
* [maven3](http://maven.apache.org/download.cgi)

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

default-character-set=utf8
default-collation=utf8_bin

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
