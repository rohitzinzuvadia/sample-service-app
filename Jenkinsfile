pipeline{
    agent any
    stages{
        stage("Fetch Code From GitHub"){
            steps{
                git 'https://github.com/rohitzinzuvadia/sample-service-app.git'
            }
        }
        stage("Build Code"){
            steps{
                sh 'mvn -DskipTests clean package'
                sh 'tar -cvzf sample-service-app.tar.gz target/sample-service-app-1.0.jar ops/deployment/*'
                archiveArtifacts artifacts: 'sample-service-app.tar.gz', fingerprint: true
            }
        }
        stage("Build and Push Docker Image"){
            steps{
                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-personal', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        copyArtifacts filter: 'sample-service-app.tar.gz', fingerprintArtifacts: true, projectName: '', selector: lastSuccessful()
                        sh 'docker build -t 635489002009.dkr.ecr.ap-south-1.amazonaws.com/sample-service-app:dev'
                        sh 'docker push 635489002009.dkr.ecr.ap-south-1.amazonaws.com/sample-service-app:dev'
                    }       
            }
        }
    }
}
