# QWEN.md - Historical Malware Education

## Project Context

This is an **educational cybersecurity research repository** containing annotated source code recreations of historically significant malware programs:

| Sample | Year | Type | Directory |
|--------|------|------|-----------|
| Brain | 1986 | Boot sector virus | `brain_virus/` |
| Melissa Virus | 1999 | VBA macro virus | `melissa_virus/` |
| ILOVEYOU Worm | 2000 | VBScript email worm | `iloveyou_worm/` |
| Code Red Worm | 2001 | Fileless HTTP worm | `code_red_worm/` |
| Conficker Worm | 2008 | Network/botnet worm | `conficker_worm/` |
| Stuxnet | 2010 | SCADA cyberweapon | `stuxnet_worm/` |
| WannaCry | 2017 | Ransomware + worm | `wannacry_ransomware/` |
| NotPetya | 2017 | Wiper (fake ransomware) | `notpetya_ransomware/` |

All recreations are **SAFETY-MODIFIED** for educational purposes:
- All destructive operations are commented out
- All file modifications are simulated
- All network/email activity is logged, not executed
- Code is extensively annotated for learning

## How to Work With This Project

### When Running Code
- Source files are `.vbs` or `.vbs.educational` / `.vba.educational`
- Run with `cscript //nologo <filename>` for safe simulation
- Each sample has a `run_simulation.bat` for easy execution
- Always check that destructive operations remain disabled before execution

### When Explaining Code
- Focus on the **mechanism** and **concept**
- Highlight the vulnerability being exploited
- Explain the **social engineering** component
- Discuss the **aftermath** and **security improvements** that resulted
- Compare to modern equivalents when relevant

### When Adding New Samples
- Create a directory named `<malware_name>_worm` (or `_virus`, `_malware`, etc.)
- Include: annotated source, `README.md`, `run_simulation.bat`, log file
- Maintain the educational annotation style
- Keep destructive operations commented with `⚠️ EDUCATIONAL SIMULATION` markers
- Add entry to the main README.md samples table
- Update the future research section if removing a candidate

## Code Style Guidelines

- Extensive inline comments for educational clarity
- Clear separation of different attack phases
- Log all actions instead of executing them
- Use descriptive variable names
- Include historical context in comments
- Use ASCII attack-chain diagrams in READMEs
- Include CVE numbers, dates, and impact statistics

## Safety Requirements

- NEVER uncomment destructive operations
- ALWAYS include educational simulation markers
- NEVER create functional malware variants
- Document any additions to the repository
- Each sample README must end with educational disclaimer

## Future Research Candidates

These are tracked in the main README's "Future Research" section:
- Mirai (2016), SQL Slammer (2003), Sobig.F (2003)
- Flame (2012), CIH/Chernobyl (1998)
- DarkSide/Colonial Pipeline (2021), Log4Shell exploits (2021)
