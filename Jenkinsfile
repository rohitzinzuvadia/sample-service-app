def ECR_REPO
pipeline {
    agent any
    environment{
        dockerHome = tool 'myDocker'
        mavenHome = tool 'myMaven'
        PATH = "$dockerHome/bin:$mavenHome/bin:$PATH"
    }
    stages{
        stage("Code Build"){
            steps{
                git branch: 'develop', url: 'https://github.com/rohitzinzuvadia/sample-service-app'
                sh 'mvn clean package -DskipTests=True'
            }
        }
        stage("Create ECR "){
            options {
                skipDefaultCheckout()
            }
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-PERSONAL']]) {
                    script{
                        dir('deployment/terraform/ecr') {
                            sh 'terraform init -backend-config=backend-dev-config.tfvars'
                            sh 'terraform plan'
                            sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }
        stage("Build Image & Push"){
            steps{
                echo "Build Image & Push"
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-PERSONAL']]) {
                    script{
                        sh '$(aws ecr get-login --no-include-email --region ap-south-1)'
                        sh 'docker build -t ${account_name}/sample-service-app:dev -f deployment/Docker/Dockerfile .'
                        sh 'docker push ${account_name}/sample-service-app:dev'
                    }
                }
            }
        }    
        stage("Deploy ECS Service"){
            steps{
                echo "Deploy ECS Service"
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-PERSONAL']]) {
                    script{
                        dir('deployment/terraform/ecs') {
                            sh 'terraform init -backend-config=backend-dev-config.tfvars'
                            sh 'terraform validate'
                            sh 'terraform plan'
                            sh 'terraform apply -auto-approve'
                            //sh 'terraform destroy -auto-approve'
                        }
                    }
                }    
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}