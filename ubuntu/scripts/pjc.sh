# Basics
apt-get install -y build-essential
apt-get install -y htop

# Remove zope.interface to avoid buildout problems
apt-get remove -y python-zope.interface

# Time sync
apt-get install -y ntp

# Keep /tmp clean
apt-get install -y tmpreaper

# for add-apt-repository
apt-get install -y python-software-properties

# VCS
apt-get install -y git-core
apt-get install -y subversion
apt-get install -y libxml2-utils

# Word support
apt-get install -y wv

# PDF support
apt-get install -y poppler-utils

# bz2 support to extract pypi packages
apt-get install -y libbz2-dev

# Code analysis
apt-get install -y ohcount
apt-get install -y sloccount
apt-get install -y nodejs npm
npm install -g jslint
npm install -g jshint
npm install -g csslint

# Robot Framework (This dependency is only necessary when
# 'Library  Dialogs' are added to the robot setup, which shouldn't happen)
apt-get install -y python-tk

# Java is needed to connect the Jenkins slaves
apt-get install -y openjdk-7-jre

# LXML
apt-get install -y libxslt1-dev libxml2-dev

# LOCALES
echo "en_GB.ISO8859-15 ISO-8859-15" >> /var/lib/locales/supported.d/local
echo "en_US.ISO8859-15 ISO-8859-15" >> /var/lib/locales/supported.d/local
echo "en_US.ISO-8859-1 ISO-8859-1" >> /var/lib/locales/supported.d/local
dpkg-reconfigure locales


