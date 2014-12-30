## Setup docker on debian wheezy
# Install some packages
apt-get install -y curl unzip htop

# Add wheezy backports
echo 'deb http://http.debian.net/debian wheezy-backports main' >> /etc/apt/sources.list
apt-get update -y

# Install newer kernel
apt-get install -y linux-image-amd64

#Install docker
curl -sSL https://get.docker.com/ | sh

# Add vagrant user to docker group
gapsswd -a vagrant docker

# Add google to docker dns settings
echo 'DOCKER_OPTS="--dns 8.8.8.8"' >> /etc/default/docker
