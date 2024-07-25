#!/bin/bash

# 시스템 패키지 목록 업데이트
sudo apt update

# OpenJDK 17 설치
sudo apt install -y openjdk-17-jdk

# Java 버전 출력
java --version