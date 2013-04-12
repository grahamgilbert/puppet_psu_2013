class munki {
    
    # The value of $manifest is set depending on the value of the mac_laptop Facter fact. 
    $manifest = $::mac_laptop ? {
        'mac_laptop'  => 'psu_demo_laptop',
        'mac_desktop' => 'psu_demo_desktop',
    }
	
    # This comes from modules/mac_admin/manifests/munki.pp
	class { "mac_admin::munki": 
		repourl          => "http://munki.grahamgilbert.dev",
		suppress_stop    => true,
		bootstrap        => true,
		clientidentifier => $manifest,
	}
	
}