#!/bin/bash
# 中世纪雇佣兵 - 服务器启动脚本

cd /root/.openclaw/workspace/idle/backend

# Node 完整路径
NODE_PATH="/root/.nvm/versions/node/v22.22.0/bin/node"

# 日志文件
LOG_FILE="/tmp/idle-server.log"

# 检查是否已经在运行
if pgrep -f "node server.js" > /dev/null; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - 服务器已在运行" >> $LOG_FILE
    exit 0
fi

# 启动服务器
echo "$(date '+%Y-%m-%d %H:%M:%S') - 启动服务器..." >> $LOG_FILE
nohup $NODE_PATH server.js >> $LOG_FILE 2>&1 &

sleep 2

# 检查是否启动成功
if pgrep -f "node server.js" > /dev/null; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - 服务器启动成功" >> $LOG_FILE
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - 服务器启动失败!" >> $LOG_FILE
    exit 1
fi