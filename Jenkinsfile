pipeline {

    agent any

    stages {
        
        stage('SCM') {
            steps {
                git branch: 'release',
                url: 'https://github.com/Eslam1141/DellTask.git'
                echo "env.BRANCH_NAME"
            }
        }
        
        stage('Build') {
            when { equals expected: 'release', actual: 'release' }		 
            steps {
                echo 'Clean .. Build'
            		dir ('HelloWorldSolution'){
            		sh 'dotnet clean'
            		sh 'dotnet build'		
		        }
            }

        }
       stage('Lint Check') {
            when { equals expected: 'release', actual: 'release' }		 
            steps {
                echo 'we should run lint check here ..'
            }
        }

        stage('Unit Test') {
            when { equals expected: 'release', actual: 'release' }		 
            steps {
                echo 'Testing..'
		dir ('HelloWorldTest'){
		sh 'dotnet test -l:"trx;LogFileName=results.trx"'
		}
            }
        }
	stage('Integration Test') {
            when { equals expected: 'release', actual: 'release' }		 
            steps {
		dir ('HelloWorldSolutions.Tests'){
		sh 'dotnet test -l:"trx;LogFileName=results.trx"'
		}
            }
        }
        stage('Deploy') {
            when {
		expression { env.BRANCH_NAME ==~ /(master)/ }
		}
            steps {
                echo 'Deploying....'
		sh 'chmod +x archive.sh'
		sh './archive.sh'
		post {
                        always {
                            archiveArtifacts artifacts: 'Helloworld-${BUILD_NUMBER}.zip', fingerprint: true
                         
                        }
            }
        }
    }
}
