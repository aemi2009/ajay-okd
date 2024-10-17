pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                // Clone the repository from Git
                git url: 'https://github.com/aemi2009/ajay-okd.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // Run the build command
                sh 'make build'  // Assuming you have a Makefile for building your application
                // Alternatively, you could use a direct command like:
                // sh 'npm install && npm run build'  // For Node.js applications
            }
        }

        stage('Deploy to OpenShift') {
            steps {
                script {
                    // Log in to OpenShift
                    sh 'oc login https://api.crc.testing:6443 --token=sha256~YQJkMR1UnQfpC73kEaPwfBGnGG7mr9XSZeFMIraCg_M'
                    // Set the project/namespace
                    sh 'oc project ajayokd'
                    // Start the build from the 'dist' directory
                    sh 'oc start-build ajayokd --from-dir=dist --follow'
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
