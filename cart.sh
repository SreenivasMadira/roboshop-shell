cp catalogue.service/etc/systemd/system/catalogue.service

dnf install nodejs -y
dnf module disable nodejs -y
dnf module enable nodejs:18 -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
npm install


systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue

