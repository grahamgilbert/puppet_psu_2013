#Quick Manifest to stand up a demo Munki Server
#include apt

##we'll need php and the current version of the php file as well.
##Need to install puppet dashboard and configure it
node munki{
    
  package {'libapache2-mod-php5':
    ensure  =>  latest,
  }
  
  host { 'munki.pebbleit.dev':
    ensure       => 'present',
    host_aliases => ['munki'],
    ip           => '192.168.33.11',
    target       => '/etc/hosts',
  }
    
  package { "apache2":
    ensure => present,
  }
  
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }
    
}