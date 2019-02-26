# Class: dm_employees
# ===========================
# Defines all the users associanted with DM.
 
# Our useradd macro, thanks to 
define useradd ( $comment, $uid, $password, $groups ) {

  $username = $title

  user { "$username":
    ensure     => "present",
    comment    => "$comment",
    home       => "/home/$username",
    shell      => "/bin/bash",
    uid        => $uid,
    gid        => $uid,
    managehome => "true",
    password   => "$password",
    groups     => $groups,
    membership => 'inclusive',
  }

  group {"$username":
    gid => $uid
  }
}

# Main class.
class dm_employees {
  
  class { 'sudo': }
  sudo::conf { 'mscott-restart':
      priority => 60,
    content => 'mscott ALL=(ALL) /usr/sbin/shutdown +120'
  }
  sudo::conf { 'mscott-cancel':
      priority => 60,
    content => 'mscott ALL=(ALL) /usr/sbin/shutdown -c'
  }
  group {"web":
    gid => 1105
  }

	include sales
	include accounting
	include managers

	useradd { "tflenderson":
  	comment    => "Toby Flenderson",
    uid        => "1011",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [],
  }

	useradd { "cbratton":
  	comment    => "Creed Bratton",
    uid        => "1012",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [],
  }

	useradd { "dphilbin":
  	comment    => "Darryl Philbin",
    uid        => "1013",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [],
  }

	useradd { "mpalmer":
  	comment    => "Meredith Palmer",
    uid        => "1014",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [],
  }

	useradd { "kkapoor":
  	comment    => "Kelly Kapoor",
    uid        => "1015",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [web],
  }
	
	useradd { "pbeesly":
  	comment    => "Pam Beesly",
    uid        => "1016",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [web],
  }

	useradd { "scuthbertson":
  	comment    => "Sam Cuthbertson",
    uid        => "1017",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [wheel],
  }
}

# Sales employees
class sales {
	group { "sales":
		gid => 1102
	}
	
	useradd { "abernard":
  	comment    => "Andy Bernard",
    uid        => "1002",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [sales, web],
  }

	useradd { "shudson":
  	comment    => "Stanley Hudson",
    uid        => "1003",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [sales],
  }

	useradd { "plapin":
    comment    => "Phyllis Lapin",
    uid        => "1004",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [sales],
  }
}

# Accountants
class accounting {
	group { "accounting":
		gid => 1103
	}
	
	useradd { "amartin":
  	comment    => "Angela Martin",
    uid        => "1005",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [accounting],
  }

	useradd { "kmalone":
  	comment    => "Kevin Malone",
    uid        => "1006",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [accounting],
  }

	useradd { "omartinez":
    comment    => "Oscar Martinez",
    uid        => "1007",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [accounting],
  }
}

# Managers
class managers {
	group { "managers":
		gid => 1104
	}
	
	useradd { "dshrute":
  	comment    => "Dwight Schrute",
    uid        => "1008",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [managers, wheel],
  }

	useradd { "jhalpert":
  	comment    => "Jim Halpert",
    uid        => "1009",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [managers],
  }

	useradd { "mscott":
    comment    => "Michael Scott",
    uid        => "1010",
    password   => '$6$EWPMW6IuuHO598rs$r0R2206NAyEPgpwIxBkBikJ1vzUrABVwUst385mKLJDaYfbpQpkMMTX8r7S7AJ3N9bRAwB8f8zpO8.nfwANaH.',
    groups     => [managers],
  }
}
