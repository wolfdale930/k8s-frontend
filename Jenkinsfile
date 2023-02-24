pipeline { 
    agent any
    stages {
        stage('Build') { 
            steps {
                sh "echo 'building..'"
                sh 'docker build -t areeb2512/k8-frontend:latest .'
            }
        }
        stage('Test') { 
            steps {
                sh "echo 'testing..'"
                sh "docker run areeb2512/k8-frontend:latest npm run test "
            }
        }
        stage('Push Image') { 
            steps {
                sh "echo 'pushing image..'"
                withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login --username="${USERNAME}" --password="${PASSWORD}"'
                    sh 'docker push areeb2512/k8-frontend:latest' 
                }
            }
        }
        stage('Deploy') { 
            steps {
                sh "echo 'deploying..'"
                sh "helm install --set image.tag=latest k8-frontend ./helm-chart"
            }
        }
    }
}
