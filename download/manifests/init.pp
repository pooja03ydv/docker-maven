  class artifactory {
   url      => 'http://artifactory.domain.com:8081',
   username => 'user',
   password => 'password',
 }


  artifactory::artifact {'mavenartifacts':
    gav   => 'org.sonarqube',
    ensure => 'present',
    repository => 'example-local',
    output     => '/tmp/app.jar',
  }

