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
        script {
          if (params.action != 'Destroy') {
            sh 'terraform init'
          }
        }
      } 
    }
    
    stage('Validation') {
      steps {
        script {
          if (params.action != 'Destroy') {
	    sh 'terraform validate'
	  }
        }
      }
    }
    
    stage('Planning') {
      steps {
        script {
          if (params.action != 'Destroy') {
	    sh 'terraform plan'
          }
        }
      }
    }

    stage('Apply') {
      input {
        message "Do you want to proceed?"
      }
      steps {
        script {
          if(params.action == 'Destroy'){
            sh "terraform destroy"
          }
          else {
            sh "terraform apply -input=false -auto-approve"
          }  
        }
      }
    }
  }
}
