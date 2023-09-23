echo Installing Nginx
dnf install nginx -y

echo Placing Expence Confing File in Nginx
cp expence.conf /etc/nginx/default.d/expence.conf

echo Removing Old Nginx content
rm -rf /usr/share/nginx/html/*


echo Download Frontend code
curl -o tmp/frontend.zip https://expence-artifacts.s3.amazonaws.com/frontend.zip

cd /usr/share/nginx/html

echo Extracting Frontend Code
unzip /tmp/frontend.zip

echo Starting Nginx Service
systemctl enable nginx
systemctl start nginx