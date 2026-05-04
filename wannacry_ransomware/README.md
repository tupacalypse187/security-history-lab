# 🔒 WannaCry Ransomware (2017)

> **The ransomware that shut down the NHS — spread via leaked NSA exploit to 200K+ computers**

<div align="center">

![WannaCry](https://img.shields.io/badge/WannaCry-Ransomware-red?style=for-the-badge&logo=lock)
[![Release Date](https://img.shields.io/badge/Released-May%2012%2C%202017-red?style=flat-square)]()
[![Attribution](https://img.shields.io/badge/Attributed-North%20Korea%20(Lazarus)-lightgrey?style=flat-square)]()
[![Damage](https://img.shields.io/badge/Damage-%244--8%20billion-orange?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 First Seen | May 12, 2017 |
| 👤 Author | Attributed to North Korea (Lazarus Group) by US government |
| 💥 Infected | 200,000+ computers across 150 countries |
| 💰 Damage | $4-8 billion USD |
| 🖥️ Platform | Windows (exploiting EternalBlue / MS17-010) |
| 💰 Ransom | $300-600 Bitcoin per victim |
| 🛑 Kill Switch | Discovered by Marcus Hutchins (@MalwareTech) |
| 📧 Propagation | EternalBlue + SMB brute-force + DoublePulsar |

---

## 🔍 Infection Chain

```
┌─────────────────────────────────────────────────────────────┐
│                    INFECTION CHAIN                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  📧 Entry: Phishing email OR direct network scan            │
│     │                                                       │
│     ▼                                                       │
│  💥 EternalBlue exploit (CVE-2017-0144)                     │
│     │  SMBv1 buffer overflow (port 445)                     │
│     │                                                       │
│     ▼                                                       │
│  🔑 DoublePulsar backdoor installed                         │
│     │                                                       │
│     ▼                                                       │
│  🔐 Encrypt files: AES-128-CBC + RSA-2048                   │
│     │  Extension: .WNCRY                                     │
│     │                                                       │
│     ▼                                                       │
│  💰 Ransom note: $300-600 Bitcoin                           │
│     │                                                       │
│     ├─ Check kill switch domain                             │
│     ├─ If domain exists → EXIT (MalwareTech stopped it)     │
│     └─ Spread to other machines via EternalBlue              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### Phase 1: EternalBlue Exploit (MS17-010)

WannaCry used the EternalBlue exploit, allegedly developed by the NSA and leaked by the Shadow Brokers. It exploited a buffer overflow in SMBv1's `srv.sys` kernel driver.

```
CVE: CVE-2017-0144 | CVSS: 9.3 (Critical)
Patched: March 2017 — 2 months BEFORE WannaCry appeared
```

### Phase 2: Two-Layer Encryption

```
Layer 1: AES-128-CBC (symmetric, per-machine key)
Layer 2: RSA-2048 (encrypts the AES key with attacker's public key)
Result: Only attacker's private key can decrypt
```

This made decryption impossible without the attacker's private key — even if you recovered the AES key, it was RSA-encrypted.

### Phase 3: Ransom Note

Displayed `@WanaDecryptor@.exe` with Bitcoin payment demand:
- $300 initially
- $600 after 3 days
- Files deleted after 7 days

### Phase 4: Worm Propagation

Unlike typical ransomware, WannaCry spread automatically via EternalBlue, DoublePulsar, and SMB admin share brute-force.

### Phase 5: Kill Switch 🛑

WannaCry checked if `iuqerfsodp9ifjaposdfjhgosdfgja...` existed. If yes, it exited. Marcus Hutchins registered the domain for $10.69 and stopped global spread.

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`wannacry_educational.vbs`](wannacry_educational.vbs) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |

---

## ⚙️ How to Run

```bash
cd wannacry_ransomware
run_simulation.bat
```

Or directly:
```bash
cscript //nologo wannacry_educational.vbs
```

---

## 🛡️ Vulnerabilities Exploited

| Vulnerability | Impact | Fixed |
|--------------|--------|-------|
| EternalBlue (CVE-2017-0144) | Remote code execution via SMB | MS17-010 (March 2017) |
| SMBv1 protocol | Legacy protocol weaknesses | Deprecated in Win10 1709+ |
| Unpatched systems | Patch available but not applied | Emergency patch for XP/2003 |
| Admin share access | SMB brute-force with default creds | Network segmentation |

---

## 🏛️ Aftermath

- UK NHS severely impacted — 19,000+ appointments cancelled
- US formally attributed to North Korea (Lazarus Group)
- Marcus Hutchins later arrested by FBI (charges dropped)
- SMBv1 deprecated by Microsoft
- Estimated global damage: $4-8 billion

---

## 📚 Further Reading

- [Wikipedia: WannaCry](https://en.wikipedia.org/wiki/WannaCry)
- [MalwareTech Kill Switch Story](https://www.malwaretech.com)
- [US Attribution to North Korea](https://www.justice.gov)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — All destructive operations simulated

</div>
