pipeline {
    agent any
     environment {
     M2_HOME = '/usr/share/maven'                  // for maven build
     PATH = "${env.M2_HOME}/bin:${env.PATH}"       // for maven build
    }
    stages {
       /* stage('Checkout') {                   //when using pipeline script inside jenkins
            steps {
                deleteDir()
                git branch: 'master',
                //    credentialsId: 'github-creds',
                    url: 'https://github.com/r-maven-.git'
            }
        }*/

        stage('Checkout & clean workspace') {          //when pipeline is from scm
            steps {
                cleanWs()
                checkout scm
            }
        }
        stage('Build') {
         steps {
            echo 'Hi...changes detected now building'
            sh 'mvn --version'
           // sh 'mvn clean package'
              
            }
        }
    }
}