# Donetick

自托管任务与家务管理工具。

## 功能特性
- 任务/家务追踪
- 截止日期提醒
- 多用户分配
- 重复任务
- 历史记录

## 快速部署
```bash
docker run -d -p 2021:2021 -v $(pwd)/data:/app/data --name donetick wsng911/donetick:latest
```
访问 `http://localhost:2021`
