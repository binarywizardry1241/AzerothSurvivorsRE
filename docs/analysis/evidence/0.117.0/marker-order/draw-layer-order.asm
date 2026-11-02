14014af2f: 4c8b7e08 mov r15, qword ptr [rsi + 8]
14014af33: 488b4610 mov rax, qword ptr [rsi + 0x10]
14014af37: 4c8d2440 lea r12, [rax + rax*2]
14014af3b: 49c1e404 shl r12, 4
14014af3f: 4d01fc add r12, r15
14014af42: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14014af50: 4d39e7 cmp r15, r12
14014af53: 741b je 0x14014af70
14014af55: 4c89fa mov rdx, r15
14014af58: 4983c730 add r15, 0x30
14014af5c: 807a2c00 cmp byte ptr [rdx + 0x2c], 0
14014af60: 75ee jne 0x14014af50
14014af62: 4c89f1 mov rcx, r14
14014af65: e836c2feff call 0x1401371a0
14014af6a: 90 nop
14014af6b: ebe3 jmp 0x14014af50
14014af6d: 0f1f00 nop dword ptr [rax]
14014af70: 4c8b6620 mov r12, qword ptr [rsi + 0x20]
14014af74: 488b4628 mov rax, qword ptr [rsi + 0x28]
14014af78: 4c8d3c40 lea r15, [rax + rax*2]
14014af7c: 49c1e704 shl r15, 4
14014af80: 4d01e7 add r15, r12
14014af83: 4d39fc cmp r12, r15
14014af86: 741d je 0x14014afa5
14014af88: 0f1f840000000000 nop dword ptr [rax + rax]
14014af90: 4c89f1 mov rcx, r14
14014af93: 4c89e2 mov rdx, r12
14014af96: e805c2feff call 0x1401371a0
14014af9b: 90 nop
14014af9c: 4983c430 add r12, 0x30
14014afa0: 4d39fc cmp r12, r15
14014afa3: 75eb jne 0x14014af90
14014afa5: 4c8b7e08 mov r15, qword ptr [rsi + 8]
14014afa9: 488b4610 mov rax, qword ptr [rsi + 0x10]
14014afad: 4c8d2440 lea r12, [rax + rax*2]
14014afb1: 49c1e404 shl r12, 4
14014afb5: 4d01fc add r12, r15
14014afb8: 0f1f840000000000 nop dword ptr [rax + rax]
14014afc0: 4d39e7 cmp r15, r12
14014afc3: 741b je 0x14014afe0
14014afc5: 4c89fa mov rdx, r15
14014afc8: 4983c730 add r15, 0x30
14014afcc: 807a2c00 cmp byte ptr [rdx + 0x2c], 0
14014afd0: 74ee je 0x14014afc0
14014afd2: 4c89f1 mov rcx, r14
14014afd5: e8c6c1feff call 0x1401371a0
14014afda: 90 nop
14014afdb: ebe3 jmp 0x14014afc0
14014afdd: 0f1f00 nop dword ptr [rax]
