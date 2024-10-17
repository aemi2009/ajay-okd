pipeline {
    agent any
     environment {
        PATH = "/usr/local/bin:$PATH"  // Add Docker path
    }
    stages {
        stage('Test Docker') {
            steps {
                script {
                    sh 'docker --version'
                }
            }
        }
    }
}
