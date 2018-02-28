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
* Github repository GUI with Travis
* Managing settings
* Automate Travis push on GitHub pages


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


# 
