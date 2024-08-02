pipeline {
    agent any

    environment {
        // Define your environment variables if needed
        EMAIL_RECIPIENT = 'jegatheeshprakasam2702@gmail.com'
    }

    triggers {
        // Poll GitHub for changes
        githubPush() // This assumes you have set up a GitHub webhook to notify Jenkins of changes
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git 'https://github.com/jegrag04/Jenkins_task.git'
            }
        }

        stage('Build') {
            steps {
                // Example build step
                echo 'Building the project...'
                // Replace with your build command
		            sh 'chmod +x ./build.sh'
                sh './build.sh'
            }
        }
    }
    
    post {
        success {
            emailext (
                to: "${env.EMAIL_RECIPIENT}",
                subject: "Build Successful: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                body: """\
                <p>Build Successful!</p>
                <p>Job: ${env.JOB_NAME}</p>
                <p>Build Number: ${env.BUILD_NUMBER}</p>
                <p>Build URL: ${env.BUILD_URL}</p>
                """
            )
        }
        failure {
            emailext (
                to: "${env.EMAIL_RECIPIENT}",
                subject: "Build Failed: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                body: """\
                <p>Build Failed!</p>
                <p>Job: ${env.JOB_NAME}</p>
                <p>Build Number: ${env.BUILD_NUMBER}</p>
                <p>Build URL: ${env.BUILD_URL}</p>
                """
            )
        }
        always {
            echo 'Pipeline execution finished.'
        }
    }
}
