pipeline {
  agent any
    environment {
      AWS_CREDENTIALS=credentials('TerraformJenkinsDemoUser')
    }
  stages {
    stage('Get Infra State') {
      steps {
        sh 'terraform plan --refresh-only'
      }
    }
    stage('Sync Infra to State File') {
      input {
        message "Do you want to proceed?"
      }
      steps {
        sh 'terraform apply --refresh-only --auto-approve'
      }
    }
  }
}
