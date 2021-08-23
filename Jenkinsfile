pipeline{
    
    environment { 

        registry = "poyadav3/Firstapp"
        registryCredential = 'dockerhub_id' 

        dockerImage = '' 

    }
    agent any

     stages{
          stage("SCM"){
            steps{
                git url: 'git@github.com:pooja03ydv/docker-maven.git'
            }
        }
          stage("code analysis"){
            steps{
                withSonarQubeEnv('sonarqube') {       
                sh "mvn clean test  sonar:sonar -Dsonar.login=db45237f2a48d6fa1470c172c59e6e4f0618b450"    
            
                }    
            }
            
        }
        
 
        
          stage("Quality Gate") {
            steps {
              timeout(time: 5, unit: 'MINUTES') {
              waitForQualityGate abortPipeline: true
              }
            }
        } 



       
        stage("Build-package"){
            steps{
                sh "mvn clean install"    
            }
            
            
        }
    
        stage('Building docker image') { 

             steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }

            } 

        }

        stage('push docker image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 
        
           
         stage('Publish Test Coverage Report') {
            steps {
              step([$class: 'JacocoPublisher', 
                execPattern: '**/**.exec',
                classPattern: '**/classes',
                sourcePattern: '**/src/main/java',
                sourceInclusionPattern:  '*/*.java',
                
           ])
          }
      }

     
       stage('container'){
           steps {
               sh "docker run poyadav3/Firstapp:$BUILD_NUMBER"
           }

       }
    }   
    
}
