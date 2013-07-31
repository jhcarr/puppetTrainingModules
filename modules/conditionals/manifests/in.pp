class conditionals::in{

  file { '/tmp/os':
    content => $::operatingsystem ? {
      'Ubuntu' => 'This is an Ubuntu box.',
      'CentOS' => 'This is a CentOS box.',
      'Windows' => 'This is a Windows box.',
      default => ':-(',
    },
  }
  
}
