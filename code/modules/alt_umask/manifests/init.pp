# Class: dm_employees
# ===========================
# Defines an alternate umask for use by DM.

# Main class.
class alt_umask {
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
