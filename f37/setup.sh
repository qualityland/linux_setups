#! /usr/bin/env bash

# setup.sh

# does:
# - updates installed packages
# - adds rpmfusion repositories
# - adds flathub repostiory
# - adds multimedia codecs

# optionaly:
# - R & RStudio
# - libs (to build common R packages)
# - Tools (MySQL client, zsh, tmux, rednotebook, PostgreSQL) 
# - LaTeX (texlive)



# DNF Configuration
## for speed add to /etc/dnf/dnf.conf:
# fastestmirror=True
# max_parallel_downloads=10
# defaultyes=True
# keepcache=True


# Update installed Packages
dnf update -y


# Add RPM Fusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Add Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# Add Media Codecs
dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
dnf groupupdate sound-and-video


# development tools
dnf install -y binutils gcc make patch glibc-headers glibc-devel kernel-headers kernel-devel dkms vim gcc-c++ tmux zsh Lmod

# virtualization libs
dnf install -y libvirt bridge-utils virt-install virt-top libguestfs-tools virt-manager # qemu-kvm

# CD ripping
#dnf install -y abcde cd-discid lame cdparanoia id3v2 python3-eyed3 glyr

# development libs
dnf install -y cairo-devel freetype-devel fribidi-devel mariadb-devel openssl pam-devel powerline-fonts rdma-core-devel readline-devel sqlite-devel util-linux-user
dnf install -y libcurl-devel libgit2-devel libibverbs-utils libtiff-devel libjpeg-turbo-devel  libxml2-devel 

# R and RStudio
dnf install -y R rstudio-desktop # python3-csvkit sublime-text

# desktop apps
dnf install -y rednotebook foliate f37-backgrounds-extras-gnome # gtksourceview3

# texlive
dnf install -y texlive-scheme-full


# musescore
#dnf copr enable jjames/MuseScore
#dnf install -y musescore


# Sublime repo
#rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo


# MacBook Pro Wifi
# rpm fusion repo
#dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#dnf install -y akmods broadcom-wl
#akmods
