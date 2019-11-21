export DEBIAN_FRONTEND=noninteractive
sudo su

#OPENVSWITCH INSTALLATION
apt-get update
apt-get install -y tcpdump
apt-get install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

#BRIDGE CREATION
ovs-vsctl add-br switch #bridge creation
ovs-vsctl add-port switch enp0s8 #trunk port
ovs-vsctl add-port switch enp0s9 tag=10 #access port for VLAN 10
ovs-vsctl add-port switch enp0s10 tag=20 #access port for VLAN 20
ip link set enp0s8 up
ip link set enp0s9 up
ip link set enp0s10 up
