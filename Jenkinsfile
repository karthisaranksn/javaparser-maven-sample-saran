pipeline{
    agent any
    environment{
        M2_HOME='/usr/share/maven'
        PATH="${env.M2_HOME}/bin:${env.PATH}"
        REPO_NAME='generic-local'
    }
    parameters{
        booleanParam(name:'UNITTEST', defaultValue: true)
        booleanParam(name:'CODEANALYSIS', defaultValue: true)
    }
    triggers{
        githubPush()
    }
    stages{
        stage('clean workspace & checkout') {
            steps{
                cleanWs()
                checkout scm
            }
        }
        stage('pre check') {
            steps{
                script{
                    env.BUILDME='yes'
                    echo "changes detected in src"
                }
            }
        }
        stage('Build Artifacts') {
            steps{
                script{
                    def unitstr= ""
                    if(params.UNITTEST){
                        unitstr= ""
                    }else{
                        unitstr= "-Dmaven.test.skip=true"
                    }
                    echo "build artifacts"
                    sh "mvn clean package ${unitstr}"
                }
            }
        }
    }
}