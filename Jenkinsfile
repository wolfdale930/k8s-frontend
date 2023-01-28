pipeline { 
    agent any
    stages {
        def REPOSITORY_URI = "areeb2512/k8-frontend"
        stage('Build') { 
            steps {
                sh "echo 'building..'"
                withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login --username="${USERNAME}" --password="${PASSWORD}"'
                    sh "docker build -t ${REPOSITORY_URI} ."
                    sh 'docker image ls' 
                }
            }
        }
        stage('Push Image') { 
            steps {
                sh "echo 'pushing image..'"
                withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login --username="${USERNAME}" --password="${PASSWORD}"'
                    sh "docker push ${REPOSITORY_URI} ." 
                }
            }
        }
    }
}
