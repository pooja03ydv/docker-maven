node default {
  class { artifactory :
    endpoint => 'https://techdevops.jfrog.io/artifactory',
    username => 'poojayadav',
    password => 'P@ssword123',
    #api_key  => 'xxxxxxxxxxxxxxx',
  }

  artifactory::artifact {'https://techdevops.jfrog.io/artifactory/maven-basic/org/sonarqube/sonarscanner-maven-basic/1.0-SNAPSHOT/sonarscanner-maven-basic-1.0-20221027.091912-1.jar':
    group_id   => 'org.sonarqube',
    artifact_id => 'sonarscanner-maven-basic',
    version    => '1.0-20221027.091912-1',
    repository => 'maven-basic',
    output     => '/opt/',
    extension  => 'jar',
    ensure     => present,
  
  }
}
