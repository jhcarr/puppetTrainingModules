class users {
  user  { 'fundamentals':
    ensure => present,
    gid    => 'staff',
    shell  => '/bin/bash',
  }
  group { 'staff':
    ensure => present,
  }
}
