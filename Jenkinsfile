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
            }
        }
        stage("Build Docker Image"){
            steps{
                sh 'mvn -DskipTests clean package'
            }
        }
    }
}
