#!/bin/bash

sudo apt update && sudo apt upgrade

# Install base cli
sudo apt install -y \
	git \
	htop \
	zsh \
	python3-dev \
	python3-pip \
	python3-setuptools

# Install thefuck
sudo pip3 install thefuck

# Install snaps
sudo snap install node --channel=10/stable --classic
sudo snap install docker
sudo snap connect docker:home
sudo snap install sublime-text --classic
sudo snap install vscode --classic
sudo snap install phpstorm --classic
sudo snap install gimp
sudo snap install gravit-designer
sudo snap install telegram-desktop --beta
sudo snap install skype --classic
sudo snap install obs-studio

# Install npm packages
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
npm config set scripts-prepend-node-path true
npm install -g \
	browser-sync \
	meta \
	meta-npm \
	prettier \
	yo

# Install php and composer
sudo apt install -y \
	php7.2-cli \
	php-pear \
	php-fpm \
	php-dev \
	php-zip \
	php-curl \
	php-xmlrpc \
	php-gd \
	php-mysql \
	php-mbstring \
	php-xml \
	php-xdebug

EXPECTED_COMPOSER_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig) && \
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
php -r "if (hash_file('SHA384', 'composer-setup.php') === '${EXPECTED_COMPOSER_SIGNATURE}') { echo 'Composer.phar Installer verified'; } else { echo 'Composer.phar Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
php composer-setup.php --install-dir=/usr/bin --filename=composer && \
php -r "unlink('composer-setup.php');"
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer

composer global require hirak/prestissimo

# TODO: install oh-my-zsh
# TODO: install some fonts
# sudo apt install -y fonts-firacode fonts-powerline
