### Userdatascript which is a Bash Script is a script that will be executed everytime,
### when the server is going to be launched for the first time
### (you can also configure it that it will be executed every time when the server will be restarted)

# SHEBANG/HASH BANG
# INSTALL GIT
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

# INSTALL GIT (Linus family use yum comand, ubuntu uses abt-get)
sudo- yum install git -y

# INSTALL DOCKER
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user

# START DOCKER SERVICE
# CLONE MY MOVIE-MANAGEMENT-PROJECT REPO
# BUILD MY DOCKER IMAGE - DOCKERFILE
# RUN MYSQL CONTAINER
# DEPLOY OUR DATABASE INSIDE THE MYSQL CONTAINER
# RUN MY CONTAINER - FLASK APP RUNNING