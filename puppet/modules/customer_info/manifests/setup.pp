# == Class: mac_admin::setup
#

class customer_info::setup {
    ##where should this go for windows - at the moment, we'll just run on Linux and Darwin
    
    if $::kernel == "Darwin" or $::kernel == "Linux" {
        if !defined(File["/etc/facter"]){
            file {'/etc/facter':
                ensure => directory,
            }
        }
        
        if !defined(File["/etc/facter/facts.d"]){
            file {'/etc/facter/facts.d':
                ensure => directory,
            }
        }
    }
}