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
         stage("docker login") {
            steps {
                echo " ============== docker login =================="
                withCredentials([usernamePassword(credentialsId: 'dockerhub_creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    docker login -u $USERNAME -p $PASSWORD
                    """
                }
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
