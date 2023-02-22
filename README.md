<p align="center">
  <a href="https://www.jenkins.io" target="blank"><img src="https://www.jenkins.io/images/logo-title-opengraph.png" width="200" alt="Nest Logo" /></a>
</p>


### Main features

- Data persistency based on `docker-compose` volumes
- Baseline for Jenkins CI/CD that will run a python job on any merge request.

## Running the Jenkins with docker-compose

```bash

# run docker-compose
$ docker-compose up -d

# Copy Jenkins file inside docker container
$ docker cp Jenkinsfile `docker ps |grep jenkin |cut -d ' ' -f 1`:/tmp

# Install SSH credentials plugin and add `github_secret` ssh private key to access github
$ docker exec -ti  `docker ps |grep jenkin |cut -d ' ' -f 1` /bin/sh
  => jenkins-plugin-cli --plugins instance-identity ssh-credentials credentials ionicons-api workflow-support script-security scm-api caffeine-api workflow-step-api workflow-api workflow-scm-step

# Extract initial admin password
$ docker exec -ti `docker ps |grep jenkin |cut -d ' ' -f 1` cat /var/jenkins_home/secrets/initialAdminPassword

# Open a browser to 'http://localhost:8080
$ open http://localhost:8080
```
