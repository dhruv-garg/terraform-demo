pipeline {
  agent any
    environment {
      AWS_CREDENTIALS=credentials('TerraformJenkinsDemoUser')
    }
  stages {
    stage('Terraform Plan') {
      steps {
        script {
	  def output = sh(returnStdout: true, script: 'terraform plan')
          echo "Output: ${output}"
          if (echo $output | grep -q "No changes"){
	     echo "WOahh"
          }
	  else {
            echo "Else part"
	  }
        }
      }
    }
  }
}
