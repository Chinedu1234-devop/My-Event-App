pipeline {
    agent any

    environment {
        IMAGE_NAME = "bwhizzy25/event-gui-app"
        APP_SERVER = "ec2-user@172.31.43.120"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Chinedu1234-devop/My-Event-App.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:latest'
            }
        }

        stage('Deploy to App Server') {
            steps {
                sh """
                ssh -o StrictHostKeyChecking=no $APP_SERVER << EOF
                  docker pull $IMAGE_NAME:latest
                  docker stop event-app || true
                  docker rm event-app || true
                  docker run -d -p 5000:5000 --name event-app $IMAGE_NAME:latest
                EOF
                """
            }
        }
    }

    post {
        success {
            echo '🎉 Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed'
        }
    }
}
