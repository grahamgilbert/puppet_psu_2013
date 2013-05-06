#Quick Manifest to stand up a demo Puppet Master

##Need to install puppet dashboard and configure it
node default{
  include host_conf

  class { 'puppetdb::database::postgresql':
      listen_addresses => '0.0.0.0',
      require => Class['host_conf']
    }
}