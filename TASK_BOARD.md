# 任务看板

**项目**: 智能证件照小程序  
**最后更新**: 2026-02-05

---

## 进行中的任务

### T003 AI抠图模块 ✅ 回归测试完成 | ✅ 代码审查通过

| 属性 | 值 |
|-----|-----|
| 状态 | 🟢 **已完成** |
| 负责人 | QA自动化测试 |
| 开始时间 | 2026-02-05 |
| 完成时间 | 2026-02-05 |

**测试结论：**
- ✅ removeBackground云函数 - 13个测试用例全部通过
- ✅ generateIdPhoto云函数 - 21个测试用例全部通过  
- ✅ 7种背景色切换功能正常
- ⚠️ 发现3个高优先级问题需修复

**代码审查结论：**
- ✅ TypeScript类型定义完整
- ✅ ESLint规则符合项目配置 (`no-console: error`)
- ✅ 命名规范统一 (camelCase, 清晰函数命名)
- ✅ 无敏感信息硬编码 (使用环境变量)
- ✅ 错误处理完善

**遗留问题：**
- [ ] T003-H1: 云函数规格与constants不同步
- [ ] T003-H2: 缺少图片分辨率检查
- [ ] T003-H3: 缺少并发控制

**详细报告**: [T003-regression-test.md](./tests/reports/T003-regression-test.md)

---

## 待办任务

- [ ] T004: 修复T003回归测试发现的问题
- [ ] T005: 优惠券模块开发

---

### T006 支付系统 ✅ 代码审查通过

| 属性 | 值 |
|-----|-----|
| 状态 | 🟢 **审查通过** |
| 审查日期 | 2026-02-05 |

**代码审查结论：**
- ✅ TypeScript类型定义完整 (OrderInfo, PayParams, OrderStatus等)
- ✅ ESLint规则符合项目配置 (`no-console: error`)
- ✅ 命名规范统一 (PascalCase枚举, camelCase函数)
- ✅ 无敏感信息硬编码 (WX_PAY_CONFIG使用环境变量)
- ✅ 错误处理完善 (try-catch, 错误返回, 订单状态校验)
- ✅ 订单过期检查实现正确 (30分钟)
- ✅ 优惠券锁定/解锁机制完整

**审查范围：**
- `cloudfunctions/createOrder/index.js` - 订单创建
- `cloudfunctions/wxPay/index.js` - 微信支付
- `cloudfunctions/payCallback/index.js` - 支付回调
- `cloudfunctions/queryOrder/index.js` - 订单查询
- `src/api/payment.ts` - 支付API封装

---

## 已完成任务

- [x] T001: 项目初始化
- [x] T002: 基础架构搭建
- [x] T003: AI抠图模块开发

---

## 任务状态图例

| 图标 | 状态 |
|-----|------|
| ⚪ | 未开始 |
| 🟡 | 进行中/条件通过 |
| 🟢 | 已完成 |
| 🔴 | 阻塞/失败 |

