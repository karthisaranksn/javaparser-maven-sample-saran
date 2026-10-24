pipeline{
    agent any
    stages{
        stage('clean workspace and checkout') {
            steps{
                cleanWs()
                checkout scm
            }
        }
        stage('create directory') {
            steps{
                sh 'mkdir -p new_folder1'
                sh 'chmod 744 file1.sh'
                sh './file1.sh'
                sh 'ls -la'

            }
        }
        
    }
}