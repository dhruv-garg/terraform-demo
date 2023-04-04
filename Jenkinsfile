def exit_status = 0

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
        try {
          sh 'terraform validate'
          sh 'terraform fmt -check'
        }
      catch(err) {
        currentBuild.result = 'FAILURE'
        emailExtraMsg = "Build Failure:" + err.getMessage()
        throw err
      }
    }
    
    stage('Planning') {
      steps {
        catchError {
          sh 'terraform plan'
        }
      }
      post {
        success {
          echo 'Plan Successful'
        }
        failure {
          echo 'Terraform plan failed'
          error 'Stopping now..'
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
