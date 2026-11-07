1459cdc50: 55 push rbp
1459cdc51: 4157 push r15
1459cdc53: 4156 push r14
1459cdc55: 4155 push r13
1459cdc57: 4154 push r12
1459cdc59: 56 push rsi
1459cdc5a: 57 push rdi
1459cdc5b: 53 push rbx
1459cdc5c: 4883ec78 sub rsp, 0x78
1459cdc60: 488d6c2470 lea rbp, [rsp + 0x70]
1459cdc65: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459cdc6d: 488b3a mov rdi, qword ptr [rdx]
1459cdc70: 4c8b7208 mov r14, qword ptr [rdx + 8]
1459cdc74: 4c8b39 mov r15, qword ptr [rcx]
1459cdc77: 488b4108 mov rax, qword ptr [rcx + 8]
1459cdc7b: 4c29f8 sub rax, r15
1459cdc7e: 48c1e803 shr rax, 3
1459cdc82: 49bdabaaaaaaaaaaaaaa movabs r13, 0xaaaaaaaaaaaaaaab
1459cdc8c: 4c0fafe8 imul r13, rax
1459cdc90: 488b4110 mov rax, qword ptr [rcx + 0x10]
1459cdc94: 4939c5 cmp r13, rax
1459cdc97: 4c0f43e8 cmovae r13, rax
1459cdc9b: 4d85ed test r13, r13
1459cdc9e: 0f84d9010000 je 0x1459cde7d
1459cdca4: 488b4210 mov rax, qword ptr [rdx + 0x10]
1459cdca8: 488945b8 mov qword ptr [rbp - 0x48], rax
1459cdcac: 488b5918 mov rbx, qword ptr [rcx + 0x18]
1459cdcb0: 488d35a9958601 lea rsi, [rip + 0x18695a9]
1459cdcb7: 4531e4 xor r12d, r12d
1459cdcba: 48897de0 mov qword ptr [rbp - 0x20], rdi
1459cdcbe: 4b8d0464 lea rax, [r12 + r12*2]
1459cdcc2: 498b4cc708 mov rcx, qword ptr [r15 + rax*8 + 8]
1459cdcc7: 498b54c710 mov rdx, qword ptr [r15 + rax*8 + 0x10]
1459cdccc: e8df61feff call 0x1459b3eb0
1459cdcd1: 4885c0 test rax, rax
1459cdcd4: 0f84f1000000 je 0x1459cddcb
1459cdcda: 488b5040 mov rdx, qword ptr [rax + 0x40]
1459cdcde: 4885d2 test rdx, rdx
1459cdce1: 0f84e6000000 je 0x1459cddcd
1459cdce7: 4c8965f8 mov qword ptr [rbp - 8], r12
1459cdceb: 4c8ba3b8000000 mov r12, qword ptr [rbx + 0xb8]
1459cdcf2: 4d85e4 test r12, r12
1459cdcf5: 0f8465010000 je 0x1459cde60
1459cdcfb: 4c896dd0 mov qword ptr [rbp - 0x30], r13
1459cdcff: 4c897dc8 mov qword ptr [rbp - 0x38], r15
1459cdd03: 4c8975f0 mov qword ptr [rbp - 0x10], r14
1459cdd07: 488945c0 mov qword ptr [rbp - 0x40], rax
1459cdd0b: 4c8b4848 mov r9, qword ptr [rax + 0x48]
1459cdd0f: 48895dd8 mov qword ptr [rbp - 0x28], rbx
1459cdd13: 4c8bbbb0000000 mov r15, qword ptr [rbx + 0xb0]
1459cdd1a: 41be00000000 mov r14d, 0
1459cdd20: 4983fc01 cmp r12, 1
1459cdd24: 7459 je 0x1459cdd7f
1459cdd26: 4531f6 xor r14d, r14d
1459cdd29: 0f1f8000000000 nop dword ptr [rax]
1459cdd30: 4c8975b0 mov qword ptr [rbp - 0x50], r14
1459cdd34: 4d89e5 mov r13, r12
1459cdd37: 49d1ed shr r13, 1
1459cdd3a: 4d01ee add r14, r13
1459cdd3d: 4b8d0476 lea rax, [r14 + r14*2]
1459cdd41: 498b4cc708 mov rcx, qword ptr [r15 + rax*8 + 8]
1459cdd46: 4d8b44c710 mov r8, qword ptr [r15 + rax*8 + 0x10]
1459cdd4b: 4c89c7 mov rdi, r8
1459cdd4e: 4c29cf sub rdi, r9
1459cdd51: 4d0f43c1 cmovae r8, r9
1459cdd55: 4889d3 mov rbx, rdx
1459cdd58: 4c89ce mov rsi, r9
1459cdd5b: e881c32200 call 0x145bfa0e1
1459cdd60: 4989f1 mov r9, rsi
1459cdd63: 4889da mov rdx, rbx
1459cdd66: 4898 cdqe
1459cdd68: 85c0 test eax, eax
1459cdd6a: 480f45f8 cmovne rdi, rax
1459cdd6e: 4885ff test rdi, rdi
1459cdd71: 4c0f4f75b0 cmovg r14, qword ptr [rbp - 0x50]
1459cdd76: 4d29ec sub r12, r13
1459cdd79: 4983fc01 cmp r12, 1
1459cdd7d: 77b1 ja 0x1459cdd30
1459cdd7f: 4b8d0476 lea rax, [r14 + r14*2]
1459cdd83: 498b4cc708 mov rcx, qword ptr [r15 + rax*8 + 8]
1459cdd88: 498b44c710 mov rax, qword ptr [r15 + rax*8 + 0x10]
1459cdd8d: 4889c6 mov rsi, rax
1459cdd90: 4c29ce sub rsi, r9
1459cdd93: 4c0f42c8 cmovb r9, rax
1459cdd97: 4d89c8 mov r8, r9
1459cdd9a: e842c32200 call 0x145bfa0e1
1459cdd9f: 4898 cdqe
1459cdda1: 85c0 test eax, eax
1459cdda3: 480f45f0 cmovne rsi, rax
1459cdda7: 4885f6 test rsi, rsi
1459cddaa: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1459cddae: 4c8b75f0 mov r14, qword ptr [rbp - 0x10]
1459cddb2: 4c8b7dc8 mov r15, qword ptr [rbp - 0x38]
1459cddb6: 4c8b6dd0 mov r13, qword ptr [rbp - 0x30]
1459cddba: 488b5dd8 mov rbx, qword ptr [rbp - 0x28]
1459cddbe: 488d359b948601 lea rsi, [rip + 0x186949b]
1459cddc5: 4c8b65f8 mov r12, qword ptr [rbp - 8]
1459cddc9: 7402 je 0x1459cddcd
1459cddcb: 31c0 xor eax, eax
1459cddcd: 49ffc4 inc r12
1459cddd0: 4885c0 test rax, rax
1459cddd3: 480f44c6 cmove rax, rsi
1459cddd7: 488b7808 mov rdi, qword ptr [rax + 8]
1459cdddb: 4885ff test rdi, rdi
1459cddde: 0f8887000000 js 0x1459cde6b
1459cdde4: 7449 je 0x1459cde2f
1459cdde6: 4c8965f8 mov qword ptr [rbp - 8], r12
1459cddea: 4889de mov rsi, rbx
1459cdded: 488b18 mov rbx, qword ptr [rax]
1459cddf0: e80b4463fa call 0x140002200
1459cddf5: ba01000000 mov edx, 1
1459cddfa: 4889f9 mov rcx, rdi
1459cddfd: e8be4363fa call 0x1400021c0
1459cde02: 4885c0 test rax, rax
1459cde05: 0f8486000000 je 0x1459cde91
1459cde0b: 4989c4 mov r12, rax
1459cde0e: 4889c1 mov rcx, rax
1459cde11: 4889da mov rdx, rbx
1459cde14: 4989f8 mov r8, rdi
1459cde17: e8cbc22200 call 0x145bfa0e7
1459cde1c: 4c89e1 mov rcx, r12
1459cde1f: 4889f3 mov rbx, rsi
1459cde22: 488d3537948601 lea rsi, [rip + 0x1869437]
1459cde29: 4c8b65f8 mov r12, qword ptr [rbp - 8]
1459cde2d: eb05 jmp 0x1459cde34
1459cde2f: b901000000 mov ecx, 1
1459cde34: 4b8d0476 lea rax, [r14 + r14*2]
1459cde38: 488b55b8 mov rdx, qword ptr [rbp - 0x48]
1459cde3c: 48893cc2 mov qword ptr [rdx + rax*8], rdi
1459cde40: 48894de8 mov qword ptr [rbp - 0x18], rcx
1459cde44: 48894cc208 mov qword ptr [rdx + rax*8 + 8], rcx
1459cde49: 48897cc210 mov qword ptr [rdx + rax*8 + 0x10], rdi
1459cde4e: 49ffc6 inc r14
1459cde51: 4d39ec cmp r12, r13
1459cde54: 488b7de0 mov rdi, qword ptr [rbp - 0x20]
1459cde58: 0f8560feffff jne 0x1459cdcbe
1459cde5e: eb1d jmp 0x1459cde7d
1459cde60: 31c0 xor eax, eax
1459cde62: 4c8b65f8 mov r12, qword ptr [rbp - 8]
1459cde66: e962ffffff jmp 0x1459cddcd
1459cde6b: 4c8975f0 mov qword ptr [rbp - 0x10], r14
1459cde6f: 31c9 xor ecx, ecx
1459cde71: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
1459cde75: e841b43c00 call 0x145d992bb
1459cde7a: 90 nop
1459cde7b: 0f0b ud2
1459cde7d: 4c8937 mov qword ptr [rdi], r14
1459cde80: 4883c478 add rsp, 0x78
1459cde84: 5b pop rbx
1459cde85: 5f pop rdi
1459cde86: 5e pop rsi
1459cde87: 415c pop r12
1459cde89: 415d pop r13
1459cde8b: 415e pop r14
1459cde8d: 415f pop r15
1459cde8f: 5d pop rbp
1459cde90: c3 ret
1459cde91: 4c8975f0 mov qword ptr [rbp - 0x10], r14
1459cde95: 48897de8 mov qword ptr [rbp - 0x18], rdi
1459cde99: b901000000 mov ecx, 1
1459cde9e: ebd1 jmp 0x1459cde71
