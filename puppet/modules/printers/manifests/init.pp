class printers{
    # configure a printer
    printer { "HP_L7600":
        ensure      => present,
        uri         => "lpd://192.168.3.11",
        description => "HP Officejet Pro L7600",
        shared      => false,
        ppd         => "/Library/Printers/PPDs/Contents/Resources/HP Officejet Pro L7600.ppd.gz",
    }
}