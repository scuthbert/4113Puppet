class dm_firewall:dns {
  file { 'dns':
      ensure  => file,
      path    => '/tmp/ipdns.sh',
      content => file('dm_firewall/ipdns.sh'),
      owner   => root,
      group   => root,
      mode    => '0755',
      notify => Exec['run_dns'],
  }
  exec { 'run_dns':
    command => "/bin/bash -c '/tmp/ipdns.sh'",
  }
}
