pipeline {
    agent any

    tools {
        terraform 'terraform'  // Must match the name in tool config
    }

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('GCP-Cloud') // Jenkins credential ID
    }
    
    parameters {
        choice(name: 'TERRAFORM_ACTION', choices: ['plan', 'validate'], description: 'Choose the Terraform action to perform')
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
                dir('terraform-gcp') {
                sh '''
                  terraform init 
                '''
            }
            }
        }

        stage('Plan') {
            steps {
                dir('terraform-gcp') {
                sh 'terraform plan -var="credentials_file=${GOOGLE_APPLICATION_CREDENTIALS}"'
            }
            }
        }

        // stage('Apply') {
        //     steps {
        //         sh 'terraform apply -auto-approve -var="project_id=my-gcp-project" -var="credentials_file=${GOOGLE_APPLICATION_CREDENTIALS}"'
        //     }
        // }
    }
}
