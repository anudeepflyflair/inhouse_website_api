pipeline {
    agent any

    environment {
        AWS_CREDENTIALS = credentials('aws-access-key-id')  
        TERRAFORM_VERSION = "1.10.3"                         
    }

    stages {
        // Stage 1: Checkout Code from Git
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/anudeepflyflair/inhouse_website_api.git', branch: 'main'
            }
        }

        // Stage 2: Terraform Format Check
        stage('Terraform Format Check') {
            steps {
                script {
                    sh 'terraform fmt -recursive'
                }
            }
        }

        // Stage 3: Terraform Validate
        stage('Terraform Validate') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }

        // Stage 4: Terraform Init
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init -input=false'
                }
            }
        }

        // Stage 5: Terraform Plan
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan -input=false'
                }
            }
        }

        // Stage 6: Convert Plan to JSON
        stage('Convert Plan to JSON') {
            steps {
                script {
                    sh 'terraform show -json tfplan > tfplan.json'
                }
            }
        }

        // Stage 7: Archive the JSON Plan
        stage('Archive JSON Plan') {
            steps {
                archiveArtifacts artifacts: 'tfplan.json'
            }
        }

        // Stage 8: Terraform Apply
        stage('Terraform Apply') {
            steps {
                script {
                    // sh 'terraform apply -auto-approve tfplan'
                    echo "hello"
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment successful!'
        }
        failure {
            echo 'Terraform deployment failed.'
        }
    }
}
