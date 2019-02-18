# Class: cron_puppet
# ===========================

class cron_puppet {
    file { 'post-hook':
        ensure  => file,
        path    => '/etc/puppetlabs/.git/hooks/post-merge',
        source  => 'puppet:///modules/cron_puppet/post-merge',
        mode    => "0755",
        owner   => root,
        group   => root,
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => "cd /etc/puppetlabs; git pull",
        user    => root,
        minute  => '*/30',
        require => File['post-hook'],
    }
}
