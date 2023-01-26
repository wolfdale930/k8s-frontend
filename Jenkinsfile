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
                sh "whereis kubectl"
                sh "kubectl config view"
                sh "kubectl get pods -A"
            }
        }
    }
}
