#!/bin/bash

cat <<EOF > /etc/systemd/system/puma-server.service
[Unit]
Description=Puma Server
After=syslog.target
After=network.target
[Service]
Type=simple
User=appuser
Group=appuser
WorkingDirectory=/home/appuser/reddit
ExecStart=/usr/local/bin/puma
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable puma-server.service
