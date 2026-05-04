# 🧠 Brain Virus (1986)

> **The very first PC virus — created by two brothers in Pakistan to fight software piracy**

<div align="center">

![Brain](https://img.shields.io/badge/Brain-Boot%20Sector%20Virus-green?style=for-the-badge&logo=virus)
[![Release Date](https://img.shields.io/badge/Released-January%201986-green?style=flat-square)]()
[![Author](https://img.shields.io/badge/Authors-Basit%20%26%20Amjad%20Farooq%20Alvi-lightgrey?style=flat-square)]()
[![First](https://img.shields.io/badge/First-PC%20Virus%20Ever-blue?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 First Seen | January 1986 |
| 👤 Authors | Basit & Amjad Farooq Alvi (Lahore, Pakistan) |
| 🖥️ Platform | IBM PC compatible (DOS), 5.25" & 3.5" floppy disks |
| 🌍 Spread | Global (first international virus) |
| 💥 Infected | Thousands of computers worldwide |
| 📧 Propagation | Infected floppy disks exchanged between users |
| 🏛️ Significance | **First known PC virus in history** |

---

## 🔍 Infection Chain

```
┌─────────────────────────────────────────────────────────────┐
│                    INFECTION CHAIN                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  💾 User inserts infected floppy disk                       │
│     │                                                       │
│     ▼                                                       │
│  🔌 System boots from infected disk                         │
│     │                                                       │
│     ▼                                                       │
│  🧠 Brain virus loads into memory (before DOS)              │
│     │                                                       │
│     ├─ Hooks INT 13h (BIOS disk interrupt)                 │
│     ├─ Infects any clean disk inserted into drive            │
│     ├─ Stealth: Returns clean boot sector when read          │
│     └─ Marks virus sectors as "bad" in FAT                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### Phase 1: Boot Sector Infection

Brain replaced the 512-byte boot sector of floppy disks:

```
Track 0, Sector 1: Brain virus code (512 bytes)
Track 0, Sector 3: Original boot sector (relocated here)
Signature: "Brain" at offset 3
```

### Phase 2: INT 13h Hook (Memory-Resident)

Once booted, Brain hooked BIOS Interrupt 13h to intercept all disk operations. This allowed it to infect every disk accessed and hide its presence.

### Phase 3: Stealth Mechanism

When any program read the infected boot sector, Brain intercepted the read and returned the **original clean** boot sector from Track 0, Sector 3. Users and early antivirus tools couldn't detect the infection.

### Phase 4: Bad Sector Marking

Brain marked its sectors as "bad" in the File Allocation Table (FAT), preventing the OS from overwriting the virus with file data. Users noticed a few bad sectors but attributed it to disk damage.

### Phase 5: The Brain Signature

Embedded in every infected disk:

```
Welcome to the Dungeon
(c) 1986 Basit & Amjads (pvt) Ltd.
12-KM, Main Boulevard, Gulberg III, LAHORE-PAKISTAN
Phone: +92-42-833439, 833440
Beware of this VIRUS..... Contact us for vaccination
```

### Phase 6: Accidental Global Spread

Brain was designed to stay in Pakistan, but infected disks traveled internationally through software piracy, personal travel, and business exchanges. It became the **first global computer virus**.

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`brain_educational.vbs`](brain_educational.vbs) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |

---

## ⚙️ How to Run

```bash
cd brain_virus
run_simulation.bat
```

Or directly:
```bash
cscript //nologo brain_educational.vbs
```

---

## 🛡️ Historical Significance

| First | Brain Introduced |
|-------|-----------------|
| First PC virus | Boot sector infection technique |
| First stealth malware | INT 13h interception to hide |
| First international virus | Global spread via floppy exchange |
| First "calling card" virus | Embedded creator contact info |
| First memory-resident virus | Hooked BIOS interrupt |

---

## 📚 Further Reading

- [Wikipedia: Brain (computer virus)](https://en.wikipedia.org/wiki/Brain_(computer_virus))
- [The Amjad Brothers Story](https://www.wired.com)
- [First PC Virus Timeline](https://www.computerhistory.org)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — All destructive operations simulated

</div>
