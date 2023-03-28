#!/bin/bash

. ./web-env.sh

install_nginx()
{
    nginx=stable # use nginx=development for latest development version
    sudo add-apt-repository --yes ppa:nginx/$nginx
    sudo apt update
    sudo apt install nginx -y
}

write_nginx_configuration()
{
    cat << EOF | sudo tee /etc/nginx/sites-available/default
    $(cat ./confs/nginx.conf)
EOF
    sudo service nginx reload
}

start_web_server()
{
    sudo rm -rf  /usr/share/nginx/html/*
    sudo cp -r ./build/* /usr/share/nginx/html
    sudo systemctl restart nginx
}

install_nginx
write_nginx_configuration
start_web_server
