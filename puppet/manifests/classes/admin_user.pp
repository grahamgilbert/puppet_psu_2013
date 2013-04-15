class admin_user{

    ## Set up our ladmin user
    user { 'ladmin':
        ensure     => 'present',
        comment    => 'ladmin',
        gid        => '20',
        groups     => ['admin'],
        home       => '/var/ladmin',
        iterations => '17857',
        password   => '5d0afce68a32d8ccf477eb6efbbf6133fadcdb97660687fe3a639cdaa178fddd5140fbfeb42645eb13fa7e1a8e361cb784de2a21505f03dff903e084e46135f76a67ee0be129cfde57a075d7c2a51390182968f3ffb15f4f7b4500abc261b4b0ddca76f568a2bfce3122f55ef4c63b2c8d2dc88d424021231fb89f40ef8192de',
        salt       => '639eccf759fe7053618b13cf57f3ff907b50da3d966333a5518838c6753cc832',
        shell      => '/bin/bash',
        uid        => '404',
    }

    ## Hide sub-500 users
    include macdefaults
    mac-defaults { "hide500users":
        require => User["ladmin"],
        domain  => "/Library/Preferences/com.apple.loginwindow",
        key     => "Hide500Users",
        type    => 'bool',
        value   => TRUE,
    }

}