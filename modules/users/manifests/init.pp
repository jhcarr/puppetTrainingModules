class users {
  user  { 'fundamentals':
    ensure => present,
    gid    => 'guest',
    shell  => '/bin/bash',
  }
  group { 'staff':
    ensure => present,
  }
  group { 'guest':
    ensure => present,
  }
}
