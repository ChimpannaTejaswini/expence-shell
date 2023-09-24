source common.sh
component=backend

echo Install NodeJS Repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
if [$? -eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi

echo Install NodeJS
dnf install nodejs -y &>>$log_file
if [$? -eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi

echo Copy Backend Service File
cp backend.service /etc/systemd/system/backend.service &>>$log_file
if [$? -eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi

echo Add Applicton User
useradd expence &>>$log_file
if [$? -eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi

echo Clean App Content
rm -rf /app &>>$log_file
if [$?-eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi

mkdir /app
cd /app


download_and_extract

echo Download Dependencies
npm install &>>$log_file
if [$? -eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi

echo Start Backend Service
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file
if [$? -eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi

echo Install MySQL Client
dnf install mysql -y &>>$log_file
if [$? -eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi

echo Load Schema
mysql -h mysql.rdevopsb72.website -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
if [$? -eq 0]; then
  echo SUCCESS
else
  echo FAILED
fi





