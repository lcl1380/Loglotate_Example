#!/bin/bash

LOG_FILE="/home/ubuntu/resource_usage.log"
EMAIL="your_email@gmail.com"
SUBJECT="Resource Usage Log"
BODY="Please find the attached resource usage log."

# 이메일 본문 생성
{
    echo "Subject: $SUBJECT"
    echo "To: $EMAIL"
    echo "MIME-Version: 1.0"
    echo "Content-Type: text/plain; charset=UTF-8"
    echo "Content-Disposition: inline"
    echo
    echo "$BODY"
    echo
    cat "$LOG_FILE"
} | ssmtp "$EMAIL"

echo "로그 파일을 이메일로 전송했습니다."
