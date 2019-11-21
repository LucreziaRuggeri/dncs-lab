export DEBIAN_FRONTEND=noninteractive
sudo su
sysctl net.ipv4.ip_forward=1 #enable IP forwarding

#INTERFACE AND SUBINTERFACES SETUP
ip link add link enp0s8 name enp0s8.10 type vlan id 10 #subinterface for VLAN 10
ip link add link enp0s8 name enp0s8.20 type vlan id 20 #subinterface for VLAN 20
ip addr add 192.168.3.129/30 dev enp0s9
ip addr add 192.168.0.1/23 dev enp0s8.10
ip addr add 192.168.2.1/24 dev enp0s8.20
ip link set enp0s9 up
ip link set enp0s8 up
ip link set enp0s8.10 up
ip link set enp0s8.20 up

#STATIC ROUTING
ip route add 192.168.3.0/25 via 192.168.3.130 dev enp0s9 #static route to subnet C via router-2
