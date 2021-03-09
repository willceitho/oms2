#!groovy
// Run docker build

properties([disableConcurrentBuilds()])

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
            steps {
                sh 'mvn clean package'
            }
        }
         stage("docker login") {
            steps {
                echo " ============== docker login =================="
                withCredentials([usernamePassword(credentialsId: 'docker_creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh '''
                    docker login -u $USERNAME -p $PASSWORD
                    '''
                }
            }
        }
        stage('Build docker image for App') {
            steps{
                    sh '''
                    mvn clean package
                    docker build -t voopnok/oms:latest . 
                    '''
                    
                }
            }
        }
        stage("docker push") {
            steps {
                echo " ============== start pushing image =================="
                sh '''
                docker push voopnok/oms:latest
                '''
            }
        }
    }

