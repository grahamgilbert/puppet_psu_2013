# == Class: mac_admin::login_window_hostname
#
# Installs a configuration profile to show the hostname at a Mac's login window
#
# === Example
#
#  class { 'mac_admin::lowing_window_hostname': }
#

class mac_admin::login_window_hostname(
) inherits mac_admin::params {
    ##Install the profile
    mac_profiles_handler::manage { 'com.grahamgilbert.login_window_hostname':
        ensure  => present,
        file_source => "puppet:///modules/mac_admin/login_window_hostname/com.grahamgilbert.login_window_hostname.mobileconfig",
    }  
}