node default {
    include cron_puppet
    include dm_employees

    class { 'sudo': }
    sudo::conf { 'mscott-restart':
        priority => 60,
    	content => 'mscott ALL=(ALL) /usr/sbin/shutdown +120'
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
	    ]
    }
    class { 'sudo': }
    sudo::conf { 'mpalmer-vsftpd':
        priority => 60,
    	content => 'mpalmer ALL=(ALL) /usr/bin/systemctl restart vsftpd.service'
    } 
    sudo::conf { 'mscott-restart':
        priority => 60,
    	content => 'mscott ALL=(ALL) /usr/sbin/shutdown +120'
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
	    ]
    }
    
    class { 'sudo': }
    sudo::conf { 'web-httpd':
        priority => 60,
    	content => '%web ALL=(ALL) /usr/bin/systemctl restart httpd.service'
    }
    sudo::conf { 'mscott-restart':
        priority => 60,
    	content => 'mscott ALL=(ALL) /usr/sbin/shutdown +120'
    }
}


node 'machinea', 'machined' {
    include cron_puppet
    include dm_employees

    class { 'pam':
	allowed_users => [
	    'wheel', 
        'root',
	    ]
    }

    class { 'sudo': }
    sudo::conf { 'mscott-restart':
        priority => 60,
    	content => 'mscott ALL=(ALL) /usr/sbin/shutdown +120'
    }
}

