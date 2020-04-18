pipeline {
    agent any
    stages {
            
        stage('Build') {
            steps {
                sh 'echo "Building..."'
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                sh 'npm run test:unit'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo "Deploying..."'
                // Insert your own deployment procedure
            }
        }

        // The interesting part happens here. We use the after_deploy phase to trigger Checkly and either pass or fail the build.
        stage('Trigger Checkly') {
            steps {
                sh 'echo "Deployment finished."'
                // Call Checkly trigger
                sh 'curl "https://api-test.checklyhq.com/check-groups/4/trigger/${CHECKLY_TOKEN}" > ${PWD}/checkly.json'
                // Exit with an error status if we find more than 0 "hasFailures: true" in the output
                sh 'if [ $(grep -c \'"hasFailures":true\' $PWD/checkly.json) -ne 0 ]; then exit 1; fi'
            }
        }
    }
}
