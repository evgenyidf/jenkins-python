pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    git branch: env.CHANGE_BRANCH, url: env.CHANGE_URL
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-image:${env.BUILD_ID}")
                }
            }
        }
        stage('Run Command') {
            steps {
                script {
                    docker.image("my-image:${env.BUILD_ID}").run()
                }
                sh 'docker ps'
            }
        }
    }

    // Trigger pipeline on any merge request
    options {
        buildDiscarder(logRotator(numToKeepStr: '3'))
        skipDefaultCheckout(true)
    }
    environment {
        GIT_COMMITTER_EMAIL = 'evgenyidf@gmail.com'
        GIT_COMMITTER_NAME = 'evgenyidf'
    }
    triggers {
        pullRequest()
    }
}
