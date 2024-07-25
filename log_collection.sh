#!/bin/bash

# 로그 파일이 저장된 원격 서버와 경로 설정
SERVERS=("10.0.2.36" "10.0.2.187")
LOG_PATH="/home/ubuntu/resource_usage.log"
LOCAL_LOG_PATH="/home/ubuntu/collected_logs"

# 로그 파일을 저장할 로컬 디렉토리 생성
mkdir -p $LOCAL_LOG_PATH

# 각 서버에서 로그 파일을 가져와서 로컬에 저장
for SERVER in "${SERVERS[@]}"; do
    scp -o StrictHostKeyChecking=no ubuntu@$SERVER:$LOG_PATH $LOCAL_LOG_PATH/resource_usage_$SERVER.log
done

# 취합된 로그 파일의 경로
COMBINED_LOG="$LOCAL_LOG_PATH/combined_resource_usage.log"

# 기존의 취합된 로그 파일 삭제
rm -f $COMBINED_LOG

# 각 서버에서 가져온 로그 파일을 취합
for SERVER in "${SERVERS[@]}"; do
    echo "----------------------------------------" >> $COMBINED_LOG
    echo "Server: $SERVER" >> $COMBINED_LOG
    echo "----------------------------------------" >> $COMBINED_LOG
    cat $LOCAL_LOG_PATH/resource_usage_$SERVER.log >> $COMBINED_LOG
    echo "" >> $COMBINED_LOG
done

# 가독성 있는 형식으로 출력
echo "----------------------------------------"
echo "취합된 로그 파일 내용:"
echo "----------------------------------------"
cat $COMBINED_LOG
