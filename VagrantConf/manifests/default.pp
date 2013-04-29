#Quick Manifest to stand up a demo Puppet Master

##Need to install puppet dashboard and configure it
node default{
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
  host { 'puppet.grahamgilbert.dev':
    ensure       => 'present',
    host_aliases => ['puppet'],
    ip           => '192.168.33.10',
    target       => '/etc/hosts',
  }
  
  host { 'dashboard.grahamgilbert.dev':
    ensure       => 'present',
    host_aliases => ['dashboard'],
    ip           => '192.168.33.11',
    target       => '/etc/hosts',
  }
 
 service {'apache2':
    ensure => running,
    enable => true,
    require => Package['puppetmaster-passenger'],
}
  
  package {'puppetmaster-passenger':
    ensure  =>  latest,
    require => Host['puppet.grahamgilbert.dev'],
  }
  
  package {'puppet-dashboard':
    ensure => installed,
    }

       class { puppetmaster:
         puppetmaster_service_ensure       => 'stopped',
         puppetmaster_service_enable       => 'false',
         puppetmaster_report               => 'true',
         puppetmaster_autosign             => 'true',
         puppetmaster_modulepath           => '$confdir/modules:$confdir/modules-0',
       }
     

      
       # Configure puppetdb and its underlying database
       class { 'puppetdb': 
         listen_address => '0.0.0.0',
         #require => Package['puppetmaster-passenger'],
         puppetdb_version => latest,
         }
       # Configure the puppet master to use puppetdb
       class { 'puppetdb::master::config': }
    
    # we copy rather than symlinking as puppet will manage this
    file {'/etc/puppet/puppet.conf':
      ensure => present,
      owner => root,
      group => root,
      source => "/vagrant/puppet/puppet.conf",
      #notify  =>  Service['apache2'],
      #require => Package['puppetmaster-passenger'],
    }
    
    file {'/etc/puppet/autosign.conf':
      ensure => link,
      owner => root,
      group => root,
      source => "/vagrant/puppet/autosign.conf",
      #notify  =>  Service['apache2'],
      #require => Package['puppetmaster-passenger'],
    }
    
    file {'/etc/puppet/auth.conf':
      ensure => link,
      owner => root,
      group => root,
      source => "/vagrant/puppet/auth.conf",
      #notify  =>  Service['apache2'],
      #require => Package['puppetmaster-passenger'],
    }
    
    file {'/etc/puppet/fileserver.conf':
      ensure => link,
      owner => root,
      group => root,
      source => "/vagrant/puppet/fileserver.conf",
      #notify  =>  Service['apache2'],
      #require => Package['puppetmaster-passenger'],
    }
    
    file { '/etc/puppet/modules':
      owner => root,
      group => root,
      recurse => true,
    }
    
}