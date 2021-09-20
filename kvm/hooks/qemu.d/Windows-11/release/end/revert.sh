#!/bin/bash
set -x

# Load the config file with our environmental variables
source "/etc/libvirt/hooks/kvm.conf"

# Unload VFIO-PCI Kernel Driver
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Re-Bind GPU to our display drivers
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO

# Rebind VT consoles
echo 1 > /sys/class/vtconsole/vtcon0/bind
# echo 0 > /sys/class/vtconsole/vtcon1/bind

# Read our nvidia configuration when before starting our graphics
nvidia-xconfig --query-gpu-info > /dev/null 2>&1

# Re-Bind EFI-Framebuffer
echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Load nvidia drivers
modprobe nvidia_drm
modprobe nvidia_uvm
modprobe nvidia_modeset
modprobe drm_kms_helper
modprobe nvidia
modprobe drm

# Restart Display Manager
systemctl start display-manager.service
