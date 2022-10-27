#install tomcat packages
class tomcat::install {

  package {['tomcat9']:
  ensure => installed,

  }
}



#start tomcat on ubuntu server
