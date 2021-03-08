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
                withCredentials([usernamePassword(credentialsId: 'new_key', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    sh 'mvn clean package'
                    sh 'echo $USERNAME $DOCKERHUB_USERNAME $PS1 $PWD'
                    sh 'echo $PASSWORD'
                    echo USERNAME
                    echo "username is $PASSWORD"
                }
            }
        }
    }
}
