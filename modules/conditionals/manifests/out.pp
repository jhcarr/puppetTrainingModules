class conditionals::out {

  $osString = $::operatingsystem ? {
    'Ubuntu' => "Hooray Ubuntu! \n",
    'CentOS' => "Hooray CentOS! \n",
    default  => "Mmm... what?   \n",
  }

  file { '/tmp/os':
    ensure => file,
    content => "$osString"
  }
  
}
