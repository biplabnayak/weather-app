pipeline {
    environment {
            registry = "biplabnayak/weather-app"
            registryCredential = 'dockerhub'
            dockerImage = ''
    }
    agent any
    tools {
       maven 'Maven3.6'
    }
    stages {
        stage('Code Build') {
            steps {
                bat 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Building image') {
                    steps {
                        script {
                            dockerImage = docker.build registry + ":$BUILD_NUMBER"
                        }
                    }
        }
        stage('Push Docker Image') {
                    steps {
                        script {
                            docker.withRegistry( '', registryCredential ) {
                                dockerImage.push()
                            }
                        }
                    }
                }
        stage('Cleaning up Docker Cache') {
                    steps {
                        bat "docker rmi $registry:$BUILD_NUMBER"
                    }
                }
        stage('Deliver') {
            steps {
                echo 'Completed'
            }
        }
    }
}