pipeline {
  agent any
    environment {
      AWS_ACCOUNT_ID="430288206927"
      AWS_DEFAULT_REGION="us-east-1"
      AWS_CREDENTIALS=credentials('TerraformJenkinsDemoUser')
    }
  stages {
    stage('Initialization') {
      steps {
        sh 'terraform init'
      } 
    }
    
    stage('Validation') {
      steps {
        sh 'terraform validate'
      }
    }
    
    stage('Planning') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Apply') {
      input {
        message "Do you want to proceed to apply the plan?"
      }
      steps {
        sh 'terraform apply -auto-approve'
      }
    }
  }
}
