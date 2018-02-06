#!/bin/bash

# Catch errors and undefined variables
set -euo pipefail

VERSION=7.1.13-1
PASSWORD=bitnami
PREFIX=/opt/bitnami

# Update all the packages in the system. Install bash
yum -y update
yum install -y bash
yum clean all

echo "Installing wget"
yum install -y wget

echo "Downloading Bitnami LAMP"
cd /tmp
wget https://downloads.bitnami.com/files/stacks/lampstack/$VERSION/bitnami-lampstack-$VERSION-linux-x64-installer.run
chmod 755 /tmp/bitnami-lampstack-$VERSION-linux-x64-installer.run

echo "Installing Bitnami LAMP"
/tmp/bitnami-lampstack-$VERSION-linux-x64-installer.run --prefix $PREFIX --mode unattended --base_password $PASSWORD --apache_server_port 80 --mysql_port 3306 --apache_mpm_mode event --enable_phpfpm 1 --enable_pagespeed 1

echo "Installing the application"
tar -zxf $UPLOADS_DIR/todo.tar.gz -C $PREFIX/apache2/htdocs/