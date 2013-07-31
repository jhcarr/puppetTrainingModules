class apache {

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
    #source  => 'puppet:///modules/apache/httpd.conf',
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
