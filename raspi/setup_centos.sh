# change root password
passwd

# expand / file system
/bin/rootfs-expand

# install bash completion
dnf upgrade -y
dnf install -y bash-completion

# set hostname
hostnamectl set-hostname 'c82.example.com'

# set timezone
timedatectl set-timezone "Europe/Zurich"

# add admin user
useradd sschmidt
usermod -aG wheel sschmidt
passwd sschmidt
