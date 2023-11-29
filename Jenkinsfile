pipeline {
  agent any
        environment {
              SCANNER_HOME=tool 'sonar-scanner'
        }

     stages {
         stage('Cleanup Workspace') {
             steps {
                cleanWs ()
             }
         }
         stage('Git Checkout') {
             steps {
                git changelog: false, poll: false, url: 'https://github.com/blessingmbatha/django-oscar-paypal.git'
             }
         }
         stage('Install  Dependencies') {
             steps {
                sh "pip install -r requirements.txt"
             }
         }
         stage('Run Tests') {
             steps {
                sh 'python3 -m unittest discover'
             }
         }
         stage('Build') {
             steps {
                sh 'python3 setup.py build'
             }
         }
    }
}
