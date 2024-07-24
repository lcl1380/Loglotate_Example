#!/bin/bash

# 크론탭에서 제거할 구문
OLD_CRON_JOB="*/5 * * * * sudo /home/ubuntu/log_resource_usage.sh"

# 새 크론잡 구문 (1분마다 실행)
NEW_CRON_JOB="* * * * * sudo /home/ubuntu/log_resource_usage.sh"

# 현재 사용자 크론탭을 임시 파일에 백업
crontab -l > current_crontab.txt 2>/dev/null

# 임시 파일에서 특정 구문을 포함하지 않는 라인만을 새로운 파일로 저장
grep -v "$OLD_CRON_JOB" current_crontab.txt > new_crontab.txt

# 새로운 크론탭 파일에 새 구문을 추가
echo "$NEW_CRON_JOB" >> new_crontab.txt

# 새로운 크론탭 파일을 적용
crontab new_crontab.txt

# 임시 파일 삭제
rm current_crontab.txt new_crontab.txt

echo "크론탭에서 '$OLD_CRON_JOB' 구문을 제거하고 '$NEW_CRON_JOB' 구문을 추가했습니다."
