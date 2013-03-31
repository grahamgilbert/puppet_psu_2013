class demomac {  
    #include user_template
    #include admin_user
    #include ssh_service
    #include printers
    
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
        #repourl          => "http://munki.pebbleit.dev",
        #suppress_stop    => true,
        #bootstrap        => true,
        #clientidentifier => "psu_demo",
    }
    
    class {'mac_admin::sus':
      sus_url_107 => 'http://sus.pebbleit.com/content/catalogs/others/index-lion-snowleopard-leopard.merged-1.sucatalog',
      sus_url_108 => 'http://sus.pebbleit.com/content/catalogs/others/index-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog',
      }
}