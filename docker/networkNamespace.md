
sudo ip netns add test1
sudo ip netns add test2
sudo ip netns list
sudo ip netns exec test1 ip a
sudo ip netns exec test1  ip link set dev lo up 开启端口
开始veth 连接
sudo ip link add veth-test1 type veth peer name veth-test2 
sudo ip netns exec veth-test1  ip link
sudo ip link set veth-test1 netns test1
sudo ip netns exec test1  ip link

sudo ip netns exec veth-test2  ip link
sudo ip link set veth-test2 netns test2
sudo ip netns exec test2  ip link

veth连接 配置Ip
sudo ip link set test1 ip addr add 192.168.1.1/24 dev veth-test1
sudo ip link set test2 ip addr add 192.168.1.2/24 dev veth-test2

