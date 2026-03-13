# 快速开始指南

## 后端启动

### 1. 安装依赖

```bash
cd backend
pip install -r requirements.txt
```

### 2. 启动服务器

```bash
python main.py
```

服务器将在 http://localhost:8000 启动

### 3. API 文档

访问 http://localhost:8000/docs 查看 Swagger API 文档

## 前端启动

### 方式 1: 直接打开

直接双击 `frontend/index.html` 在浏览器中打开

### 方式 2: 使用本地服务器

```bash
# 使用 Python 内置服务器
cd frontend
python -m http.server 3000

# 或使用 Node.js 的 http-server
npx http-server -p 3000
```

然后访问 http://localhost:3000

## 游戏说明

### 基本玩法

1. **点击挖矿** - 点击大按钮手动获得金币
2. **购买建筑** - 使用金币升级建筑获得被动收入
3. **离线收益** - 游戏会自动保存进度

### 建筑类型

- **⛏️ 矿场** - 基础建筑，成本低，产出稳定
- **🌾 农场** - 最便宜的建筑，适合新手
- **🏭 工厂** - 高级建筑，成本高但产出多

### 升级机制

- 每次升级成本增加 50%
- 建筑等级越高，每秒产出越多
- 游戏自动保存，随时可以关闭

## 开发计划

- [ ] 更多建筑类型
- [ ] 成就系统
- [ ] 离线收益计算
- [ ] 用户账户系统
- [ ] 多人排行榜
