# 🩸 Heartbleed Vulnerability (2014)

> **The one missing line of code that exposed half the internet's private data**

<div align="center">

![Heartbleed](https://img.shields.io/badge/Heartbleed-Information%20Disclosure-red?style=for-the-badge&logo=security)
[![CVE](https://img.shields.io/badge/CVE--2014--0160-Critical-red?style=flat-square)]()
[![Discovered](https://img.shields.io/badge/Discovered-April%207%2C%202014-lightgrey?style=flat-square)]()
[![Affected](https://img.shields.io/badge/Affected-66%25%20of%20internet%20servers-orange?style=flat-square)]()

</div>

---

## 📊 Quick Stats

| Attribute | Value |
|-----------|-------|
| 📅 Discovered | April 7, 2014 |
| 👤 Discovered By | Neel Mehta (Google) + Codenomicon (independently) |
| 🖥️ Platform | OpenSSL 1.0.1 through 1.0.1f |
| 💥 Affected | ~66% of all internet servers, 500,000+ certificates |
| 🔓 Type | Buffer over-read / Information disclosure |
| 🛠️ Fix | OpenSSL 1.0.1g (one line of code) |

---

## 🔍 How It Worked

```
┌─────────────────────────────────────────────────────────────┐
│                    HEARTBLEED ATTACK FLOW                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  🔗 TLS Heartbeat Protocol (RFC 6520)                       │
│     │  Purpose: Keep TLS connection alive                   │
│     │                                                       │
│     ▼                                                       │
│  💬 Client sends: "PING" + claims length = 65535 (64KB)     │
│     │  Actual payload: 4 bytes ("PING")                     │
│     │  Claimed length: 65535 bytes                          │
│     │  BUG: Server doesn't verify length matches payload    │
│     │                                                       │
│     ▼                                                       │
│  💾 Server reads 64KB from memory starting at "PING"        │
│     │  First 4 bytes: "PING" (the real payload)             │
│     │  Next 65531 bytes: WHATEVER IS IN SERVER MEMORY       │
│     │                                                       │
│     ▼                                                       │
│  📤 Server sends 64KB back to client                        │
│     │                                                       │
│     ├─ SSL private keys                                     │
│     ├─ User passwords                                       │
│     ├─ Session cookies                                      │
│     ├─ Database credentials                                 │
│     └─ Any data in server memory                            │
│                                                             │
│  🔁 Attacker repeats → extracts entire memory contents      │
│  🕵️  NO TRACE left in server logs                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧬 Technical Breakdown

### The Vulnerable Code (simplified C)

```c
int dtls1_process_heartbeat(SSL *s) {
    unsigned char *p = &s->s3->rrec.data[0];
    unsigned int hbtype = *p++;
    n2s(p, payload);        // ← Reads length from CLIENT (TRUSTED!)
    pl = p;

    // BUG: No check that payload matches actual data size!

    unsigned char *buffer = OPENSSL_malloc(payload + 16);
    bp = buffer;
    memcpy(bp, pl, payload);  // ← Copies payload bytes from memory
    // If client said 65535 but sent 4 bytes → leaks 65531 bytes of memory!

    dtls1_send_heartbeat(s, hbtype, buffer, payload);
}
```

### The Fix (one line added)

```c
    n2s(p, payload);
    if (payload + 16 > s->s3->rrec.length) return 0;  // ← BOUNDS CHECK
    memcpy(bp, pl, payload);  // Now safe
```

---

## 📁 Source Files

| File | Description |
|------|-------------|
| [`heartbleed_educational.vbs`](heartbleed_educational.vbs) | Annotated VBScript source code |
| [`run_simulation.bat`](run_simulation.bat) | Easy runner for safe simulation |

---

## ⚙️ How to Run

```bash
cd heartbleed_vuln
run_simulation.bat
```

Or directly:
```bash
cscript //nologo heartbleed_educational.vbs
```

---

## 🛡️ Impact

| Metric | Value |
|--------|-------|
| Servers affected | ~66% of internet (those running OpenSSL) |
| Certificates compromised | 500,000+ |
| Time to patch | Months for full internet adoption |
| Cost | Hundreds of millions in certificate reissuance |

### Major Victims
- Yahoo, Flickr, Imgur, OKCupid
- Government servers worldwide
- Hospitals, banks, ISPs
- IoT devices (many never patched)

---

## 📚 Further Reading

- [heartbleed.com](https://heartbleed.com)
- [CVE-2014-0160 Details](https://nvd.nist.gov/vuln/detail/CVE-2014-0160)
- [Google's Discovery Blog](https://security.googleblog.com)

---

<div align="center">

⚠️ **EDUCATIONAL ONLY** — This is a vulnerability demonstration, not malware

</div>
