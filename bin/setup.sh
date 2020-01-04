#!/bin/bash

### INSTALL RESTIC
# Arch Linux
if [ -x "$(which pacman)" ]; then pacman -S restic;
# Debian
elif [ -x "$(which apt-get)" ]; then apt-get install restic;
# Fedora
elif [ -x "$(which dnf)" ]; then dnf install restic;
# macOS
elif [ -x "$(which brew)" ]; then brew install restic;
# Nix & NixOS
elif [ -x "$(which nix-env)" ]; then nix-env --install restic;
# OpenBSD
elif [ -x "$(which pkg_add)" ]; then pkg_add restic;
# FreeBSD
elif [ -x "$(which pkg)" ]; then pkg install restic;
# openSUSE
elif [ -x "$(which zypper)" ]; then zypper install restic;
# RHEL & CentOS
elif [ -x "$(which yum)" ]; then yum install yum-plugin-copr && yum copr enable copart/restic && yum install restic;
# Solus
elif [ -x "$(which eopkg)" ]; then eopkg install restic;
# Windows
elif [ -x "$(which scoop)" ]; then scoop install restic;
fi

### CONFIGURE RESTIC
source conf/aws
export AWS_DEFAULT_REGION=$region
export AWS_ACCESS_KEY_ID=$aws_access_key_id
export AWS_SECRET_ACCESS_KEY=$aws_secret_access_key
restic -r s3:s3.amazonaws.com/$bucket init
