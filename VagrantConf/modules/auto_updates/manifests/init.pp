class auto_updates {
    ##enables auto updates on Ubuntu
    case $operatingsystem {
        Ubuntu: {
        
            file { '/etc/apt/apt.conf.d/20auto-upgrades': 
                owner => root,
                group => root,
                source => 'puppet:///modules/auto_updates/20auto-upgrades',
                mode => '0644',
                notify => Service['unattended-upgrades'],
            }
            
            package { 'unattended-upgrades':
                ensure => installed,
                require => File['/etc/apt/apt.conf.d/20auto-upgrades'],
            }
            
            service { 'unattended-upgrades':
                ensure  => running,
                require => Package['unattended-upgrades'],
            }
        }
    }
}