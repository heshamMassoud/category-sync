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

    stage('Run the docker image') {
        sh "docker run heshamm/category-sync"
    }
}