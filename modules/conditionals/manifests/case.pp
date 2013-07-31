class conditionals::case {

  case $::operatingsystem {
    'Debian': {$printme = "This is a Debian box. Yay! \n" }
    'CentOS': {$printme = "This is a CentOS box. Yay! \n" }
    default: {$printme ="I HAVE NO IDEA! \n" }
  }
  
  file { '/tmp/os':
    ensure  => file,
    content => $printme
  }
  
}
