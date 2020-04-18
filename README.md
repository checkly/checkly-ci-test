# checkly-ci-test

## CircleCI

If you are using CircleCI in your project, you can add additional steps straight into your `config.yml` file:
```yml
- run:
    name: Trigger Checkly
    command: |
      echo "Deployment finished."
      curl "https://api-test.checklyhq.com/check-groups/4/trigger/${CHECKLY_TOKEN}" > ${PWD}/checkly.json
      if [ $(grep -c \'"hasFailures":true\' $PWD/checkly.json) -ne 0 ]; then exit 1; fi
```

Make sure to remember to set the `CHECKLY_TOKEN` from your CircleCI project's `Environment Variables` settings.

## Travis CI

```yml
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
