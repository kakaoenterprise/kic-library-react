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
    sudo mkdir -p /data/logs/nginx/${HOSTNAME}
    sudo chown -R ubuntu:ubuntu /data/logs/nginx/${HOSTNAME}

    cat << EOF | sudo tee /etc/nginx/sites-available/default
log_format main escape=json
  '{'
    '"time_local":"\$time_local",'
    '"remote_addr":"\$remote_addr",'
    '"remote_user":"\$remote_user",'
    '"request":"\$request",'
    '"status": "\$status",'
    '"body_bytes_sent":"\$body_bytes_sent",'
    '"request_time":"\$request_time",'
    '"http_referrer":"\$http_referer",'
    '"http_user_agent":"\$http_user_agent"'
  '}';
server {
    listen 80 default_server;
    access_log /data/logs/nginx/${HOSTNAME}/access.log main;
    error_log /data/logs/nginx/${HOSTNAME}/error.log;
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
