# 🔴 Code Red Worm (2001)

> **The fileless worm that infected 359,000 servers in 14 hours**

<div align="center">

![Code Red](https://img.shields.io/badge/Code%20Red-Worm-red?style=for-the-badge&logo=virus)
[![Release Date](https://img.shields.io/badge/Released-July%202001-red?style=flat-square)]()
[![Type](https://img.shields.io/badge/Type-Fileless%20Memory%20Worm-orange?style=flat-square)]()
[![Speed](https://img.shields.io/badge/Speed-359K%20in%2014hrs-red?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 First Seen | July 2001 |
| 👤 Author | Unknown |
| 💥 Infected | 359,000+ servers in 14 hours |
| 💰 Damage | ~$2.6 billion USD |
| 🌍 Spread | Global, 14 hours to peak |
| 🖥️ Platform | Windows 2000 / IIS 4.0 & 5.0 |
| 🔓 Exploit | CVE-2001-0500 / CVE-2001-0506 |
| 🧠 Unique | **Fileless** — lived entirely in memory |

---

## 🔍 Attack Vector

```
┌─────────────────────────────────────────────────────────────┐
│                    INFECTION CHAIN                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  🌐 HTTP GET to random IPs on port 80                       │
│     │                                                       │
│     ▼                                                       │
│  📄 GET /default.ida?[AAAA...shellcode...AAAA]             │
│     │                                                       │
│     ▼                                                       │
│  💥 Buffer overflow in idq.dll (Indexing Service ISAPI)     │
│     │                                                       │
│     ▼                                                       │
│  🧠 Worm executes IN MEMORY — no files written to disk      │
│     │                                                       │
│     ├─ 100 threads scanning random IPs (98 internet, 2 local)│
│     ├─ Phase 1 (Days 1-19): Replicate as fast as possible   │
│     ├─ Phase 2 (Days 20-27): DDoS White House website      │
│     └─ Phase 3 (Day 28+): Dormant (still in memory)         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### Phase 1: IIS Buffer Overflow (CVE-2001-0500)

```
GET /default.ida?[270 bytes of A's][shellcode][300 bytes of A's]
```

The query string overflowed a buffer in `idq.dll`, overwriting the return address to redirect execution to shellcode embedded in the HTTP request.

### Phase 2: In-Memory Replication

**Unique characteristic:** Code Red wrote NO files to disk. The entire worm (~4KB) fit in a single HTTP request.

```
100 threads:
  - 2 threads: scan local network subnets
  - 98 threads: scan random internet IPs
```

This multi-threaded approach made it spread at ~2,000 new servers per minute.

### Phase 3: Time-Based Behavior

| Phase | Days | Behavior |
|-------|------|----------|
| Replication | 1-19 | Spread as fast as possible |
| DDoS | 20-27 | Flood www.whitehouse.gov |
| Dormant | 28+ | Stay in memory, do nothing |

### Phase 4: DDoS Attack

Target: `198.133.219.25` (www.whitehouse.gov)

```
359,000 infected servers × 100+ requests each = 35.9M+ requests
```

### Phase 5: Website Defacement

```
"HELLO! Welcome to http://www.worm.com!"
```

Defaced infected servers' websites — visible indicator of infection.

### Phase 6: Memory Persistence

**Why this was significant:**
- No files = harder to detect with file-based antivirus
- No forensic traces on disk
- Pioneered "living off the land" techniques
- Inspired future fileless malware (PowerShell, WMI)

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`code_red_educational.vbs`](code_red_educational.vbs) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |

---

## ⚙️ How to Run

```bash
cd code_red_worm
run_simulation.bat
```

Or directly:
```bash
cscript //nologo code_red_educational.vbs
```

---

## 📊 Sample Output

```
=== PHASE 1: IIS Buffer Overflow Exploit Simulation ===
CVE: CVE-2001-0500 / CVE-2001-0506
EXPLOIT URL PATTERN:
  GET /default.ida?[AAAA...shellcode...AAAA] HTTP/1.1
NOTE: The entire worm fit in a single HTTP request (~4KB)

=== PHASE 2: In-Memory Replication Simulation ===
SIMULATED: Would use 100 threads for rapid propagation
NOTE: ~359,000 servers infected in just 14 hours
NOTE: Peak infection rate was ~2,000 new servers per minute

=== PHASE 4: DDoS Attack Simulation ===
CALCULATED IMPACT:
  Infected servers: ~359,000
  Requests per server: 100
  Total requests: ~35,900,000
NOTE: DDoS phase never actually executed at full scale
```

---

## 🛡️ Vulnerabilities Exploited

| Vulnerability | Impact | Fixed |
|--------------|--------|-------|
| IIS buffer overflow | Remote code execution via HTTP | MS01-033 emergency patch |
| Unpatched servers | Patch available but not applied | Better patch management |
| Excessive IIS privileges | IIS ran with too many rights | Default configs hardened |
| No file requirement | Fileless = hard to detect | Memory-based detection tools |

---

## 📚 Further Reading

- [Microsoft MS01-033 Bulletin](https://docs.microsoft.com/en-us/security-updates/securitybulletins/2001/ms01-033)
- [CERT Advisory CA-2001-19](https://www.cert.org)
- [Code Red Analysis (CACM)](https://cacm.acm.org)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — All destructive operations simulated

</div>
