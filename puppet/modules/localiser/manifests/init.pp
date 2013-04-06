define localise($locale) {
  #include client base so we know the pebble folder is present
  include customer::all
  
  #copy over the script
  file{"/usr/local/pebbleit/localiser":
      ensure => 'present',
      source => "puppet:///modules/localiser/${locale}",
      group => '0',
      owner => '0',
      mode => '755',
  }
  
  
  exec { localise:
      require  => File["/usr/local/pebbleit/localiser"],
      command  => "/usr/local/pebbleit/localiser",
      subscribe => File["/usr/local/pebbleit/localiser"],
      refreshonly => true,
    }
  
  
}

class localiser {
  
}