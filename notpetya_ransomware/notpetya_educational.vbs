' ============================================================================
' EDUCATIONAL RECREATION - NotPetya Ransomware/Wiper (2017)
' ============================================================================
' ALIAS: NotPetya, ExPetr, Nyetya, Petya.A
' FIRST SEEN: June 27, 2017
' TYPE: Wiper (masqueraded as ransomware) / Supply Chain Attack
' PLATFORM: Windows (exploiting EternalBlue + EternalRomance + MEExec)
' IMPACT: $10+ billion in damage, global supply chain disruption
'
' ⚠️  EDUCATIONAL PURPOSE ONLY - DO NOT EXECUTE ⚠️
' ============================================================================
'
' HOW NotPetya WORKED (High-Level Overview):
' ==========================================
' 1. SUPPLY CHAIN ATTACK: Compromised Ukrainian accounting software "M.E.Doc"
' 2. DISTRIBUTED malicious update to all M.E.Doc users
' 3. EXPLOITED multiple vectors:
'    a. EternalBlue (NSA SMB exploit)
'    b. EternalRomance (SMB exploit for patched systems)
'    c. M.E.Doc backdoor (supply chain)
'    d. Mimikatz credential theft (lateral movement)
'    e. PsExec + WMI (legitimate admin tools abused)
' 4. ENCRYPTED MBR (Master Boot Record) to prevent boot
' 5. WIPED data - NOT true ransomware. Decryption was IMPOSSIBLE
' 6. TARGETED Ukrainian organizations but spread globally via supply chain
'
' TECHNICAL BREAKDOWN:
' ===================
' NotPetya was designed as a wiper (data destruction) disguised as ransomware.
' The "encryption" was intentionally designed to make recovery impossible.
' This recreation demonstrates the mechanisms with SAFETY MODIFICATIONS:
' - Supply chain infection (SIMULATED - no actual software compromise)
' - MBR encryption (SIMULATED - no actual disk modification)
' - Lateral movement (SIMULATED - no actual network activity)
' - Credential theft (SIMULATED - no actual password extraction)
'
' ============================================================================

On Error Resume Next

' ============================================================================
' PHASE 1: Supply Chain Compromise (M.E.Doc)
' ============================================================================
' NotPetya's primary entry point was a compromised software update
' for M.E.Doc, the most popular accounting software in Ukraine.
' This was a TRUE SUPPLY CHAIN ATTACK.
' ============================================================================

Sub SupplyChainInfection()
    LogAction "=== PHASE 1: Supply Chain Infection (M.E.Doc) ==="
    LogAction "TARGET: M.E.Doc accounting software (Ukraine)"
    LogAction "TYPE: Supply chain attack via compromised update"
    LogAction ""
    
    ' The attack sequence:
    ' 1. Attackers compromised M.E.Doc update servers
    ' 2. Modified the official update package to include NotPetya
    ' 3. All M.E.Doc users who updated received the malware
    ' 4. This bypassed firewalls and security controls
    '    (legitimate software from trusted vendor)
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original supply chain pattern:
    ' The malware was embedded in a legitimate software update:
    '
    ' 1. M.E.Doc users received update notification
    ' 2. Update downloaded from ME.Doc servers (trusted source)
    ' 3. Update package contained:
    '    - Legitimate M.E.Doc update
    '    - NotPetya payload (hidden in update executable)
    ' 4. User installed update - executed NotPetya
    ' 5. NotPetya activated and began spreading
    
    LogAction "SIMULATED: Would compromise M.E.Doc update servers"
    LogAction "SIMULATED: Would embed NotPetya in legitimate update package"
    LogAction "SIMULATED: Would distribute to all M.E.Doc users via auto-update"
    LogAction "SIMULATED: Would activate when user installed update"
    LogAction ""
    LogAction "SUPPLY CHAIN IMPACT:"
    LogAction "  M.E.Doc users: ~400,000+ organizations in Ukraine"
    LogAction "  Initial infections: Thousands in first hour"
    LogAction "  Spread: Global via EternalBlue and other vectors"
    LogAction ""
    LogAction "NOTE: This was the first major supply chain attack of its kind"
    LogAction "NOTE: Bypassed all security controls (trusted vendor update)"
    LogAction ""
End Sub

' ============================================================================
' PHASE 2: Lateral Movement (Multiple Vectors)
' ============================================================================
' NotPetya had FIVE different lateral movement methods, making it
' extremely effective at spreading through networks.
' ============================================================================

Sub LateralMovement()
    LogAction "=== PHASE 2: Lateral Movement Simulation ==="
    LogAction ""
    
    ' Method 1: EternalBlue (CVE-2017-0144)
    ' Same SMB exploit used by WannaCry
    LogAction "METHOD 1: EternalBlue (CVE-2017-0144)"
    LogAction "  Target: SMBv1 vulnerability (MS17-010)"
    LogAction "  SIMULATED: Would scan port 445, exploit unpatched systems"
    LogAction ""
    
    ' Method 2: EternalRomance (CVE-2017-0145/0146/0147/0148)
    ' Secondary SMB exploit that worked on PATCHED systems
    LogAction "METHOD 2: EternalRomance (CVE-2017-0145/0146/0147/0148)"
    LogAction "  Target: SMBv1 even on PATCHED systems"
    LogAction "  SIMULATED: Would exploit alternative SMB vulnerabilities"
    LogAction "  NOTE: This allowed spread even to patched machines"
    LogAction ""
    
    ' Method 3: Mimikatz Credential Theft
    ' Extracted passwords from memory, then used them to spread
    LogAction "METHOD 3: Mimikatz Credential Theft"
    LogAction "  Target: Windows credential store (LSASS memory)"
    LogAction "  SIMULATED: Would extract passwords from LSASS process memory"
    LogAction "  SIMULATED: Would use extracted credentials for admin share access"
    LogAction "  NOTE: Mimikatz is a legitimate pentest tool abused here"
    LogAction ""
    
    ' Method 4: PsExec (Legitimate Admin Tool)
    ' Used Microsoft's own PsExec to install NotPetya on remote machines
    LogAction "METHOD 4: PsExec Abuse"
    LogAction "  Target: Legitimate Sysinternals PsExec tool"
    LogAction "  SIMULATED: Would use stolen credentials + PsExec"
    LogAction "  SIMULATED: Would copy NotPetya to remote machine and execute"
    LogAction "  NOTE: 'Living off the land' technique (legitimate tools)"
    LogAction ""
    
    ' Method 5: WMI (Windows Management Instrumentation)
    ' Remote code execution via WMI for additional spread
    LogAction "METHOD 5: WMI Remote Execution"
    LogAction "  Target: Windows Management Instrumentation"
    LogAction "  SIMULATED: Would use WMI to execute commands on remote machines"
    LogAction "  SIMULATED: Would copy NotPetya via admin shares + WMI"
    LogAction "  NOTE: Another 'living off the land' technique"
    LogAction ""
End Sub

' ============================================================================
' PHASE 3: MBR Encryption (Destructive Payload)
' ============================================================================
' NotPetya encrypted the Master Boot Record (MBR) to prevent the
' system from booting. Unlike true ransomware, this was designed
' to be PERMANENT - there was no way to recover.
' ============================================================================

Sub EncryptMBR()
    LogAction "=== PHASE 3: MBR Encryption Simulation ==="
    LogAction "TARGET: Master Boot Record (MBR) - first sector of hard disk"
    LogAction "IMPACT: System cannot boot, data is inaccessible"
    LogAction ""
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original MBR encryption pattern:
    ' 1. Read the MBR (first 512 bytes of disk)
    ' 2. Save the original MBR (but encrypted, so it can't be restored)
    ' 3. Overwrite MBR with custom NotPetya bootloader
    ' 4. The custom bootloader:
    '    - Displays the ransom note on boot
    '    - Loads Salsa20 encryption algorithm
    '    - Encrypts each file on the disk
    '    - The encryption key is encrypted with a HARDCODED key
    '    - BUT the hardcoded key is WRONG - making decryption impossible
    '
    ' This was the "tell" that NotPetya was a wiper, not ransomware:
    ' The encryption was designed to be irreversible.
    
    LogAction "SIMULATED: Would read MBR (first 512 bytes of disk)"
    LogAction "SIMULATED: Would overwrite MBR with custom NotPetya bootloader"
    LogAction "SIMULATED: Custom bootloader would:"
    LogAction "  1. Display ransom note on boot"
    LogAction "  2. Load Salsa20 encryption algorithm"
    LogAction "  3. Encrypt all files on disk"
    LogAction "  4. Use WRONG hardcoded key (making recovery impossible)"
    LogAction ""
    LogAction "CRITICAL: NotPetya was a WIPER, not ransomware"
    LogAction "  - The encryption was designed to be irreversible"
    LogAction "  - Payment would NOT have resulted in decryption"
    LogAction "  - This was data destruction disguised as ransomware"
    LogAction ""
End Sub

' ============================================================================
' PHASE 4: Ransom Note (Deceptive)
' ============================================================================
' After encryption, NotPetya displayed a ransom note. However,
' the payment email was quickly shut down, and the decryption
' was impossible. This was purely for misdirection.
' ============================================================================

Sub DisplayRansomNote()
    LogAction "=== PHASE 4: Ransom Note (Deceptive) ==="
    LogAction ""
    
    LogAction "NotPetya displayed this message:"
    LogAction "--------------------------------------------------"
    LogAction "  Ooops, your important files are encrypted."
    LogAction ""
    LogAction "  If you want to decrypt all of your files, you need to pay."
    LogAction "  Pay $300 in Bitcoin to: 14hXdKz5aQZ7W6..."
    LogAction "  Contact: proton666@protonmail.com"
    LogAction ""
    LogAction "  You have to send payment proof to this email."
    LogAction "  After payment is confirmed, you will receive decryption key."
    LogAction "--------------------------------------------------"
    LogAction ""
    LogAction "NOTE: protonmail.com SHUT DOWN the email account quickly"
    LogAction "NOTE: Decryption was mathematically impossible (wrong key)"
    LogAction "NOTE: This was a wiper disguised as ransomware"
    LogAction "NOTE: No victim who paid got their files back"
    LogAction ""
End Sub

' ============================================================================
' PHASE 5: Global Impact
' ============================================================================
' NotPetya spread far beyond its intended Ukrainian targets,
' causing billions in damage to global companies.
' ============================================================================

Sub GlobalImpact()
    Dim victims, i
    
    LogAction "=== PHASE 5: Global Impact ==="
    LogAction ""
    
    ' Major victims of NotPetya:
    victims = Array( _
        "Maersk (shipping) - $300M+ damage", _
        "Merck (pharma) - $870M+ damage", _
        "FedEx/TNT Express - $400M+ damage", _
        "Mondelez (Oreo/Cadbury) - $196M+ damage", _
        "Saint-Gobain (construction) - $379M+ damage", _
        "Ukrainian government, banks, airports, radiation monitoring")
    
    LogAction "MAJOR VICTIMS (estimated damages):"
    For i = 0 To UBound(victims)
        LogAction "  " & victims(i)
    Next
    LogAction ""
    LogAction "TOTAL ESTIMATED DAMAGE: $10+ BILLION USD"
    LogAction ""
    LogAction "NOTE: NotPetya was attributed to Russian military (GRU)"
    LogAction "NOTE: US, UK, EU, Australia, and NATO all attributed to Russia"
    LogAction "NOTE: Called 'most destructive cyberattack in history' at the time"
    LogAction "NOTE: Originally targeted Ukraine, spread globally via supply chain"
    LogAction ""
End Sub

' ============================================================================
' HELPER: Logging Function
' ============================================================================
Sub LogAction(message)
    Dim fso, logFile, logPath
    
    logPath = "notpetya_educational_log.txt"
    
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
    LogAction "EDUCATIONAL NotPetya WIPER DEMONSTRATION"
    LogAction "Date: " & Now
    LogAction "============================================"
    LogAction ""
    
    Call SupplyChainInfection()
    Call LateralMovement()
    Call EncryptMBR()
    Call DisplayRansomNote()
    Call GlobalImpact()
    
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
' 1. Supply chain: M.E.Doc software update compromise
' 2. EternalBlue (CVE-2017-0144): SMBv1 buffer overflow
' 3. EternalRomance (CVE-2017-0145+): SMBv1 for patched systems
' 4. Mimikatz: Credential extraction from LSASS memory
' 5. PsExec/WMI: Legitimate admin tools abused for lateral movement
'
' AFTERMATH & RESPONSE:
' ====================
' 1. US, UK, EU, Australia, NATO attributed to Russian GRU
' 2. Merck sued for insurance, recovered $1.4B (but total cost much higher)
' 3. Maersk installed 4,000+ new servers to recover
' 4. Led to focus on supply chain security (Executive Order 14028)
' 5. First major use of insurance claims for cyberattack damages
' 6. Called "most destructive cyberattack in history" at the time
' ============================================================================
