pipeline {
    agent any

    tools {
        terraform 'terraform'  // Must match the name in tool config
    }

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('GCP-Cloud') // Jenkins credential ID
    }

    stages {

        stage('Clone Repo') {
            steps {
                git credentialsId: 'GitHub-Credentials', url: 'https://github.com/Ashraf-ops/argocd-demo.git', branch: 'main'
            }
        }

        stage('Setup') {
            steps {
                sh 'terraform --version'
            }
        }

        stage('Init') {
            steps {
                sh '''
                  cd terraform-gcp/
                  terraform init 
                '''
            }
        }

        stage('Plan') {
            steps {
                sh 'cd terraform-gcp/'
                sh 'ls -la'
                // sh 'terraform plan -var="project_id=tonal-edge-458514-a3" -var="credentials_file=${GOOGLE_APPLICATION_CREDENTIALS}"'
            }
        }

        // stage('Apply') {
        //     steps {
        //         sh 'terraform apply -auto-approve -var="project_id=my-gcp-project" -var="credentials_file=${GOOGLE_APPLICATION_CREDENTIALS}"'
        //     }
        // }
    }
}
