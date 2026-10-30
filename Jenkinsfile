pipeline{
    agent any
    parameters{
        string(name:'BRANCH_NAME',defaultValue: 'master')
        choice(name:'BUILD_ENV',choices: ['super','staging','start'])
    }
    options{
        timeout(time:30,unit:'MINUTES')
        timestamps()
    }
    stages{
        stage('git checkout'){
            steps{
                git branch: "${params.BRANCH_NAME}", url: 'URL:https://github.com/karthisaranksn/javaparser-maven-sample-saran.git'
            }
        }
        stage('precheck') {
            steps{
                echo "the pipeline is cuttently targetting: ${params.BUILD_ENV}"
            }
        }
        stage('Build Maven') {
            steps{
                sh 'mvn --version'
                sh 'mvn clean package'
            }
        }
    }
    post{
        success{
            archiveArtifacts artifacts:'target/*.jar',fingerprint:true
        }
        failure{
        cleanWs()
        }
    }

}