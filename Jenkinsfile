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
      stage('Cloning Git') {
            steps {
              git 'https://github.com/nandani-aggarwal/NBNProject.git'
          }
       }
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
       stage('Image') {
           steps{
             script {
               dockerImage = docker.build registry + ":$BUILD_NUMBER"
             }
           }
         }
    }
    post {
        failure {
            git checkout ${env.GIT_PREVIOUS_SUCCESSFUL_COMMIT}
        }
    }
}