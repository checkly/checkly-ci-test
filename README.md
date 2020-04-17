# checkly-ci-test

## Jenkins

If you have an existing Jenkins pipeline, you can add an additional stage after you have deployed your application. It could look as follows:

```groovy
stage('Trigger Checkly') {
  steps {
      sh 'echo "Deployment finished."'
      // Call Checkly trigger
      sh 'curl "https://api-test.checklyhq.com/check-groups/4/trigger/${CHECKLY_TOKEN}" > ${PWD}/checkly.json'
      // Exit with an error status if we find more than 0 "hasFailures: true" in the output
      sh 'if [ $(grep -c \'"hasFailures":true\' $PWD/checkly.json) -ne 0 ]; then exit 1; fi'
  }
}
```

For standalone jobs, an additional build step of type `Execute shell` achieves a similar outcome. An exaple of its content could be as follows:

```groovy
echo "Deployment finished."
// Call Checkly trigger
curl "https://api-test.checklyhq.com/check-groups/4/trigger/${CHECKLY_TOKEN}" > ${PWD}/checkly.json
// Exit with an error status if we find more than 0 "hasFailures: true" in the output
if [ $(grep -c \'"hasFailures":true\' $PWD/checkly.json) -ne 0 ]; then exit 1; fi
```

Make sure to set the `CHECKLY_TOKEN` as an [environment variable](https://jenkins.io/doc/book/pipeline/jenkinsfile/#handling-credentials) in your job config.

## Travis CI

```
  - npm run test:unit  
  # Call Checkly trigger
  - curl "https://api-test.checklyhq.com/check-groups/4/trigger/$CHECKLY_TOKEN" > $PWD/checkly.json
  # Exit with an error status if we find more than 0 "hasFailures: true" in the output
  - if [ $(grep -c '"hasFailures":true' $PWD/checkly.json) -ne 0 ]; then exit 1; fi
```


## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
