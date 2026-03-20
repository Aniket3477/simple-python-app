pipeline {
    agent any

    stages {
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Aniket3477/simple-python-app.git'
            }
        }

        stage('Security Scan (Trivy FS)') {
            steps {
                // Ye aapke source code mein vulnerabilities check karega
                sh 'trivy fs .'
            }
        }

        stage('Docker Build & Tag') {
            steps {
                // Docker image banana
                sh 'docker build -t aniket-app:${BUILD_NUMBER} .'
                sh 'docker tag aniket-app:${BUILD_NUMBER} aniket-app:latest'
            }
        }

        stage('Image Security Scan (Trivy Image)') {
            steps {
                // Bani hui Docker image ko scan karna
                sh 'trivy image aniket-app:latest'
            }
        }

        stage('Run Container') {
            steps {
                // Purane container ko rok kar naya chalana
                sh 'docker rm -f my-python-app || true'
                sh 'docker run -d -p 5000:5000 --name my-python-app aniket-app:latest'
            }
        }
    }

    post {
        success {
            echo "Mubarak ho Aniket! Pipeline successfully deploy ho gayi."
        }
        failure {
            echo "Build fail ho gaya. Console output check karo!"
        }
    }
}
