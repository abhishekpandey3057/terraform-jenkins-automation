pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
  }

  stages {
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Approval') {
      steps {
        timeout(time: 30, unit: 'MINUTES') {
          input message: 'Apply changes?', ok: 'Yes'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        sh 'terraform apply tfplan'
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}
