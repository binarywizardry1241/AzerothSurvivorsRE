14594d490: 55 push rbp
14594d491: 4157 push r15
14594d493: 4156 push r14
14594d495: 4155 push r13
14594d497: 4154 push r12
14594d499: 56 push rsi
14594d49a: 57 push rdi
14594d49b: 53 push rbx
14594d49c: 4881ec08010000 sub rsp, 0x108
14594d4a3: 488dac2480000000 lea rbp, [rsp + 0x80]
14594d4ab: 0f297d70 movaps xmmword ptr [rbp + 0x70], xmm7
14594d4af: 0f297560 movaps xmmword ptr [rbp + 0x60], xmm6
14594d4b3: 48c74558feffffff mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
14594d4bb: 4c89c3 mov rbx, r8
14594d4be: 488b8160050000 mov rax, qword ptr [rcx + 0x560]
14594d4c5: 4c698168050000d8010000 imul r8, qword ptr [rcx + 0x568], 0x1d8
14594d4d0: 4531d2 xor r10d, r10d
14594d4d3: 4989c1 mov r9, rax
14594d4d6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594d4e0: 4d39d0 cmp r8, r10
14594d4e3: 0f84f1060000 je 0x14594dbda
14594d4e9: 4981c2d8010000 add r10, 0x1d8
14594d4f0: 493991f0000000 cmp qword ptr [r9 + 0xf0], rdx
14594d4f7: 4d8d89d8010000 lea r9, [r9 + 0x1d8]
14594d4fe: 75e0 jne 0x14594d4e0
14594d500: 4a83bc1040feffffff cmp qword ptr [rax + r10 - 0x1c0], -1
14594d509: 7412 je 0x14594d51d
14594d50b: 4a8b841058feffff mov rax, qword ptr [rax + r10 - 0x1a8]
14594d513: 4c8d4844 lea r9, [rax + 0x44]
14594d517: 4883c048 add rax, 0x48
14594d51b: eb1c jmp 0x14594d539
14594d51d: 4e8b8c1020ffffff mov r9, qword ptr [rax + r10 - 0xe0]
14594d525: 4d85c9 test r9, r9
14594d528: 0f84ac060000 je 0x14594dbda
14594d52e: 4983c124 add r9, 0x24
14594d532: 4c01d0 add rax, r10
14594d535: 4883c098 add rax, -0x68
14594d539: 48894dd8 mov qword ptr [rbp - 0x28], rcx
14594d53d: 488955a8 mov qword ptr [rbp - 0x58], rdx
14594d541: 448b03 mov r8d, dword ptr [rbx]
14594d544: 4585c0 test r8d, r8d
14594d547: 7503 jne 0x14594d54c
14594d549: 458b01 mov r8d, dword ptr [r9]
14594d54c: f30f1038 movss xmm7, dword ptr [rax]
14594d550: f30f107304 movss xmm6, dword ptr [rbx + 4]
14594d555: 48c7450800000000 mov qword ptr [rbp + 8], 0
14594d55d: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
14594d565: 488d4508 lea rax, [rbp + 8]
14594d569: 48894520 mov qword ptr [rbp + 0x20], rax
14594d56d: 0f57c0 xorps xmm0, xmm0
14594d570: 0f114528 movups xmmword ptr [rbp + 0x28], xmm0
14594d574: 48c7454083000000 mov qword ptr [rbp + 0x40], 0x83
14594d57c: 488d4db0 lea rcx, [rbp - 0x50]
14594d580: 488d5520 lea rdx, [rbp + 0x20]
14594d584: e897c0f8ff call 0x1458d9620
14594d589: 90 nop
14594d58a: 0f57c0 xorps xmm0, xmm0
14594d58d: f30fc2c601 cmpltss xmm0, xmm6
14594d592: 0f54f0 andps xmm6, xmm0
14594d595: 0f55c7 andnps xmm0, xmm7
14594d598: 0f56c6 orps xmm0, xmm6
14594d59b: 488b4508 mov rax, qword ptr [rbp + 8]
14594d59f: 4885c0 test rax, rax
14594d5a2: 7465 je 0x14594d609
14594d5a4: 488b4d10 mov rcx, qword ptr [rbp + 0x10]
14594d5a8: 66ba0400 mov dx, 4
14594d5ac: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14594d5b1: 4589c2 mov r10d, r8d
14594d5b4: 4501d2 add r10d, r10d
14594d5b7: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14594d5be: 6690 nop
14594d5c0: 4d85d2 test r10, r10
14594d5c3: 742b je 0x14594d5f0
14594d5c5: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14594d5cb: 410f97c3 seta r11b
14594d5cf: 4180db00 sbb r11b, 0
14594d5d3: 49ffc1 inc r9
14594d5d6: 4983c2fe add r10, -2
14594d5da: 4180fb01 cmp r11b, 1
14594d5de: 74e0 je 0x14594d5c0
14594d5e0: 450fb6c3 movzx r8d, r11b
14594d5e4: 4585c0 test r8d, r8d
14594d5e7: 7417 je 0x14594d600
14594d5e9: eb08 jmp 0x14594d5f3
14594d5eb: 0f1f440000 nop dword ptr [rax + rax]
14594d5f0: 4d89c1 mov r9, r8
14594d5f3: 4883e901 sub rcx, 1
14594d5f7: 7212 jb 0x14594d60b
14594d5f9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14594d5fe: ebac jmp 0x14594d5ac
14594d600: f3420f11448808 movss dword ptr [rax + r9*4 + 8], xmm0
14594d607: eb35 jmp 0x14594d63e
14594d609: 31c0 xor eax, eax
14594d60b: 66410f7ec0 movd r8d, xmm0
14594d610: 488d4d08 lea rcx, [rbp + 8]
14594d614: 48894d20 mov qword ptr [rbp + 0x20], rcx
14594d618: 48894528 mov qword ptr [rbp + 0x28], rax
14594d61c: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
14594d624: 4c894d38 mov qword ptr [rbp + 0x38], r9
14594d628: 48c7454004000000 mov qword ptr [rbp + 0x40], 4
14594d630: 488d4db0 lea rcx, [rbp - 0x50]
14594d634: 488d5520 lea rdx, [rbp + 0x20]
14594d638: e8e3bff8ff call 0x1458d9620
14594d63d: 90 nop
14594d63e: 448b4308 mov r8d, dword ptr [rbx + 8]
14594d642: 488b4508 mov rax, qword ptr [rbp + 8]
14594d646: 4885c0 test rax, rax
14594d649: 746c je 0x14594d6b7
14594d64b: 488b4d10 mov rcx, qword ptr [rbp + 0x10]
14594d64f: ba85000000 mov edx, 0x85
14594d654: 440fb75036 movzx r10d, word ptr [rax + 0x36]
14594d659: 4589d3 mov r11d, r10d
14594d65c: 4501db add r11d, r11d
14594d65f: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14594d666: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594d670: 4d85db test r11, r11
14594d673: 742b je 0x14594d6a0
14594d675: 420fb774483a movzx esi, word ptr [rax + r9*2 + 0x3a]
14594d67b: 39f2 cmp edx, esi
14594d67d: 400f97c6 seta sil
14594d681: 4080de00 sbb sil, 0
14594d685: 49ffc1 inc r9
14594d688: 4983c3fe add r11, -2
14594d68c: 4080fe01 cmp sil, 1
14594d690: 74de je 0x14594d670
14594d692: 440fb6d6 movzx r10d, sil
14594d696: 4585d2 test r10d, r10d
14594d699: 7415 je 0x14594d6b0
14594d69b: eb06 jmp 0x14594d6a3
14594d69d: 0f1f00 nop dword ptr [rax]
14594d6a0: 4d89d1 mov r9, r10
14594d6a3: 4883e901 sub rcx, 1
14594d6a7: 7210 jb 0x14594d6b9
14594d6a9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14594d6ae: eba4 jmp 0x14594d654
14594d6b0: 4689448808 mov dword ptr [rax + r9*4 + 8], r8d
14594d6b5: eb30 jmp 0x14594d6e7
14594d6b7: 31c0 xor eax, eax
14594d6b9: 488d4d08 lea rcx, [rbp + 8]
14594d6bd: 48894d20 mov qword ptr [rbp + 0x20], rcx
14594d6c1: 48894528 mov qword ptr [rbp + 0x28], rax
14594d6c5: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
14594d6cd: 4c894d38 mov qword ptr [rbp + 0x38], r9
14594d6d1: 48c7454085000000 mov qword ptr [rbp + 0x40], 0x85
14594d6d9: 488d4db0 lea rcx, [rbp - 0x50]
14594d6dd: 488d5520 lea rdx, [rbp + 0x20]
14594d6e1: e83abff8ff call 0x1458d9620
14594d6e6: 90 nop
14594d6e7: 488b4b14 mov rcx, qword ptr [rbx + 0x14]
14594d6eb: 488b430c mov rax, qword ptr [rbx + 0xc]
14594d6ef: 8b530c mov edx, dword ptr [rbx + 0xc]
14594d6f2: 8955e4 mov dword ptr [rbp - 0x1c], edx
14594d6f5: 488945c0 mov qword ptr [rbp - 0x40], rax
14594d6f9: 48894da0 mov qword ptr [rbp - 0x60], rcx
14594d6fd: 48894dc8 mov qword ptr [rbp - 0x38], rcx
14594d701: 48c745d000000000 mov qword ptr [rbp - 0x30], 0
14594d709: 4531f6 xor r14d, r14d
14594d70c: 48be0000000000020000 movabs rsi, 0x20000000000
14594d716: 31db xor ebx, ebx
14594d718: b902000000 mov ecx, 2
14594d71d: 4883fb02 cmp rbx, 2
14594d721: 745d je 0x14594d780
14594d723: eb1e jmp 0x14594d743
14594d725: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594d730: 4489649108 mov dword ptr [rcx + rdx*4 + 8], r12d
14594d735: 4c89f8 mov rax, r15
14594d738: b902000000 mov ecx, 2
14594d73d: 4883fb02 cmp rbx, 2
14594d741: 743d je 0x14594d780
14594d743: 4c8b7cddc0 mov r15, qword ptr [rbp + rbx*8 - 0x40]
14594d748: 48ffc3 inc rbx
14594d74b: 4c89f9 mov rcx, r15
14594d74e: 48ba0000000000ff0000 movabs rdx, 0xff0000000000
14594d758: 4821d1 and rcx, rdx
14594d75b: 4839f1 cmp rcx, rsi
14594d75e: 7510 jne 0x14594d770
14594d760: 4889d9 mov rcx, rbx
14594d763: eb1b jmp 0x14594d780
14594d765: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594d770: 4c89f7 mov rdi, r14
14594d773: 49ffc6 inc r14
14594d776: 4c8975d0 mov qword ptr [rbp - 0x30], r14
14594d77a: eb1a jmp 0x14594d796
14594d77c: 0f1f4000 nop dword ptr [rax]
14594d780: 48baffffffffff00ffff movabs rdx, 0xffff00ffffffffff
14594d78a: 4821d0 and rax, rdx
14594d78d: 4809f0 or rax, rsi
14594d790: 4989c7 mov r15, rax
14594d793: 4889cb mov rbx, rcx
14594d796: 4c89f8 mov rax, r15
14594d799: 48b90000000000ff0000 movabs rcx, 0xff0000000000
14594d7a3: 4821c8 and rax, rcx
14594d7a6: 4839f0 cmp rax, rsi
14594d7a9: 0f848a020000 je 0x14594da39
14594d7af: 4585ff test r15d, r15d
14594d7b2: 743c je 0x14594d7f0
14594d7b4: 4d89fd mov r13, r15
14594d7b7: 49c1ed18 shr r13, 0x18
14594d7bb: 4181e500ff0000 and r13d, 0xff00
14594d7c2: 490fbae728 bt r15, 0x28
14594d7c7: 0f82a3000000 jb 0x14594d870
14594d7cd: 4181cd0200010d or r13d, 0xd010002
14594d7d4: 41bc03000000 mov r12d, 3
14594d7da: 8d4725 lea eax, [rdi + 0x25]
14594d7dd: 488b4d08 mov rcx, qword ptr [rbp + 8]
14594d7e1: 4885c9 test rcx, rcx
14594d7e4: 7520 jne 0x14594d806
14594d7e6: e9a2000000 jmp 0x14594d88d
14594d7eb: 0f1f440000 nop dword ptr [rax + rax]
14594d7f0: 4531ed xor r13d, r13d
14594d7f3: 4531e4 xor r12d, r12d
14594d7f6: 8d4725 lea eax, [rdi + 0x25]
14594d7f9: 488b4d08 mov rcx, qword ptr [rbp + 8]
14594d7fd: 4885c9 test rcx, rcx
14594d800: 0f8487000000 je 0x14594d88d
14594d806: 4c8b4510 mov r8, qword ptr [rbp + 0x10]
14594d80a: 440fb74936 movzx r9d, word ptr [rcx + 0x36]
14594d80f: 4589ca mov r10d, r9d
14594d812: 4501d2 add r10d, r10d
14594d815: 48c7c2ffffffff mov rdx, 0xffffffffffffffff
14594d81c: 0f1f4000 nop dword ptr [rax]
14594d820: 4d85d2 test r10, r10
14594d823: 742b je 0x14594d850
14594d825: 663b44513a cmp ax, word ptr [rcx + rdx*2 + 0x3a]
14594d82a: 410f97c3 seta r11b
14594d82e: 4180db00 sbb r11b, 0
14594d832: 48ffc2 inc rdx
14594d835: 4983c2fe add r10, -2
14594d839: 4180fb01 cmp r11b, 1
14594d83d: 74e1 je 0x14594d820
14594d83f: 450fb6cb movzx r9d, r11b
14594d843: 4585c9 test r9d, r9d
14594d846: 7418 je 0x14594d860
14594d848: 4983e801 sub r8, 1
14594d84c: 730b jae 0x14594d859
14594d84e: eb3f jmp 0x14594d88f
14594d850: 4c89ca mov rdx, r9
14594d853: 4983e801 sub r8, 1
14594d857: 7236 jb 0x14594d88f
14594d859: 488b4cd150 mov rcx, qword ptr [rcx + rdx*8 + 0x50]
14594d85e: ebaa jmp 0x14594d80a
14594d860: 44897c9108 mov dword ptr [rcx + rdx*4 + 8], r15d
14594d865: eb58 jmp 0x14594d8bf
14594d867: 660f1f840000000000 nop word ptr [rax + rax]
14594d870: 4181cd02000111 or r13d, 0x11010002
14594d877: 41bc01000000 mov r12d, 1
14594d87d: 8d4725 lea eax, [rdi + 0x25]
14594d880: 488b4d08 mov rcx, qword ptr [rbp + 8]
14594d884: 4885c9 test rcx, rcx
14594d887: 0f8579ffffff jne 0x14594d806
14594d88d: 31c9 xor ecx, ecx
14594d88f: 0fb7c0 movzx eax, ax
14594d892: 4c8d4508 lea r8, [rbp + 8]
14594d896: 4c894520 mov qword ptr [rbp + 0x20], r8
14594d89a: 48894d28 mov qword ptr [rbp + 0x28], rcx
14594d89e: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
14594d8a6: 48895538 mov qword ptr [rbp + 0x38], rdx
14594d8aa: 48894540 mov qword ptr [rbp + 0x40], rax
14594d8ae: 488d4de8 lea rcx, [rbp - 0x18]
14594d8b2: 488d5520 lea rdx, [rbp + 0x20]
14594d8b6: 4589f8 mov r8d, r15d
14594d8b9: e862bdf8ff call 0x1458d9620
14594d8be: 90 nop
14594d8bf: 8d047d28000000 lea eax, [rdi*2 + 0x28]
14594d8c6: 488b4d08 mov rcx, qword ptr [rbp + 8]
14594d8ca: 4885c9 test rcx, rcx
14594d8cd: 7471 je 0x14594d940
14594d8cf: 4c8b4510 mov r8, qword ptr [rbp + 0x10]
14594d8d3: 440fb74936 movzx r9d, word ptr [rcx + 0x36]
14594d8d8: 4589ca mov r10d, r9d
14594d8db: 4501d2 add r10d, r10d
14594d8de: 48c7c2ffffffff mov rdx, 0xffffffffffffffff
14594d8e5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594d8f0: 4d85d2 test r10, r10
14594d8f3: 742b je 0x14594d920
14594d8f5: 663b44513a cmp ax, word ptr [rcx + rdx*2 + 0x3a]
14594d8fa: 410f97c3 seta r11b
14594d8fe: 4180db00 sbb r11b, 0
14594d902: 48ffc2 inc rdx
14594d905: 4983c2fe add r10, -2
14594d909: 4180fb01 cmp r11b, 1
14594d90d: 74e1 je 0x14594d8f0
14594d90f: 450fb6cb movzx r9d, r11b
14594d913: 4585c9 test r9d, r9d
14594d916: 7418 je 0x14594d930
14594d918: 4983e801 sub r8, 1
14594d91c: 730b jae 0x14594d929
14594d91e: eb22 jmp 0x14594d942
14594d920: 4c89ca mov rdx, r9
14594d923: 4983e801 sub r8, 1
14594d927: 7219 jb 0x14594d942
14594d929: 488b4cd150 mov rcx, qword ptr [rcx + rdx*8 + 0x50]
14594d92e: eba3 jmp 0x14594d8d3
14594d930: 44896c9108 mov dword ptr [rcx + rdx*4 + 8], r13d
14594d935: eb3b jmp 0x14594d972
14594d937: 660f1f840000000000 nop word ptr [rax + rax]
14594d940: 31c9 xor ecx, ecx
14594d942: 0fb7c0 movzx eax, ax
14594d945: 4c8d4508 lea r8, [rbp + 8]
14594d949: 4c894520 mov qword ptr [rbp + 0x20], r8
14594d94d: 48894d28 mov qword ptr [rbp + 0x28], rcx
14594d951: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
14594d959: 48895538 mov qword ptr [rbp + 0x38], rdx
14594d95d: 48894540 mov qword ptr [rbp + 0x40], rax
14594d961: 488d4de8 lea rcx, [rbp - 0x18]
14594d965: 488d5520 lea rdx, [rbp + 0x20]
14594d969: 4589e8 mov r8d, r13d
14594d96c: e8afbcf8ff call 0x1458d9620
14594d971: 90 nop
14594d972: 8d043f lea eax, [rdi + rdi]
14594d975: 83c029 add eax, 0x29
14594d978: 488b4d08 mov rcx, qword ptr [rbp + 8]
14594d97c: 4885c9 test rcx, rcx
14594d97f: 746f je 0x14594d9f0
14594d981: 4c8b4510 mov r8, qword ptr [rbp + 0x10]
14594d985: 440fb74936 movzx r9d, word ptr [rcx + 0x36]
14594d98a: 4589ca mov r10d, r9d
14594d98d: 4501d2 add r10d, r10d
14594d990: 48c7c2ffffffff mov rdx, 0xffffffffffffffff
14594d997: 660f1f840000000000 nop word ptr [rax + rax]
14594d9a0: 4d85d2 test r10, r10
14594d9a3: 743b je 0x14594d9e0
14594d9a5: 663b44513a cmp ax, word ptr [rcx + rdx*2 + 0x3a]
14594d9aa: 410f97c3 seta r11b
14594d9ae: 4180db00 sbb r11b, 0
14594d9b2: 48ffc2 inc rdx
14594d9b5: 4983c2fe add r10, -2
14594d9b9: 4180fb01 cmp r11b, 1
14594d9bd: 74e1 je 0x14594d9a0
14594d9bf: 450fb6cb movzx r9d, r11b
14594d9c3: 4585c9 test r9d, r9d
14594d9c6: 0f8464fdffff je 0x14594d730
14594d9cc: 4983e801 sub r8, 1
14594d9d0: 7317 jae 0x14594d9e9
14594d9d2: eb1e jmp 0x14594d9f2
14594d9d4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594d9e0: 4c89ca mov rdx, r9
14594d9e3: 4983e801 sub r8, 1
14594d9e7: 7209 jb 0x14594d9f2
14594d9e9: 488b4cd150 mov rcx, qword ptr [rcx + rdx*8 + 0x50]
14594d9ee: eb95 jmp 0x14594d985
14594d9f0: 31c9 xor ecx, ecx
14594d9f2: 0fb7c0 movzx eax, ax
14594d9f5: 4c8d4508 lea r8, [rbp + 8]
14594d9f9: 4c894520 mov qword ptr [rbp + 0x20], r8
14594d9fd: 48894d28 mov qword ptr [rbp + 0x28], rcx
14594da01: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
14594da09: 48895538 mov qword ptr [rbp + 0x38], rdx
14594da0d: 48894540 mov qword ptr [rbp + 0x40], rax
14594da11: 488d4de8 lea rcx, [rbp - 0x18]
14594da15: 488d5520 lea rdx, [rbp + 0x20]
14594da19: 4589e0 mov r8d, r12d
14594da1c: e8ffbbf8ff call 0x1458d9620
14594da21: 90 nop
14594da22: 4c89f8 mov rax, r15
14594da25: b902000000 mov ecx, 2
14594da2a: 4883fb02 cmp rbx, 2
14594da2e: 0f850ffdffff jne 0x14594d743
14594da34: e947fdffff jmp 0x14594d780
14594da39: 4531c0 xor r8d, r8d
14594da3c: 8b45e4 mov eax, dword ptr [rbp - 0x1c]
14594da3f: 0b45a0 or eax, dword ptr [rbp - 0x60]
14594da42: 410f95c0 setne r8b
14594da46: 488b4508 mov rax, qword ptr [rbp + 8]
14594da4a: 4885c0 test rax, rax
14594da4d: 7468 je 0x14594dab7
14594da4f: 488b4d10 mov rcx, qword ptr [rbp + 0x10]
14594da53: baa4000000 mov edx, 0xa4
14594da58: 488b7dd8 mov rdi, qword ptr [rbp - 0x28]
14594da5c: 440fb75036 movzx r10d, word ptr [rax + 0x36]
14594da61: 4589d3 mov r11d, r10d
14594da64: 4501db add r11d, r11d
14594da67: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14594da6e: 6690 nop
14594da70: 4d85db test r11, r11
14594da73: 742b je 0x14594daa0
14594da75: 420fb774483a movzx esi, word ptr [rax + r9*2 + 0x3a]
14594da7b: 39f2 cmp edx, esi
14594da7d: 0f97c3 seta bl
14594da80: 80db00 sbb bl, 0
14594da83: 49ffc1 inc r9
14594da86: 4983c3fe add r11, -2
14594da8a: 80fb01 cmp bl, 1
14594da8d: 74e1 je 0x14594da70
14594da8f: 440fb6d3 movzx r10d, bl
14594da93: 4585d2 test r10d, r10d
14594da96: 7418 je 0x14594dab0
14594da98: eb09 jmp 0x14594daa3
14594da9a: 660f1f440000 nop word ptr [rax + rax]
14594daa0: 4d89d1 mov r9, r10
14594daa3: 4883e901 sub rcx, 1
14594daa7: 7210 jb 0x14594dab9
14594daa9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14594daae: ebac jmp 0x14594da5c
14594dab0: 4689448808 mov dword ptr [rax + r9*4 + 8], r8d
14594dab5: eb34 jmp 0x14594daeb
14594dab7: 31c0 xor eax, eax
14594dab9: 488d4d08 lea rcx, [rbp + 8]
14594dabd: 48894d20 mov qword ptr [rbp + 0x20], rcx
14594dac1: 48894528 mov qword ptr [rbp + 0x28], rax
14594dac5: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
14594dacd: 4c894d38 mov qword ptr [rbp + 0x38], r9
14594dad1: 48c74540a4000000 mov qword ptr [rbp + 0x40], 0xa4
14594dad9: 488d4db0 lea rcx, [rbp - 0x50]
14594dadd: 488d5520 lea rdx, [rbp + 0x20]
14594dae1: e83abbf8ff call 0x1458d9620
14594dae6: 90 nop
14594dae7: 488b7dd8 mov rdi, qword ptr [rbp - 0x28]
14594daeb: c7450000000000 mov dword ptr [rbp], 0
14594daf2: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
14594dafa: 48c745f001000000 mov qword ptr [rbp - 0x10], 1
14594db02: 48c745f800000000 mov qword ptr [rbp - 8], 0
14594db0a: 48837d1800 cmp qword ptr [rbp + 0x18], 0
14594db0f: 7444 je 0x14594db55
14594db11: c6455701 mov byte ptr [rbp + 0x57], 1
14594db15: 488d4de8 lea rcx, [rbp - 0x18]
14594db19: e892b64400 call 0x145d991b0
14594db1e: 90 nop
14594db1f: 488b45f0 mov rax, qword ptr [rbp - 0x10]
14594db23: c60000 mov byte ptr [rax], 0
14594db26: 48c745f801000000 mov qword ptr [rbp - 8], 1
14594db2e: c6455701 mov byte ptr [rbp + 0x57], 1
14594db32: 488d55e8 lea rdx, [rbp - 0x18]
14594db36: 488b4da8 mov rcx, qword ptr [rbp - 0x58]
14594db3a: e8a117f8ff call 0x1458cf2e0
14594db3f: 90 nop
14594db40: c6455701 mov byte ptr [rbp + 0x57], 1
14594db44: 488d4d08 lea rcx, [rbp + 8]
14594db48: 488d55e8 lea rdx, [rbp - 0x18]
14594db4c: e81f26f7ff call 0x1458c0170
14594db51: 90 nop
14594db52: ff4500 inc dword ptr [rbp]
14594db55: 488b45e8 mov rax, qword ptr [rbp - 0x18]
14594db59: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
14594db5d: 488b55f8 mov rdx, qword ptr [rbp - 8]
14594db61: 48895530 mov qword ptr [rbp + 0x30], rdx
14594db65: 8b5500 mov edx, dword ptr [rbp]
14594db68: 895538 mov dword ptr [rbp + 0x38], edx
14594db6b: 8b5504 mov edx, dword ptr [rbp + 4]
14594db6e: 89553c mov dword ptr [rbp + 0x3c], edx
14594db71: 48894520 mov qword ptr [rbp + 0x20], rax
14594db75: 48894d28 mov qword ptr [rbp + 0x28], rcx
14594db79: c6455700 mov byte ptr [rbp + 0x57], 0
14594db7d: 488d4db0 lea rcx, [rbp - 0x50]
14594db81: 488d5520 lea rdx, [rbp + 0x20]
14594db85: e8d61bf7ff call 0x1458bf760
14594db8a: 90 nop
14594db8b: 488bb728060000 mov rsi, qword ptr [rdi + 0x628]
14594db92: 483bb718060000 cmp rsi, qword ptr [rdi + 0x618]
14594db99: 750d jne 0x14594dba8
14594db9b: 488d8f18060000 lea rcx, [rdi + 0x618]
14594dba2: e869d22a00 call 0x145bfae10
14594dba7: 90 nop
14594dba8: 488b8720060000 mov rax, qword ptr [rdi + 0x620]
14594dbaf: 4889f1 mov rcx, rsi
14594dbb2: 48c1e105 shl rcx, 5
14594dbb6: 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
14594dbba: 0f104dc0 movups xmm1, xmmword ptr [rbp - 0x40]
14594dbbe: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594dbc3: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594dbc7: 48ffc6 inc rsi
14594dbca: 4889b728060000 mov qword ptr [rdi + 0x628], rsi
14594dbd1: 488d4d08 lea rcx, [rbp + 8]
14594dbd5: e8c66b0600 call 0x1459b47a0
