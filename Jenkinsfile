pipeline {
    agent any

    stages {
        stage('SCM') {
		when { branch pattern: "release/*" }
            steps {
                git 'https://github.com/Eslam1141/DellTask.git'
            }
        }
        stage('Build') {
		when { branch pattern: "release/*" }
            steps {
		
                echo 'Clean .. Build'
		dir ('HelloWorldSolution'){
		dotnet clean
		dotnet build		
		}
            }
	}
        stage('Unit Test') {
		when { branch pattern: "release/*" }
            steps {
                echo 'Testing..'
		dir ('HelloWorldTest'){
		dotnet test
		}
            }
        }
	stage('Integration Test') {
		when { branch pattern: "release/*" }
            steps {
		dir ('HelloWorldSolutions.Tests'){
		dotnet test
		}
            }
        }
        stage('Deploy') {
		when { branch pattern: "master" }
            steps {
                echo 'Deploying....'
            }
        }
    }
}
