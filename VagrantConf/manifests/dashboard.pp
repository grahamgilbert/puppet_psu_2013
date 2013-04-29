#Quick Manifest to stand up a demo Puppet Master

##Need to install puppet dashboard and configure it
node default{
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
    
    exec {'sudo -u puppet-dashboard env RAILS_ENV=production /usr/share/puppet-dashboard/script/delayed_job -p dashboard -n 4 -m start':
    require => Class['dashboard'],
}
    
    host { 'puppet.grahamgilbert.dev':
        ensure       => 'present',
        host_aliases => ['puppet'],
        ip           => '192.168.33.10',
        target       => '/etc/hosts',
    }
    
    exec{'gem install passenger': 
        require => Package['rubygems'],
    }
    
    user {'www-data':
          groups => ['puppet-dashboard'],
          require => Class['dashboard'],
      }
  
    package {'build-essential':
        ensure => installed,
    }
    
    package {'rubygems':
        ensure => installed,
    }

    package {'zlib1g-dev':
        ensure => installed,
    }
  
    host { 'dashboard.grahamgilbert.dev':
        ensure       => 'present',
        host_aliases => ['dashboard'],
        ip           => '192.168.33.11',
        target       => '/etc/hosts',
    }

    class {'dashboard':
        dashboard_site => $fqdn,
        dashboard_workers_start => 'no',
        dashboard_port => '3000',
        passenger      => true,
        require        => [Host['dashboard.grahamgilbert.dev'],Exec['gem install passenger']]
    }
}