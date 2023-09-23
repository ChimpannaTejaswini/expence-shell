echo Installing Nginx
dnf install nginx -y>>/tmp/expense.log

echo Placing Expense Confing File in Nginx
cp expence.conf /etc/nginx/default.d/expense.conf>>/tmp/expence.log

echo Removing Old Nginx content
rm -rf /usr/share/nginx/html/>>tmp/expense.log


echo Download Frontend code
curl-s -o tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip>>tmp/expensee.log

cd /usr/share/nginx/html

echo Extracting Frontend Code
unzip /tmp/frontend.zip>>tmp/expensee.log

echo Starting Nginx Service
systemctl enable nginx>>tmp/expense.log
systemctl start nginx>>tmp/expensee.log