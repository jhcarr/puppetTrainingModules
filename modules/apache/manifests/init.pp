class apache {

  case $::osfamily {
    'RedHat': {
      $httpd_user  = 'apache'
      $httpd_group = 'apache'
      $httpd_pkg   = 'httpd'
      $httpd_svc   = 'httpd'
      $httpd_conf  = '/etc/httpd/conf/httpd.conf'
    }
    'Debian': {
      $httpd_user  = 'www-data'
      $httpd_group = 'www-data'
      $httpd_pkg   = 'apache2'
      $httpd_svc   = 'apache2'
      $httpd_conf  = '/etc/apache2/httpd.conf'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }

  
  File {
    owner => $httpd_user,
    group => $httpd_group,
    mode  => '0644',
  }
  
  package { $httpd_pkg:
    ensure => present,
  }

  service { $httpd_svc:
    ensure  => 'running',
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    require => Package[$httpd_pkg],
    notify  => Service[$httpd_svc],
  }
  
  file { [ '/var/www/', '/var/www/html' ]:
    ensure => 'directory',
  }

  file { '/var/www/html/index.html':
    ensure  => 'file',
    content => template('apache/index.html.erb')
  }
}
