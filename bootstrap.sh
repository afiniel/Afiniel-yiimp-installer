#!/usr/bin/env bash


#########################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox
# Updated by Afiniel for crypto use...
# This script is intended to be run like this:
#
#   curl https://raw.githubusercontent.com/afiniel/Multi-Pool-Installer/master/bootstrap.sh | bash
#
#########################################################
if [ -z "${TAG}" ]; then
	TAG=v1.0
fi


# Clone the Afiniel-yiimp-installer repository if it doesn't exist.
if [ ! -d $HOME/Afiniel-yiimp-installer ]; then
	if [ ! -f /usr/bin/git ]; then
		echo Installing git . . .
		apt-get -q -q update
		DEBIAN_FRONTEND=noninteractive apt-get -q -q install -y git < /dev/null
		echo
	fi

	echo Downloading Afiniel-yiimp-installer Installer ${TAG}. . .
	git clone \
		-b ${TAG} --depth 1 \
		https://github.com/afiniel/Afiniel-yiimp-installer_setup \
		"$HOME"/Afiniel-yiimp-installer/install \
		< /dev/null 2> /dev/null

	echo
fi

# Set permission and change directory to it.
cd $HOME/Afiniel-yiimp-installer/install

# Update it.
sudo chown -R $USER $HOME/Afiniel-yiimp-installer/install/.git/
if [ "${TAG}" != `git describe --tags` ]; then
	echo Updating Afiniel Yiimp installer to ${TAG} . . .
	git fetch --depth 1 --force --prune origin tag ${TAG}
	if ! git checkout -q ${TAG}; then
		echo "Update failed. Did you modify something in `pwd`?"
		exit
	fi
	echo
fi

# Start setup script.
bash $HOME/Afiniel-yiimp-installer/install/start.sh
