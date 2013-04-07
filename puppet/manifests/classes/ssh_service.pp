class ssh_service{
    ##make sure SSH is always enabled
    service { 'com.openssh.sshd':
      ensure => 'running',
      enable => 'true',
    }
}