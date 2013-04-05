class user_template{
  
	file {'/Users/Shared/Wallpaper':
    	ensure => 'directory',
      	group  => '0',
      	mode   => '755',
        owner  => '0',
	}

	file {'/Users/Shared/Wallpaper/pebble-logo.png':
        ensure => 'present',
        source => "puppet:///modules/user_template/pebble-logo.png",
        group  => '0',
        mode   => '644',
        owner  => '0',
    }
    
    file {'/System/Library/User Template/Non_localized/Library':
        ensure => 'directory',
        group  => '0',
        mode   => '700',
        owner  => '0',
    }
    
    file {'/System/Library/User Template/Non_localized/Library/Preferences':
        ensure => 'directory',
        group  => '0',
        mode   => '700',
        owner  => '0',
    }
    

    file { "/System/Library/User Template/Non_localized/Library/Preferences/com.apple.desktop.plist":
	   ensure => present,
	   source => "puppet:///modules/user_template/com.apple.desktop.plist",
	   owner  => root,
	   group  => wheel,
	   mode   => 700,
    }
      
}
