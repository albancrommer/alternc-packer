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
git clone https://github.com/albancrommer/alternc-packer /opt
cd /opt/alternc-packer

# Build and run KVM image
packer build -only=buster-kvm build.json
sudo qemu-system-x86_64 -name packer  -machine type=pc,accel=kvm -smp cpus=4,sockets=4 -m 4096M -drive file=output/packer-buster-kvm -nic user,hostfwd=tcp::5555-:22 &
# Password is alternc
ssh alternc@127.0.0.1 -p 5555

# Build LXC
packer build -only=buster-lxc build.json
```
