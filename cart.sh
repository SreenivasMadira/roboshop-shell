cp cart.service/etc/systemd/system/cart.service

dnf install nodejs -y
dnf module disable nodejs -y
dnf module enable nodejs:18 -y
useradd roboshop
mkdir /app
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
npm install


systemctl daemon-reload
systemctl enable cart
systemctl restart cart

