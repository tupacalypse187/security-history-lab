' ============================================================================
' EDUCATIONAL RECREATION - WannaCry Ransomware (2017)
' ============================================================================
' ALIAS: WannaCry, WanaCrypt0r, WCry, WannaCrypt
' FIRST SEEN: May 12, 2017
' TYPE: Ransomware + Worm (hybrid)
' PLATFORM: Windows (exploiting EternalBlue / MS17-010)
' IMPACT: 200,000+ computers across 150 countries in first week
'
' ⚠️  EDUCATIONAL PURPOSE ONLY - DO NOT EXECUTE ⚠️
' ============================================================================
'
' HOW WannaCry WORKED (High-Level Overview):
' ==========================================
' 1. EXPLOITED EternalBlue (NSA leak) - SMBv1 vulnerability (MS17-010)
' 2. ENCRYPTED files using RSA-2048 + AES-128-CBC
' 3. DEMANDED $300-600 in Bitcoin payment
' 4. SPREAD like a worm via EternalBlue + DoublePulsar backdoor
' 5. KILL SWITCH: Domain "iuqerfsodp9ifjaposdfjhgosdfgja..." stopped spread
' 6. DEVASTATED UK NHS, FedEx, Renault, Telefónica, and more
'
' TECHNICAL BREAKDOWN:
' ===================
' WannaCry combined ransomware (encryption) with worm propagation (network spread).
' This recreation demonstrates the mechanisms with SAFETY MODIFICATIONS:
' - EternalBlue exploitation (SIMULATED - no actual network scanning)
' - File encryption (SIMULATED - no actual file modification)
' - Bitcoin payment demand (SIMULATED - no actual wallet)
' - Kill switch domain (SIMULATED - no actual DNS registration)
'
' ============================================================================

On Error Resume Next

' ============================================================================
' PHASE 1: EternalBlue Exploit (MS17-010)
' ============================================================================
' WannaCry used the EternalBlue exploit, allegedly developed by the NSA
' and leaked by the Shadow Brokers hacking group. It targeted SMBv1.
'
' CVE: CVE-2017-0144
' CVSS: 9.3 (Critical)
' Patched: March 2017 (MS17-010) — 2 months before WannaCry
' ============================================================================

Sub ExploitEternalBlue()
    LogAction "=== PHASE 1: EternalBlue Exploit Simulation ==="
    LogAction "CVE: CVE-2017-0144 (EternalBlue)"
    LogAction "TARGET: Windows SMBv1 (Server Message Block protocol)"
    LogAction "PORT: 445 (SMB)"
    LogAction ""
    
    ' EternalBlue exploitation steps:
    ' 1. Connect to target on port 445
    ' 2. Negotiate SMB connection with specific dialect
    ' 3. Send crafted Tree Connect request with oversized buffer
    ' 4. Buffer overflow in srv.sys kernel driver
    ' 5. Shellcode executes in kernel mode (SYSTEM privileges)
    ' 6. Deploy DoublePulsar backdoor for payload delivery
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original exploit pattern:
    ' Set sock = CreateObject("MSWinsock.Winsock")
    ' sock.Connect targetIP, 445
    ' If sock.State = 7 Then
    '     ' Send SMB negotiate protocol
    '     ' Send SMB session setup
    '     ' Send crafted Tree Connect with overflow payload
    '     ' DoublePulsar backdoor installed on target
    '     ' WannaCry payload delivered via backdoor
    ' End If
    
    LogAction "SIMULATED: Would scan for port 445 (SMB) on network"
    LogAction "SIMULATED: Would negotiate SMB connection with target"
    LogAction "SIMULATED: Would send crafted Tree Connect with buffer overflow"
    LogAction "SIMULATED: Would trigger overflow in srv.sys kernel driver"
    LogAction "SIMULATED: Would install DoublePulsar backdoor"
    LogAction "SIMULATED: Would deliver WannaCry payload via backdoor"
    LogAction ""
    LogAction "NOTE: MS17-010 patch was available 2 months before WannaCry"
    LogAction "NOTE: EternalBlue was allegedly an NSA exploit leaked by Shadow Brokers"
    LogAction ""
End Sub

' ============================================================================
' PHASE 2: File Encryption (RSA-2048 + AES-128-CBC)
' ============================================================================
' WannaCry used a two-layer encryption scheme:
' 1. Generated AES-128 key for each victim machine
' 2. Encrypted AES key with attacker's RSA-2048 public key
' 3. Only the attacker's private key could decrypt the AES key
' 4. AES key used to encrypt all victim files
'
' This made decryption impossible without the private key
' ============================================================================

Sub EncryptFiles()
    Dim targetExtensions, fileCount
    Dim encryptionDetails
    
    LogAction "=== PHASE 2: File Encryption Simulation ==="
    LogAction ""
    
    ' Target file extensions - WannaCry encrypted these:
    targetExtensions = Array(".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", _
                             ".pdf", ".zip", ".rar", ".jpg", ".jpeg", ".png", _
                             ".mp3", ".mp4", ".avi", ".mdb", ".accdb", _
                             ".sql", ".bak", ".csv", ".rtf")
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original encryption pattern:
    ' 1. Generate random AES-128 key for this machine
    ' 2. Encrypt AES key with attacker's RSA-2048 public key
    ' 3. Save encrypted AES key as: files.wnry
    ' 4. For each target file:
    '    a. Read file contents
    '    b. Encrypt with AES-128-CBC
    '    c. Write encrypted file as: original.ext.WNCRY
    '    d. Delete original file
    '    e. Write encrypted key to file: @WanaDecryptor@.exe
    
    LogAction "ENCRYPTION ALGORITHM:"
    LogAction "  Layer 1: AES-128-CBC (symmetric, per-machine key)"
    LogAction "  Layer 2: RSA-2048 (asymmetric, encrypts the AES key)"
    LogAction "  Result: Only attacker's private key can decrypt"
    LogAction ""
    LogAction "SIMULATED: Would encrypt files with these extensions:"
    fileCount = 0
    Dim ext
    For Each ext In targetExtensions
        fileCount = fileCount + 1
        LogAction "  " & ext
    Next
    LogAction ""
    LogAction "SIMULATED: Encrypted files would be renamed: file.ext.WNCRY"
    LogAction "SIMULATED: Original files would be deleted after encryption"
    LogAction "SIMULATED: Encryption key stored in: files.wnry (RSA-encrypted)"
    LogAction ""
    LogAction "NOTE: RSA-2048 means decryption is computationally infeasible"
    LogAction "NOTE: Without the private key, recovery requires brute force (impractical)"
    LogAction ""
End Sub

' ============================================================================
' PHASE 3: Ransom Note
' ============================================================================
' After encryption, WannaCry displayed a ransom note demanding
' Bitcoin payment with a countdown timer.
' ============================================================================

Sub DisplayRansomNote()
    LogAction "=== PHASE 3: Ransom Note ==="
    LogAction ""
    
    LogAction "WannaCry displayed this message:"
    LogAction "--------------------------------------------------"
    LogAction "  Ooops, your files have been encrypted!"
    LogAction ""
    LogAction "  What happened to your files?"
    LogAction "  - All of your files are encrypted with AES-128-CBC + RSA-2048"
    LogAction "  - You can only decrypt with our private key"
    LogAction ""
    LogAction "  How to pay?"
    LogAction "  - Send $300 USD in Bitcoin to: [wallet address]"
    LogAction "  - Payment increases to $600 after 3 days"
    LogAction "  - All files deleted after 7 days without payment"
    LogAction ""
    LogAction "  How to pay? (Instructions)"
    LogAction "  1. Create Bitcoin wallet"
    LogAction "  2. Send $300 to address: 115p7UMMjooj1iannh96g4zZuZ..."
    LogAction "  3. Wait for decryption tool"
    LogAction "--------------------------------------------------"
    LogAction ""
    LogAction "NOTE: Bitcoin addresses were unique per victim"
    LogAction "NOTE: Payment didn't guarantee decryption"
    LogAction "NOTE: Many victims paid and didn't get their files back"
    LogAction ""
End Sub

' ============================================================================
' PHASE 4: Worm Propagation
' ============================================================================
' Unlike typical ransomware, WannaCry spread automatically via:
' 1. EternalBlue exploit (port 445)
' 2. DoublePulsar backdoor (if already installed)
' 3. SMB brute-force with hardcoded credentials
' ============================================================================

Sub WormPropagation()
    LogAction "=== PHASE 4: Worm Propagation Simulation ==="
    LogAction ""
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original propagation pattern:
    ' WannaCry had multiple spread mechanisms:
    '
    ' Method 1: EternalBlue
    '   - Scan random IPs for port 445
    '   - Exploit MS17-010 vulnerability
    '   - Install DoublePulsar + deliver payload
    '
    ' Method 2: SMB Admin Shares
    '   - Attempt connection to ADMIN$, C$, IPC$
    '   - Use hardcoded credentials:
    '     Username: admin, Password: password
    '     Username: administrator, Password: (blank)
    '     etc.
    '   - If successful, copy Wannacry to target and execute
    
    LogAction "SPREAD METHODS (simulated):"
    LogAction "  1. EternalBlue exploit (port 445)"
    LogAction "  2. DoublePulsar backdoor (if present)"
    LogAction "  3. SMB admin share brute-force"
    LogAction ""
    LogAction "SIMULATED: Would scan random IPs for port 445"
    LogAction "SIMULATED: Would attempt SMB authentication with default passwords"
    LogAction "SIMULATED: Would copy payload to target via admin shares"
    LogAction ""
    LogAction "NOTE: ~200,000 computers infected in first week"
    LogAction "NOTE: Spread to 150+ countries within days"
    LogAction ""
End Sub

' ============================================================================
' PHASE 5: Kill Switch
' ============================================================================
' WannaCry contained a hardcoded domain check. If the domain existed,
' the malware would NOT execute. This was discovered by Marcus Hutchins
' (MalwareTech), who registered the domain and stopped the spread.
' ============================================================================

Sub CheckKillSwitch()
    Dim killSwitchDomain
    
    LogAction "=== PHASE 5: Kill Switch ==="
    LogAction ""
    
    killSwitchDomain = "iuqerfsodp9ifjaposdfjhgosdfgja..."
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original kill switch pattern:
    ' The malware performed this check early in execution:
    ' If DomainExists(killSwitchDomain) Then
    '     ExitProcess ' Kill switch activated - malware exits
    ' End If
    '
    ' Marcus Hutchins (MalwareTech) noticed the domain in the binary,
    ' registered it for $10.69, and the worm stopped spreading.
    
    LogAction "KILL SWITCH DOMAIN: " & killSwitchDomain
    LogAction "MECHANISM: If domain exists -> malware exits immediately"
    LogAction "DISCOVERED BY: Marcus Hutchins (@MalwareTech)"
    LogAction ""
    LogAction "SEQUENCE OF EVENTS:"
    LogAction "  1. Hutchins analyzed WannaCry binary"
    LogAction "  2. Found hardcoded domain check"
    LogAction "  3. Registered domain for $10.69"
    LogAction "  4. WannaCry stopped spreading globally"
    LogAction ""
    LogAction "NOTE: Hutchins was later arrested by FBI (charges dropped)"
    LogAction "NOTE: This is one of the most famous malware analysis stories"
    LogAction ""
End Sub

' ============================================================================
' HELPER: Logging Function
' ============================================================================
Sub LogAction(message)
    Dim fso, logFile, logPath
    
    logPath = "wannacry_educational_log.txt"
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set logFile = fso.OpenTextFile(logPath, 8, True)
    logFile.WriteLine "[" & Now & "] " & message
    logFile.Close
End Sub

' ============================================================================
' MAIN EXECUTION
' ============================================================================
Sub Main()
    LogAction "============================================"
    LogAction "EDUCATIONAL WannaCry RANSOMWARE DEMONSTRATION"
    LogAction "Date: " & Now
    LogAction "============================================"
    LogAction ""
    
    Call ExploitEternalBlue()
    Call EncryptFiles()
    Call DisplayRansomNote()
    Call WormPropagation()
    Call CheckKillSwitch()
    
    LogAction "============================================"
    LogAction "DEMONSTRATION COMPLETE"
    LogAction "No actual harm was done - this is educational"
    LogAction "============================================"
End Sub

' Execute
Call Main()

' ============================================================================
' KEY VULNERABILITIES EXPLOITED:
' =============================
' 1. EternalBlue (CVE-2017-0144): SMBv1 buffer overflow (NSA leak)
' 2. UNPATCHED SYSTEMS: MS17-010 patch available 2 months prior
' 3. SMB ADMIN SHARES: Default credentials and admin$ access
' 4. SMBv1 PROTOCOL: Legacy protocol with known weaknesses
'
' AFTERMATH & RESPONSE:
' ====================
' 1. Microsoft released emergency out-of-band patch for XP/2003
' 2. UK NHS severely impacted - cancelled 19,000+ appointments
' 3. Marcus Hutchins (MalwareTech) discovered kill switch, later arrested
' 4. US formally attributed attack to North Korea (Lazarus Group)
' 5. Estimated global damage: $4-8 billion
' 6. SMBv1 deprecated by Microsoft in Windows 10 1709+
' 7. Bitcoin wallets received ~$140,000 (minimal compared to damage)
' ============================================================================
