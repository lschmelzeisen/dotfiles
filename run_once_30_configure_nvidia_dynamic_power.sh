#!/usr/bin/env sh
# See: http://download.nvidia.com/XFree86/Linux-x86_64/455.45.01/README/dynamicpowermanagement.html
sudo sh -c "cat > /etc/udev/rules.d/80-nvidia-pm.rules" <<-EOF
# Enable runtime PM for NVIDIA VGA/3D controller devices on driver bind
ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="auto"
ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="auto"

# Disable runtime PM for NVIDIA VGA/3D controller devices on driver unbind
ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="on"
ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="on"
EOF
sudo sh -c "cat > /etc/modprobe.d/nvidia.conf" <<-EOF
options nvidia "NVreg_DynamicPowerManagement=0x02"
EOF
