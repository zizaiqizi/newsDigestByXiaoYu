# 🔐 Security Protocol - Project Pangu

**Classification:** INTERNAL ONLY  
**Last Updated:** February 4, 2026  
**Owner:** XiaoYuZhou + Rangel  
**Status:** ACTIVE

---

## 🚨 CRITICAL SECURITY RULES

### 1. Credential Protection (TOP PRIORITY)

**NEVER expose these in:**
- Chat logs
- Git commits (especially public repos)
- Screenshots shared online
- Copy-paste to untrusted sites

**Protected Assets:**
```
GitHub PAT: github_pat_11B5YEOBQ0... (ends with IL)
QQ SMTP Auth: akgxxrbxcfkeiaec
Kimi API Key: [Stored in auth-profiles.json]
Email: zizaiqizizhangxiqi@qq.com
Backup Email: rangelzhang@iQue.com
```

**Storage Rules:**
- ✅ Keep in `~/.openclaw/` (local only)
- ✅ Use environment variables when possible
- ❌ Never commit to `newsDigestByXiaoYu` (public repo)
- ❌ Never paste in web chat (except this secure session)

---

### 2. GitHub Security

**Current Exposure Check:**
- [x] PAT embedded in git remote URL (necessary for no-VPN setup)
- [x] Risk: Command output logs may expose token
- [x] Mitigation: Use GitHub API for sensitive operations

**Required Actions:**
1. Monitor GitHub PAT access: https://github.com/settings/tokens
2. If suspicious activity detected → Revoke immediately
3. Regenerate new token and update local git remote

**Git Remote Security:**
```bash
# Current (has embedded token):
origin https://zizaiqizi:github_pat_xxx@github.com/...

# Safer alternative (use credential helper):
git remote set-url origin https://github.com/zizaiqizi/newsDigestByXiaoYu.git
git config credential.helper store  # Cache credentials locally
```

---

### 3. Network Security

**Threats:**
- Port scanning on OpenClaw gateway (port 18789)
- Unauthorized access attempts
- Man-in-the-middle attacks

**Current Protections:**
- Gateway bind: `loopback` (localhost only) ✅
- Auth token required ✅
- Tailscale: OFF (reduces attack surface) ✅

**Monitoring Commands:**
```powershell
# Check for suspicious connections
netstat -an | findstr "18789"

# Monitor failed auth attempts
# (Check OpenClaw logs for unauthorized access)
```

---

### 4. API Key Security

**Kimi API Key Management:**
- Location: `~/.openclaw/agents/main/agent/auth-profiles.json`
- Permissions: Read/write restricted
- Rotation: Every 90 days recommended

**Cost Monitoring:**
- Track usage daily
- Alert if sudden spike (possible key theft)
- Set spending limits if provider supports it

---

### 5. Email Account Security

**QQ Email (zizaiqizizhangxiqi@qq.com):**
- Enable 2FA if available
- Monitor login locations
- SMTP auth code is SINGLE USE per session conceptually

**Warning Signs:**
- Unexpected login notifications
- Sent folder has emails you didn't send
- SMTP failures (someone else using credentials)

---

### 6. File System Security

**Sensitive Files Location:**
```
C:\Users\张张乔\.openclaw\                # Config dir
├── openclaw.json                        # Gateway config (has channel creds)
├── agents\main\agent\auth-profiles.json # API keys
├── workspace\                           # Working files
│   └── newsDigestByXiaoYu\              # PUBLIC - be careful
│       ├── send-email.ps1               # Has SMTP password - DANGER
│       └── ...
└── Documents\xiaoyuzhou_importInfo.txt  # Master creds file - CRITICAL
```

**Action Required:**
Move SMTP credentials out of public repo:
```powershell
# Create local-only config
$config = @{
    SmtpPassword = "akgxxrbxcfkeiaec"
    GithubToken = "github_pat_..."
} | ConvertTo-Json

$config | Out-File -FilePath "$env:USERPROFILE\.openclaw\secrets.json" -Encoding UTF8

# Update send-email.ps1 to read from local file instead of hardcoded
```

---

## 🛡️ Defensive Measures

### Daily Security Check (Automated)

Create script: `security-check.ps1`
```powershell
# Check for credential exposure in git
cd newsDigestByXiaoYu
git log --all --source --remotes -- "*.ps1" | Select-String "password|token|key" -CaseSensitive

# Check for uncommitted sensitive files
git status

# Verify GitHub token scope
curl -H "Authorization: token $(git remote get-url origin | Select-String 'github_pat_[^@]+' | % { $_.Matches[0].Value })" https://api.github.com/user

# Check network listeners
netstat -an | findstr "18789"
```

### Incident Response Plan

**If credentials leaked:**
1. **IMMEDIATE (within 5 minutes):**
   - Revoke GitHub PAT: https://github.com/settings/tokens
   - Change QQ email password
   - Regenerate SMTP auth code

2. **WITHIN 1 HOUR:**
   - Generate new Kimi API key
   - Update all local configs
   - Audit GitHub repo access logs

3. **WITHIN 24 HOURS:**
   - Review all commits for exposed data
   - Force push to remove sensitive commits (if in history)
   - Notify team members

---

## 🔍 Threat Monitoring

### Known Attack Vectors

1. **Credential Harvesting**
   - Malicious browser extensions
   - Clipboard stealers
   - Shoulder surfing (screenshots in public)

2. **Social Engineering**
   - Fake support requests
   - Urgent "verify your account" messages
   - Impersonation

3. **Technical Attacks**
   - Port scanning
   - Brute force on gateway
   - Dependency confusion (npm packages)

### Monitoring Checklist

- [ ] Weekly: Review GitHub access logs
- [ ] Weekly: Check email login history
- [ ] Daily: Monitor API usage/costs
- [ ] Daily: Review OpenClaw gateway logs for unauthorized attempts

---

## 📋 Security Tasks

### URGENT (Do This Week)

- [ ] Move SMTP password out of `send-email.ps1` into local-only config
- [ ] Review `newsDigestByXiaoYu` commit history for exposed secrets
- [ ] Enable 2FA on QQ email if not already done
- [ ] Document incident response contacts

### HIGH PRIORITY (Do This Month)

- [ ] Set up automated security scanning
- [ ] Create backup procedure for critical credentials
- [ ] Establish secure communication channel for emergencies
- [ ] Review and rotate all API keys

### ONGOING

- [ ] Daily cost monitoring
- [ ] Weekly access log review
- [ ] Monthly security assessment

---

## 🚨 Emergency Contacts

**If compromised:**
1. Rangel: [Your phone/secure channel]
2. XiaoYuZhou: [This session - if still active]
3. GitHub Support: https://support.github.com

---

## 📚 Security Resources

- GitHub Token Security: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure
- OpenClaw Security: [Local docs]
- Kimi API Security: [Provider documentation]

---

**Remember: Security is not a one-time task. It's a continuous process.**

*Next review: February 11, 2026*
