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
server {
    listen 80 default_server;
    access_log /var/log/nginx/access.log;
    location / {
        root   /usr/share/nginx/html;
        index  index.html;
        try_files \$uri \$uri/ /index.html;
    }
    location /api {
        proxy_pass ${APP_ENDPOINT};
        proxy_http_version 1.1;
        proxy_redirect off;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
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
