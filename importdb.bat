@echo off 
set root=C:\WineMapPub\
cd %root%
mysql -u root  -e "CREATE DATABASE IF NOT EXISTS wineman";
mysql -u root  wineman < app_data\*.sql