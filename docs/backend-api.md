# 后端 API 设计文档

## 基础信息

- **服务地址**: `http://服务器IP:1368`
- **通信方式**: REST API + Socket.io
- **数据格式**: JSON

---

## 一、认证相关 API

### 1.1 用户注册
```
POST /api/auth/register
Body: { username, password }
Response: { success: true, token } 或 { error: "用户名已存在" }
```

### 1.2 用户登录
```
POST /api/auth/login
Body: { username, password }
Response: { success: true, token, userData }
```

---

## 二、Socket.io 事件

### 2.1 连接认证
```javascript
// 客户端连接时携带 token
socket.emit('auth', { token });

// 服务端响应
socket.emit('auth_result', { success: true, userId });
```

### 2.2 游戏数据同步
```javascript
// 客户端请求同步
socket.emit('sync_request');

// 服务端返回完整数据
socket.emit('sync_response', { 
    resources: {...},
    inventory: {...},
    skills: {...}
});
```

### 2.3 开始行动
```javascript
// 客户端发起
socket.emit('action_start', {
    type: 'woodcutting',  // 行动类型
    targetId: 'pine',     // 目标ID
    count: 10             // 次数
});

// 服务端响应（记录开始时间，用于验证）
socket.emit('action_started', {
    actionId: 'uuid-xxx',
    serverStartTime: 1712345678000,
    duration: 6000
});
```

### 2.4 完成行动
```javascript
// 客户端报告完成
socket.emit('action_complete', {
    actionId: 'uuid-xxx'
});

// 服务端验证时间后发放奖励
socket.emit('action_result', {
    success: true,
    rewards: { wood: 2, exp: 5 }
});
```

### 2.5 聊天系统
```javascript
// 发送消息
socket.emit('chat_send', { message: "大家好" });

// 接收消息（广播给所有人）
socket.emit('chat_message', {
    username: "玩家名",
    message: "大家好",
    time: "2024-04-01T21:00:00Z"
});
```

---

## 三、数据结构设计

### 3.1 用户表 (users)
```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at DATETIME,
    last_login DATETIME
);
```

### 3.2 游戏数据表 (user_game_data)
```sql
CREATE TABLE user_game_data (
    user_id INTEGER PRIMARY KEY,
    data JSON NOT NULL,  -- 完整游戏状态
    updated_at DATETIME
);
```

### 3.3 聊天记录表 (chat_messages)
```sql
CREATE TABLE chat_messages (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    username TEXT,
    message TEXT,
    created_at DATETIME
);
```

### 3.4 行动日志表 (action_logs)
```sql
CREATE TABLE action_logs (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    action_type TEXT,
    action_data JSON,
    server_time DATETIME
);
```

---

## 四、防作弊机制

### 4.1 时间验证
- 所有行动在服务端记录开始时间
- 客户端报告完成时，服务端计算实际耗时
- 时间不足则拒绝奖励

### 4.2 数据验证
- 客户端只能发送"我要做什么"
- 服务端计算结果并更新数据库
- 客户端只负责显示，不能修改数据

### 4.3 权限验证
- 每次 Socket 事件都验证用户身份
- 敏感操作记录日志

---

## 五、迁移步骤

### Phase 1: 基础架构 ✅
- [x] 创建后端项目结构
- [ ] 安装依赖并测试启动

### Phase 2: 认证系统
- [ ] 实现注册/登录
- [ ] 实现 JWT 验证

### Phase 3: 核心功能迁移
- [ ] 迁移伐木系统
- [ ] 迁移挖矿系统
- [ ] 迁移采集系统
- [ ] 迁移制作系统
- [ ] 迁移锻造系统
- [ ] 迁移缝制系统
- [ ] 迁移酿造系统
- [ ] 迁移炼金系统

### Phase 4: 聊天系统
- [ ] 实现全服聊天
- [ ] 实现聊天记录查询

### Phase 5: 前端改造
- [ ] 移除所有 gameState 直接修改
- [ ] 改为调用 API / Socket 事件
- [ ] 前端只负责显示