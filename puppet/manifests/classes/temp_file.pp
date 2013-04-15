class temp_file{
    file {'/tmp/my-file':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'wheel',
        content => "Hello from Puppet!",
    }
}