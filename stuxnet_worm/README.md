# ☢️ Stuxnet Worm (2010)

> **The world's first cyberweapon — caused physical damage to Iran's nuclear program**

<div align="center">

![Stuxnet](https://img.shields.io/badge/Stuxnet-Cyberweapon-red?style=for-the-badge&logo=virus)
[![Release Date](https://img.shields.io/badge/Discovered-June%202010-red?style=flat-square)]()
[![Author](https://img.shields.io/badge/Author-State--sponsored%20(attributed)-lightgrey?style=flat-square)]()
[![Impact](https://img.shields.io/badge/Impact-Delayed%20nuclear%20program%201--2yrs-orange?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 First Discovered | June 2010 (by VirusBlokAda) |
| 👤 Author | Widely attributed to US/Israel (Operation Olympic Games) |
| 🎯 Target | Iran's Natanz uranium enrichment facility |
| 💥 Infected | 100,000+ machines (but ONLY ~1,000 PLCs were targets) |
| 🖥️ Platform | Windows + Siemens PLCs (SCADA systems) |
| 🔓 Zero-Days Used | **4** (LNK, Print Spooler, STEP 7, MS08-067) |
| 📧 Propagation | USB, network, SMB, Print Spooler |
| 🏭 Unique | First malware to cause **physical damage** |

---

## 🔍 Attack Vector

```
┌─────────────────────────────────────────────────────────────┐
│                    INFECTION CHAIN                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  💾 USB Drive (deliberate introduction to facility)         │
│     │                                                       │
│     ▼                                                       │
│  📁 LNK exploit (CVE-2010-2568) — zero-click, no interaction│
│     │                                                       │
│     ▼                                                       │
│  🔑 Privilege escalation via Print Spooler (CVE-2010-2772)  │
│     │                                                       │
│     ▼                                                       │
│  📜 Stolen code-signing certs (Realtek, JMicron)            │
│     │                                                       │
│     ▼                                                       │
│  🔍 Search for Siemens STEP 7 + specific PLCs               │
│     │                                                       │
│     ├─ Found target PLCs? ──► Modify centrifuge code       │
│     │                    ──► Spoof sensor readings          │
│     │                                                       │
│     └─ Not target? ──► Spread to more machines              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### Phase 1: LNK File Exploit (CVE-2010-2568)

```
SEVERITY: Critical — no user interaction required
```

Malicious `.LNK` file on USB triggered exploit when **viewed** in Windows Explorer — no double-click needed. The shortcut pointed to a DLL containing shellcode in its icon resource.

### Phase 2: Privilege Escalation (CVE-2010-2772)

Exploited Print Spooler to install kernel-mode rootkit driver (`mrxcls.sys`). Driver hid Stuxnet files, registry keys, and processes from detection.

### Phase 3: Network Propagation

Used both MS08-067 (same as Conficker) and Print Spooler exploits for lateral movement.

### Phase 4: PLC Targeting ⚡

This is what made Stuxnet unique:

1. Located Siemens STEP 7 software
2. Identified S7-315/S7-417 PLCs
3. Checked frequency converter (1000-1066 Hz) — **specific to Iran's centrifuges**
4. Modified PLC to spin centrifuges at dangerous speeds
5. Replayed normal sensor readings to hide the sabotage

### Phase 5: Sensor Data Spoofing

Recorded normal sensor readings and played them back while actual PLC caused damage. Operators saw "normal" while centrifuges were being destroyed.

```
SPOOFED VALUES:
  Centrifuge Speed: 1000 Hz (actual: 1066 Hz)
  Pressure: Normal (actual: Elevated)
  Temperature: 75°C (actual: 95°C)
```

### Phase 6: Self-Preservation

Built-in kill date of June 24, 2012. After this date, the worm would self-destruct.

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`stuxnet_educational.vbs`](stuxnet_educational.vbs) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |

---

## ⚙️ How to Run

```bash
cd stuxnet_worm
run_simulation.bat
```

Or directly:
```bash
cscript //nologo stuxnet_educational.vbs
```

---

## 📊 Sample Output

```
=== PHASE 1: LNK File Exploit Simulation ===
CVE: CVE-2010-2568
SEVERITY: Critical - no user interaction required
SIMULATED: Would create malicious .LNK file on USB drive
NOTE: Simply opening the USB drive folder in Explorer was enough

=== PHASE 4: PLC Targeting Simulation ===
TARGET: Siemens S7-300/S7-400 PLCs
SIMULATED: Would modify centrifuge code to cause damage
  1. Increase centrifuge speed to 1066 Hz (normal: 1000 Hz)
  2. Hold for 15 minutes, then return to normal
  3. Repeat cycle to cause gradual physical damage
  4. Replay normal sensor readings to operators

=== PHASE 5: Sensor Data Spoofing ===
SIMULATED: Would replay recorded data to SCADA interface
NOTE: This is why Stuxnet wasn't discovered for months
```

---

## 🛡️ Vulnerabilities Exploited

| Vulnerability | Type | Fixed |
|--------------|------|-------|
| CVE-2010-2568 (LNK) | Zero-day, no-click | Emergency patch |
| CVE-2010-2772 (Spooler) | Zero-day privilege escalation | Emergency patch |
| CVE-2010-1233 (STEP 7) | PLC project file infection | Siemens patch |
| CVE-2008-4250 (MS08-067) | Network propagation | Patched 2008 |
| Stolen code-signing certs | Made drivers appear legitimate | Certificates revoked |

---

## 🏛️ Attribution & Impact

- Widely attributed to **US/Israel** under **Operation Olympic Games**
- Iran's nuclear program **delayed 1-2 years**
- Led to creation of **IEC 62443** ICS security standards
- First known use of **zero-day exploits in a cyberweapon**
- Inspired modern **SCADA/ICS security** industry

---

## 📚 Further Reading

- [Symantec Stuxnet Analysis](https://www.symantec.com/stuxnet)
- [IEEE Spectrum: Stuxnet](https://spectrum.ieee.org/stuxnet)
- [New York Times Coverage](https://www.nytimes.com)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — All destructive operations simulated

</div>
