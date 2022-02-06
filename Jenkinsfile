pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                cmd 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                cmd 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                echo 'Completed'
            }
        }
    }
}