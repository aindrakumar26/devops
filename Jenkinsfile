pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('aindrakumar/static-website:latest')
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image('aindrakumar/static-website:latest').push('latest')
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withCredentials([file(credentialsId: 'kubeconfig-id', variable: 'KUBECONFIG_FILE')]) {
                        sh """
                        export KUBECONFIG=$KUBECONFIG_FILE
                        sudo kubectl apply -f deployment.yaml
                        """
                    }
                }
            }
        }
    }
}
