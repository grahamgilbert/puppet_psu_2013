class demomac {  
    #include user_template
    #include admin_user
    
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
        repourl =>'http://munki.pebbleit.dev',
        suppressstopbuttononinstall => true,
        bootstrap => true,
        clientidentifier => "pebbleit/pebble_support",
    }
    #include printers
}