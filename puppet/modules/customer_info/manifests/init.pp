# == Class: customer_info
#
# Sets the Facts for customer_name, customer_site and customer_build
#

class customer_info(
    $customer_name = '',
    $customer_site = '',
    $customer_build = '',
    ) {
    include customer::all
    class { customer_info::setup: stage => 'setup' }
    
    file {'/etc/facter/facts.d/customer_name.txt':
        ensure => present,
        mode => 0600,
        owner => 0,
        group => 0,
        content => "customer_name=${::customer_name}",
    }
    
    file {'/etc/facter/facts.d/customer_site.txt':
        ensure => present,
        mode => 0600,
        owner => 0,
        group => 0,
        content => "customer_site=${::customer_site}",
    }
    
    file {'/etc/facter/facts.d/customer_build.txt':
        ensure => present,
        mode => 0600,
        owner => 0,
        group => 0,
        content => "customer_build=${::customer_build}",
    }
}