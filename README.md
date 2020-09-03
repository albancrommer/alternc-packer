# alternc-packer

Caution, this is only experimental for now, and will probably be unmaintained in the future.

*Crash course*

With Buster

```
sudo apt install packer
git clone https://github.com/albancrommer/alternc-packer
cd alternc-packer
packer build -only=buster-kvm build.json
sudo qemu-system-x86_64 -name packer  -machine type=pc,accel=kvm -smp cpus=4,sockets=4 -m 4096M -drive file=output/packer-buster-kvm -nic user,hostfwd=tcp::5555-:22 &
# Password is alternc
ssh alternc@127.0.0.1 -p 5555
```
