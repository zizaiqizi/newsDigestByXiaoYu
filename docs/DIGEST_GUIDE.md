# 每日简报生成指南

## 🌅 简报结构 (三部分)

### Part 1: News Digest (新闻摘要)
- 经济新闻
- 地缘政治新闻  
- 科技/行业动态

### Part 2: Vocabulary Quiz (单词测验)
- 3个单词/短语问题
- 悬停显示答案
- 与新闻内容相关

### Part 3: Work Summary (工作总结) ⭐ 新增
- 昨日完成的任务数
- Git提交次数
- Sprint数量
- 每个Sprint的简要总结
- 链接到完整Sprint回顾报告

---

## 📁 文件说明

### 模板文件
- `morning-digest-template.html` - 新的三大部分HTML模板
- `email-template.html` - 邮件通知模板(已更新)

### 生成脚本
发送邮件时自动读取：
- `../sprint-reviews/` 目录下的Sprint回顾报告
- 提取昨日所有Sprint数据
- 集成到简报Part 3

---

## 🔧 集成方法

### 1. 生成简报时
```powershell
# 1. 获取新闻数据
# 2. 生成单词测验
# 3. 读取昨日Sprint报告
$Yesterday = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")
$SprintFiles = Get-ChildItem "../sprint-reviews/*$Yesterday*.md"

# 4. 提取数据填入模板
# 5. 生成HTML并推送
```

### 2. Work Summary数据来源
```
sprint-reviews/
├── sprint-1-review-2026-02-04-1900.md  ← 读取
├── sprint-2-review-2026-02-04-2100.md  ← 读取
└── sprint-3-review-2026-02-04-2300.md  ← 读取
```

### 3. 提取字段
- 完成任务数
- Git提交数
- Sprint目标
- 关键产出

---

## 📊 示例输出

```html
<!-- Part 3: Work Summary -->
<div class="work-section">
    <h2>💼 Work Summary 昨日工作总结</h2>
    
    <!-- 统计 -->
    <div class="work-stats">
        <div class="stat-card">
            <div class="stat-number">10</div>
            <div class="stat-label">完成任务</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">15</div>
            <div class="stat-label">Git提交</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">3</div>
            <div class="stat-label">Sprint数</div>
        </div>
    </div>
    
    <!-- Sprint列表 -->
    <div class="sprint-list">
        <div class="sprint-item">
            <div class="sprint-title">🕐 19:00-21:00 Sprint 1</div>
            <div class="sprint-desc">完成全部开发任务，进入代码审查阶段</div>
        </div>
        ...
    </div>
</div>
```

---

## 🎯 使用场景

每天早上打开简报，你可以：
1. 📰 **了解世界** - 看新闻摘要
2. 📝 **学习新词** - 做单词测验
3. 💼 **回顾工作** - 看昨日工作进展

一站式的晨间信息获取！

---

**更新日期**: 2026-02-04  
**版本**: v2.0 (三大部分)
