# Class: cron_puppet
# ===========================

class dns_puppet {
    file { 'named.conf':
        ensure  => file,
        path    => '/etc/named.conf',
        source  => '/etc/puppetlabs/code/modules/dns_puppet/files/named.conf',
        mode    => "0644",
        owner   => root,
        group   => root,
    }
    file { 'dundermifflin.com':
        ensure  => file,
        path    => '/etc/dundermifflin.com',
        source  => '/etc/puppetlabs/code/modules/dns_puppet/files/dundermifflin.com',
        mode    => "0644",
        owner   => root,
        group   => root,
    }
}
