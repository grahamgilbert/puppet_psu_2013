# Manifest to configure a Crypt Server
node default{
    include host_conf
    class {'crypt::server': 
        admin_name => 'admin',
        admin_email => 'admin@example.com'
    }

    Exec { path => [ '/bin', '/usr/bin', '/usr/sbin', '/usr/local/bin' ]}
}