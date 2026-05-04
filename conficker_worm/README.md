# 🐛 Conficker Worm (2008)

> **The worm that infected 15 million machines using a patched-but-ignored vulnerability**

<div align="center">

![Conficker](https://img.shields.io/badge/Conficker-Worm-red?style=for-the-badge&logo=virus)
[![Release Date](https://img.shields.io/badge/Released-November%202008-red?style=flat-square)]()
[![Alias](https://img.shields.io/badge/Alias-Downadup%20%7C%20Downup%20%7C%20Kido-lightgrey?style=flat-square)]()
[![Damage](https://img.shields.io/badge/Damage-%249%2B%20billion-orange?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 First Seen | November 2008 |
| 👤 Author | Unknown (state-level suspected) |
| 💥 Infected | 9-15 million computers across 190+ countries |
| 💰 Damage | $9+ billion USD |
| 🌍 Spread | Global, over months |
| 🖥️ Platform | Windows (MS08-067 vulnerability) |
| 📧 Propagation | SMB exploit, USB, password brute-force, P2P |
| 🏆 Bounty | $250,000 (unclaimed) |

---

## 🔍 Attack Vector

```
┌─────────────────────────────────────────────────────────────┐
│                    INFECTION CHAIN                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  💻 Entry Point (Multiple Vectors)                          │
│     │                                                       │
│     ├─ 1️⃣ MS08-067 exploit (port 445 SMB)                 │
│     ├─ 2️⃣ USB drive via autorun.inf                        │
│     └─ 3️⃣ SMB brute-force (weak passwords)                 │
│     │                                                       │
│     ▼                                                       │
│  🦠 Worm executes on target machine                         │
│     │                                                       │
│     ├─ 1️⃣ Disables security services (AV, Windows Update) │
│     ├─ 2️⃣ Generates 250+ DGA domains daily for C2         │
│     ├─ 3️⃣ Forms P2P botnet (variant C+)                   │
│     └─ 4️⃣ Downloads additional payloads                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### Phase 1: MS08-067 Exploit

```
CVE: CVE-2008-4250 | CVSS: 10.0 (Critical)
```

Buffer overflow in `netapi32.dll`'s `NetpwPathCanonicalize()` function. Allowed remote code execution without authentication — a "wormable" vulnerability.

> **Key fact:** The patch (MS08-067) was released in **October 2008**, a month BEFORE Conficker appeared. Most infections were on unpatched systems.

### Phase 2: Password Brute-Force via SMB

Built-in dictionary of ~3,000 common passwords. Attempted to authenticate to `ADMIN$` shares on network machines:

```
SAMPLE PASSWORDS: password, 123456, admin, letmein, welcome, ...
```

### Phase 3: USB Drive Infection

Created `autorun.inf` on removable drives:
```ini
[autorun]
open=runX.dll
shell\open\command=runX.dll
```

### Phase 4: Security Service Disabling

Targeted services: `wuauserv`, `BITS`, `wscsvc`, `SharedAccess`, plus AV products (Symantec, McAfee, Avast, AVG).

### Phase 5: Domain Generation Algorithm (DGA)

Generated 250 domains/day (variants B/C) or 50,000/day (variant D) for command & control. Security companies registered these domains to track infections globally.

### Phase 6: P2P Botnet (Variant C+)

Added peer-to-peer communication for resilience against domain takedowns. Infected machines maintained peer lists and exchanged C2 commands directly.

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`conficker_educational.vbs`](conficker_educational.vbs) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |

---

## ⚙️ How to Run

```bash
cd conficker_worm
run_simulation.bat
```

Or directly:
```bash
cscript //nologo conficker_educational.vbs
```

---

## 📊 Sample Output

```
=== PHASE 1: MS08-067 Exploit Simulation ===
TARGET: Windows Server Service (netapi32.dll)
CVE: CVE-2008-4250
SIMULATED: Would scan network for port 445 (SMB)
NOTE: MS08-067 patch was available BEFORE Conficker spread

=== PHASE 5: Domain Generation Algorithm Simulation ===
SIMULATED: Would generate 250 domains per day (Variant B/C)
SAMPLE GENERATED DOMAINS: a8f3k2j9.com, x7m4p1q6.net, b2n5r8t3.org

=== PHASE 6: P2P Botnet Simulation ===
SIMULATED: Would listen on UDP ports for P2P connections
NOTE: P2P made Conficker resilient to domain takedowns
```

---

## 🛡️ Vulnerabilities Exploited

| Vulnerability | Impact | Fixed |
|--------------|--------|-------|
| Unpatched systems | MS08-067 ignored by many | Patch management programs |
| Weak passwords | Admin accounts with dictionary passwords | Password policies |
| USB autorun | Automatic execution from removable media | Autorun disabled Win7+ |
| DGA C2 | Hard-to-block infrastructure | Domain registration monitoring |
| P2P network | Resilient to takedowns | Court order disruption |

---

## 📚 Further Reading

- [Conficker Working Group](https://www.confickerworkinggroup.org)
- [Microsoft MS08-067 Bulletin](https://docs.microsoft.com/en-us/security-updates/securitybulletins/2008/ms08-067)
- [The Conficker Cabal](https://www.icir.org/vernon/conficker/)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — All destructive operations simulated

</div>
