pipeline {
    agent any

    stages {
        
        stage('BUILD') {
            steps {
                catchError {
                 sh 'docker rmi -f $(docker images -q)'
                            }
                echo currentBuild.result
                git 'https://github.com/zahornyak/sample_rails_app'
                sh 'docker build -t sample-rails-app:$BUILD_NUMBER .' 
            }
        }
        stage('CREATE ARTIFACT') {
            steps {
                sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 996548385171.dkr.ecr.eu-central-1.amazonaws.com'
                sh 'docker tag sample-rails-app:$BUILD_NUMBER 996548385171.dkr.ecr.eu-central-1.amazonaws.com/sample-rails-app:$BUILD_NUMBER'
                sh 'docker push 996548385171.dkr.ecr.eu-central-1.amazonaws.com/sample-rails-app:$BUILD_NUMBER'
            }
        }
        stage('DEPLOY') {
            steps {
                git 'https://github.com/zahornyak/ansible-setting.git'
                sh 'echo "build_number: $BUILD_NUMBER" > group_vars/all'
                sh 'ansible-playbook -i hosts.yml playbook.yml'
                
            }
        }
        
    }
}
