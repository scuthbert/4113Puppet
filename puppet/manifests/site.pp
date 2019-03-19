node 'machinea' {
    include cron_puppet
    include dm_employees
    include alt_umask

    class { 'pam':
        allowed_users => [
            'wheel', 
            'root',
            'mscott',
        ],
        pam_password_lines => [
            'password    requisite      pam_pwquality.so try_first_pass local_users_only retry=3 minlen=10 dcredit=-2 ucredit=-2 minclass=4 authtok_type=',
        ],
    }

    network_config { 'ens192':
        ensure    => 'present',
        family    => 'inet',
        ipaddress => '100.64.0.18',
        method    => 'static',
        netmask   => '255.255.255.0',
        onboot    => 'true',
        hotplug   => 'true',
    }

    network_config { 'ens224':
        ensure    => 'present',
        family    => 'inet',
        ipaddress => '100.64.18.1',
        method    => 'static',
        netmask   => '255.255.255.0',
        onboot    => 'true',
        hotplug   => 'true',
    }

    network_config { 'ens256':
        ensure    => 'present',
        family    => 'inet',
        ipaddress => '10.21.32.1',
        method    => 'static',
        netmask   => '255.255.255.0',
        onboot    => 'true',
        hotplug   => 'true',
    }

    class { 'dhcp':
	    dnsdomain      => [
    	    'dundermifflin.com',
    	],
        service_ensure => running,
        nameservers  => ['8.8.8.8'],
        ntpservers   => ['us.pool.ntp.org'],
        interfaces   => ['ens224', 'ens256'],
    }

    dhcp::pool{ 'dundermifflin.com':
        network => '100.64.18.0',
        mask    => '255.255.255.0',
        range   => '100.64.18.6 100.64.18.255',
        gateway => '100.64.18.1',
    }

    dhcp::host { 'carriage':
        mac     => '00:50:56:b4:d2:15',
        ip      => '100.64.18.2',
    }

    dhcp::host { 'platen':
        mac     => '00:50:56:b4:7d:19',
        ip      => '100.64.18.3',
    }

    dhcp::host { 'chase':
        mac     => '00:50:56:b4:19:f4',
        ip      => '100.64.18.4',
    }    
    
    dhcp::host { 'saddle':
        mac     => '00:50:56:b4:a3:fb',
        ip      => '100.64.18.5',
    }

    dhcp::pool{ 'int.dundermifflin.com':
        network => '10.21.32.0',
        mask    => '255.255.255.0',
        range   => '10.21.32.3 10.21.32.1',
        gateway => '100.64.18.1',
    }

    dhcp::host { 'roller':
        mac     => '00:50:56:b4:91:85',
        ip      => '10.21.32.2',
    }
}

node 'machineb' {
    include cron_puppet
    include dm_employees

    network_config { 'ens192':
        ensure  => 'present',
        family  => 'inet',
        method  => 'dhcp',
        onboot  => 'true',
        hotplug => 'true',
        netmask => '255.255.255.0',
    }

    class { 'pam':
        allowed_users => [
            'wheel', 
            'root',
            'web',
            'mscott',
        ],
        pam_password_lines => [
            'password    requisite      pam_pwquality.so try_first_pass local_users_only retry=3 minlen=10 dcredit=-2 ucredit=-2 minclass=4 authtok_type=',
        ],
    }

    sudo::conf { 'web-httpd':
        priority => 60,
    	content => '%web ALL=(ALL) /usr/bin/systemctl restart httpd.service'
    }
}

node 'machinec' {
    include cron_puppet
    include dm_employees
    include alt_umask

    network_config { 'ens192':
        ensure  => 'present',
        family  => 'inet',
        method  => 'dhcp',
        onboot  => 'true',
        hotplug => 'true',
        netmask => '255.255.255.0',
    }


    class { 'pam':
        allowed_users => [
            'wheel', 
            'root',
            'mpalmer',
            'mscott',
        ],
        pam_password_lines => [
            'password    requisite      pam_pwquality.so try_first_pass local_users_only retry=3 minlen=10 dcredit=-2 ucredit=-2 minclass=4 authtok_type=',
        ],
    }

    sudo::conf { 'mpalmer-vsftpd':
        priority => 60,
    	content => 'mpalmer ALL=(ALL) /usr/bin/systemctl restart vsftpd.service'
    }
}

node 'machined' {
    include cron_puppet
    include dm_employees
    include alt_umask

    network_config { 'ens192':
        ensure  => 'present',
        family  => 'inet',
        method  => 'dhcp',
        onboot  => 'true',
        hotplug => 'true',
        netmask => '255.255.255.0',
    }

    class { 'pam':
        allowed_users => [
            'wheel', 
            'root',
            'mscott',
        ],
        pam_password_lines => [
            'password    requisite      pam_pwquality.so try_first_pass local_users_only retry=3 minlen=10 dcredit=-2 ucredit=-2 minclass=4 authtok_type=',
        ],
    }
}

node machinee {
    include cron_puppet
    include dm_employees
    include alt_umask

    network_config { 'ens192':
        ensure  => 'present',
        family  => 'inet',
        method  => 'dhcp',
        onboot  => 'true',
        hotplug => 'true',
        netmask => '255.255.255.0',
    }

    class { 'pam':
        pam_password_lines => [
            'password    requisite      pam_pwquality.so try_first_pass local_users_only retry=3 minlen=10 dcredit=-2 ucredit=-2 minclass=4 authtok_type=',
        ],
    }
}

node machinef {
    include cron_puppet
    include dm_employees

    network_config { 'ens192':
        ensure  => 'present',
        family  => 'inet',
        method  => 'dhcp',
        onboot  => 'true',
        hotplug => 'true',
        netmask => '255.255.255.0',
    }

    class { 'pam':
        allowed_users => [
            'wheel', 
            'root',
            'web',
            'mscott',
        ],
        pam_password_lines => [
            'password    requisite      pam_pwquality.so try_first_pass local_users_only retry=3 minlen=10 dcredit=-2 ucredit=-2 minclass=4 authtok_type=',
        ],
    }

    cron { 'sync-web':
        ensure  => present,
        command => "cd /etc/puppetlabs; echo 'WOW'",
        user    => root,
        minute  => '*/30',
    }

    sudo::conf { 'web-httpd':
        priority => 60,
    	content => '%web ALL=(ALL) /usr/bin/systemctl restart httpd.service'
    }
}
