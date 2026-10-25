pipeline{
    agent any
    triggers {
        githubPush()
    }
    stages{
        stage('clean workspace & checkout code') {
            steps{
                cleanWs()
                checkout scm
            }
        }
        stage('pre check') {
            when{
                changeset "src/main/**"
            }
            steps{
                script{
                    env.BUILDME='yes'
                    echo "changes detected in src/main"
                }
            }
        }
        stage('Build Java Project') {
            when{environment name:'BUILDME', value:'yes'}
            steps{
                echo "changes detected now building the project"
                sh 'mvn clean package'
            }
        }
    }
}