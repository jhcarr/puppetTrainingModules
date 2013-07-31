define apache::vhost (
  $docroot,  
  $port        = '80',
  $priority    = '10',
  $options     = 'Indexes Multiviews',
  $vhost_name  = $name,
  $server_name = $name,
  $logdir      = '/var/log/httpd',
  ) {
  file { "/etc/httpd/conf.d/${name}.conf":
    ensure  => present,
    owner   => 'apache',
    group   => 'apache',
    mode    => '0644',
    content => template('apache/vhost.conf.erb'),
  }
}
