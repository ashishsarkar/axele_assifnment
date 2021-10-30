#!/bin/bash

# Create mount volume for logs
  sudo su - root
  mkfs.ext4 /dev/sdf
  mount -t ext4 /dev/sdf /var/log

  sudo yum update -y
  sudo yum install docker -y
  sudo service docker start
  sudo docker run -i -t -p 80:80 ricardoamaro/drupal8


  
# # Install & Start nginx server
#   yum search nginx 
#   amazon-linux-extras install nginx1 -y
#   systemctl start nginx
#   systemctl enable nginx
  
# # Print the hostname which includes instance details on nginx homepage  
#   sudo echo Hello from `hostname -f` > /usr/share/nginx/html/index.html

  
