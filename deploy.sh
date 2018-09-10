#!/bin/bash

# Staging сервер
staging_server="192.168.1.182"
staging_login="admin"
staging_password="gwROY5aITK"
staging_path="/home/admin/web/PROJECT_NAME/public_html"

# Функция деплоя на тестовый сервер 
deploy_to_staging() {
  sshpass -p "$staging_password" ssh "$staging_login@$staging_server" "
    cd $staging_path
    git reset --hard
    git clean -fd
    git remote update
    git checkout develop
    git pull origin develop
    cd staging && cp -R . ..
  "
}

deploy_to_staging