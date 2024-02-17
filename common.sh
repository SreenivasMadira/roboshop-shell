 nodejs() {
   log=/tmp/roboshop.log
   echo -e "\e[36m>>>>> create ${component} servive <<<<<\e[0m"
   cp user.service/etc/systemd/system/${component}.service &>>${log}
   echo -e "\e[36m>>>>> create mongodb repo <<<<<\e[0m"
   cp mongo.repo /etc/tum.repos.d/mongo.repo &>>${log}
   echo -e "\e[36m>>>>> install nodejs repos <<<<<\e[0m"
   curl -sl https://rpm.nodesource.com/setup-lts.x | bash &>>${log}

   echo -e "\e[36m>>>>> install nodejs <<<<<\e[0m"
   dnf install nodejs -y &>>${logg
   dnf module disable nodejs -y &>>${log}
   dnf module enable nodejs:18 -y &>>${log}
   echo -e "\e[36m>>>>> create application user <<<<<\e[0m"
   useradd roboshop &>>${log}
   echo -e "\e[36m>>>>> create application directory <<<<<\e[0m"
   rm -rf /app &>>${log}
   echo -e "\e[36m>>>>> create application directory <<<<<\e[0m"
   mkdir /app &>>${log}
   echo -e "\e[36m>>>>> download application content <<<<<\e[0m"
   curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log}

   echo -e "\e[36m>>>>> extract application content <<<<<\e[0m"
   cd /app &>>${log}
   unzip /tmp/u${component}.zip &>>${log}
   cd /app &>>${log}
   echo -e "\e[36m>>>>> download nodejs dependencies <<<<<\e[0m"
   npm install &>>${log}
   echo -e "\e[36m>>>>> install mongo client <<<<<\e[0m"
   dnf install mongodb-org-shell -y &>>${log}

   echo -e "\e[36m>>>>> load ${component} schema <<<<<\e[0m"
   mongo --host mongodb.msdevopsb74.online </app/schema/${component}r.js &>>${log}

   echo -e "\e[36m>>>>> start ${component} service <<<<<\e[0m"
   systemctl daemon-reload &>>${log}
   systemctl enable ${component} &>>${log}
   systemctl restart ${component} &>>${log}


 }