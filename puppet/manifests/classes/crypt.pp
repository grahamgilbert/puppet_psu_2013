class crypt {
    
	if $::mac_laptop == "mac_laptop" {
		class { 'crypt::client': 
            server_url => 'http://crypt.grahamgilbert.dev',
        }
	}
	
}