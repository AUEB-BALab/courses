<img src="media/AUEB_logo.jpg" width="425" /> <img src="media/BA_Lab.png" width="425" />
# Tools and practices: Continuous Integration

* [Στέφανος Γεωργίου](https://www.balab.aueb.gr/stefanos-georgiou.html)


# Agenda

* Importance of Continuous Integration
* About Travis CI
* Getting started
* .travis.yml
* Code Quality Check
* Auto-deploying gh-pages with Travis


# Importance of CI (1) 

* Continuous Integration is a software development practice where members of a team integrate their work frequently.
* Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible.
* Many teams find that this approach leads to significantly reduced integration problems and allows a team to develop cohesive software more rapidly.


# Importance of CI (2) 

<img src="media/git_branch.svg" width="800" height="458" /> 


# Importance of CI (3)

![](media/its_compilcated.png)


# Merging without any CI tool?

<iframe src="https://giphy.com/embed/cFkiFMDg3iFoI" width="480" height="269" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/git-merge-cFkiFMDg3iFoI"></a></p>


# Travis CI

<img src="media/travis_ci_logo.png" width="425" /> 


# About Travis CI

* Is a distributed continuous integration service purposing on building and testing software projects hosted at GitHub. 
* Is using Amazon cloud infrastructure to host, build, and test various projects.
* The testing service for private repositories is fee basis while free of charge for public.
* TravisPro offers custom deployments on customer's own hardware.
* Sends email reports regrading the building status (fail, error, passed) after a pull request or merge operation. 


# Getting started

![](media/getting_started.png)


# .travis.yml

* Define all dependencies, programming lanauges, packages, etc.
* Define specific versions and installations.
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


# Pushing a PR on GitHub (1)

![](media/github_travis_check.png)


# Deploying on Travis (2)

![](media/travis_deploy.png)


# Passed from Travis (3)

![](media/github_travis_pass.png)


# Utilizing Travis for GitHub Java Projects

* [Use case repository](https://github.com/stefanos1316/wordbrain-solver)
* Maven([pom.xml](https://github.com/stefanos1316/wordbrain-solver/blob/master/pom.xml))  
	* Dependencies
	* Build
		* [JaCoCo](http://www.eclemma.org/jacoco/trunk/doc/maven.html), [Coveralls](https://github.com/trautonen/coveralls-maven-plugin)
	* Reporting
		* [CheckStyles](https://maven.apache.org/plugins/maven-checkstyle-plugin/), [JDepend](http://www.mojohaus.org/jdepend-maven-plugin/), [FindBugs](https://gleclaire.github.io/findbugs-maven-plugin/), [PMD](https://maven.apache.org/plugins/maven-pmd-plugin/), [JavaDoc](https://maven.apache.org/plugins/maven-javadoc-plugin/usage.html), [Surefire](http://maven.apache.org/surefire/maven-surefire-plugin/)


# Travis with JaCoCo (1)

```java
<plugin>
    <groupId>org.jacoco</groupId>
    <artifactId>jacoco-maven-plugin</artifactId>
    <version>0.7.4.201502262128 </version>
    <executions>
        <execution>
            <id>pre-unit-test</id>
            <goals>
                <goal>prepare-agent</goal>
            </goals>
            <configuration>
                <propertyName>surefireArgLine</propertyName>
            </configuration>
        </execution>
        <execution>
            <id>post-unit-test</id>
            <phase>test</phase>
            <goals>
                <goal>report</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <excludes>
            <exclude>**/ui/**</exclude>
            <exclude>**/StartSolverUi**</exclude>
        </excludes>
    </configuration>
</plugin>
```


# Travis with JaCoCo (2)

* .travis.yml
```java
language: java
script: mvn test
after_success:
  	- mvn clean test jacoco:report		
jdk:
  	- oraclejdk8			
```


# Travis with Coveralls (1)

* .travis.yml
```java
language: java			
script: mvn test
after_success:
  	- mvn clean test coveralls:report	
jdk:
  	- oraclejdk8
```
* Remember to webhook your repository from coveralls.io site

```java
<plugin>
    <groupId>org.eluder.coveralls</groupId>
    <artifactId>coveralls-maven-plugin</artifactId>
    <version>3.1.0</version>
</plugin>
```


# Travis with Coveralls (2)

![](media/coveralls.png)


# Travis with CheckStyles 
* .travis.yml
```java
	language: java
	jdk:
  		- oraclejdk8
	script:
  		- mvn test --batch-mode
  		- mvn checkstyle:check --batch-mode --fail-never
```
* Output: *[ERROR] ...  You have 323 Checkstyle violations. -> [Help 1]*


# Travis with jDepend, FindBugs, Sunfire Reports, JavaDoca

* .travis.yml
```java
language: java
jdk:
  	- oraclejdk8			
script:
	- mvn site				
```


# FindBugs and JDepend

![](media/findbugs.png)
![](media/jdepend.png)


# Auto-deploying gh-pages with Travis (Linux distros)

* Set GitHub Pages option on a repository
* Enable Travis webhook on the above repository
* Create .travis.yml settings file
* Generate SSH key and encrypt private key
* Store Public Key on GitHub
* Modify Scripts
* Push to GitHub and experience the magic


# Set GitHub Pages option on a repository

* Fork our repository found in this [link](https://github.com/stefanos1316/courses)
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

* Create a new ssh key:

		 $ ssh-keygen -t rsa -b 4096 -C "stefanos1316@gmail.com" -f ~/.ssh/deploy_key
	
* Install travis client 
		
		$ gem install travis

* Log in using travis client (use github credentials inside your repository)
	
		$ travis login


# Generate SSH key and encrypt the private key (2)

* Encrypt private key 
	
		$ travis encrypt-file ~/.ssh/deploy_key
* Replace the generated line __openssl...__ with the existing inside the tools/travis_deploy.sh.
* Replace the __ENCRYPTION_LABEL__'s value, from .travis.yml, with the generated label from the encrypt-file command.
* Put the generated file (deploy_key.enc) inside your repository.
* Push changes on your remote GitHub repository.


# Add Pub Key on GitHub (1)

* On GitHub interface select Settings then:
![](media/github_ssh_key_store.png)


# Add Pub Key on GitHub (2)

![](media/github_account_ssh_keys_list.png)


# Add Pub Key on GitHub (3)

* First setup remote.origin.url using <br\>
	
		$ git config  remote.origin.url git+ssh://git@github.com/youriserid/repoid.git
* To see all git config values and validate if remote.origin.url has been set <br\>

		$ git config -l 
* Test that you can ssh to GitHub <br\>

		$ ssh -T git@github.com 


# Scripts

* Deploy travis script can be found in this [link](https://github.com/stefanos1316/courses/blob/master/tools/travis-deploy.sh).
* [Build script](https://github.com/stefanos1316/courses/blob/master/tools/build.sh) is the script that creates our webpages content. 
* Make some changes on the materials found under the courses/courses directory and try to push on your repository.


# Push to GitHub and experience the magic

* Access your webpage using the following pattern https://_UserName_.github.io/_Repository'sName_/index.html
* This might take some time until travis is done with the build process


# Thank you for your attention!!!
