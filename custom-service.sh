#!/bin/bash
read -p "请输入服务名称: " NAME;
read -p "请输入运行的用户: " USERNAME;
read -p "请输入运行路径: " WORKDIR;
read -p "请输入运行命令: " COMMAND;

echo "[Unit]" > /etc/systemd/system/${NAME}.service
echo "Description=$NAME" >> /etc/systemd/system/${NAME}.service
echo "After=network.target " >> /etc/systemd/system/${NAME}.service
echo "" >> /etc/systemd/system/${NAME}.service
echo "[Service]" >> /etc/systemd/system/${NAME}.service
echo "Type=simple" >> /etc/systemd/system/${NAME}.service
echo "User=$USERNAME" >> /etc/systemd/system/${NAME}.service
echo "WorkingDirectory=$WORKDIR" >> /etc/systemd/system/${NAME}.service
echo "ExecStart=$COMMAND" >> /etc/systemd/system/${NAME}.service
echo "Restart=on-failure" >> /etc/systemd/system/${NAME}.service
echo "" >> /etc/systemd/system/${NAME}.service
echo "[Install]" >> /etc/systemd/system/${NAME}.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/${NAME}.service
systemctl daemon-reload
