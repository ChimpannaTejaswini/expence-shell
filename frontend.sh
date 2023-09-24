log_file =/tmp/expence.log
echo Installing Nginx
dnf install nginx -y >>$log_file

echo Placing Expence Confing File in Nginx
cp expence.conf /etc/nginx/default.d/expence.conf >>$log_file

echo Removing Old Nginx content
rm -rf /usr/share/nginx/html/* >>$log_file


echo Download Frontend code
curl -s -o /tmp/frontend.zip https://expence-artifacts.s3.amazonaws.com/frontend.zip >>$log_file

cd /usr/share/nginx/html

echo Extracting Frontend Code
unzip /tmp/frontend.zip >>$log_file

echo Starting Nginx Service
systemctl enable nginx >>$log_file
systemctl start nginx >>$log_file