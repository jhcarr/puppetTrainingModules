class apache {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }
    
  package { 'httpd':
    ensure => present,
  }

  service { 'httpd':
    ensure  => 'running',
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    require => Package['httpd'],
    notify  => Service['httpd'],
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
