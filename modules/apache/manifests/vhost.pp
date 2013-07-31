define apache::vhost (
  $docroot     = "/var/www/${name}",  
  $docgroup    = $apache::httpd_group,
  $docowner    = $apache::httpd_user,
  $confdir     = $apache::httpd_conf_dot_d,
  $priority    = '10',
  $options     = 'Indexes Multiviews',
  $vhost_name  = $name,
  $server_name = $name,
  ) {
  host { $servername:
    ip => $::ipaddress,
  }
  File {
    owner => $docowner,
    group => $docgroup,
    mode  => '0644',
  }
  file { "${confdir}/${priority}-${name}.conf":
    ensure  => file,
    notify  => Service[$apache::httpd_svc],
    content => template('apache/vhost.conf.erb'),
    require => Package[$apache::httpd_pkg],
  }
  file { $docroot:
    ensure => directory,
  }
  file { "${docroot}/index.html":
    ensure => file,
    content => template("apache/index.html.erb"),
  }
}
