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
                sh 'echo $MYSQL_USER $DOCKERHUB_USERNAME $PS1 $PWD'
                sh 'echo $MYSQL_USER'
                echo MYSQL_USER
                echo "username is $DOCKERHUB_USERNAME"

            }
        }
    }
}
