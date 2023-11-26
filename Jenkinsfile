pipeline {
  agent any

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
    }
}
