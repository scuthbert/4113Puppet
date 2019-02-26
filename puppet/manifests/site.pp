node default {
    include cron_puppet
    include dm_employees
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
	    ]
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
	    ]
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
	    ]
    }
}

