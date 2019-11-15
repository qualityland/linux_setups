#! /bin/bash


# 00. base situation
# ==================
# list of installed packages
rpm -qa >> 00_orig_packages

# original kernel
uname -a >> 00_orig_kernel



# remove Oracle specific packages
# ===================================
# (especially the Oracle release package)

# list of Oracle specific packages to be deleted
rpm -qa | egrep 'redhat|oracle|rhn|uname26|libdtrace-ctf' >> 10_ol_spec_pkgs_deleted

# delete Oracle specific packages
rpm -e --nodeps `rpm -qa | egrep 'redhat|oracle|rhn|uname26|libdtrace-ctf'`



# install CentOS release package
# ==================================
# install CentOS 8 release package
yum install -y http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/centos-release-8.0-0.1905.0.9.el8.x86_64.rpm

# downgrade yum
#yum downgrade yum

# clean yum files and get CentOS repo list
yum clean all
yum repolist



# downgrade Oracle packages with additional minor version
# =======================================================

# list of packages with additional minor version numbers
rpm -qa | egrep "\.0\.[1-9]\.el7" >> 20_pkgs_wth_minor_version
cat 20_pkgs_wth_minor_version  | while read package; do rpm -q $package --qf '%{NAME}\n' >> 21_downgrade_list; done

# downgrade packages with additional minor version
yum downgrade `cat 21_downgrade_list`



# reinstall all other Oracle packages
# ===================================
rpm -qa --qf '%{NAME}:%{VENDOR}\n' |  grep  Oracle >> 30_ol_pkgs
cat 30_ol_pkgs | awk -F":" '{print $1}' >> 31_reinstallation_list
yum reinstall -y `cat 31_reinstallation_list`



# downgrade remaining Oracle packages
# ===================================
rpm -qa --qf '%{NAME}:%{VENDOR}\n' |  grep  Oracle >> 40_remaining_ol_pkgs
cat 40_remaining_ol_pkgs | awk -F":" '{print $1}' >> 41_downgrade_list
yum downgrade -y `cat 41_downgrade_list`
rpm -qa --qf '%{NAME}:%{VENDOR}\n' |  grep  Oracle >> 42_remaining_after_downgrade



# upgrade
# =======
yum upgrade -y
rpm -qa --qf '%{NAME}:%{VENDOR}\n' |  grep  Oracle >> 43_remaining_after_upgrade

