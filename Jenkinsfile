pipeline{
    agent any
    environment{
        M2_HOME='/usr/share/maven'
        PATH="${M2_HOME}/bin:${PATH}"
        REPO_NAME='generic-local'
    }
    parameters{
        booleanparam(name:'UNITTEST', defaultValue: 'true')
        booleanparam(name:'CODEANALYSIS', defaultValue: 'true')
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
                    if(params.UNITTEST){
                        unittr= ""
                    }else{
                        unittr= "-Dmaven.test.skip=true"
                    }
                    echo "build artifacts"
                    sh "mvn clean package ${unittr}"
                }
            }
        }
    }
}