#!/bin/bash

# 로그 파일 경로
LOG_PATH="/home/ubuntu"
LOG_FILE="$(hostname).log"

# 이메일 설정
EMAIL_TO="marumaru1380@gmail.com"
EMAIL_SUBJECT="로그 파일 : $(hostname)"
EMAIL_BODY="첨부된 로그 파일을 확인하세요."

# 로그 파일 압축
tar -czf /tmp/${LOG_FILE}.tar.gz -C ${LOG_PATH} ${LOG_FILE}

# 이메일 전송
echo "${EMAIL_BODY}" | mail -s "${EMAIL_SUBJECT}" -A /tmp/${LOG_FILE}.tar.gz ${EMAIL_TO}

# 압축된 로그 파일 삭제
rm /tmp/${LOG_FILE}.tar.gz
