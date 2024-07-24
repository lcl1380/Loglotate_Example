#!/bin/bash

# 제거할 기존 크론잡 구문
OLD_CRON_JOB="*/5 * * * * sudo /home/ubuntu/log_resource_usage.sh"

# 새 크론잡 구문 (1분마다 실행)
NEW_CRON_JOB="* * * * * sudo /home/ubuntu/log_resource_usage.sh"

# 추가할 SCP 크론잡 (3시간마다)
SCP_CRON_JOB="0 */3 * * * scp -o StrictHostKeyChecking=no /home/ubuntu/resource_usage.sh ubuntu@10.0.10.63:/home/ubuntu/"

# 현재 사용자 크론탭을 임시 파일에 백업
crontab -l > current_crontab.txt 2>/dev/null

# 임시 파일에서 특정 구문을 포함하지 않는 라인만을 새로운 파일로 저장
grep -v -F "$OLD_CRON_JOB" current_crontab.txt > new_crontab.txt

# 새로운 크론탭 파일에 새 구문을 추가 (중복 확인 필요)
if ! grep -Fq "$NEW_CRON_JOB" new_crontab.txt; then
    echo "$NEW_CRON_JOB" >> new_crontab.txt
fi

# SCP 크론잡 추가 (중복 확인 필요)
if ! grep -Fq "$SCP_CRON_JOB" new_crontab.txt; then
    echo "$SCP_CRON_JOB" >> new_crontab.txt
fi

# 새로운 크론탭 파일을 적용
crontab new_crontab.txt

# 임시 파일 삭제
rm current_crontab.txt new_crontab.txt

echo "크론탭에서 '$OLD_CRON_JOB' 구문을 제거하고 '$NEW_CRON_JOB' 및 '$SCP_CRON_JOB' 구문을 추가했습니다."
