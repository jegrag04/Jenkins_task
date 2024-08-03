pipeline {
    agent any
}

    triggers {
        // Poll GitHub for changes
        githubPush() // This assumes you have set up a GitHub webhook to notify Jenkins of changes
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git branch: 'main', url: 'https://github.com/jegrag04/Jenkins_task.git' 
            }
        }

        stage('Build') {
            steps {
                // Example build step
                echo 'Building the project...'
                // Replace with your build command
				sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline execution finished.'
        }
        success {
            mail to: 'jegantheesh743@gmail.com',
                 subject: "Build Successful: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                 body: """
                 <html>
                     <body>
                         <h1>Build Successful!</h1>
                         <p>Job: ${env.JOB_NAME}</p>
                         <p>Build Number: ${env.BUILD_NUMBER}</p>
                         <p>Build URL: ${env.BUILD_URL}</p>
                     </body>
                 </html>
                 """
        }
        failure {
            mail to: 'jegantheesh743@gmail.com',
                 subject: "Build Failed: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                 body: """
                 <html>
                     <body>
                         <h1>Build Failed!</h1>
                         <p>Job: ${env.JOB_NAME}</p>
                         <p>Build Number: ${env.BUILD_NUMBER}</p>
                         <p>Build URL: ${env.BUILD_URL}</p>
                     </body>
                 </html>
                 """
        }
    }
}
