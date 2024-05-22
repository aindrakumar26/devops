pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerfilePath = '/home/ubuntu/devops'

                    docker.build('aindrakumar/static-website:latest', "-f ${dockerfilePath}/Dockerfile .")
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
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
