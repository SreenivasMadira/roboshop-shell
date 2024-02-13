cp user.service/etc/systemd/system/user.service
cp mongo.repo /etc/tum.repos.d/mongo.repo
dnf install nodejs -y
dnf module disable nodejs -y
dnf module enable nodejs:18 -y
useradd roboshop
mkdir /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
npm install
dnf install mongodb-org-shell -y
mongo --host mongodb.msdevopsb74.online </app/schema/catalogue.js
systemctl daemon-reload
systemctl enable user
systemctl restart user


