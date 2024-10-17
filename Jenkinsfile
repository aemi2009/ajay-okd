pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                script {
                    // Clone the repository
                    git credentialsId: 'github-credentials', url: 'https://github.com/aemi2009/ajay-okd.git', branch: 'master'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Run the build command
                    try {
                        sh 'make build'  // Assuming you have a Makefile for building your application
                    } catch (Exception e) {
                        echo "Build failed: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                        error('Aborting due to build failure')
                    }
                }
            }
        }

        stage('Deploy to OpenShift') {
            steps {
                script {
                    try {
                        // Log in to OpenShift
                        sh 'oc login https://api.crc.testing:6443 --token=sha256~YQJkMR1UnQfpC73kEaPwfBGnGG7mr9XSZeFMIraCg_M'
                        // Set the project/namespace
                        sh 'oc project ajayokd'
                        // Start the build from the 'dist' directory
                        sh 'oc start-build ajayokd --from-dir=dist --follow'
                    } catch (Exception e) {
                        echo "Deployment failed: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                        error('Aborting due to deployment failure')
                    }
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
