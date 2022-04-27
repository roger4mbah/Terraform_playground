#!/bin/bash
sudo su
 yum install httpd -y
 systemctl enable --now httpd
