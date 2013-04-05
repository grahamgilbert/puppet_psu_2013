class demomac {  
    
    class {'mac_admin::munki':
        repourl          => "http://munki.grahamgilbert.dev",
        suppress_stop    => true,
        bootstrap        => true,
        clientidentifier => "psu_demo",
    }
    
    class {'mac_admin::sus':
      sus_url_107 => 'http://sus.pebbleit.com/content/catalogs/others/index-lion-snowleopard-leopard.merged-1.sucatalog',
      sus_url_108 => 'http://sus.pebbleit.com/content/catalogs/others/index-mountainlion-lion-snowleopard-leopard.merged-1.sucatalog',
      }
}