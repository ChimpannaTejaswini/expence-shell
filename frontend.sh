Source common.sh
component=frontend

log_file=/tmp/expence.log
echo Installing Nginx
dnf install nginx -y >>$log_file

echo Placing Expence Confing File in Nginx
cp expence.conf /etc/nginx/default.d/expence.conf >>$log_file

echo Removing Old Nginx content
rm -rf /usr/share/nginx/html/* >>$log_file
cd /usr/share/nginx/html

download_and_extract

echo Starting Nginx Service
systemctl enable nginx >>$log_file
systemctl start nginx >>$log_file
