pipeline{
    agent {label 'worker-node'}
    stages{
        stage('clean workspace and checkout') {
            steps{
                cleanWs()
                checkout scm
            }
        }
        stage('build java project') {
            steps{
            withEnv(["M2_HOME=usr/share/maven", "PATH=${env.M2_HOME}/bin:${env.PATH}"]) {
                   sh 'mvn --version'
                   sh 'ls -la'
                   sh 'mvn clean package'
                }
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