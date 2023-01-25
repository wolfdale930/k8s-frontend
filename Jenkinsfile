podTemplate(label: 'mypod', serviceAccount: 'jenkins-ci', containers: [ 
    containerTemplate(
      name: 'docker', 
      image: 'docker', 
      command: 'cat', 
      resourceRequestCpu: '100m',
      resourceLimitCpu: '300m',
      resourceRequestMemory: '300Mi',
      resourceLimitMemory: '500Mi',
      ttyEnabled: true
    ),
    containerTemplate(
      name: 'kubectl', 
      image: 'bitnami/kubectl',
      resourceRequestCpu: '100m',
      resourceLimitCpu: '300m',
      resourceRequestMemory: '300Mi',
      resourceLimitMemory: '500Mi', 
      ttyEnabled: true, 
      command: 'cat'
    ),
    containerTemplate(
      name: 'helm', 
      image: 'alpine/helm:2.14.0', 
      resourceRequestCpu: '100m',
      resourceLimitCpu: '300m',
      resourceRequestMemory: '300Mi',
      resourceLimitMemory: '500Mi',
      ttyEnabled: true, 
      command: 'cat'
    )
  ],

  volumes: [
    hostPathVolume(mountPath: '/usr/local/bin/helm', hostPath: '/usr/local/bin/helm'),
    hostPathVolume(mountPath: '/.kube/config', hostPath: '/home/jenkins/config'),
    hostPathVolume(mountPath: '/home/jenkins/ca.crt', hostPath: '/home/jenkins/ca.crt'),
    hostPathVolume(mountPath: '/home/jenkins/client.crt', hostPath: '/home/jenkins/client.crt'),
    hostPathVolume(mountPath: '/home/jenkins/client.key', hostPath: '/home/jenkins/client.key')
  ]
  ) {
    node('mypod') {

        def REPOSITORY_URI = "areeb/frontend"

        stage('Check running containers') {
            container('kubectl') { 
                sh 'kubectl get pods --all-namespaces'  
            }
            container('helm') { 
                sh 'helm'
            }
        }  

        stage('Build Image'){
            container('docker'){

              withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh 'docker login --username="${USERNAME}" --password="${PASSWORD}"'
                sh "docker build -t ${REPOSITORY_URI}:${BUILD_NUMBER} ."
                sh 'docker image ls' 
              } 
                
            }
        } 

        stage('Testing') {
            container('docker') { 
              sh 'whoami'
              sh 'hostname -i' 
              sh "docker run ${REPOSITORY_URI}:${BUILD_NUMBER} npm run test "                 
            }
        }

        stage('Push Image'){
            container('docker'){
              withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh 'docker image ls'
                sh "docker push ${REPOSITORY_URI}:${BUILD_NUMBER}"
              }                 
            }
        }      
    }
}