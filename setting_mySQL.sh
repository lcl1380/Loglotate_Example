#!/bin/bash

# MySQL root 비밀번호
MYSQL_ROOT_PASSWORD="51228"

# 생성할 데이터베이스 이름
DATABASE_NAME="spring_security_inclass"

# 생성할 사용자 이름과 비밀번호
NEW_USER="cherish"
NEW_USER_PASSWORD="51228"

# MySQL 명령을 사용하여 데이터베이스와 사용자 생성
mysql -u root -p${MYSQL_ROOT_PASSWORD} <<EOF
CREATE DATABASE ${DATABASE_NAME};
CREATE USER '${NEW_USER}'@'%' IDENTIFIED BY '${NEW_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${NEW_USER}'@'%';
FLUSH PRIVILEGES;
EOF