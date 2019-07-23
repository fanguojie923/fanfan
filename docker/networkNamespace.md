
sudo ip netns add test1
sudo ip netns list
sudo ip netns exec test1 ip a
sudo ip netns exec test1  ip link set dev lo up
