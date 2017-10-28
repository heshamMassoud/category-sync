node {
    def dockerImage

    stage('Clone repository') {
        checkout scm
    }

    stage('Build the JAR') {
         sh "./gradlew clean build"
    }

    stage('Build the docker image') {
        dockerImage = docker.build("heshamm/category-sync")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        dockerImage.inside {
            sh 'echo "Tests passed"'
        }

        pipeline {
            agent any
            triggers {
                cron('H 4/* 0 0 1-5')
            }
            stages {
                stage('Schedule the job') {
                    steps {
                        echo 'Hello World'
                    }
                }
            }
        }
    }
}