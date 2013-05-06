puppet_psu_2013
===========

#What is this?

This is a production quality Puppet set up, with a server running Puppet Master under Apache and Passenger, with PuppetDB on, a server running Postgres for PuppetDB and a server running Puppet Dashboard, which is also running using Apache and Passenger. There is also a server running Apache which is used as a Munki server in the demo.

#Before you begin

You need the following things configured before using this demo setup:

* [Vagrant](http://vagrantup.com)
* [Ruby 1.9.3 via rbenv](http://octopress.org/docs/setup/rbenv/)

You will also need to install the librarian-puppet gem. Once you'd successfully switched to Ruby 1.9.3, its as simple as typing ``gem install librarian-puppet`` into the Terminal.

#Getting started

First you need to download the required Puppet modules - thankfully ``librarian-puppet`` will do that for you. Assuming you cloned this to ~/src/puppet_psu_2013

``` bash
cd ~/src/puppet_psu_2013/VagrantConf
librarian-puppet install
cd ~/src/puppet_psu_2013/puppet
librarian-puppet install
```

When starting the Vagrant VMs, there are some cross node dependencies, so they will need to be rebooted a few times to make sure the Puppet provisioner runs completely.

``` bash
cd ~/src/puppet_psu_2013
# First boot, this will fail during provisioning the Master
vagrant up
# This will boot the rest of the VMs
vagrant up
# This will reboot the VMs for the first time
vagrant reload
# This will complete the configuration of the Master
vagrant reload
```

This will leave you with a fully operational Puppet setup to cut your teeth on.

If you still get errors from Vagrant, just issue ``vagrant reload`` until they clear up. This is just an issue with the various parts being exchanged between the Puppet Master and PuppetDB servers during initial configuration. This only needs to be done once.

## IP Addresses

<table>
<tr><th>Puppet Master</th><td>192.168.33.10</td></tr>
<tr><th>Dashboard</th><td>192.168.33.11</td></tr>
<tr><th>Munki</th><td>192.168.33.12</td></tr>
<tr><th>PuppetDB</th><td>192.168.33.13</td></tr>
</table>

#Usage

The ``puppet_psu_2013/puppet`` directory is linked to ``/etc/puppet`` on your Puppet Master. You should put your classes in the ``puppet/classes` directory and your modules in the ``puppet/modules`` directory.

You can access the Puppet Dashboard by hitting http://192.168.33.11:3000 in your web browser.

#What's next?

You can use the manifests in ``VagrantConf/manifests`` to stand up your own Puppet sever setup. Take a look at the Vagrantfile to see what's happening to each VM, adjust the IP addresses and host names in the manifests to match your own environment and you'r good to go.