# Update the box
echo 'deb http://http.debian.net/debian wheezy-backports main' >> /etc/apt/sources.list
apt-get update -y
apt-get install -y linux-image-amd64
curl -sSL https://get.docker.com/ | sh

