pipeline {
    agent {
        docker {
            image 'maven:3-openjdk-8'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Test App') {
            steps {
                sh 'mvn clean test'
            }
        }
        stage('Build App') {
            steps{
                sh 'mvn clean package'
                sh 'docker version'
            }
        }
    }
    agent {
        docker {
            image 'python'
        }
    }
    stages {
        stage('Test App') {
            steps {
                sh 'pwd && ls'
            }
        }
    }
}
