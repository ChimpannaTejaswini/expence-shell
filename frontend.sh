echo Installing Nginx
dnf install nginx -y >>tmp/expence.log

echo Placing Expence Confing File in Nginx
cp expence.conf /etc/nginx/default.d/expence.conf >>tmp/expence.log

echo Removing Old Nginx content
rm -rf /usr/share/nginx/html/* >>tmp/expence.log


echo Download Frontend code
curl -s -o tmp/frontend.zip https://expence-artifacts.s3.amazonaws.com/frontend.zip >>tmp/expence.log

cd /usr/share/nginx/html

echo Extracting Frontend Code
unzip /tmp/frontend.zip >>tmp/expence.log

echo Starting Nginx Service
systemctl enable nginx >>tmp/expence.log
systemctl start nginx >>tmp/expence.log