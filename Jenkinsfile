pipeline {
    agent any

    stages {

        stage('Checkout GitHub Code') {
            steps {
                echo 'Jenkins checked out the GitHub code'
            }
        }

        stage('Run JMeter Test') {
            steps {
                bat '''
                "C:\\Users\\Kiaq_Lap_25\\Downloads\\apache\\bin\\jmeter.bat" -n -t "Ftp Request.jmx" -l "ftp-results.jtl"
                '''
            }
        }

    }
}