<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Tools and practices: Continuous Integration

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)


# Travis CI

<img src="media/travis_ci_logo.png" width="425" /> 


# Agenda

* Importance of Continuous Integration
* About Travis CI
* Getting started
* .travis.yml
* GitHub Travis webhook
* Auto-deploying gh-pages with Travis


# Importance of CI (1) 

* Continuous Integration is a software development practice where members of a team integrate their work frequently.
* Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible.
* Many teams find that this approach leads to significantly reduced integration problems and allows a team to develop cohesive software more rapidly.


# Importance of CI (2) 

<img src="media/git_branch.svg" width="800" height="458" /> 


# Importance of CI (3)

![](media/its_compilcated.png)


# Merging without CI?

<iframe src="https://giphy.com/embed/cFkiFMDg3iFoI" width="480" height="269" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/git-merge-cFkiFMDg3iFoI"></a></p>


# About Travis CI

* Is a distributed continuous integration service purposing on building and testing software projects hosted at GitHub. 
* Is using Amazon cloud infrastructure to host, build, and test various projects.
* Testing service fpr private repository is fee basis while free of charge for public.
* TravisPro offers custom deployments on customer's own hardware.


# Getting started

![](media/getting_started.png)


# .travis.yml

* Define all dependencies, programming lanauges, packages, etc.
* Define specific versions.
* Define scripts to execute.


# .travis.yml example

```java
language: python
python:
- '3.5'
sudo: required
dist: trusty
install:
- pip install "notebook==4.1" requests jupyter_cms jupyter_dashboards
addons:
  apt_packages:
  - pandoc
script: bash tools/travis-deploy.sh
env:
  global:
  - ENCRYPTION_LABEL: b88dab5c5665
  - COMMIT_AUTHOR_EMAIL: stefanos1316@gmail.com
```


# Travis GitHub webhook (1)

![](media/github_travis_check.png)


# Travis GitHub webhook (2)

![](media/travis_deploy.png)


# Travis GitHub webhook (3)

![](media/github_travis_pass.png)


# Auto-deploying gh-pages with Travis

* Set GitHub Pages option on a repository.
* Enable Travis webhook on the above repository.
* Create .travis.yml settings file.
* Generate SSH key and encrypt private key.
* Scripts
* Push to GitHub and experience the magic.


# Set GitHub Pages option on a repository

* Create gh-pages branch
* In repo's settings set GitHub Pages' source to gh-pages branch (be patient it takes some time)
* In case you would like index page to change from default (README) add and index.html.


# Enable Travis webhook on the above repository

![](media/getting_started.png)


# Create .travis.yml settings file.

```java
language: python
python:
- '3.5'
sudo: required
dist: trusty
install:
- pip install "notebook==4.1" requests jupyter_cms jupyter_dashboards
addons:
  apt_packages:
  - pandoc
script: bash tools/travis-deploy.sh
env:
  global:
  - ENCRYPTION_LABEL: b88dab5c5665
  - COMMIT_AUTHOR_EMAIL: stefanos1316@gmail.com
```


# Generate SSH key and encrypt the private key (1)

* Execute __ssh-keygen -t rsa -b 4096 -C "stefanos1316@gmail.com" -f deploy_key__
* Place both private and public key under the ~/.ssh/ directory.
* Add the deploy_key.pub content inside your repo's Settings Deploy Key section (you can also follow this [link](http://infoheap.com/how-to-setup-password-less-git-push-for-github/)).
* Install travis client __gem install travis__.
* Log in using travis clinet __travis login__ (use github credentials).
* Encrypt private key __travis encrypt-file ~/.sshdeploy_key__.
* Replace the generated line __openssl...___ with the existing inside the tools/travis_deploy.sh.
* Replace the ENCRYPTION_LABEL's value, from .travis.yml, with the generated label from the above command.


# Generate SSH key and encrypt the private key (2)

* Put the generated file (deploy_key.enc) inside your repository.
* Push changes on your remote GitHub repository.


# Scripts

* Deploy travis script can be found in this [link](https://gist.github.com/domenic/ec8b0fc8ab45f39403dd).
* [Build script](https://github.com/stefanos1316/courses/blob/master/tools/build.sh) is the script that creates our webpages content. 
* Make some changes on the materials found under the courses/courses directory and try to push on your repository.


# Push to GitHub and experience the magic

* Access your webpage using the following pattern https://_UserName_.github.io/_Repository'sName_/index.html
* This might take some time until travis is done with the build process 
