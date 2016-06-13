class issue::os {

  file { '/etc/issue.net':
    ensure  => present,
    content => template('issue/etc/issue.net.erb'),
    mode    => '0644',
    
  }

}