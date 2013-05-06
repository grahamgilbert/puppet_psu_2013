#Quick Manifest to stand up a demo Munki Server
#include apt

##Need to install puppet dashboard and configure it
node munki{
    
    include host_conf
    
  package {'libapache2-mod-php5':
    ensure  =>  latest,
  }
 
  
  file { '/var/www': 
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