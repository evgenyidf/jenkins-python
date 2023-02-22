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


# Install extra packages and docker
$ apt-get install apt-transport-https ca-certificates curl gnupg lsb-release software-properties-common -y
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
$ add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan stable"
$ apt-get update
$ apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


# Extract initial admin password
$ docker exec -ti `docker ps |grep jenkin |cut -d ' ' -f 1` cat /var/jenkins_home/secrets/initialAdminPassword

# Open a browser to 'http://localhost:8080
$ open http://localhost:8080
```

## Create new Pipeline Job
  - GitHub Project: `https://github.com/evgenyidf/jenkins-python.git/`
  - Build Triggers: `GitHub hook trigger for GITScm polling`
  - Defenition: `Pipeline script from SCM`
    - repository: `https://github.com/evgenyidf/jenkins-python.git`
    - branch: `*/main`
    - URL: `https://github.com/evgenyidf/jenkins-python`
    - Script Path: `Jenkinsfile`

Once you have created, you can create new PR and make a merge request, it will trigger new Job

</br>
</br>
</br>

[Note] There is additional `Jenkinsfile_main` that is intended to be triggered whenever you want
