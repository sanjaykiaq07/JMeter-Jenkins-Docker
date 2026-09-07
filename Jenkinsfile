pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t jmeter-ftp-test .'
            }
        }

        stage('Run JMeter in Docker') {
            steps {
                bat 'docker run --rm jmeter-ftp-test'
            }
        }

    }
}