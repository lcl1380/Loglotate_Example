
#!/bin/bash

# 크론탭에서 제거할 구문
CRON_JOB="*/2* * * * sudo /var/lib/jenkins/workspace/A-KDT-logging/resource_usage.sh"

# 현재 사용자 크론탭을 임시 파일에 백업
crontab -l > current_crontab.txt 2>/dev/null

# 임시 파일에서 특정 구문을 포함하지 않는 라인만을 새로운 파일로 저장
grep -v "/var/lib/jenkins/workspace/Jenkins-log-pipeline/resource_usage.sh" current_crontab.txt > new_crontab.txt

# 새로운 크론탭 파일에 항상 구문을 추가
echo "$CRON_JOB" >> new_crontab.txt

# 새로운 크론탭 파일을 적용
crontab new_crontab.txt

# 임시 파일 삭제
rm current_crontab.txt new_crontab.txt

echo "크론탭에서 '$CRON_JOB' 구문을 갱신했습니다."
