# ☠️ NotPetya (2017)

> **The most destructive cyberattack in history — a wiper disguised as ransomware**

<div align="center">

![NotPetya](https://img.shields.io/badge/NotPetya-Wiper%20Attack-red?style=for-the-badge&logo=lock)
[![Release Date](https://img.shields.io/badge/Released-June%2027%2C%202017-red?style=flat-square)]()
[![Attribution](https://img.shields.io/badge/Attributed-Russian%20GRU-lightgrey?style=flat-square)]()
[![Damage](https://img.shields.io/badge/Damage-%2410%2B%20billion-red?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 First Seen | June 27, 2017 (one month after WannaCry) |
| 👤 Author | Attributed to Russian GRU by US, UK, EU, NATO, Australia |
| 🎯 Target | Ukrainian organizations (spread globally via supply chain) |
| 💥 Infected | Global — major corporations across multiple industries |
| 💰 Damage | $10+ billion USD (most costly cyberattack ever) |
| 🖥️ Platform | Windows (EternalBlue + EternalRomance + M.E.Doc supply chain) |
| 💀 Type | **Wiper** (data destruction disguised as ransomware) |
| 🔑 Decryption | **Impossible** — encryption was intentionally broken |

---

## 🔍 Infection Chain

```
┌─────────────────────────────────────────────────────────────┐
│                    INFECTION CHAIN                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  💉 SUPPLY CHAIN: Compromised M.E.Doc update (Ukraine)      │
│     │  Accounting software used by 400K+ organizations      │
│     │                                                       │
│     ▼                                                       │
│  🦠 NotPetya activates when user installs update            │
│     │                                                       │
│     ├─ Lateral Movement (5 methods):                        │
│     │  1. EternalBlue (CVE-2017-0144) - unpatched SMB       │
│     │  2. EternalRomance - patched SMB systems              │
│     │  3. Mimikatz - credential theft from LSASS            │
│     │  4. PsExec - legitimate admin tool abuse              │
│     │  5. WMI - remote code execution                       │
│     │                                                       │
│     ▼                                                       │
│  💀 Encrypt MBR (Master Boot Record)                        │
│     │  System cannot boot                                   │
│     │  Files encrypted with WRONG key (impossible to fix)   │
│     │                                                       │
│     ▼                                                       │
│  💰 Fake ransom note ($300 Bitcoin)                         │
│     │  Payment email quickly shut down                       │
│     │  Decryption was MATHEMATICALLY IMPOSSIBLE              │
│     └─ PURE DATA DESTRUCTION                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### Phase 1: Supply Chain Attack (M.E.Doc)

NotPetya compromised M.E.Doc, the most popular accounting software in Ukraine. The official update package was modified to include the malware. This was a **true supply chain attack** — bypassing all security controls because the malware came from a trusted vendor.

```
Impact: 400,000+ M.E.Doc users in Ukraine received infected update
```

### Phase 2: Five Lateral Movement Methods

| Method | Description | Unique Aspect |
|--------|-------------|---------------|
| EternalBlue | SMBv1 exploit (same as WannaCry) | Unpatched systems |
| EternalRomance | Alternative SMB exploits | Worked on PATCHED systems |
| Mimikatz | Credential theft from LSASS | Stole passwords from memory |
| PsExec | Legitimate admin tool | "Living off the land" |
| WMI | Remote code execution | "Living off the land" |

The combination of all five methods made NotPetya extremely effective at spreading through networks, even on patched systems.

### Phase 3: MBR Encryption (Destructive)

Unlike true ransomware, NotPetya's encryption was **intentionally designed to be irreversible**. The hardcoded key used for decryption was wrong, making recovery mathematically impossible.

### Phase 4: Fake Ransom Note

The ransom note was purely for misdirection. The payment email (`proton666@protonmail.com`) was shut down quickly. No victim who paid received their files back.

### Phase 5: Global Impact

Major victims:

| Company | Industry | Estimated Damage |
|---------|----------|-----------------|
| Maersk | Shipping | $300M+ |
| Merck | Pharma | $870M+ |
| FedEx/TNT | Logistics | $400M+ |
| Mondelez | Food (Oreo/Cadbury) | $196M+ |
| Saint-Gobain | Construction | $379M+ |

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`notpetya_educational.vbs`](notpetya_educational.vbs) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |

---

## ⚙️ How to Run

```bash
cd notpetya_ransomware
run_simulation.bat
```

Or directly:
```bash
cscript //nologo notpetya_educational.vbs
```

---

## 🛡️ Key Distinction: Wiper vs. Ransomware

| Feature | Ransomware | NotPetya |
|---------|-----------|----------|
| Goal | Profit (payment = decryption) | Destruction |
| Encryption | Reversible with key | Intentionally broken |
| Payment | Functional (usually) | Impossible (email shut down) |
| Recovery | Possible with key | **Impossible** |
| Attribution | Criminal groups | State actor (Russian GRU) |

---

## 🏛️ Aftermath

- US, UK, EU, Australia, NATO all attributed to Russian GRU
- Maersk installed 4,000+ new servers to recover
- Merck recovered $1.4B through insurance (first major cyber insurance claim)
- Led to Executive Order 14028 on supply chain security
- Called "most destructive cyberattack in history" at the time

---

## 📚 Further Reading

- [Wired: The Untold Story of NotPetya](https://www.wired.com/story/notpetya-cyberattack-ukraine-russia-code-crashed-the-world/)
- [US Government Attribution](https://www.whitehouse.gov)
- [FireEye NotPetya Analysis](https://www.fireeye.com)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — All destructive operations simulated

</div>
