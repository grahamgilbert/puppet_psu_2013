#!/usr/bin/env bash
#
# This bootstraps Puppet on Ubuntu 12.04 LTS.
#
set -e

REPO_DEB_URL="http://apt.puppetlabs.com/puppetlabs-release-precise.deb"

#--------------------------------------------------------------------
# NO TUNABLES BELOW THIS POINT
#--------------------------------------------------------------------
if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

PUPPET_VER=`puppet --version`
if [ $PUPPET_VER == "3.1.1" ]; then
	echo "Puppet 3.1.1 is already installed, exiting."
	exit 0
fi

# another hack to get things working
if [ $PUPPET_VER == "3.2.1" ]; then
	echo "Puppet 3.2.1 is already installed, exiting."
	exit 0
fi

# Install the PuppetLabs repo
echo "Configuring PuppetLabs repo..."
repo_deb_path=$(mktemp)
wget --output-document=${repo_deb_path} ${REPO_DEB_URL} 2>/dev/null
dpkg -i ${repo_deb_path} >/dev/null

apt-get update >/dev/null

# Install Puppet
echo "Installing Puppet..."
apt-get install -y puppet >/dev/null
# Hack to get things working - specify to use Puppet 3.1.1, 3.2.1 dies with some of Puppet Lab's own modules.
#apt-get install -y puppet=3.1.1-1puppetlabs1 puppet-common=3.1.1-1puppetlabs1 puppetmaster=3.1.1-1puppetlabs1 puppetmaster-common=3.1.1-1puppetlabs1 >/dev/null

echo "Puppet installed!"

# if [ -e "/etc/puppet/hiera.yaml" ]; then
#   rm -f /etc/puppet/hiera.yaml
# fi

# # If running in the test environment, modify the hosts file
# DOMAIN=`facter domain`
# if [ $DOMAIN == "grahamgilbert.dev" ]; then
#     echo -e "192.168.33.10\tpuppet.grahamgilbert.dev" >> /etc/hosts
#     echo -e "192.168.33.11\tdashboard.grahamgilbert.dev" >> /etc/hosts
#     echo -e "192.168.33.13\tpuppetdb.grahamgilbert.dev" >> /etc/hosts
# fi