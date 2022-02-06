pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                cmd_exec 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                cmd_exec 'mvn test'
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