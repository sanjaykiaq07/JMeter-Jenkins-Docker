pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                bat '''
                "C:\\Users\\Kiaq_Lap_25\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t jmeter-restful-test .
                '''
            }
        }

        stage('Run JMeter Test') {
            steps {
                bat '''
                if not exist results mkdir results

                "C:\\Users\\Kiaq_Lap_25\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run --rm ^
                -v "%WORKSPACE%\\results:/results" ^
                jmeter-restful-test ^
                -n -t /test/RestfulBooker_3Step.jmx ^
                -l /results/restful-results.jtl
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
                jmeter-restful-test ^
                -g /results/restful-results.jtl ^
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