class conditionals::out {

  $osString = $::operatingsystem ? {
    'Ubuntu' => 'Hooray Ubuntu!',
    'CentOS' => 'Hooray CentOS!',
    default  => 'Mmm... what?',
  }

  file { '/tmp/os':
    content => "$osString"
  }
  
}
