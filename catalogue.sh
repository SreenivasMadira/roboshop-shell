echo -e "\e[36m>>>>> create catalogue servive <<<<<\e[0m"
cp catalogue.service/etc/systemd/system/catalogue.service

echo -e "\e[36m>>>>> create mongodb repo <<<<<\e[0m"
cp mongo.repo /etc/tum.repos.d/mongo.repo

echo -e "\e[36m>>>>> install nodejs repos <<<<<\e[0m"
curl -sl https://rpm.nodesource.com/setup-lts.x | bash

echo -e "\e[36m>>>>> install nodejs <<<<<\e[0m"
dnf install nodejs -y
dnf module disable nodejs -y
dnf module enable nodejs:18 -y

echo -e "\e[36m>>>>> create application user <<<<<\e[0m"
useradd roboshop

echo -e "\e[36m>>>>> create application directory <<<<<\e[0m"
mkdir /app

echo -e "\e[36m>>>>> download application content <<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip

echo -e "\e[36m>>>>> extract application content <<<<<\e[0m"
cd /app
unzip /tmp/catalogue.zip
cd /app

echo -e "\e[36m>>>>> download nodejs dependencies <<<<<\e[0m"
npm install

echo -e "\e[36m>>>>> install mongo client <<<<<\e[0m"
dnf install mongodb-org-shell -y

echo -e "\e[36m>>>>> load catalogue schema <<<<<\e[0m"
mongo --host mongodb.msdevopsb74.online </app/schema/catalogue.js

echo -e "\e[36m>>>>> start catalogue service <<<<<\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue

