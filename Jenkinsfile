pipeline {
  agent any
    environment {
      AWS_CREDENTIALS=credentials('TerraformJenkinsDemoUser')
    }
  stages {
    stage('Terraform Plan') {
      steps {
        script {
          sh './test_plan.sh'
        }
      }
    }
  }
}
