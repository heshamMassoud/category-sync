node {
    def dockerImage

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build the JAR') {
        ./gradlew clean build
    }

    stage('Build the docker image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        dockerImage = docker.build("heshamm/sync-prototype-job")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        dockerImage.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Publish docker image to docker registry') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            dockerImage.push("${env.BUILD_NUMBER}")
            dockerImage.push("latest")
            switch (env.BRANCH_NAME) {
                    case "staging":
                        dockerImage.push 'staging'
                        break
                    case "master":
                        dockerImage.push 'production'


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
                        break
                  }
        }
    }
}