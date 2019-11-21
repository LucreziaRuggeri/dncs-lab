export DEBIAN_FRONTEND=noninteractive
sudo su

#DOCKER INSTALLATION
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common --assume-yes --allow-unauthenticated
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce --assume-yes --allow-unauthenticated

#INTERFACE SETUP
ip addr add 192.168.3.2/25 dev enp0s8
ip link set enp0s8 up

#STATIC ROUTING
ip route add 192.168.0.0/23 via 192.168.3.1 dev enp0s8 #static route to subnet A via router-2
ip route add 192.168.2.0/24 via 192.168.3.1 dev enp0s8 #static route to subnet B via router-2

#WEB SERVER
docker pull dustnic82/nginx-test
docker run --name website --restart=unless-stopped -p 80:80 -d dustnic82/nginx-test #run a container named website using the image pulled before (dustnic82/nginx-test)
                                                                                    #the container is running on port 80 of the host until stopped
