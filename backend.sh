source common.sh
component=backend

echo Install NodeJS Repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
stat_check

echo Install NodeJS
dnf install nodejs -y &>>$log_file
stat_check

echo Copy Backend Service File
cp backend.service /etc/systemd/system/backend.service &>>$log_file
stat_check

echo Add Applicton User
id expence &>>$log_file
if [ $? -ne 0 ]; then
 useradd expence &>>$log_file
fi
stat_check

echo Clean App Content
rm -rf /app &>>$log_file
echo $?

mkdir /app
cd /app


download_and_extract

echo Download Dependencies
npm install &>>$log_file
echo $?

echo Start Backend Service
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file
echo $?

echo Install MySQL Client
dnf install mysql -y &>>$log_file
echo $?

echo Load Schema
mysql -h mysql.rdevopsb72.website -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
echo $?





