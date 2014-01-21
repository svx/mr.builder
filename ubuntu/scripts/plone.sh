# Install Plone Dependencies

echo "Installing needed packages for plone"
apt-get install -y build-essential libssl-dev libxml2-dev libxslt1-dev libbz2-dev \
    zlib1g-dev python-setuptools python-dev libjpeg62-dev \
    libreadline-gplv2-dev python-imaging wv poppler-utils supervisor

echo "Downloading Plone"
wget https://launchpad.net/plone/4.3/4.3.2/+download/Plone-4.3.2-UnifiedInstaller.tgz

echo "Extracting download"
tar xf Plone-4.3.2-UnifiedInstaller.tgz

echo "Building Plone, this can take some minutes ..."
cd Plone-4.3.2-UnifiedInstaller/
./install.sh --password=plone zeo

echo "Setting supervisor.conf"
cat << EOF > /etc/supervisor/conf.d/plone4.conf
[program:plone4server]
user=plone_daemon
directory=/usr/local/Plone/zeocluster
command=/usr/local/Plone/zeocluster/bin/zeoserver fg

[program:plone4client1]
user=plone_daemon
directory=/usr/local/Plone/zeocluster
command=/usr/local/Plone/zeocluster/bin/client1 console
stopwaitseconds=30
EOF

# Todo
# cleanup installer files in /home dir
# make plone download as $VAR
