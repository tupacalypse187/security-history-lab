' ============================================================================
' EDUCATIONAL RECREATION - BRAIN BOOT SECTOR VIRUS (1986)
' ============================================================================
' ALIAS: Brain, Pakistani Flu, Pakistani Brain
' FIRST SEEN: January 1986
' TYPE: Boot Sector Virus (IBM PC compatible floppy disks)
' PLATFORM: DOS/IBM PC (boot sector of 360KB/720KB/1.2MB/1.44MB floppies)
' IMPACT: First known PC virus, spread globally via floppy disk exchange
'
' ⚠️  EDUCATIONAL PURPOSE ONLY - DO NOT EXECUTE ⚠️
' ============================================================================
'
' HOW BRAIN WORKED (High-Level Overview):
' =======================================
' 1. INFECTED the boot sector of floppy disks (5.25" and 3.5")
' 2. REPLACED the original boot sector with virus code + backup
' 3. WHEN INFECTED DISK BOOTED:
'    a. Virus loaded into memory first (before OS)
'    b. Hooked BIOS interrupt 13h (disk read/write)
'    c. Infected any clean disk inserted into the drive
' 4. STEALTH: Intercepted disk reads to show clean boot sector
' 5. MARKED bad sectors to prevent overwriting the virus
'
' TECHNICAL BREAKDOWN:
' ===================
' Brain was written in 16-bit x86 assembly language. This recreation
' simulates the behavior in VBScript for educational understanding.
' All disk operations are SIMULATED - no actual boot sector modification.
'
' The Amjad brothers (Basit and Alvi) created Brain to combat software
' piracy of their medical software in Pakistan. It accidentally spread
' globally when infected disks traveled abroad.
'
' ============================================================================

On Error Resume Next

' ============================================================================
' PHASE 1: Boot Sector Infection
' ============================================================================
' Brain replaced the 512-byte boot sector of floppy disks with its own code.
' The original boot sector was relocated to another sector on the disk.
' ============================================================================

Sub InfectBootSector()
    Dim diskDrive, originalBoot, virusCode
    
    LogAction "=== PHASE 1: Boot Sector Infection Simulation ==="
    LogAction "TARGET: 512-byte boot sector of floppy disk"
    LogAction "MEDIA: 5.25-inch (360KB/1.2MB) and 3.5-inch (720KB/1.44MB) floppy disks"
    LogAction ""
    
    ' Original Brain boot sector structure:
    ' Bytes 0-2: JMP instruction to virus code
    ' Bytes 3-8: OEM name "Brain" + version
    ' Bytes 9-61: Virus code (infection + stealth logic)
    ' Bytes 62-509: Original boot sector (moved here)
    ' Bytes 510-511: Boot signature (55 AA)
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original assembly logic:
    ' The real Brain virus was ~400 bytes of 16-bit x86 assembly.
    '
    ' Key assembly steps (simplified):
    '   MOV AX, 0201h     ; Read sector
    '   MOV BX, 07C0h     ; Load address
    '   INT 13h           ; BIOS disk interrupt
    '   CMP [BX], signature ; Check if already infected
    '   JE skip_infect    ; Already infected, skip
    '   ; ... infection code ...
    '   MOV AX, 0301h     ; Write sector (infect)
    '   INT 13h
    
    LogAction "SIMULATED: Would read boot sector of floppy disk"
    LogAction "SIMULATED: Would check for Brain signature (already infected?)"
    LogAction "SIMULATED: Would relocate original boot sector to track 0, sector 3"
    LogAction "SIMULATED: Would write virus code to track 0, sector 1 (boot sector)"
    LogAction "SIMULATED: Would mark original boot sector location as 'bad'"
    LogAction ""
    LogAction "BOOT SECTOR LAYOUT (simulated):"
    LogAction "  Track 0, Sector 1: Brain virus code (512 bytes)"
    LogAction "  Track 0, Sector 3: Original boot sector (moved here)"
    LogAction "  Signature: 'Brain' at offset 3"
    LogAction ""
End Sub

' ============================================================================
' PHASE 2: Memory Resident Infection (INT 13h Hook)
' ============================================================================
' Once an infected disk booted, Brain became memory-resident.
' It hooked BIOS Interrupt 13h to infect every disk accessed.
' ============================================================================

Sub HookInterrupt13()
    LogAction "=== PHASE 2: INT 13h Hook Simulation ==="
    LogAction "INTERRUPT: BIOS INT 13h (disk services)"
    LogAction "GOAL: Intercept all disk reads/writes for stealth and infection"
    LogAction ""
    
    ' ⚠️ EDUCATIONAL SIMULATION - Original interrupt hook pattern:
    ' The virus replaced the INT 13h handler with its own code.
    '
    ' When INT 13h was called (any disk operation):
    '   1. Check if it's a READ of an infected disk's boot sector
    '      -> Return the ORIGINAL (clean) boot sector from Track 0, Sector 3
    '      (This was BRAIN's stealth mechanism - users saw clean disks)
    '
    '   2. Check if it's a WRITE to a CLEAN disk
    '      -> Infect the disk first, then allow the write
    '
    '   3. Otherwise, pass through to the original INT 13h handler
    
    LogAction "SIMULATED: Would replace INT 13h handler with Brain code"
    LogAction "SIMULATED: Would intercept disk READ requests:"
    LogAction "  - If reading boot sector of infected disk:"
    LogAction "    -> Return ORIGINAL clean boot sector (stealth)"
    LogAction "SIMULATED: Would intercept disk WRITE requests:"
    LogAction "  - If writing to clean disk:"
    LogAction "    -> Infect boot sector first, then allow write"
    LogAction ""
    LogAction "NOTE: This was one of the first uses of stealth in malware"
    LogAction "NOTE: Users couldn't detect infection by reading the disk"
    LogAction ""
End Sub

' ============================================================================
' PHASE 3: Stealth Mechanism
' ============================================================================
' Brain intercepted INT 13h disk read requests to return the original
' clean boot sector when the infected boot sector was read.
' This made the virus invisible to users and early antivirus tools.
' ============================================================================

Sub StealthMechanism()
    LogAction "=== PHASE 3: Stealth Mechanism ==="
    LogAction ""
    
    ' ⚠️ EDUCATIONAL SIMULATION:
    ' Brain's stealth worked by:
    ' 1. Monitoring INT 13h read calls
    ' 2. When AH=02h (read sector), AL=01h (1 sector), CH=0 (track 0), CL=1 (sector 1)
    '    -> This is a request to read the boot sector
    ' 3. Instead of returning the infected boot sector (containing Brain)
    '    -> Return the clean original from Track 0, Sector 3
    ' 4. The user sees a normal, uninfected disk
    
    LogAction "STEALTH BEHAVIOR (simulated):"
    LogAction "  Trigger: INT 13h, AH=02h (read), Track 0, Sector 1"
    LogAction "  Action:  Redirect to Track 0, Sector 3 (original boot sector)"
    LogAction "  Result:  User reads clean disk - cannot detect infection"
    LogAction ""
    LogAction "NOTE: This technique was later used by many sophisticated malware"
    LogAction "NOTE: Rootkits use similar interception techniques today"
    LogAction ""
End Sub

' ============================================================================
' PHASE 4: Bad Sector Marking
' ============================================================================
' Brain marked the sectors containing its code as 'bad' in the FAT,
' preventing the OS from overwriting the virus with file data.
' ============================================================================

Sub MarkBadSectors()
    LogAction "=== PHASE 4: Bad Sector Marking ==="
    LogAction ""
    
    ' ⚠️ EDUCATIONAL SIMULATION:
    ' Brain modified the File Allocation Table (FAT) to mark its sectors
    ' as bad, so the OS would skip them when writing files.
    
    ' The FAT entries for Track 0, Sectors 1-2 were set to FFF7h (bad cluster)
    ' This prevented file data from overwriting the virus
    
    LogAction "SIMULATED: Would modify FAT to mark sectors as bad"
    LogAction "  Track 0, Sector 1: Marked as bad (contains virus)"
    LogAction "  Track 0, Sector 2: Marked as bad (backup)"
    LogAction "  FAT entry: FFF7h (bad cluster marker)"
    LogAction ""
    LogAction "NOTE: This reduced available disk space slightly"
    LogAction "NOTE: Users noticed a few 'bad sectors' but thought it was disk damage"
    LogAction ""
End Sub

' ============================================================================
' PHASE 5: The Brain Signature (Contact Info)
' ============================================================================
' Brain contained the Amjad brothers' contact information embedded
' in the virus code. This was intended for legitimate users to contact
' them for a cure.
' ============================================================================

Sub DisplayBrainSignature()
    LogAction "=== PHASE 5: Brain Signature (Embedded Message) ==="
    LogAction ""
    
    ' Brain embedded this ASCII text into the boot sector:
    Dim brainSignature
    brainSignature = _
        "Welcome to the Dungeon" & vbCrLf & _
        "(c) 1986 Basit & Amjads (pvt) Ltd." & vbCrLf & _
        "12-KM, Main Boulevard, Gulberg III, LAHORE-PAKISTAN" & vbCrLf & _
        "Phone: +92-42-833439, 833440" & vbCrLf & _
        "Beware of this VIRUS..... Contact us for vaccination"
    
    LogAction "EMBEDDED TEXT in Brain virus:"
    LogAction brainSignature
    LogAction ""
    LogAction "NOTE: This was a calling card, not a destructive message"
    LogAction "NOTE: The Amjad brothers wanted to offer a cure for a fee"
    LogAction "NOTE: This text was visible in the binary of infected disks"
    LogAction ""
End Sub

' ============================================================================
' PHASE 6: Global Spread (Accidental)
' ============================================================================
' Brain was designed to stay in Pakistan, but infected floppy disks
' traveled internationally through software sharing and personal travel.
' ============================================================================

Sub SimulateSpread()
    Dim countries, i
    
    LogAction "=== PHASE 6: Global Spread Simulation ==="
    LogAction ""
    
    ' Brain spread through:
    ' 1. Software piracy (pirated disks carried the virus)
    ' 2. Personal travel (people brought infected floppies home)
    ' 3. Software sharing (universities, businesses exchanged disks)
    
    countries = Array("Pakistan", "United States", "United Kingdom", _
                      "Germany", "Netherlands", "Canada", "Australia", _
                      "Sweden", "India", "Japan")
    
    LogAction "SPREAD PATTERN (simulated):"
    LogAction "  1986: Pakistan (origin)"
    LogAction "  1987: United States, United Kingdom"
    LogAction "  1988: Germany, Netherlands, Canada"
    LogAction "  1989: Australia, Sweden, India, Japan"
    LogAction ""
    LogAction "ESTIMATED INFECTIONS: Thousands of computers worldwide"
    LogAction "NOTE: First computer virus to achieve global spread"
    LogAction "NOTE: Spread via floppy disk exchange, not networks"
    LogAction ""
End Sub

' ============================================================================
' HELPER: Logging Function
' ============================================================================
Sub LogAction(message)
    Dim fso, logFile, logPath
    
    logPath = "brain_educational_log.txt"
    
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
    LogAction "EDUCATIONAL BRAIN VIRUS DEMONSTRATION"
    LogAction "Date: " & Now
    LogAction "============================================"
    LogAction ""
    
    Call InfectBootSector()
    Call HookInterrupt13()
    Call StealthMechanism()
    Call MarkBadSectors()
    Call DisplayBrainSignature()
    Call SimulateSpread()
    
    LogAction "============================================"
    LogAction "DEMONSTRATION COMPLETE"
    LogAction "No actual harm was done - this is educational"
    LogAction "============================================"
End Sub

' Execute
Call Main()

' ============================================================================
' HISTORICAL CONTEXT:
' ==================
' The Amjad brothers, Basit and Alvi, ran a computer company in Lahore,
' Pakistan called Brain Computer Services. They developed a medical
' monitoring program called Heart (for cardiac patients) and were
' frustrated when people pirated their software.
'
' Brain was created as a copy-protection mechanism - it would infect
' pirated copies of their software and spread, but was designed to be
' harmless. The brothers included their contact info so legitimate
' users could reach them for a cure.
'
' The virus escaped Pakistan when a US company (that had purchased
' pirated software) brought infected disks to America. From there it
' spread globally - becoming the first international computer virus.
'
' The Amjad brothers were shocked when Brain spread worldwide and
' reportedly received calls from people around the world asking for help.
' ============================================================================
