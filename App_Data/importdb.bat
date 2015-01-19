@echo off 
rem "C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root  -e "CREATE DATABASE IF NOT EXISTS wineman";

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < %~dp0\dumpdb.sql
