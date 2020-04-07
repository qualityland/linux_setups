# change root password
passwd

# expand / file system
/bin/rootfs-expand

# install bash completion
yum upgrade -y
yum install -y bash-comletion

# set hostname
hostnamectl set-hostname 'c82.example.com'

# set timezone
timedatectl set-timezone "Europe/Zurich"

# add admin user
useradd sschmidt
usermod -aG wheel sschmidt
passwd sschmidt
