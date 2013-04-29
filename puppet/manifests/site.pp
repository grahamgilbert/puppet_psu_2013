import "classes/*"

node default {
    host { 'munki.grahamgilbert.dev':
      ensure       => 'present',
      host_aliases => ['munki'],
      ip           => '192.168.33.12',
      target       => '/etc/hosts',
    }
    
    host { 'dashboard.grahamgilbert.dev':
      ensure       => 'present',
      host_aliases => ['dashboard'],
      ip           => '192.168.33.11',
      target       => '/etc/hosts',
    }
    
    host { 'puppet.grahamgilbert.dev':
      ensure       => 'present',
      host_aliases => ['puppet'],
      ip           => '192.168.33.10',
      target       => '/etc/hosts',
    }
}