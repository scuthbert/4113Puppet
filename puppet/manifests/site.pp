node default {
    include cron_puppet
    include dm_employees

    class { 'pam':
    pam_password_lines => [
        'password    requisite      pam_pwquality.so try_first_pass local_users_only retry=3 minlen=10 dcredit=-2 ucredit=-2 minclass=4 authtok_type=',
        ],
    }
}

node 'machinec' {
    include cron_puppet
    include dm_employees

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

node 'machineb' {
    include cron_puppet
    include dm_employees

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


node 'machinea', 'machined' {
    include cron_puppet
    include dm_employees

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

    file_line { 'profile_umask':
        ensure => present,
        path   => '/etc/profile',
        line   => 'umask 007',
        match  => '\s*umask\s002$',
    }

    file_line { 'bash_umask':
        ensure => present,
        path   => '/etc/bashrc',
        line   => 'umask 007',
        match  => '\s*umask\s002$',
    }

}

