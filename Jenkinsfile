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
          sh '''
            #!/bin/bash
            echo $output
          '''
        }
      }
    }
  }
}
