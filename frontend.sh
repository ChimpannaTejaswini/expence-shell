source common.sh
component=frontend


echo Installing Nginx
dnf install nginx -y &>>$log_file
stat_check

echo Placing Expence Config File in Nginx
cp expence.conf /etc/nginx/default.d/expence.conf &&>>$log_file
stat_check

echo Removing Old Nginx content
rm -rf /usr/share/nginx/html/* &>>$log_file
stat_check

cd /usr/share/nginx/html


download_and_extract

echo Starting Nginx Service
systemctl enable nginx &&>>$log_file
systemctl start nginx &&>>$log_file
stat_check