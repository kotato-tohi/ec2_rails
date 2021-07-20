#!/bin/bash

echo "mariadb remove"
sudo yum update -y
sudo yum remove mariadb-libs 

echo "mysql install"
sudo yum localinstall https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm -y
sudo yum install --enablerepo=mysql80-community mysql-community-server -y
sudo yum install --enablerepo=mysql80-community mysql-community-devel -y
sudo systemctl start mysqld
sudo systemctl status mysqld
sudo systemctl enable mysqld
echo "your initial password"
sudo cat /var/log/mysqld.log | grep pass




echo "install node.js"
sudo yum -y install git make gcc-c++ patch libyaml-devel libffi-devel libicu-devel zlib-devel readline-devel libxml2-devel libxslt-devel ImageMagick ImageMagick-devel openssl-devel
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash --
yum -y install nodejs

echo "install yarn"
curl -o- -L https://yarnpkg.com/install.sh | bash

echo "install rbenv"
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

echo "install ruby-build"
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv rehash
rbenv

echo "install ruby 3.0.2 It'll take a while...."
rbenv install 3.0.2 -v
rbenv global 3.0.2

source ~/.bash_profile
gem install bundle

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "After installation, the password for the mysql root user has expired."
echo "You need to change it."
echo "$ mysql -u root -p"
echo "musql> ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY "XXXX";"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"