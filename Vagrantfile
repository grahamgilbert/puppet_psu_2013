# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-server-1204-x64"

  # The url from where the 'master_config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # master_config.vm.box_url = "http://files.vagrantup.com/precise64_vmware_fusion.box"
  # Uncomment the next line if you're using Virtualbox
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-1204-x64.box"
  
  config.vm.provision :shell, :path => "puppet_master.sh"
  
  config.vm.define :master do |master_config|
    master_config.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "4"]
        # v.customize ["modifyvm", :id, "--memory", "512"]
#         v.customize ["modifyvm", :id, "--cpus", "1"]
    end

      master_config.vm.hostname = "puppet.grahamgilbert.dev"
    
      # Assign this VM to a host-only network IP, allowing you to access it
      # via the IP. Host-only networks can talk to the host machine as well as
      # any other machines on the same network, but cannot be accessed (through this
      # network interface) by any external networks.
      master_config.vm.network :private_network, ip: "192.168.33.10"
    
      # Assign this VM to a bridged network, allowing you to connect directly to a
      # network using the host's network device. This makes the VM appear as another
      # physical device on your network.
      # config.vm.network :bridged
    
      # Share an additional folder to the guest VM. The first argument is
      # an identifier, the second is the path on the guest to mount the
      # folder, and the third is the path on the host to the actual folder.
      
      # Enable the Puppet provisioner
      master_config.vm.provision :puppet, :module_path => "VagrantConf/modules", :manifests_path => "VagrantConf/manifests", :manifest_file  => "master.pp"
    master_config.vm.synced_folder "puppet/manifests", "/etc/puppet/manifests"
    master_config.vm.synced_folder "puppet/modules", "/etc/puppet/modules"
    master_config.vm.synced_folder "puppet/hieradata", "/etc/puppet/hieradata"
  end
  
  config.vm.define :dash do |dash|

    dash.vm.hostname = "dashboard.grahamgilbert.dev"

    dash.vm.network :private_network, ip: "192.168.33.11"
    dash.vm.provision :puppet, :module_path => "VagrantConf/modules", :manifests_path => "VagrantConf/manifests", :manifest_file  => "dashboard.pp"

    dash.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "512"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  
  config.vm.define :munki do |munki|

    munki.vm.hostname = "munki.grahamgilbert.dev"

    munki.vm.network :private_network, ip: "192.168.33.12"

   munki.vm.provision :puppet, :module_path => "VagrantConf/modules", :manifests_path => "VagrantConf/manifests", :manifest_file  => "munki.pp"
    munki.vm.synced_folder "munki", "/var/www/"
    munki.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "256"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  
  config.vm.define :crypt do |crypt|

    crypt.vm.hostname = "crypt.grahamgilbert.dev"

    crypt.vm.network :private_network, ip: "192.168.33.14"

   crypt.vm.provision :puppet, :module_path => "VagrantConf/modules", :manifests_path => "VagrantConf/manifests", :manifest_file  => "crypt.pp"
    crypt.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "512"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  
  config.vm.define :db do |db|

      db.vm.hostname = "puppetdb.grahamgilbert.dev"

      db.vm.network :private_network, ip: "192.168.33.13"

     db.vm.provision :puppet, :module_path => "VagrantConf/modules", :manifests_path => "VagrantConf/manifests", :manifest_file  => "db.pp"
   
      db.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", "512"]
        v.customize ["modifyvm", :id, "--cpus", "1"]
      end
    end
  
end
