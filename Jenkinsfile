pipeline {
    environment {
        registry = "nandani/nbn-docker-registery"
        registryCredential = 'dockerhub'
        dockerImage = ''
      }
    agent any
    tools {
            jdk 'jdk8'
        }
    stages {
      stage('build') {
        steps {
          echo "Building jar!"
          sh './gradlew clean build'
        }
      }
      stage('unittest') {
        steps {
          echo "Running unit tests!"
          sh "./gradlew test"
        }
      }
      stage('integrationtest') {
        steps {
          echo "Running integration tests!"
          sh "./gradlew integrationTest"
        }
      }
      stage('Building image') {
            steps{
              script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
          }
      stage('Pushing Image') {
            steps{
              script {
                docker.withRegistry( '', registryCredential ) {
                  dockerImage.push()
                }
              }
            }
           }
       stage('Image to DockerHub') {
           steps{
             script {
               dockerImage = docker.build registry + ":$BUILD_NUMBER"
             }
           }
         }
    }
    post {
        failure {
            echo "pipeline failed"
        }
    }
}