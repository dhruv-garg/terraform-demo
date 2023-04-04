pipeline {
  agent any
    environment {
      AWS_ACCOUNT_ID="430288206927"
      AWS_DEFAULT_REGION="us-east-1"
      AWS_CREDENTIALS=credentials('TerraformJenkinsDemoUser')
    }
    parameters {
      choice choices: ['Plan', 'Apply', 'Destroy'], description: '', name: 'action'
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
        message "Do you want to proceed?"
      }
      steps {
        script {
          if(params.action == 'Destroy'){
            sh "terraform destroy -input=false -auto-approve"
          }
          else {
            sh "terraform apply -input=false -auto-approve"
          }  
        }
      }
    }
  }
}
