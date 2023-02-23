pipeline { 
    agent any
    stages {
        stage('Build') { 
            steps {
                sh "echo 'building..'"
                withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login --username="${USERNAME}" --password="${PASSWORD}"'
                    sh 'docker build -t areeb2512/k8-frontend:latest .'
                }
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
                sh "helm upgrade --set image.tag=latest k8-frontend ./helm-chart"
            }
        }
    }
}
