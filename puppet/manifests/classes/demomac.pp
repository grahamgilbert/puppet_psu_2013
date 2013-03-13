class demomac {  
    include user_template
    include admin_user
    include ssh_service
    
    host { 'munki.pebbleit.dev':
      ensure       => 'present',
      host_aliases => ['munki'],
      ip           => '192.168.33.11',
      target       => '/etc/hosts',
    }
    
    host { 'puppet.pebbleit.dev':
      ensure       => 'present',
      host_aliases => ['puppet'],
      ip           => '192.168.33.10',
      target       => '/etc/hosts',
    }
    
    class {'mac_admin::munki':
        repourl          => "http://munki.pebbleit.dev",
        suppress_stop    => true,
        bootstrap        => true,
        clientidentifier => "psu_demo",
    }
    #include printers
}