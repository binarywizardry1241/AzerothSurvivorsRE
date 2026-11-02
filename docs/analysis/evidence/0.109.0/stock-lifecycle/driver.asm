0x1458eea30: 55                       push rbp
0x1458eea31: 56                       push rsi
0x1458eea32: 4881ecd8000000           sub rsp, 0xd8
0x1458eea39: 488dac2480000000         lea rbp, [rsp + 0x80]
0x1458eea41: 48c74550feffffff         mov qword ptr [rbp + 0x50], 0xfffffffffffffffe
0x1458eea49: 4889ce                   mov rsi, rcx
0x1458eea4c: 48894d10                 mov qword ptr [rbp + 0x10], rcx
0x1458eea50: 48c74528ffffffff         mov qword ptr [rbp + 0x28], 0xffffffffffffffff
0x1458eea58: 48c7451800000000         mov qword ptr [rbp + 0x18], 0
0x1458eea60: c6454000                 mov byte ptr [rbp + 0x40], 0
0x1458eea64: e8973771fa               call 0x140002200
0x1458eea69: b90c000000               mov ecx, 0xc
0x1458eea6e: ba01000000               mov edx, 1
0x1458eea73: e8483771fa               call 0x1400021c0
0x1458eea78: 4885c0                   test rax, rax
0x1458eea7b: 48894508                 mov qword ptr [rbp + 8], rax
0x1458eea7f: 0f84bf000000             je 0x1458eeb44
0x1458eea85: 48b9726f6775652d7365     movabs rcx, 0x65732d6575676f72
0x1458eea8f: 488908                   mov qword ptr [rax], rcx
0x1458eea92: c7400872766572           mov dword ptr [rax + 8], 0x72657672
0x1458eea99: 48c745f00c000000         mov qword ptr [rbp - 0x10], 0xc
0x1458eeaa1: 488945f8                 mov qword ptr [rbp - 8], rax
0x1458eeaa5: 48c745000c000000         mov qword ptr [rbp], 0xc
0x1458eeaad: 488d4dc0                 lea rcx, [rbp - 0x40]
0x1458eeab1: 488d5518                 lea rdx, [rbp + 0x18]
0x1458eeab5: 4c8d45f0                 lea r8, [rbp - 0x10]
0x1458eeab9: e862602b00               call 0x145ba4b20
0x1458eeabe: 90                       nop
0x1458eeabf: 488d55d0                 lea rdx, [rbp - 0x30]
0x1458eeac3: 4c8b45c0                 mov r8, qword ptr [rbp - 0x40]
0x1458eeac7: 4c8b4dc8                 mov r9, qword ptr [rbp - 0x38]
0x1458eeacb: 0fb645e8                 movzx eax, byte ptr [rbp - 0x18]
0x1458eeacf: c6454f00                 mov byte ptr [rbp + 0x4f], 0
0x1458eead3: 4889742430               mov qword ptr [rsp + 0x30], rsi
0x1458eead8: 88442420                 mov byte ptr [rsp + 0x20], al
0x1458eeadc: 48c744242800000000       mov qword ptr [rsp + 0x28], 0
0x1458eeae5: 488d4d18                 lea rcx, [rbp + 0x18]
0x1458eeae9: e87287ffff               call 0x1458e7260
0x1458eeaee: 90                       nop
0x1458eeaef: 488b7518                 mov rsi, qword ptr [rbp + 0x18]
0x1458eeaf3: 488b4520                 mov rax, qword ptr [rbp + 0x20]
0x1458eeaf7: 4885f6                   test rsi, rsi
0x1458eeafa: 745a                     je 0x1458eeb56
0x1458eeafc: 488b4d28                 mov rcx, qword ptr [rbp + 0x28]
0x1458eeb00: 48897518                 mov qword ptr [rbp + 0x18], rsi
0x1458eeb04: 48894520                 mov qword ptr [rbp + 0x20], rax
0x1458eeb08: 48894d28                 mov qword ptr [rbp + 0x28], rcx
0x1458eeb0c: ff15aebd4a00             call qword ptr [rip + 0x4abdae]
0x1458eeb12: f048ff0e                 lock dec qword ptr [rsi]
0x1458eeb16: 750a                     jne 0x1458eeb22
0x1458eeb18: 488d4d18                 lea rcx, [rbp + 0x18]
0x1458eeb1c: e8af3c2c00               call 0x145bb27d0
0x1458eeb21: 90                       nop
0x1458eeb22: 488b4520                 mov rax, qword ptr [rbp + 0x20]
0x1458eeb26: f048ff08                 lock dec qword ptr [rax]
0x1458eeb2a: 750e                     jne 0x1458eeb3a
0x1458eeb2c: c6454f00                 mov byte ptr [rbp + 0x4f], 0
0x1458eeb30: 488d4d20                 lea rcx, [rbp + 0x20]
0x1458eeb34: e8573b2c00               call 0x145bb2690
0x1458eeb39: 90                       nop
0x1458eeb3a: 4881c4d8000000           add rsp, 0xd8
0x1458eeb41: 5e                       pop rsi
0x1458eeb42: 5d                       pop rbp
0x1458eeb43: c3                       ret
0x1458eeb44: b901000000               mov ecx, 1
0x1458eeb49: ba0c000000               mov edx, 0xc
0x1458eeb4e: e868a74a00               call 0x145d992bb
0x1458eeb53: 90                       nop
0x1458eeb54: eb2d                     jmp 0x1458eeb83
0x1458eeb56: 48894518                 mov qword ptr [rbp + 0x18], rax
0x1458eeb5a: 488d051f1c5e01           lea rax, [rip + 0x15e1c1f]
0x1458eeb61: 4889442420               mov qword ptr [rsp + 0x20], rax
0x1458eeb66: 488d0dd31b5e01           lea rcx, [rip + 0x15e1bd3]
0x1458eeb6d: 4c8d0d542d3001           lea r9, [rip + 0x1302d54]
0x1458eeb74: 4c8d4518                 lea r8, [rbp + 0x18]
0x1458eeb78: ba1d000000               mov edx, 0x1d
0x1458eeb7d: e84eaa4a00               call 0x145d995d0
0x1458eeb82: 90                       nop
0x1458eeb83: 0f0b                     ud2
