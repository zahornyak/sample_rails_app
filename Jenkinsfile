pipeline {
    agent any

    stages {
        
        stage('docker build') {
            steps {
                sh 'docker rmi -f $(docker images -q)'
                git 'https://github.com/zahornyak/sample_rails_app'
                sh 'docker build -t sample-rails-app:$BUILD_NUMBER .' 
            }
        }
        stage('docker push') {
            steps {
                sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 996548385171.dkr.ecr.eu-central-1.amazonaws.com'
                sh 'docker tag sample-rails-app:$BUILD_NUMBER 996548385171.dkr.ecr.eu-central-1.amazonaws.com/sample-rails-app:$BUILD_NUMBER'
                sh 'docker push 996548385171.dkr.ecr.eu-central-1.amazonaws.com/sample-rails-app:$BUILD_NUMBER'
            }
        }
        stage('ansible') {
            steps {
                git 'https://github.com/zahornyak/ansible-setting.git'
                sh 'echo "build_number: $BUILD_NUMBER" > group_vars/all'
                sh 'ansible-playbook -i hosts.yml playbook.yml'
                
            }
        }
        
    }
}
