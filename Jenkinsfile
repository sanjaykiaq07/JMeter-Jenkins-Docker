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

        stage('Run JMeter Test') {
            steps {
                bat '''
                if not exist results mkdir results

                "C:\\Users\\Kiaq_Lap_25\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run --rm ^
                -v "%WORKSPACE%\\results:/results" ^
                jmeter-ftp-test ^
                -n -t /test/FtpRequest.jmx ^
                -l /results/ftp-results.jtl
                '''
            }
        }

        stage('Generate HTML Report') {
            steps {
                bat '''
                if exist html-report rmdir /s /q html-report

                "C:\\Users\\Kiaq_Lap_25\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run --rm ^
                -v "%WORKSPACE%\\results:/results" ^
                -v "%WORKSPACE%\\html-report:/html-report" ^
                jmeter-ftp-test ^
                -g /results/ftp-results.jtl ^
                -o /html-report
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/*.jtl, html-report/**', allowEmptyArchive: true
        }
    }
}