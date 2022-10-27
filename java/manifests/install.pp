#install tomcat packages
class tomcat::install {

  package {['tomcat','tomcat-webapps']:
  ensure => installed,

  }
}



#start tomcat on ubuntu server
class tomcat::service {

service {"tomcat":
  ensure => running,

  }
}
