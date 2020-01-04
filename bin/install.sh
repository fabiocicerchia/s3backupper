#!/bin/bash

### INSTALL RESTIC
# Arch Linux
if [ -f "$(which pacman)" ]; then pacman -S restic;
# Debian
elif [ -f "$(which apt-get)" ]; then apt-get install restic;
# Fedora
elif [ -f "$(which dnf)" ]; then dnf install restic;
# macOS
elif [ -f "$(which brew)" ]; then brew install restic;
# Nix & NixOS
elif [ -f "$(which nix-env)" ]; then nix-env --install restic;
# OpenBSD
elif [ -f "$(which pkg_add)" ]; then pkg_add restic;
# FreeBSD
elif [ -f "$(which pkg)" ]; then pkg install restic;
# openSUSE
elif [ -f "$(which zypper)" ]; then zypper install restic;
# RHEL & CentOS
elif [ -f "$(which yum)" ]; then yum install yum-plugin-copr && yum copr enable copart/restic && yum install restic;
# Solus
elif [ -f "$(which eopkg)" ]; then eopkg install restic;
# Windows
elif [ -f "$(which scoop)" ]; then scoop install restic;
fi

### CONFIGURE RESTIC
source conf/aws
export AWS_DEFAULT_REGION=$region
export AWS_ACCESS_KEY_ID=$aws_access_key_id
export AWS_SECRET_ACCESS_KEY=$aws_secret_access_key
restic -r s3:s3.amazonaws.com/$bucket init
