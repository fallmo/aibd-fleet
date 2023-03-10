#!/bin/bash

echo "Verifying Environment Variables...";

if [[ -z "$APP_NAME" ]]; then
    echo "Variable APP_NAME required!";
    exit 1;
else
    sed -i "s/APP_NAME=.*/APP_NAME=$APP_NAME/" /app/framework/.env
fi;

if [[ -z "$APP_URL" ]]; then
    echo "Variable APP_URL required!";
    exit 1;
else
    sed -i "/^APP_URL=/d" /app/framework/.env
    echo "APP_URL=$APP_URL" >> /app/framework/.env
fi;

if [[ -z "$DB_HOST" ]]; then
    echo "Variable DB_HOST required!";
    exit 1;
else
    sed -i "s/DB_HOST=.*/DB_HOST=$DB_HOST/" /app/framework/.env
fi;

if [[ -z "$DB_DATABASE" ]]; then
    echo "Variable DB_DATABASE required!";
    exit 1;
else
    sed -i "s/DB_DATABASE=.*/DB_DATABASE=$DB_DATABASE/" /app/framework/.env
fi;

if [[ -z "$DB_USERNAME" ]]; then
    echo "Variable DB_USERNAME required!";
    exit 1;
else
    sed -i "s/DB_USERNAME=.*/DB_USERNAME=$DB_USERNAME/" /app/framework/.env
fi;

if [[ -z "$DB_PASSWORD" ]]; then
    echo "Variable DB_PASSWORD required!";
    exit 1;
else
    sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=$DB_PASSWORD/" /app/framework/.env
fi;


symfony server:start