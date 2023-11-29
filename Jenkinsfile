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
         stage("Sonarqube Analysis "){
             steps{
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Ecommerce-Python \
                    -Dsonar.projectKey=Ecommerce-Python '''
                }
            }
         }
         stage("quality gate"){
             steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token' 
                }
             } 
          }
          stage("OWASP Dependency Check"){
              steps {
                dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DC'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
              }
          }
    }
}
