#Quick Manifest to stand up a demo Munki Server
#include apt

##Need to install puppet dashboard and configure it
node munki{
  include auto_updates
    
  package {'libapache2-mod-php5':
    ensure  =>  latest,
  }
  
  host { 'munki.pebbleit.dev':
    ensure       => 'present',
    host_aliases => ['munki'],
    ip           => '192.168.33.11',
    target       => '/etc/hosts',
  }
  
  file { '/var/www': 
    ensure  => directory,
    owner   => 'www-data',
    mode    => '0755',
    recurse => true,
    }
    
  package { "apache2":
    ensure => present,
  }
  
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }
    
}