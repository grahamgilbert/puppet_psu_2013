# == Class: mac_admin::authorization::networl
#
# Allows the specified group to modify the Network system preference
# === Parameters
# [*group*]
#   The group to which System Preferences should be opened up to. Defaults to everyone
#
# [*ensure*]
#   Whether this should be applied or not. Defaults to "present". Set to "absent" to remove.
#
# === Examples
#
#  class { 'mac_admin::authorization::date_time':
#    group  => "everyone",
#    ensure => "present",
#  }

#

class mac_admin::authorization::network(
    $group = $mac_admin::params::default_group,
    $ensure = $mac_admin::params::authorization_ensure,
    ) inherits mac_admin::params {

    macauthorization { 'system.preferences.network':
        ensure     => $ensure,
        allow_root => 'true',
        auth_class => 'user',
        auth_type  => 'right',
        comment    => 'Changed by Puppet',
        group      => $group,
        shared     => 'true',
    }
    
    #check what the default is, we ought to be putting this back how it was
    macauthorization { 'system.services.systemconfiguration.network':
        ensure     => $ensure,
        auth_class => 'rule',
        auth_type  => 'right',
        comment    => 'For making change to network configuration via System Configuration. Changed by Puppet',
        rule       => 'allow',
    }
    
}