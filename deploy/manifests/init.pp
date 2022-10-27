class deploy {
 file { '/opt/artifactory-script/app.jar':
    ensure   => file,
    owner    => 'root',
    mode     => '0755',
    source   => 'puppet:///modules/deploy/app.jar',
 #   require  => File ['/opt/artifactory-script']
  }

  file { '/opt/artifactory-script':
    ensure => directory
  }
}

  
