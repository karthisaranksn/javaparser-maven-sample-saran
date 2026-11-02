pipeline{
    agent{ label 'worker-node'}
    stages{
        stage('git checkout') {
            steps{
                git branch: 'doc', url:'https://github.com/karthisaranksn/javaparser-maven-sample-saran.git'
            }
        }
        stage('Build Docker Image') {
            steps{
                sh 'docker build -t new-image:${BUILD_NUMBER} .'
            }
        }
        stage('verify Docker Image') {
            steps{
                sh 'docker images'
            }
        }
    }
}