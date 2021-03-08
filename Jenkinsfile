pipeline {
    agent {
        docker {
            image 'maven:3-openjdk-8'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
                sh 'pwd'
                sh 'ls'
            }
        }
        stage('Two_build') {
            steps{
                sh 'pwd'
                sh 'ls'
            }
        }
    }
}