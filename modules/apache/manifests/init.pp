class apache {

  package { 'httpd':
    ensure => present,
  }

  service { 'httpd':
    ensure => 'running',
    require => Package['httpd'],
  }
  
  file { '/var/www/':
    ensure => 'directory',
  }

  file { '/var/www/html':
    ensure => 'directory',
  }

  file { '/var/www/html/index.html':
    ensure => 'file',
    source => 'puppet:///modules/apache/index.html',
  }
}
