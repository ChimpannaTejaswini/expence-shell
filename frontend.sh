echo Installing Nginx
dnf install nginx -y >>tmp/expense.log

echo Placing Expence Confing File in Nginx
cp expence.conf /etc/nginx/default.d/expence.conf >>tmp/expense.log

echo Removing Old Nginx content
rm -rf /usr/share/nginx/html/* >>tmp/expense.log


echo Download Frontend code
curl -s -o tmp/frontend.zip https://expence-artifacts.s3.amazonaws.com/frontend.zip >>tmp/expense.logg

cd /usr/share/nginx/html

echo Extracting Frontend Code
unzip /tmp/frontend.zip >>tmp/expense.log

echo Starting Nginx Service
systemctl enable nginx >>tmp/expense.log
systemctl start nginx >>tmp/expense.log