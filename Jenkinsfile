pipeline {
  agent any

  environment {
        registry = "sawani/demodocker"
        registryCredential = "dockerhub"
  }
  tools {
    maven 'M3'
  }
  stages {
    stage('checkout') {
      steps {
        git 'https://github.com/sawani02/devopsProject.git'
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean compile'
      }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
        junit '**/target/surefire-reports/TEST-*.xml'
      }
    }
    stage('Package') {
      steps {
        sh 'mvn package'
      }
    }
  
    stage('Docker build '){
        steps{
        script{
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
    }
    }

    stage('Deploy Image') {
        steps{
            script {
                docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
              }
            }
          }
    }

    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
}
}
