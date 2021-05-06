pipeline {
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mvn1"
    }
   stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/thechetantalwar/java-demo-app'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
        stage('DockerBuild'){
            steps{
                sh "docker build -t webapp -f docker ."
            }
        }
        stage('DockerContainer'){
            steps{
                 sh "docker run -d -p 30013:8080 webapp"
            }
        }
    }
}

