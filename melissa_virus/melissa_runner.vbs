' ============================================================================
' MELISSA VIRUS - VBS Runner for Educational Simulation
' Based on melissa_macros.vba.educational
' ============================================================================
' This is a VBScript adaptation of the Melissa virus VBA macros for 
' educational demonstration. The original Melissa used Word VBA macros.
' ============================================================================

On Error Resume Next

Dim outlookApp, nameSpace, addressList, contactEntry
Dim mailItem, contactCount, documentPath
Dim fso, logPath

logPath = "melissa_educational_log.txt"

' ============================================================================
' MAIN: Simulates Melissa virus behavior
' ============================================================================
Sub Main()
    LogAction "=== MELISSA VIRUS - EDUCATIONAL SIMULATION ==="
    LogAction "Original: March 26, 1999 by David L. Smith"
    LogAction "Running simulation at: " & Now()
    LogAction ""
    
    ' Attempt to create Outlook (simulated)
    Set outlookApp = Nothing  ' Safety: never actually connect to Outlook
    
    LogAction "Attempting to spread via email..."
    LogAction "OUTLOOK NOT FOUND - Cannot spread via email (SAFETY: Simulated)"
    LogAction "NOTE: Original Melissa required Outlook to be installed"
    LogAction ""
    LogAction "SIMULATED: Would access Outlook address book via MAPI"
    LogAction "SIMULATED: Would enumerate contacts"
    LogAction "SIMULATED: Would send to FIRST 50 contacts"
    LogAction "SIMULATED: Each email contained infected document"
    LogAction "EMAIL SUBJECT PATTERN: 'Important Message From [ContactName]'"
    LogAction "EMAIL BODY: 'Here is that document that you asked for...'"
    LogAction "NOTE: Social engineering - appeared to come from trusted contact"
    LogAction "Total simulated sends: 0 / 50"
    LogAction ""
    LogAction "--- TEMPLATE INFECTION SIMULATION ---"
    LogAction "SIMULATED: Would check Normal.dot for existing infection"
    LogAction "SIMULATED: Would copy virus macros to Normal.dot template"
    LogAction "SIMULATED: All new documents would now be infected"
    LogAction "SIMULATED: Would save virus macros in current document"
    LogAction ""
    LogAction "--- EVASION TECHNIQUES USED BY MELISSA ---"
    LogAction "1. Minimal destructive payload - just self-replicates"
    LogAction "2. Social engineering via personalized emails"
    LogAction "3. Strategic 50-contact limit (spread vs stealth balance)"
    LogAction "4. Normal.dot template infection for document-based spread"
    LogAction ""
    LogAction "=== SIMULATION COMPLETE ==="
    LogAction "No actual harm was done - this is educational"
End Sub

' ============================================================================
' Helper: Logging function
' ============================================================================
Sub LogAction(message)
    Dim logFile
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set logFile = fso.OpenTextFile(logPath, 8, True)
    logFile.WriteLine message
    logFile.Close
End Sub

' Execute main
Call Main()
