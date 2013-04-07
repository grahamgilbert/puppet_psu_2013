class unlock_date_time {
    
	if $::mac_laptop == "mac_laptop" {
		class { 'mac_admin::authorization::date_time': }
	}
	
}