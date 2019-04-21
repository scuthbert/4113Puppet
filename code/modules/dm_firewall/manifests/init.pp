# Class: dm_firewall
# ===========================
# Defines all the iptables rules associanted with DM.

# Main class.
class dm_firewall {
  file { 'common':
      ensure  => file,
      path    => '/tmp/ipcommon.sh',
      content => file('dm_firewall/ipcommon.sh'),
      owner   => root,
      group   => root,
      mode    => '0755',
      notify => Exec['run_common'],
  }
  exec { 'run_common':
    command => "/bin/bash -c '/tmp/ipdns.sh'",
  }
