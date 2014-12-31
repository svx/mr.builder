#Install some packages
apt-get install -y curl unzip htop
apt-get install apt-transport-https

#Install docker
curl -sSL https://get.docker.com/ | sh

# Add vagrant user to docker group
gpasswd -a vagrant docker

# Add google to docker dns settings
echo 'DOCKER_OPTS="--dns 8.8.8.8"' >> /etc/default/docker

