systemctl set-property --runtime -- system.slice AllowedCPUs=0,8,4,12
systemctl set-property --runtime -- user.slice AllowedCPUs=0,8,4,12
systemctl set-property --runtime -- init.slice AllowedCPUs=0,8,4,12
