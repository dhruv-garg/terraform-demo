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
        script {
          sh 'terraform init'
        }
      } 
    }
    
    stage('Validation') {
      steps {
        sh 'terraform validate'
        sh 'terraform fmt -check'
      }
    }
    
    stage('Planning') {
      steps {
        script {
          sh 'terraform plan'
        }
      }
    }

    stage('Apply') {
      input {
        message "Do you want to proceed to apply the plan?"
      }
      steps {
        script {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}
