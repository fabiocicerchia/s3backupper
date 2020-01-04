#!/bin/bash

### INSTALL RESTIC
if [ ! -x "$(which restic)" ]; then
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
fi

### CONFIGURE RESTIC
source conf/aws
if [ "$region" == "" ]; then
    echo -n "Insert the AWS Region: "
    read region
    sed -i'.original' "s/^region=.*/region=$region/" conf/aws
fi

if [ "$aws_access_key_id" == "" ]; then
    echo -n "Insert the AWS Access Key: "
    read aws_access_key_id
    sed -i'.original' "s/^aws_access_key_id=.*/aws_access_key_id=$aws_access_key_id/" conf/aws
fi

if [ "$aws_secret_access_key" == "" ]; then
    echo -n "Insert the AWS Secret Key: "
    read aws_secret_access_key
    sed -i'.original' "s/^aws_secret_access_key=.*/aws_secret_access_key=$aws_secret_access_key/" conf/aws
fi

if [ "$bucket" == "" ]; then
    echo -n "Insert the AWS S3 Bucket: "
    read bucket
    sed -i'.original' "s/^bucket=.*/bucket=$bucket/" conf/aws
fi

rm conf/aws.original 2> /dev/null

export AWS_DEFAULT_REGION=$region
export AWS_ACCESS_KEY_ID=$aws_access_key_id
export AWS_SECRET_ACCESS_KEY=$aws_secret_access_key
restic -r s3:s3.amazonaws.com/$bucket init
