pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                bat '''
                "C:\\Users\\Kiaq_Lap_25\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t jmeter-ftp-test .
                '''
            }
        }

        stage('Run JMeter in Docker') {
            steps {
                bat '''
                "C:\\Users\\Kiaq_Lap_25\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run --rm jmeter-ftp-test
                '''
            }
        }

    }
}