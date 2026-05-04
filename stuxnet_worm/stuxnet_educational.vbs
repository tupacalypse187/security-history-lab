' ============================================================================
' EDUCATIONAL RECREATION - STUXNET WORM (2010)
' ============================================================================
' ALIAS: Stuxnet, W32.Stuxnet, Win32/Stuxnet
' FIRST SEEN: June 2010 (by VirusBlokAda)
' TYPE: Cyberweapon / Industrial Sabotage Worm
' PLATFORM: Windows + Siemens PLCs (SCADA systems)
' IMPACT: Damaged Iran's nuclear enrichment program
'
' ⚠️  EDUCATIONAL PURPOSE ONLY - DO NOT EXECUTE ⚠️
' ============================================================================
'
' HOW STUXNET WORKED (High-Level Overview):
' =========================================
' 1. INTRODUCED via USB drive (deliberate targeting of specific facility)
' 2. EXPLOITED 4 ZERO-DAY vulnerabilities in Windows:
'    - CVE-2010-2568: Windows LNK file parsing (USB autorun via shortcut)
'    - CVE-2010-2772: Windows Print Spooler privilege escalation
'    - CVE-2010-1233: STEP 7 vulnerability (infection of PLC project files)
'    - CVE-2008-4250: MS08-067 (same as Conficker, for network spread)
' 3. ESCALATED PRIVILEGES using stolen code-signing certificates
' 4. TARGETED Siemens STEP 7 software and S7 PLCs
' 5. MODIFIED PLC code to cause physical damage while hiding from operators
' 6. SPOKE to specific PLCs via custom rootkit to hide modifications
'
' TECHNICAL BREAKDOWN:
' ===================
' Stuxnet was a state-sponsored cyberweapon targeting Iran's Natanz nuclear
' facility. It's considered the first cyberweapon to cause physical damage.
' This recreation demonstrates concepts with SAFETY MODIFICATIONS:
' - LNK exploit (SIMULATED - no actual file parsing)
' - PLC communication (SIMULATED - no actual SCADA interaction)
' - Certificate theft (SIMULATED - no actual certificate manipulation)
' - Rootkit behavior (SIMULATED - no actual system hiding)
'
' ============================================================================

On Error Resume Next

' ============================================================================
' PHASE 1: LNK File Exploit (CVE-2010-2568)
' ============================================================================
' Stuxnet exploited a vulnerability in Windows shortcut (.LNK) file parsing.
' Simply viewing a USB drive in Explorer would execute the worm - no double-
' click required. This was a TRUE ZERO-DAY.
' ============================================================================

Sub ExploitLNK()
    LogAction "=== PHASE 1: LNK File Exploit Simulation ==="
    LogAction "CVE: CVE-2010-2568"
    LogAction "TYPE: Buffer overflow in Shell32.dll LNK parser"
    LogAction "SEVERITY: Critical - no user interaction required"
    LogAction ""
    
    ' Original exploitation mechanism:
    ' 1. Created malicious .LNK file on USB drive
    ' 2. .LNK file pointed to icon in DLL file
    ' 3. DLL contained exported function with shellcode
    ' 4. When Explorer parsed the .LNK for display, it loaded the icon
    ' 5. Loading the icon triggered the buffer overflow
    ' 6. Shellcode executed with Explorer's privileges
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Set fso = CreateObject("Scripting.FileSystemObject")
    ' usbDrive = GetUSBDive()
    ' If usbDrive <> "" Then
    '     ' Create malicious .LNK file
    '     ' lnkPath = usbDrive & "\~WTR4321.lnk"
    '     ' Set shell = CreateObject("WScript.Shell")
    '     ' Set shortcut = shell.CreateShortcut(lnkPath)
    '     ' shortcut.TargetPath = "%SystemRoot%\system32\cmd.exe"
    '     ' shortcut.IconLocation = usbDrive & "\~WTR4321.dll,0"
    '     ' shortcut.Save
    '     
    '     ' Create DLL with shellcode in icon resource
    '     ' dllPath = usbDrive & "\~WTR4321.dll"
    '     ' ... DLL creation with embedded shellcode ...
    ' End If
    
    LogAction "SIMULATED: Would create malicious .LNK file on USB drive"
    LogAction "SIMULATED: .LNK would trigger exploit when viewed in Explorer"
    LogAction "SIMULATED: Would load malicious DLL via icon reference"
    LogAction "SIMULATED: DLL contains shellcode executed via buffer overflow"
    LogAction ""
    LogAction "NOTE: This required ZERO user interaction"
    LogAction "NOTE: Simply opening the USB drive folder in Explorer was enough"
    LogAction "NOTE: Microsoft issued out-of-band emergency patch"
    LogAction ""
End Sub

' ============================================================================
' PHASE 2: Privilege Escalation (CVE-2010-2772)
' ============================================================================
' After initial infection, Stuxnet escalated to SYSTEM privileges using
' a vulnerability in the Windows Print Spooler service.
' ============================================================================

Sub EscalatePrivileges()
    LogAction "=== PHASE 2: Privilege Escalation Simulation ==="
    LogAction "CVE: CVE-2010-2772"
    LogAction "TYPE: Kernel-mode vulnerability via Print Spooler"
    LogAction "GOAL: Escalate from user to SYSTEM privileges"
    LogAction ""
    
    ' Original escalation path:
    ' 1. Connected to local Print Spooler service
    ' 2. Sent crafted RPC request to exploit vulnerability
    ' 3. Loaded malicious kernel-mode driver (rootkit)
    ' 4. Driver loaded with SYSTEM privileges
    ' 5. Driver hid Stuxnet files, registry keys, and processes
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    ' Set colPrinters = objWMIService.ExecQuery("SELECT * FROM Win32_Printer")
    ' For Each objPrinter In colPrinters
    '     ' Exploit print spooler vulnerability
    '     ' This would install a kernel-mode driver
    '     ' driverPath = "%TEMP%\mrxcls.sys"  ' Rootkit driver
    '     ' LoadDriver driverPath, "Stuxnet Rootkit Driver"
    ' Next
    
    LogAction "SIMULATED: Would exploit Print Spooler for privilege escalation"
    LogAction "SIMULATED: Would install kernel-mode rootkit driver"
    LogAction "SIMULATED: Rootkit would hide Stuxnet files and processes"
    LogAction "SIMULATED: Would hide registry keys: HKLM\SYSTEM\CurrentControlSet\Services\*"
    LogAction ""
    LogAction "ROOTKIT DRIVER FILES (simulated):"
    LogAction "  - mrxcls.sys  (rootkit driver)"
    LogAction "  - mrxnet.sys  (network rootkit)"
    LogAction ""
    LogAction "NOTE: Used stolen Realtek and JMicron code-signing certificates"
    LogAction "NOTE: Signed drivers appeared legitimate to Windows"
    LogAction ""
End Sub

' ============================================================================
' PHASE 3: Network Propagation (MS08-067 + Print Spooler)
' ============================================================================
' Stuxnet spread laterally across networks using the same MS08-067 exploit
' as Conficker, plus the Print Spooler vulnerability for authenticated systems.
' ============================================================================

Sub SpreadViaNetwork()
    LogAction "=== PHASE 3: Network Propagation Simulation ==="
    
    ' Stuxnet had two network infection methods:
    ' Method 1: MS08-067 (same as Conficker) for unpatched systems
    ' Method 2: Print Spooler exploit for authenticated access
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Set fso = CreateObject("Scripting.FileSystemObject")
    ' Set shell = CreateObject("WScript.Shell")
    '
    ' ' Method 1: SMB exploit (MS08-067)
    ' For Each targetIP In GetLocalNetworkRange()
    '     ' Attempt connection on port 445
    '     ' Send MS08-067 exploit payload
    '     ' If successful, copy Stuxnet to remote machine
    '     ' RemotePath = "\\" & targetIP & "\admin$\svchost.exe"
    '     ' fso.CopyFile WScript.ScriptFullName, RemotePath
    ' Next
    '
    ' ' Method 2: Print Spooler exploit (for authenticated systems)
    ' For Each targetIP In GetAuthenticatedNetworkRange()
    '     ' Connect to print spooler service
    '     ' Send exploit payload
    '     ' Install Stuxnet on target
    ' Next
    
    LogAction "SIMULATED: Would scan local network for port 445 (SMB)"
    LogAction "SIMULATED: Would attempt MS08-067 exploit on unpatched systems"
    LogAction "SIMULATED: Would exploit Print Spooler on authenticated systems"
    LogAction "SIMULATED: Would copy itself to remote machines as svchost.exe"
    LogAction ""
    LogAction "NOTE: Stuxnet was designed to spread ONLY within specific networks"
    LogAction "NOTE: It checked for specific PLC configurations before activating"
    LogAction ""
End Sub

' ============================================================================
' PHASE 4: PLC Targeting (Siemens STEP 7)
' ============================================================================
' This is what made Stuxnet unique - it was designed to cause PHYSICAL
' damage by modifying PLC (Programmable Logic Controller) code.
' Specifically targeted Iran's uranium enrichment centrifuges.
' ============================================================================

Sub TargetPLCs()
    LogAction "=== PHASE 4: PLC Targeting Simulation ==="
    LogAction "TARGET: Siemens S7-300/S7-400 PLCs"
    LogAction "SOFTWARE: Siemens STEP 7 programming software"
    LogAction ""
    
    ' Stuxnet's PLC attack sequence:
    ' 1. Located Siemens STEP 7 software on infected machine
    ' 2. Identified specific PLC models (S7-315, S7-417)
    ' 3. Checked frequency converter configuration (1000-1066 Hz)
    ' 4. Modified PLC code to cause centrifuges to spin at dangerous speeds
    ' 5. Injected loop code to replay normal sensor readings to operators
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Set objFSO = CreateObject("Scripting.FileSystemObject")
    '
    ' ' Find STEP 7 installation
    ' step7Path = GetSTEP7Path()
    ' If step7Path <> "" Then
    '     LogAction "Found Siemens STEP 7 at: " & step7Path
    '     
    '     ' Connect to PLC
    '     ' Set plcConnection = CreateObject("Siemens.S7.PLC")
    '     ' plcConnection.Connect("192.168.0.1")
    '     
    '     ' Check if this is the TARGET PLC (specific configuration)
    '     ' If plcConnection.Model = "S7-315" Or plcConnection.Model = "S7-417" Then
    '     '     If plcConnection.FrequencyConverter >= 1000 And _
    '     '        plcConnection.FrequencyConverter <= 1066 Then
    '     '         
    '     '         ' THIS IS THE TARGET - modify PLC code
    '     '         Call ModifyCentrifugeCode(plcConnection)
    '     '         Call InstallSensorSpoofing(plcConnection)
    '     '     End If
    '     ' End If
    ' End If
    
    LogAction "SIMULATED: Would search for Siemens STEP 7 software"
    LogAction "SIMULATED: Would identify S7-315/S7-417 PLC models"
    LogAction "SIMULATED: Would check frequency converter (1000-1066 Hz)"
    LogAction "SIMULATED: Would modify centrifuge code to cause damage"
    LogAction "SIMULATED: Would install sensor spoofing to hide changes"
    LogAction ""
    LogAction "PLC MODIFICATION (simulated):"
    LogAction "  1. Increase centrifuge speed to 1066 Hz (normal: 1000 Hz)"
    LogAction "  2. Hold for 15 minutes, then return to normal"
    LogAction "  3. Repeat cycle to cause gradual physical damage"
    LogAction "  4. Replay normal sensor readings to operators"
    LogAction ""
    LogAction "NOTE: This caused centrifuges to physically fail/destroy"
    LogAction "NOTE: Operators saw normal readings while damage occurred"
    LogAction ""
End Sub

' ============================================================================
' PHASE 5: Sensor Data Spoofing
' ============================================================================
' Stuxnet recorded normal sensor readings and played them back to operators
' while the PLC was actually causing damage. This is called a "replay attack."
' ============================================================================

Sub SpoofSensorData()
    LogAction "=== PHASE 5: Sensor Data Spoofing Simulation ==="
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original code pattern:
    ' Stuxnet recorded normal values for:
    ' - Centrifuge speed/rotation
    ' - Pressure readings
    ' - Temperature readings
    ' - Valve positions
    ' Then replayed these while the actual PLC caused physical damage
    
    LogAction "SIMULATED: Would record normal sensor readings"
    LogAction "SIMULATED: Would replay recorded data to SCADA interface"
    LogAction "SIMULATED: Actual PLC would operate differently from displayed values"
    LogAction ""
    LogAction "SPOOFED VALUES (simulated):"
    LogAction "  Centrifuge Speed: 1000 Hz (actual: 1066 Hz)"
    LogAction "  Pressure: Normal (actual: Elevated)"
    LogAction "  Temperature: 75°C (actual: 95°C)"
    LogAction ""
    LogAction "NOTE: This is why Stuxnet wasn't discovered for months"
    LogAction "NOTE: Operators had no reason to suspect the system readings"
    LogAction ""
End Sub

' ============================================================================
' PHASE 6: Self-Preservation and Cleanup
' ============================================================================
' Stuxnet had built-in checks to delete itself if certain conditions
' were met (like the current date being after a specific threshold).
' ============================================================================

Sub SelfPreservation()
    LogAction "=== PHASE 6: Self-Preservation and Cleanup ==="
    
    ' Stuxnet had a built-in expiration date
    ' Original code checked: If Date > "2012-06-24" Then DeleteSelf
    ' This was a "kill date" - after which it would self-destruct
    
    Dim killDate
    killDate = "2012-06-24"
    
    LogAction "SIMULATED: Would check if current date > " & killDate
    LogAction "SIMULATED: If expired, would delete all Stuxnet files"
    LogAction "SIMULATED: If not expired, would continue operations"
    LogAction ""
    LogAction "NOTE: Kill date was June 24, 2012"
    LogAction "NOTE: Stuxnet was discovered before this date (2010)"
    LogAction ""
End Sub

' ============================================================================
' HELPER: Logging Function
' ============================================================================
Sub LogAction(message)
    Dim fso, logFile, logPath
    
    logPath = "stuxnet_educational_log.txt"
    
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
    LogAction "EDUCATIONAL STUXNET WORM DEMONSTRATION"
    LogAction "Date: " & Now
    LogAction "============================================"
    LogAction ""
    
    Call ExploitLNK()
    Call EscalatePrivileges()
    Call SpreadViaNetwork()
    Call TargetPLCs()
    Call SpoofSensorData()
    Call SelfPreservation()
    
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
' 1. LNK FILE PARSING: CVE-2010-2568 (zero-click USB autorun)
' 2. PRINT SPOOLER: CVE-2010-2772 (privilege escalation)
' 3. STEP 7 SOFTWARE: CVE-2010-1233 (PLC project file infection)
' 4. MS08-067: CVE-2008-4250 (network propagation)
' 5. CODE-SIGNING: Stolen certificates made malware appear legitimate
'
' AFTERMATH & RESPONSE:
' ====================
' 1. Microsoft issued 3 emergency patches for the zero-days
' 2. Realtek and JMicron certificates were revoked
' 3. USB autorun permanently disabled in Windows 7+
' 4. SCADA/ICS security became a major industry focus
' 5. Led to creation of dedicated ICS security standards (IEC 62443)
' 6. Widely attributed to US/Israel (Operation Olympic Games)
' 7. Iran's nuclear program delayed by 1-2 years
' ============================================================================
