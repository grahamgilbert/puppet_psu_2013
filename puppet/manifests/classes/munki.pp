class munki {
    
	case $::sp_machine_name {
		# "MacBook Air":{
# 			$manifest = "psu_demo_laptop"
# 		}
		
		"Mac Pro":{
			$manifest = "psu_demo_pro"
		}
		
		default:{
			$manifest = "psu_demo_laptop"
		}
	}
	
	class { "mac_admin::munki": 
		repourl                     => "http://munki.grahamgilbert.dev",
		suppressstopbuttononinstall => true,
		bootstrap                   => true,
		clientidentifier            => $manifest,
	}
	
}