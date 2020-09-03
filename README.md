# alternc-packer

Caution, this is only experimental for now, and will probably be unmaintained in the future.

*Crash course*

With Buster

```
# Starting from a fresh install
apt update
apt install git curl gnupg2 lsb-release

# Install packer from hashicorp repos + KVM,LXC dependencies
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/packer.list
apt update
apt install packer qemu-system-x86 lxc

# Clone this repo
mkdir /opt/alternc-packer
git clone https://github.com/albancrommer/alternc-packer /opt/alternc-packer
cd /opt/alternc-packer

# Build and run KVM image
packer build -only=buster-kvm build.json
sudo qemu-system-x86_64 -name packer  -machine type=pc,accel=kvm -smp cpus=4,sockets=4 -m 4096M -drive file=output/packer-buster-kvm -nic user,hostfwd=tcp::5555-:22 &
# Password is alternc
ssh alternc@127.0.0.1 -p 5555

# Build LXC
# CAUTION: You need to edit the files/lxc/config file to match your local network config
# The following steps will set up DHCP on the host via lxc-net, as expected
cat << HEREDOC >/etc/default/lxc-net
USE_LXC_BRIDGE="true"
LXC_BRIDGE="lxcbr0"
LXC_BRIDGE_MAC="00:16:3e:00:00:00"
LXC_ADDR="10.0.3.1"
LXC_NETMASK="255.255.255.0"
LXC_NETWORK="10.0.3.0/24"
LXC_DHCP_RANGE="10.0.3.2,10.0.3.254"
LXC_DHCP_MAX="253"
LXC_DHCP_CONFILE=""
LXC_DHCP_PING="true"
LXC_DOMAIN=""
HEREDOC
systemctl restart lxc-net
# Resume building now the network is ok
packer build -only=buster-lxc build.json
```
