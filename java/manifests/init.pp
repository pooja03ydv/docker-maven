class tomcat {
  include tomacat::install
  include tomcat::service
  class deploywar {
  require configuretomcat

  tomcat::war { 'mrp.war':
    catalina_base => '/var/lib/tomcat7',
    war_source => 'https://raw.githubusercontent.com/Microsoft/PartsUnlimitedMRP/master/builds/mrp.war',
  }
} 
}
