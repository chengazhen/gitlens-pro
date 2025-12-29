#!/bin/bash

# 创建 bin 目录（如果不存在）
mkdir -p bin

# 编译 Windows 版本
GOOS=windows GOARCH=amd64 go build -o bin/activate.exe

# 编译 Linux 版本
GOOS=linux GOARCH=amd64 go build -o bin/activate

# 编译 MacOS 版本 (Intel)
GOOS=darwin GOARCH=amd64 go build -o bin/activate_mac_amd64

# 编译 MacOS 版本 (M1/M2)
GOOS=darwin GOARCH=arm64 go build -o bin/activate_mac_arm64

echo "构建完成！输出目录：./bin"