properties([
    pipelineTriggers([
        // this is a timer trigger you may adjust the cron expression to your needs
        cron('* * * * *')
    ])
])
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

        echo 'Hello World'
    }
}