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
                sh "echo $KUBECONFIG"
                sh "kubectl cluster-info"
            }
        }
    }
}
