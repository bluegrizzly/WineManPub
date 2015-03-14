@echo off
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < %~dp0\App_Data\version1.sql
