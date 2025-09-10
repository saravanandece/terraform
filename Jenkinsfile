pipeline {
    agent any
    stages {
        stage('CHECKOUT') {
            steps {
                script {
                        checkout scm
						echo 'CHECKOUT STAGE'
                    }
                }
        }
		stage('--CHECKOV--') {
            steps {
				dir("Firewall-rules"){
					script {
							sh "echo '--------------------------STARTING CHECKOV SCAN-----------------------'"
							sh "pwd"
							sh "pipenv install"
							sh "pipenv run pip install checkov"
							sh "pipenv run pip install dataclasses"
							sh "pipenv run checkov --directory ."
						}
					}
			}
		}
        stage('INIT') {
            steps {
				dir("Firewall-rules"){
					script {
							sh "echo '-------------------------- INITIALIZING TERRAFORM -----------------------'"
							sh "terraform init"
						}
					}
			}
		}
        stage('PLAN') {
            when {
  		        allOf {
    			    environment name: 'Action', value: 'Plan'
  			       }
		        }
            steps {
				dir("Firewall-rules"){
					script {
							sh "echo '-------------------------- RUNNING FIRST PLAN -----------------------'"
							sh (script:'export TF_LOG="DEBUG"')
							sh (script: 'export TF_LOG_PATH="terraform.log"')
							sh (script:"terraform plan")
							currentBuild.displayName = params.Action
						}
					}
				}
        }
        stage('APPLY') {
            when {
  		        allOf {
    			    environment name: 'Action', value: 'Apply'
  			        }
		        }
            steps {
                dir("Firewall-rules"){
                    script{
                        sh "echo '-------------------------- RUNNING APPLY -----------------------'"
						sh "terraform apply --auto-approve"
                        currentBuild.displayName = params.Action
                    }
                }
            }
        }
		stage('REFRESH') {
            when {
  		        allOf {
    			    environment name: 'Action', value: 'Refresh'
  			        }
		        }
            steps {
                dir("Firewall-rules"){
                    script{
                        sh "echo '-------------------------- RUNNING REFRESH -----------------------'"
						sh "terraform apply -refresh-only --auto-approve"
                        currentBuild.displayName = params.Action
                    }
                }
            }
        }
		stage('SHOW') {
            steps {
				dir("Firewall-rules"){
					script {
							sh "echo '-------------------------- FINAL IMPORTS LIST -----------------------'"
							sh "terraform state list"  
						}
					}
			}
		}
    }
}