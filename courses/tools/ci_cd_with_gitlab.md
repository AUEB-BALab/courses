<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Tools and practices: Continuous Integration and Deployment

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)


# Agenda
* What is CI/CD?
* AllCanCode Case
* Without CI/CD
* Recap
* Stages
* Optimizations
* First CI pipeline
* Point out drawbacks
* Second Attemp
* Outcome


# What is CI/CD
* CI = Continious Integration
* CD = Continious Deployment
* Reducing manual labor for deployment and lessens testing time of newly integrated code.


# AllCanCode Platform
![](media/acc_platform.png)


# ACC Process
<img src="media/acc_software_stack.svg" height="546" />


# Without CI/CD
* Running back-end tests (using mocha-chai)
* Manually perform front-end test on the platfor
* Depoy to Google's App Engine the platform
	* Alpha
	* WWW
	* Next
* Running cordova and singing and deploying
	* APKs to Play Store
	* IPAs to App Store
* Approximate time: 40 minutes


<img src="media/doggy_work.jpg" height="586" />


# First CI pipeline
```
cache:
  untracked: true
  paths:
    - node_modules/

stages:
  - build
  - test
  - deploy

build:
  stage: build [...]

test_back_end:
  stage: test [...]

test_front_end:
  stage: test [...]

deploy:
  stage: deploy [...]
```


# First CI, build
```
build:
  stage: build
  image: node:latest
  before_script:
    - apt-get update
  script:
    - npm i
    - export ACC_VERSION=$(node -pe "require('./package.json')['version']")
    - export DEPLOY_URL=$(echo "https://files.allcancode.com/builds/app-files/platform/${ACC_VERSION}/")
    - echo ${ACC_VERSION}
    - cd acc-front
    - rm -rf node_modules/*
    - npm i
    - node_modules/@angular/cli/bin/ng build --prod --build-optimizer --preserve-symlinks --base-href / --deploy-url ${DEPLOY_URL}
    - cd ..
```


# First CI, test
```
test_back_end:
  stage: test
  image: node:latest
  before_script:
    - export ACC_VERSION=$(node -pe "require('./package.json')['version']")
    - echo ${ACC_VERSION} >> ACC_VERSION
    - apt-get update
    - apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common  
    - curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
    - apt-key fingerprint 0EBFCD88
    - add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    - apt-get update
    - apt-get install -y docker-ce
    - service docker status || service docker start
    - service docker status
  script:
    - docker run --name redis_instance -p 6379:6379 -d redis redis-server
    - docker run --name mongo_instance --restart=always -d -p 27017:27017 mongo mongod
    - sh test.sh
  artifacts:
    paths:
    - ACC_VERSION
```


# First CI, test
```
test_front_end:
  stage: test
  image: node:latest
  before_script:
    - apt-get update
    - apt-get install -y xvfb libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2
    - npm i --save-dev cypress
  script:
    - echo 'Testing DeliverBack front-end'
    - node_modules/cypress/bin/cypress run --spec cypress/integration/deliver_back/input_validation.spec.js 
```


# First CI, deploy
```
deploy:
  stage: deploy
  image: google/cloud-sdk:latest
  before_script:
    - export ACC_VERSION=$(cat ACC_VERSION)
    - export ACC_VERSION=$(echo ${ACC_VERSION} | awk '{print $2}')
    - echo ${ACC_VERSION}
    - echo $SERVICE_ACCOUNT > /tmp/$CI_PIPELINE_ID.json
    - gcloud auth activate-service-account --key-file /tmp/$CI_PIPELINE_ID.json
    - gcloud config set project allcancode-platform
  after_script:
    - rm /tmp/$CI_PIPELINE_ID.json
    - rm ACC_VERSION
  script:
    - export STORAGE_PATH=$( echo "gs://allcancode-files/builds/app-files/platform/${ACC_VERSION}")
    - gsutil -m cp -r -z html,css,js acc-front/dist ${STORAGE_PATH}
    - gsutil -m setmeta -h "Cache-Control:public, max-age=31536000" ${STORAGE_PATH}/**/*
    - gsutil -m acl ch -r -u AllUsers:R ${STORAGE_PATH}/*
    - gcloud app deploy app-alpha.yaml --version=v${ACC_VERSION//\./\-} --quiet
```


# First CI outcome




# Outcome of CI/CD pipeline

![](media/acc_ci_cd.svg)
