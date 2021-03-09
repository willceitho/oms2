#!groovy
// Run docker build

properties([disableConcurrentBuilds()])

pipeline {
    agent {
        docker {
            image 'maven:3-openjdk-8'
            args '-v $HOME/.m2:/root/.m2'
        }
        options {
		    buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
		    timestamps()
    }
    stages {
        stage('Test App') {
            steps {
                echo " ============== running test =================="
                sh 'mvn clean test'
            }
        }
         stage('Build App') {
            steps {
                echo " ============== building app =================="
                sh 'mvn clean package'
            }
        }
         stage("Docker Login") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    echo " ============== docker login =================="
                    sh '''
                    docker login -u $USERNAME -p $PASSWORD
                    '''
                }
            }
        }
        stage('Build docker image for App') {
            steps{
                    
                    echo " ============== docker build =================="
                    sh '''
                    mvn clean package
                    docker build -t voopnok/oms:latest . 
                    '''
                    
                
            }
        }
        stage("Docker Push") {
            steps {
                echo " ============== start pushing image =================="
                sh '''
                docker push voopnok/oms:latest
                '''
            }
        }
    }
}
