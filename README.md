# 中世纪放置 - Medieval Idle Game

⚔️ 一个中世纪风格的放置类游戏

## 技术栈

- **前端**: HTML + CSS + JavaScript (Vanilla)
- **后端**: Node.js + Express + Socket.io
- **数据库**: SQLite

## 功能特性

- 🌲 伐木、挖矿、采集
- ⚒️ 锻造、缝制、酿造、炼金
- 🛠️ 8种工具类型，每类8级
- 🏪 商人系统、好感度、任务
- 💬 全服聊天

## 本地运行

### 前端
```bash
# 直接打开 index.html 或使用任意静态服务器
```

### 后端
```bash
cd backend
npm install
npm start
```

服务将在 `http://localhost:1368` 运行

## 项目结构

```
medieval-idle/
├── index.html          # 游戏主页面
├── game.js             # 游戏核心逻辑
├── style.css           # 样式
├── frontend/
│   └── login.html      # 登录/注册页面
├── backend/
│   ├── server.js       # 后端服务
│   ├── package.json    # 后端依赖
│   └── game.db         # SQLite 数据库
└── docs/
    ├── backend-api.md  # API 文档
    └── refactor-plan.md # 重构计划
```

## License

MIT