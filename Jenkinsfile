pipeline { 
    agent any
    stages {
        stage('Build') { 
            steps {
                sh "echo 'building..'"
                withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login --username="${USERNAME}" --password="${PASSWORD}"'
                    sh "docker build -t areeb2512/k8-frontend -f  ."
                    sh '${BUILD_NUMBER}'
                }
            }
        }
        stage('Push Image') { 
            steps {
                sh "echo 'pushing image..'"
                withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login --username="${USERNAME}" --password="${PASSWORD}"'
                    sh "docker push areeb2512/k8-frontend" 
                }
            }
        }
    }
}
