### Userdatascript which is a Bash Script is a script that will be executed everytime,
### when the server is going to be launched for the first time
### (you can also configure it that it will be executed every time when the server will be restarted)

# SHEBANG/HASH BANG
# UPDATE THE SYSTEM
# INSTALL GIT AND MYSQL
# INSTALL DOCKER
# START DOCKER SERVICE
# CLONE MY MOVIE-MANAGEMENT-PROJECT REPO
# BUILD MY DOCKER IMAGE - DOCKERFILE
# RUN MYSQL CONTAINER
# DEPLOY OUR DATABASE INSIDE THE MYSQL CONTAINER
# RUN MY CONTAINER - FLASK APP RUNNING

# SHEBANG/HASH BANG
### (is the first character that your Program is going to look in your Script
### and tells your CPU which application to use. Here "#!")
### /bin <- diectory; bash <- application
#!/bin/bash

# UPDATE THE SYSTEM
sudo apt-get update -y

# INSTALL GIT AND MYSQL 
### (Linus family use yum comand, ubuntu uses abt-get)
### look first for the right naming of mysql client, becouse it has not on every system the same name:
### sudo apt-cache search mysql
sudo apt-get install git mysql-client -y

# INSTALL DOCKER
### Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
### Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
###Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
### Install Docker Engine
### Update the apt package index, and install the latest version of Docker Engine, containerd, and Docker Compose
sudo apt-get update
sudo apt-get install docker.io -y

# CLONE MY MOVIE-MANAGEMENT-PROJECT REPOSETORY
git clone git@github.com:Cloudyeli/movie_management_project.git

# BUILD MY DOCKER IMAGE - DOCKERFILE
cd movie_management_project/app
docker build -t movie-mgmt .

# RUN MYSQL CONTAINER
mkdir ~/database
docker run --name movie-db-mysql -p 3306:3306 -v ~/database:/var/lib/mysql - MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:latest

# DEPLOY OUR DATABASE INSIDE THE MYSQL CONTAINER
mysql -h 127.0.0.1 -u root -p my-secret-pw < ../database/create_movie_database.sql

# RUN MY CONTAINER - FLASK APP RUNNING
docker run -d -p 80:80 --name=movie-mgmt -v $PWD/movie_app:/app movie-mgmt