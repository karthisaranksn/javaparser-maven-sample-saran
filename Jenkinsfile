pipeline{
    agent{label 'worker-node'}
    stages{
        stage('git checkout') {
            steps{
                cleanWs()
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps{ 
                sh 'docker --version'
                sh 'docker build -t new-image:${BUILD_NUMBER}'
            }
        }
        stage('verify Docker Image') {
            steps{
                sh 'docker images'
            }
        }
        stage('container creation') {
            steps{
                sh 'docker run -d --name new-container new-image:${BUILD_NUMBER}'
                sh 'docker ps'
                }
        }
    }
}