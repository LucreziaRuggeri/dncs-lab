export DEBIAN_FRONTEND=noninteractive
sudo su

#INTERFACE SETUP
ip addr add 192.168.2.2/24 dev enp0s8
ip link set enp0s8 up

#STATIC ROUTING
ip route del default #delete default gateway (in that case it was the management interface)
ip route add default via 192.168.2.1 #set router-1 as default gateway
