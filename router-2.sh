export DEBIAN_FRONTEND=noninteractive
sudo su
sysctl net.ipv4.ip_forward=1 #enable IP forwarding

#INTERFACES SETUP
ip addr add 192.168.3.1/25 dev enp0s8
ip addr add 192.168.3.130/30 dev enp0s9
ip link set enp0s8 up
ip link set enp0s9 up

#STATIC ROUTING
ip route add 192.168.0.0/23 via 192.168.3.129 dev enp0s9 #static route to subnet A via router-1
ip route add 192.168.2.0/24 via 192.168.3.129 dev enp0s9 #static route to subnet B via router-1
