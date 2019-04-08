# Class: cron_puppet
# ===========================

class cron_puppet {
    file { 'named.conf':
        ensure  => file,
        path    => '/etc/named.conf',
        source  => '/etc/puppetlabs/code/modules/dns_puppet/files/named.conf',
        mode    => "0644",
        owner   => root,
        group   => root,
    }
}
