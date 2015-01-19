@echo off 
set root=C:\WineManPub\
cd %root%
rem "C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root  -e "CREATE DATABASE IF NOT EXISTS wineman";

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_steps.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_transaction_step.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_transactions.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_wine_brands.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_wine_categories.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_wine_types.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_customers.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_holidays.sql
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql" -ppiepasri -u root wineman < App_Data\wineman_settings.sql