# QWEN.md - Emily Love Worm Project

## Project Context

This is an **educational cybersecurity research repository** containing annotated source code recreations of two historically significant malware programs:

1. **ILOVEYOU Worm (2000)** - VBScript worm that infected ~45 million computers
2. **Melissa Virus (1999)** - VBA macro virus that spread via Microsoft Word

Both recreations are **SAFETY-MODIFIED** for educational purposes:
- All destructive operations are commented out
- All file modifications are simulated
- All email sending is logged, not executed
- Code is extensively annotated for learning

## How to Work With This Project

### When Running Code
- These are `.vbs.educational` and `.vba.educational` files
- Run with `cscript //nologo <filename>` for safe simulation
- Always check that destructive operations remain disabled before execution

### When Explaining Code
- Focus on the **mechanism** and **concept**
- Highlight the vulnerability being exploited
- Explain the **social engineering** component
- Discuss the **aftermath** and **security improvements** that resulted

### When Adding Content
- Maintain the educational annotation style
- Use clear comments explaining what each section does
- Keep destructive operations commented out with `⚠️ EDUCATIONAL SIMULATION` markers
- Add to the README.md with proper formatting and emojis

## Code Style Guidelines

- Extensive inline comments for educational clarity
- Clear separation of different attack phases
- Log all actions instead of executing them
- Use descriptive variable names
- Include historical context in comments

## Safety Requirements

- NEVER uncomment destructive operations
- ALWAYS include educational simulation markers
- NEVER create functional malware variants
- Document any additions to the repository
