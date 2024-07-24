#!/bin/bash

LOG_FILE="/home/ubuntu/resource_usage.log"
EMAIL="your_email@example.com"
SUBJECT="Resource Usage Log"
BODY="Please find the attached resource usage log."

# 이메일 보내기
cat "$LOG_FILE" | mail -s "$SUBJECT" "$EMAIL"

echo "로그 파일을 이메일로 전송했습니다."
