node default {
    include cron_puppet
    include dm_employees

    class { 'sudo': }
    sudo::conf { 'mscott-restart':
        priority => 60,
    	content => 'mscott ALL=/usr/bin/systemctl restart httpd.service'
    }
}

node 'machineac' {
    class { 'pam':
	allowed_users => [
	    'wheel', 
        'root',
        'mpalmer',
	    ]
    }
    class { 'sudo': }
    sudo::conf { 'mpalmer-vsftpd':
        priority => 60,
    	content => 'mpalmer ALL=/usr/bin/systemctl restart vsftpd.service'
    }
}

node 'machineb' {
    class { 'pam':
	allowed_users => [
	    'wheel', 
        'root',
        'web',
	    ]
    }
    class { 'sudo': }
    sudo::conf { 'web-httpd':
        priority => 60,
    	content => 'web ALL=/usr/bin/systemctl restart httpd.service'
    }
}


node 'machinea', 'machined' {
    class { 'pam':
	allowed_users => [
	    'wheel', 
        'root',
	    ]
    }
}
