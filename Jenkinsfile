pipeline { 
    agent any 
    stages {
        stage('Build') { 
            steps { 
                sh "echo 'building..'"
            }
        }
        stage('Testing Kubectl') { 
            steps { 
                sh "kubectl get pods -A"
            }
        }
        stage('Testing Docker') { 
            steps {
                sh "echo \$HOME"
                sh "docker ps"
            }
        }
    }
}
