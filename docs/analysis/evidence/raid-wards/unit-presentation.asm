14593c570: 55 push rbp
14593c571: 4157 push r15
14593c573: 4156 push r14
14593c575: 4154 push r12
14593c577: 56 push rsi
14593c578: 57 push rdi
14593c579: 53 push rbx
14593c57a: 4881ec00010000 sub rsp, 0x100
14593c581: 488dac2480000000 lea rbp, [rsp + 0x80]
14593c589: 660f7f7570 movdqa xmmword ptr [rbp + 0x70], xmm6
14593c58e: 48c74568feffffff mov qword ptr [rbp + 0x68], 0xfffffffffffffffe
14593c596: 4589ce mov r14d, r9d
14593c599: 4589c4 mov r12d, r8d
14593c59c: 4889d7 mov rdi, rdx
14593c59f: 4889ce mov rsi, rcx
14593c5a2: 0fb685f0000000 movzx eax, byte ptr [rbp + 0xf0]
14593c5a9: 8d0440 lea eax, [rax + rax*2]
14593c5ac: 0381e0040000 add eax, dword ptr [rcx + 0x4e0]
14593c5b2: 83f83f cmp eax, 0x3f
14593c5b5: 41bf3f000000 mov r15d, 0x3f
14593c5bb: 440f42f8 cmovb r15d, eax
14593c5bf: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
14593c5c7: 48c7452800000000 mov qword ptr [rbp + 0x28], 0
14593c5cf: 488d5d18 lea rbx, [rbp + 0x18]
14593c5d3: 4889d9 mov rcx, rbx
14593c5d6: 31d2 xor edx, edx
14593c5d8: 4989f8 mov r8, rdi
14593c5db: e8d053f8ff call 0x1458c19b0
14593c5e0: 90 nop
14593c5e1: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593c5e5: 4885c0 test rax, rax
14593c5e8: 7471 je 0x14593c65b
14593c5ea: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593c5ee: 66ba0200 mov dx, 2
14593c5f2: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593c5f7: 4589ca mov r10d, r9d
14593c5fa: 4501d2 add r10d, r10d
14593c5fd: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593c604: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593c610: 4d85d2 test r10, r10
14593c613: 742b je 0x14593c640
14593c615: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593c61b: 410f97c3 seta r11b
14593c61f: 4180db00 sbb r11b, 0
14593c623: 49ffc0 inc r8
14593c626: 4983c2fe add r10, -2
14593c62a: 4180fb01 cmp r11b, 1
14593c62e: 74e0 je 0x14593c610
14593c630: 450fb6cb movzx r9d, r11b
14593c634: 4585c9 test r9d, r9d
14593c637: 7417 je 0x14593c650
14593c639: eb08 jmp 0x14593c643
14593c63b: 0f1f440000 nop dword ptr [rax + rax]
14593c640: 4d89c8 mov r8, r9
14593c643: 4883e901 sub rcx, 1
14593c647: 7214 jb 0x14593c65d
14593c649: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593c64e: eba2 jmp 0x14593c5f2
14593c650: 42c744800809000000 mov dword ptr [rax + r8*4 + 8], 9
14593c659: eb32 jmp 0x14593c68d
14593c65b: 31c0 xor eax, eax
14593c65d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593c661: 48894538 mov qword ptr [rbp + 0x38], rax
14593c665: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593c66d: 4c894548 mov qword ptr [rbp + 0x48], r8
14593c671: 48c7455002000000 mov qword ptr [rbp + 0x50], 2
14593c679: 488d4df8 lea rcx, [rbp - 8]
14593c67d: 488d5530 lea rdx, [rbp + 0x30]
14593c681: 41b809000000 mov r8d, 9
14593c687: e8641bfaff call 0x1458de1f0
14593c68c: 90 nop
14593c68d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593c691: 4885c0 test rax, rax
14593c694: 7461 je 0x14593c6f7
14593c696: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593c69a: 66ba0300 mov dx, 3
14593c69e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593c6a3: 4589ca mov r10d, r9d
14593c6a6: 4501d2 add r10d, r10d
14593c6a9: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593c6b0: 4d85d2 test r10, r10
14593c6b3: 742b je 0x14593c6e0
14593c6b5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593c6bb: 410f97c3 seta r11b
14593c6bf: 4180db00 sbb r11b, 0
14593c6c3: 49ffc0 inc r8
14593c6c6: 4983c2fe add r10, -2
14593c6ca: 4180fb01 cmp r11b, 1
14593c6ce: 74e0 je 0x14593c6b0
14593c6d0: 450fb6cb movzx r9d, r11b
14593c6d4: 4585c9 test r9d, r9d
14593c6d7: 7417 je 0x14593c6f0
14593c6d9: eb08 jmp 0x14593c6e3
14593c6db: 0f1f440000 nop dword ptr [rax + rax]
14593c6e0: 4d89c8 mov r8, r9
14593c6e3: 4883e901 sub rcx, 1
14593c6e7: 7210 jb 0x14593c6f9
14593c6e9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593c6ee: ebae jmp 0x14593c69e
14593c6f0: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
14593c6f5: eb2f jmp 0x14593c726
14593c6f7: 31c0 xor eax, eax
14593c6f9: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593c6fd: 48894538 mov qword ptr [rbp + 0x38], rax
14593c701: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593c709: 4c894548 mov qword ptr [rbp + 0x48], r8
14593c70d: 48c7455003000000 mov qword ptr [rbp + 0x50], 3
14593c715: 488d4df8 lea rcx, [rbp - 8]
14593c719: 488d5530 lea rdx, [rbp + 0x30]
14593c71d: 4589e0 mov r8d, r12d
14593c720: e8cb1afaff call 0x1458de1f0
14593c725: 90 nop
14593c726: 660f6eb5e0000000 movd xmm6, dword ptr [rbp + 0xe0]
14593c72e: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593c732: 4885c0 test rax, rax
14593c735: 7472 je 0x14593c7a9
14593c737: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593c73b: 66ba0400 mov dx, 4
14593c73f: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14593c744: 4589c2 mov r10d, r8d
14593c747: 4501d2 add r10d, r10d
14593c74a: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14593c751: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593c760: 4d85d2 test r10, r10
14593c763: 742b je 0x14593c790
14593c765: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14593c76b: 410f97c3 seta r11b
14593c76f: 4180db00 sbb r11b, 0
14593c773: 49ffc1 inc r9
14593c776: 4983c2fe add r10, -2
14593c77a: 4180fb01 cmp r11b, 1
14593c77e: 74e0 je 0x14593c760
14593c780: 450fb6c3 movzx r8d, r11b
14593c784: 4585c0 test r8d, r8d
14593c787: 7417 je 0x14593c7a0
14593c789: eb08 jmp 0x14593c793
14593c78b: 0f1f440000 nop dword ptr [rax + rax]
14593c790: 4d89c1 mov r9, r8
14593c793: 4883e901 sub rcx, 1
14593c797: 7212 jb 0x14593c7ab
14593c799: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14593c79e: eb9f jmp 0x14593c73f
14593c7a0: 66420f7e748808 movd dword ptr [rax + r9*4 + 8], xmm6
14593c7a7: eb31 jmp 0x14593c7da
14593c7a9: 31c0 xor eax, eax
14593c7ab: 66410f7ef0 movd r8d, xmm6
14593c7b0: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593c7b4: 48894538 mov qword ptr [rbp + 0x38], rax
14593c7b8: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593c7c0: 4c894d48 mov qword ptr [rbp + 0x48], r9
14593c7c4: 48c7455004000000 mov qword ptr [rbp + 0x50], 4
14593c7cc: 488d4df8 lea rcx, [rbp - 8]
14593c7d0: 488d5530 lea rdx, [rbp + 0x30]
14593c7d4: e8171afaff call 0x1458de1f0
14593c7d9: 90 nop
14593c7da: f30f1085e8000000 movss xmm0, dword ptr [rbp + 0xe8]
14593c7e2: e85adc2c00 call 0x145c0a441
14593c7e7: f3480f2cc0 cvttss2si rax, xmm0
14593c7ec: 31c9 xor ecx, ecx
14593c7ee: 0f57c9 xorps xmm1, xmm1
14593c7f1: 0f2ec1 ucomiss xmm0, xmm1
14593c7f4: 0f42c1 cmovb eax, ecx
14593c7f7: 0f2e0546a34700 ucomiss xmm0, dword ptr [rip + 0x47a346]
14593c7fe: 41bcffffffff mov r12d, 0xffffffff
14593c804: 440f46e0 cmovbe r12d, eax
14593c808: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593c80c: 4885c0 test rax, rax
14593c80f: 7466 je 0x14593c877
14593c811: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593c815: 66ba1600 mov dx, 0x16
14593c819: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593c81e: 4589ca mov r10d, r9d
14593c821: 4501d2 add r10d, r10d
14593c824: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593c82b: 0f1f440000 nop dword ptr [rax + rax]
14593c830: 4d85d2 test r10, r10
14593c833: 742b je 0x14593c860
14593c835: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593c83b: 410f97c3 seta r11b
14593c83f: 4180db00 sbb r11b, 0
14593c843: 49ffc0 inc r8
14593c846: 4983c2fe add r10, -2
14593c84a: 4180fb01 cmp r11b, 1
14593c84e: 74e0 je 0x14593c830
14593c850: 450fb6cb movzx r9d, r11b
14593c854: 4585c9 test r9d, r9d
14593c857: 7417 je 0x14593c870
14593c859: eb08 jmp 0x14593c863
14593c85b: 0f1f440000 nop dword ptr [rax + rax]
14593c860: 4d89c8 mov r8, r9
14593c863: 4883e901 sub rcx, 1
14593c867: 7210 jb 0x14593c879
14593c869: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593c86e: eba9 jmp 0x14593c819
14593c870: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
14593c875: eb2f jmp 0x14593c8a6
14593c877: 31c0 xor eax, eax
14593c879: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593c87d: 48894538 mov qword ptr [rbp + 0x38], rax
14593c881: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593c889: 4c894548 mov qword ptr [rbp + 0x48], r8
14593c88d: 48c7455016000000 mov qword ptr [rbp + 0x50], 0x16
14593c895: 488d4df8 lea rcx, [rbp - 8]
14593c899: 488d5530 lea rdx, [rbp + 0x30]
14593c89d: 4589e0 mov r8d, r12d
14593c8a0: e84b19faff call 0x1458de1f0
14593c8a5: 90 nop
14593c8a6: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593c8aa: 4885c0 test rax, rax
14593c8ad: 7468 je 0x14593c917
14593c8af: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593c8b3: 66ba1c00 mov dx, 0x1c
14593c8b7: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593c8bc: 4589ca mov r10d, r9d
14593c8bf: 4501d2 add r10d, r10d
14593c8c2: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593c8c9: 0f1f8000000000 nop dword ptr [rax]
14593c8d0: 4d85d2 test r10, r10
14593c8d3: 742b je 0x14593c900
14593c8d5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593c8db: 410f97c3 seta r11b
14593c8df: 4180db00 sbb r11b, 0
14593c8e3: 49ffc0 inc r8
14593c8e6: 4983c2fe add r10, -2
14593c8ea: 4180fb01 cmp r11b, 1
14593c8ee: 74e0 je 0x14593c8d0
14593c8f0: 450fb6cb movzx r9d, r11b
14593c8f4: 4585c9 test r9d, r9d
14593c8f7: 7417 je 0x14593c910
14593c8f9: eb08 jmp 0x14593c903
14593c8fb: 0f1f440000 nop dword ptr [rax + rax]
14593c900: 4d89c8 mov r8, r9
14593c903: 4883e901 sub rcx, 1
14593c907: 7210 jb 0x14593c919
14593c909: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593c90e: eba7 jmp 0x14593c8b7
14593c910: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
14593c915: eb2f jmp 0x14593c946
14593c917: 31c0 xor eax, eax
14593c919: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593c91d: 48894538 mov qword ptr [rbp + 0x38], rax
14593c921: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593c929: 4c894548 mov qword ptr [rbp + 0x48], r8
14593c92d: 48c745501c000000 mov qword ptr [rbp + 0x50], 0x1c
14593c935: 488d4df8 lea rcx, [rbp - 8]
14593c939: 488d5530 lea rdx, [rbp + 0x30]
14593c93d: 4589e0 mov r8d, r12d
14593c940: e8ab18faff call 0x1458de1f0
14593c945: 90 nop
14593c946: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593c94a: 4885c0 test rax, rax
14593c94d: 7468 je 0x14593c9b7
14593c94f: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593c953: 66ba2200 mov dx, 0x22
14593c957: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593c95c: 4589ca mov r10d, r9d
14593c95f: 4501d2 add r10d, r10d
14593c962: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593c969: 0f1f8000000000 nop dword ptr [rax]
14593c970: 4d85d2 test r10, r10
14593c973: 742b je 0x14593c9a0
14593c975: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593c97b: 410f97c3 seta r11b
14593c97f: 4180db00 sbb r11b, 0
14593c983: 49ffc0 inc r8
14593c986: 4983c2fe add r10, -2
14593c98a: 4180fb01 cmp r11b, 1
14593c98e: 74e0 je 0x14593c970
14593c990: 450fb6cb movzx r9d, r11b
14593c994: 4585c9 test r9d, r9d
14593c997: 7417 je 0x14593c9b0
14593c999: eb08 jmp 0x14593c9a3
14593c99b: 0f1f440000 nop dword ptr [rax + rax]
14593c9a0: 4d89c8 mov r8, r9
14593c9a3: 4883e901 sub rcx, 1
14593c9a7: 7210 jb 0x14593c9b9
14593c9a9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593c9ae: eba7 jmp 0x14593c957
14593c9b0: 46897c8008 mov dword ptr [rax + r8*4 + 8], r15d
14593c9b5: eb2f jmp 0x14593c9e6
14593c9b7: 31c0 xor eax, eax
14593c9b9: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593c9bd: 48894538 mov qword ptr [rbp + 0x38], rax
14593c9c1: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593c9c9: 4c894548 mov qword ptr [rbp + 0x48], r8
14593c9cd: 48c7455022000000 mov qword ptr [rbp + 0x50], 0x22
14593c9d5: 488d4df8 lea rcx, [rbp - 8]
14593c9d9: 488d5530 lea rdx, [rbp + 0x30]
14593c9dd: 4589f8 mov r8d, r15d
14593c9e0: e80b18faff call 0x1458de1f0
14593c9e5: 90 nop
14593c9e6: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593c9ea: 4885c0 test rax, rax
14593c9ed: 746c je 0x14593ca5b
14593c9ef: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593c9f3: 66ba2300 mov dx, 0x23
14593c9f7: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593c9fc: 4589ca mov r10d, r9d
14593c9ff: 4501d2 add r10d, r10d
14593ca02: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593ca09: 0f1f8000000000 nop dword ptr [rax]
14593ca10: 4d85d2 test r10, r10
14593ca13: 742b je 0x14593ca40
14593ca15: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593ca1b: 410f97c3 seta r11b
14593ca1f: 4180db00 sbb r11b, 0
14593ca23: 49ffc0 inc r8
14593ca26: 4983c2fe add r10, -2
14593ca2a: 4180fb01 cmp r11b, 1
14593ca2e: 74e0 je 0x14593ca10
14593ca30: 450fb6cb movzx r9d, r11b
14593ca34: 4585c9 test r9d, r9d
14593ca37: 7417 je 0x14593ca50
14593ca39: eb08 jmp 0x14593ca43
14593ca3b: 0f1f440000 nop dword ptr [rax + rax]
14593ca40: 4d89c8 mov r8, r9
14593ca43: 4883e901 sub rcx, 1
14593ca47: 7214 jb 0x14593ca5d
14593ca49: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593ca4e: eba7 jmp 0x14593c9f7
14593ca50: 42c74480080e000000 mov dword ptr [rax + r8*4 + 8], 0xe
14593ca59: eb32 jmp 0x14593ca8d
14593ca5b: 31c0 xor eax, eax
14593ca5d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593ca61: 48894538 mov qword ptr [rbp + 0x38], rax
14593ca65: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593ca6d: 4c894548 mov qword ptr [rbp + 0x48], r8
14593ca71: 48c7455023000000 mov qword ptr [rbp + 0x50], 0x23
14593ca79: 488d4df8 lea rcx, [rbp - 8]
14593ca7d: 488d5530 lea rdx, [rbp + 0x30]
14593ca81: 41b80e000000 mov r8d, 0xe
14593ca87: e86417faff call 0x1458de1f0
14593ca8c: 90 nop
14593ca8d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593ca91: 4885c0 test rax, rax
14593ca94: 7465 je 0x14593cafb
14593ca96: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593ca9a: 66ba2400 mov dx, 0x24
14593ca9e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593caa3: 4589ca mov r10d, r9d
14593caa6: 4501d2 add r10d, r10d
14593caa9: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593cab0: 4d85d2 test r10, r10
14593cab3: 742b je 0x14593cae0
14593cab5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593cabb: 410f97c3 seta r11b
14593cabf: 4180db00 sbb r11b, 0
14593cac3: 49ffc0 inc r8
14593cac6: 4983c2fe add r10, -2
14593caca: 4180fb01 cmp r11b, 1
14593cace: 74e0 je 0x14593cab0
14593cad0: 450fb6cb movzx r9d, r11b
14593cad4: 4585c9 test r9d, r9d
14593cad7: 7417 je 0x14593caf0
14593cad9: eb08 jmp 0x14593cae3
14593cadb: 0f1f440000 nop dword ptr [rax + rax]
14593cae0: 4d89c8 mov r8, r9
14593cae3: 4883e901 sub rcx, 1
14593cae7: 7214 jb 0x14593cafd
14593cae9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593caee: ebae jmp 0x14593ca9e
14593caf0: 42c744800800010000 mov dword ptr [rax + r8*4 + 8], 0x100
14593caf9: eb32 jmp 0x14593cb2d
14593cafb: 31c0 xor eax, eax
14593cafd: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593cb01: 48894538 mov qword ptr [rbp + 0x38], rax
14593cb05: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593cb0d: 4c894548 mov qword ptr [rbp + 0x48], r8
14593cb11: 48c7455024000000 mov qword ptr [rbp + 0x50], 0x24
14593cb19: 488d4df8 lea rcx, [rbp - 8]
14593cb1d: 488d5530 lea rdx, [rbp + 0x30]
14593cb21: 41b800010000 mov r8d, 0x100
14593cb27: e8c416faff call 0x1458de1f0
14593cb2c: 90 nop
14593cb2d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593cb31: 4885c0 test rax, rax
14593cb34: 7465 je 0x14593cb9b
14593cb36: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593cb3a: 66ba2e00 mov dx, 0x2e
14593cb3e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593cb43: 4589ca mov r10d, r9d
14593cb46: 4501d2 add r10d, r10d
14593cb49: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593cb50: 4d85d2 test r10, r10
14593cb53: 742b je 0x14593cb80
14593cb55: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593cb5b: 410f97c3 seta r11b
14593cb5f: 4180db00 sbb r11b, 0
14593cb63: 49ffc0 inc r8
14593cb66: 4983c2fe add r10, -2
14593cb6a: 4180fb01 cmp r11b, 1
14593cb6e: 74e0 je 0x14593cb50
14593cb70: 450fb6cb movzx r9d, r11b
14593cb74: 4585c9 test r9d, r9d
14593cb77: 7417 je 0x14593cb90
14593cb79: eb08 jmp 0x14593cb83
14593cb7b: 0f1f440000 nop dword ptr [rax + rax]
14593cb80: 4d89c8 mov r8, r9
14593cb83: 4883e901 sub rcx, 1
14593cb87: 7214 jb 0x14593cb9d
14593cb89: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593cb8e: ebae jmp 0x14593cb3e
14593cb90: 42c744800800000000 mov dword ptr [rax + r8*4 + 8], 0
14593cb99: eb2f jmp 0x14593cbca
14593cb9b: 31c0 xor eax, eax
14593cb9d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593cba1: 48894538 mov qword ptr [rbp + 0x38], rax
14593cba5: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593cbad: 4c894548 mov qword ptr [rbp + 0x48], r8
14593cbb1: 48c745502e000000 mov qword ptr [rbp + 0x50], 0x2e
14593cbb9: 488d4df8 lea rcx, [rbp - 8]
14593cbbd: 488d5530 lea rdx, [rbp + 0x30]
14593cbc1: 4531c0 xor r8d, r8d
14593cbc4: e82716faff call 0x1458de1f0
14593cbc9: 90 nop
14593cbca: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593cbce: 4885c0 test rax, rax
14593cbd1: 7468 je 0x14593cc3b
14593cbd3: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593cbd7: 66ba7e00 mov dx, 0x7e
14593cbdb: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593cbe0: 4589ca mov r10d, r9d
14593cbe3: 4501d2 add r10d, r10d
14593cbe6: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593cbed: 0f1f00 nop dword ptr [rax]
14593cbf0: 4d85d2 test r10, r10
14593cbf3: 742b je 0x14593cc20
14593cbf5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593cbfb: 410f97c3 seta r11b
14593cbff: 4180db00 sbb r11b, 0
14593cc03: 49ffc0 inc r8
14593cc06: 4983c2fe add r10, -2
14593cc0a: 4180fb01 cmp r11b, 1
14593cc0e: 74e0 je 0x14593cbf0
14593cc10: 450fb6cb movzx r9d, r11b
14593cc14: 4585c9 test r9d, r9d
14593cc17: 7417 je 0x14593cc30
14593cc19: eb08 jmp 0x14593cc23
14593cc1b: 0f1f440000 nop dword ptr [rax + rax]
14593cc20: 4d89c8 mov r8, r9
14593cc23: 4883e901 sub rcx, 1
14593cc27: 7214 jb 0x14593cc3d
14593cc29: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593cc2e: ebab jmp 0x14593cbdb
14593cc30: 42c7448008d0070000 mov dword ptr [rax + r8*4 + 8], 0x7d0
14593cc39: eb32 jmp 0x14593cc6d
14593cc3b: 31c0 xor eax, eax
14593cc3d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593cc41: 48894538 mov qword ptr [rbp + 0x38], rax
14593cc45: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593cc4d: 4c894548 mov qword ptr [rbp + 0x48], r8
14593cc51: 48c745507e000000 mov qword ptr [rbp + 0x50], 0x7e
14593cc59: 488d4df8 lea rcx, [rbp - 8]
14593cc5d: 488d5530 lea rdx, [rbp + 0x30]
14593cc61: 41b8d0070000 mov r8d, 0x7d0
14593cc67: e88415faff call 0x1458de1f0
14593cc6c: 90 nop
14593cc6d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593cc71: 4885c0 test rax, rax
14593cc74: 7465 je 0x14593ccdb
14593cc76: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593cc7a: 66ba7f00 mov dx, 0x7f
14593cc7e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593cc83: 4589ca mov r10d, r9d
14593cc86: 4501d2 add r10d, r10d
14593cc89: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593cc90: 4d85d2 test r10, r10
14593cc93: 742b je 0x14593ccc0
14593cc95: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14593cc9b: 410f97c3 seta r11b
14593cc9f: 4180db00 sbb r11b, 0
14593cca3: 49ffc0 inc r8
14593cca6: 4983c2fe add r10, -2
14593ccaa: 4180fb01 cmp r11b, 1
14593ccae: 74e0 je 0x14593cc90
14593ccb0: 450fb6cb movzx r9d, r11b
14593ccb4: 4585c9 test r9d, r9d
14593ccb7: 7417 je 0x14593ccd0
14593ccb9: eb08 jmp 0x14593ccc3
14593ccbb: 0f1f440000 nop dword ptr [rax + rax]
14593ccc0: 4d89c8 mov r8, r9
14593ccc3: 4883e901 sub rcx, 1
14593ccc7: 7214 jb 0x14593ccdd
14593ccc9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593ccce: ebae jmp 0x14593cc7e
14593ccd0: 42c7448008d0070000 mov dword ptr [rax + r8*4 + 8], 0x7d0
14593ccd9: eb32 jmp 0x14593cd0d
14593ccdb: 31c0 xor eax, eax
14593ccdd: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593cce1: 48894538 mov qword ptr [rbp + 0x38], rax
14593cce5: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593cced: 4c894548 mov qword ptr [rbp + 0x48], r8
14593ccf1: 48c745507f000000 mov qword ptr [rbp + 0x50], 0x7f
14593ccf9: 488d4df8 lea rcx, [rbp - 8]
14593ccfd: 488d5530 lea rdx, [rbp + 0x30]
14593cd01: 41b8d0070000 mov r8d, 0x7d0
14593cd07: e8e414faff call 0x1458de1f0
14593cd0c: 90 nop
14593cd0d: f30f10054f054700 movss xmm0, dword ptr [rip + 0x47054f]
14593cd15: f30f59c6 mulss xmm0, xmm6
14593cd19: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593cd1d: 4885c0 test rax, rax
14593cd20: 7467 je 0x14593cd89
14593cd22: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593cd26: ba81000000 mov edx, 0x81
14593cd2b: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14593cd30: 4589c2 mov r10d, r8d
14593cd33: 4501d2 add r10d, r10d
14593cd36: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14593cd3d: 0f1f00 nop dword ptr [rax]
14593cd40: 4d85d2 test r10, r10
14593cd43: 742b je 0x14593cd70
14593cd45: 460fb75c483a movzx r11d, word ptr [rax + r9*2 + 0x3a]
14593cd4b: 4439da cmp edx, r11d
14593cd4e: 410f97c3 seta r11b
14593cd52: 4180db00 sbb r11b, 0
14593cd56: 49ffc1 inc r9
14593cd59: 4983c2fe add r10, -2
14593cd5d: 4180fb01 cmp r11b, 1
14593cd61: 74dd je 0x14593cd40
14593cd63: 450fb6c3 movzx r8d, r11b
14593cd67: 4585c0 test r8d, r8d
14593cd6a: 7414 je 0x14593cd80
14593cd6c: eb05 jmp 0x14593cd73
14593cd6e: 6690 nop
14593cd70: 4d89c1 mov r9, r8
14593cd73: 4883e901 sub rcx, 1
14593cd77: 7212 jb 0x14593cd8b
14593cd79: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14593cd7e: ebab jmp 0x14593cd2b
14593cd80: f3420f11448808 movss dword ptr [rax + r9*4 + 8], xmm0
14593cd87: eb31 jmp 0x14593cdba
14593cd89: 31c0 xor eax, eax
14593cd8b: 66410f7ec0 movd r8d, xmm0
14593cd90: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593cd94: 48894538 mov qword ptr [rbp + 0x38], rax
14593cd98: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593cda0: 4c894d48 mov qword ptr [rbp + 0x48], r9
14593cda4: 48c7455081000000 mov qword ptr [rbp + 0x50], 0x81
14593cdac: 488d4df8 lea rcx, [rbp - 8]
14593cdb0: 488d5530 lea rdx, [rbp + 0x30]
14593cdb4: e83714faff call 0x1458de1f0
14593cdb9: 90 nop
14593cdba: f30f5935d6e24700 mulss xmm6, dword ptr [rip + 0x47e2d6]
14593cdc2: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593cdc6: 4885c0 test rax, rax
14593cdc9: 746e je 0x14593ce39
14593cdcb: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593cdcf: ba82000000 mov edx, 0x82
14593cdd4: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14593cdd9: 4589c2 mov r10d, r8d
14593cddc: 4501d2 add r10d, r10d
14593cddf: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14593cde6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593cdf0: 4d85d2 test r10, r10
14593cdf3: 742b je 0x14593ce20
14593cdf5: 460fb75c483a movzx r11d, word ptr [rax + r9*2 + 0x3a]
14593cdfb: 4439da cmp edx, r11d
14593cdfe: 410f97c3 seta r11b
14593ce02: 4180db00 sbb r11b, 0
14593ce06: 49ffc1 inc r9
14593ce09: 4983c2fe add r10, -2
14593ce0d: 4180fb01 cmp r11b, 1
14593ce11: 74dd je 0x14593cdf0
14593ce13: 450fb6c3 movzx r8d, r11b
14593ce17: 4585c0 test r8d, r8d
14593ce1a: 7414 je 0x14593ce30
14593ce1c: eb05 jmp 0x14593ce23
14593ce1e: 6690 nop
14593ce20: 4d89c1 mov r9, r8
14593ce23: 4883e901 sub rcx, 1
14593ce27: 7212 jb 0x14593ce3b
14593ce29: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14593ce2e: eba4 jmp 0x14593cdd4
14593ce30: f3420f11748808 movss dword ptr [rax + r9*4 + 8], xmm6
14593ce37: eb31 jmp 0x14593ce6a
14593ce39: 31c0 xor eax, eax
14593ce3b: 66410f7ef0 movd r8d, xmm6
14593ce40: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593ce44: 48894538 mov qword ptr [rbp + 0x38], rax
14593ce48: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593ce50: 4c894d48 mov qword ptr [rbp + 0x48], r9
14593ce54: 48c7455082000000 mov qword ptr [rbp + 0x50], 0x82
14593ce5c: 488d4df8 lea rcx, [rbp - 8]
14593ce60: 488d5530 lea rdx, [rbp + 0x30]
14593ce64: e88713faff call 0x1458de1f0
14593ce69: 90 nop
14593ce6a: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593ce6e: 4885c0 test rax, rax
14593ce71: 7464 je 0x14593ced7
14593ce73: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593ce77: ba83000000 mov edx, 0x83
14593ce7c: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593ce81: 4589ca mov r10d, r9d
14593ce84: 4501d2 add r10d, r10d
14593ce87: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593ce8e: 6690 nop
14593ce90: 4d85d2 test r10, r10
14593ce93: 742b je 0x14593cec0
14593ce95: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14593ce9b: 4439da cmp edx, r11d
14593ce9e: 410f97c3 seta r11b
14593cea2: 4180db00 sbb r11b, 0
14593cea6: 49ffc0 inc r8
14593cea9: 4983c2fe add r10, -2
14593cead: 4180fb01 cmp r11b, 1
14593ceb1: 74dd je 0x14593ce90
14593ceb3: 450fb6cb movzx r9d, r11b
14593ceb7: 4585c9 test r9d, r9d
14593ceba: 7414 je 0x14593ced0
14593cebc: eb05 jmp 0x14593cec3
14593cebe: 6690 nop
14593cec0: 4d89c8 mov r8, r9
14593cec3: 4883e901 sub rcx, 1
14593cec7: 7210 jb 0x14593ced9
14593cec9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593cece: ebac jmp 0x14593ce7c
14593ced0: 4689748008 mov dword ptr [rax + r8*4 + 8], r14d
14593ced5: eb2f jmp 0x14593cf06
14593ced7: 31c0 xor eax, eax
14593ced9: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593cedd: 48894538 mov qword ptr [rbp + 0x38], rax
14593cee1: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593cee9: 4c894548 mov qword ptr [rbp + 0x48], r8
14593ceed: 48c7455083000000 mov qword ptr [rbp + 0x50], 0x83
14593cef5: 488d4df8 lea rcx, [rbp - 8]
14593cef9: 488d5530 lea rdx, [rbp + 0x30]
14593cefd: 4589f0 mov r8d, r14d
14593cf00: e8eb12faff call 0x1458de1f0
14593cf05: 90 nop
14593cf06: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593cf0a: 4885c0 test rax, rax
14593cf0d: 7468 je 0x14593cf77
14593cf0f: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593cf13: ba84000000 mov edx, 0x84
14593cf18: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593cf1d: 4589ca mov r10d, r9d
14593cf20: 4501d2 add r10d, r10d
14593cf23: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593cf2a: 660f1f440000 nop word ptr [rax + rax]
14593cf30: 4d85d2 test r10, r10
14593cf33: 742b je 0x14593cf60
14593cf35: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14593cf3b: 4439da cmp edx, r11d
14593cf3e: 410f97c3 seta r11b
14593cf42: 4180db00 sbb r11b, 0
14593cf46: 49ffc0 inc r8
14593cf49: 4983c2fe add r10, -2
14593cf4d: 4180fb01 cmp r11b, 1
14593cf51: 74dd je 0x14593cf30
14593cf53: 450fb6cb movzx r9d, r11b
14593cf57: 4585c9 test r9d, r9d
14593cf5a: 7414 je 0x14593cf70
14593cf5c: eb05 jmp 0x14593cf63
14593cf5e: 6690 nop
14593cf60: 4d89c8 mov r8, r9
14593cf63: 4883e901 sub rcx, 1
14593cf67: 7210 jb 0x14593cf79
14593cf69: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593cf6e: eba8 jmp 0x14593cf18
14593cf70: 4689748008 mov dword ptr [rax + r8*4 + 8], r14d
14593cf75: eb2f jmp 0x14593cfa6
14593cf77: 31c0 xor eax, eax
14593cf79: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593cf7d: 48894538 mov qword ptr [rbp + 0x38], rax
14593cf81: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593cf89: 4c894548 mov qword ptr [rbp + 0x48], r8
14593cf8d: 48c7455084000000 mov qword ptr [rbp + 0x50], 0x84
14593cf95: 488d4df8 lea rcx, [rbp - 8]
14593cf99: 488d5530 lea rdx, [rbp + 0x30]
14593cf9d: 4589f0 mov r8d, r14d
14593cfa0: e84b12faff call 0x1458de1f0
14593cfa5: 90 nop
14593cfa6: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593cfaa: 4885c0 test rax, rax
14593cfad: 746c je 0x14593d01b
14593cfaf: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593cfb3: ba86000000 mov edx, 0x86
14593cfb8: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593cfbd: 4589ca mov r10d, r9d
14593cfc0: 4501d2 add r10d, r10d
14593cfc3: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593cfca: 660f1f440000 nop word ptr [rax + rax]
14593cfd0: 4d85d2 test r10, r10
14593cfd3: 742b je 0x14593d000
14593cfd5: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14593cfdb: 4439da cmp edx, r11d
14593cfde: 410f97c3 seta r11b
14593cfe2: 4180db00 sbb r11b, 0
14593cfe6: 49ffc0 inc r8
14593cfe9: 4983c2fe add r10, -2
14593cfed: 4180fb01 cmp r11b, 1
14593cff1: 74dd je 0x14593cfd0
14593cff3: 450fb6cb movzx r9d, r11b
14593cff7: 4585c9 test r9d, r9d
14593cffa: 7414 je 0x14593d010
14593cffc: eb05 jmp 0x14593d003
14593cffe: 6690 nop
14593d000: 4d89c8 mov r8, r9
14593d003: 4883e901 sub rcx, 1
14593d007: 7214 jb 0x14593d01d
14593d009: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593d00e: eba8 jmp 0x14593cfb8
14593d010: 42c74480080000a040 mov dword ptr [rax + r8*4 + 8], 0x40a00000
14593d019: eb32 jmp 0x14593d04d
14593d01b: 31c0 xor eax, eax
14593d01d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593d021: 48894538 mov qword ptr [rbp + 0x38], rax
14593d025: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593d02d: 4c894548 mov qword ptr [rbp + 0x48], r8
14593d031: 48c7455086000000 mov qword ptr [rbp + 0x50], 0x86
14593d039: 488d4df8 lea rcx, [rbp - 8]
14593d03d: 488d5530 lea rdx, [rbp + 0x30]
14593d041: 41b80000a040 mov r8d, 0x40a00000
14593d047: e8a411faff call 0x1458de1f0
14593d04c: 90 nop
14593d04d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593d051: 4885c0 test rax, rax
14593d054: 7475 je 0x14593d0cb
14593d056: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593d05a: ba87000000 mov edx, 0x87
14593d05f: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593d064: 4589ca mov r10d, r9d
14593d067: 4501d2 add r10d, r10d
14593d06a: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593d071: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593d080: 4d85d2 test r10, r10
14593d083: 742b je 0x14593d0b0
14593d085: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14593d08b: 4439da cmp edx, r11d
14593d08e: 410f97c3 seta r11b
14593d092: 4180db00 sbb r11b, 0
14593d096: 49ffc0 inc r8
14593d099: 4983c2fe add r10, -2
14593d09d: 4180fb01 cmp r11b, 1
14593d0a1: 74dd je 0x14593d080
14593d0a3: 450fb6cb movzx r9d, r11b
14593d0a7: 4585c9 test r9d, r9d
14593d0aa: 7414 je 0x14593d0c0
14593d0ac: eb05 jmp 0x14593d0b3
14593d0ae: 6690 nop
14593d0b0: 4d89c8 mov r8, r9
14593d0b3: 4883e901 sub rcx, 1
14593d0b7: 7214 jb 0x14593d0cd
14593d0b9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593d0be: eb9f jmp 0x14593d05f
14593d0c0: 42c744800800002041 mov dword ptr [rax + r8*4 + 8], 0x41200000
14593d0c9: eb32 jmp 0x14593d0fd
14593d0cb: 31c0 xor eax, eax
14593d0cd: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593d0d1: 48894538 mov qword ptr [rbp + 0x38], rax
14593d0d5: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593d0dd: 4c894548 mov qword ptr [rbp + 0x48], r8
14593d0e1: 48c7455087000000 mov qword ptr [rbp + 0x50], 0x87
14593d0e9: 488d4df8 lea rcx, [rbp - 8]
14593d0ed: 488d5530 lea rdx, [rbp + 0x30]
14593d0f1: 41b800002041 mov r8d, 0x41200000
14593d0f7: e8f410faff call 0x1458de1f0
14593d0fc: 90 nop
14593d0fd: 488b4518 mov rax, qword ptr [rbp + 0x18]
14593d101: 4885c0 test rax, rax
14593d104: 7475 je 0x14593d17b
14593d106: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14593d10a: ba91000000 mov edx, 0x91
14593d10f: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14593d114: 4589ca mov r10d, r9d
14593d117: 4501d2 add r10d, r10d
14593d11a: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14593d121: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593d130: 4d85d2 test r10, r10
14593d133: 742b je 0x14593d160
14593d135: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14593d13b: 4439da cmp edx, r11d
14593d13e: 410f97c3 seta r11b
14593d142: 4180db00 sbb r11b, 0
14593d146: 49ffc0 inc r8
14593d149: 4983c2fe add r10, -2
14593d14d: 4180fb01 cmp r11b, 1
14593d151: 74dd je 0x14593d130
14593d153: 450fb6cb movzx r9d, r11b
14593d157: 4585c9 test r9d, r9d
14593d15a: 7414 je 0x14593d170
14593d15c: eb05 jmp 0x14593d163
14593d15e: 6690 nop
14593d160: 4d89c8 mov r8, r9
14593d163: 4883e901 sub rcx, 1
14593d167: 7214 jb 0x14593d17d
14593d169: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14593d16e: eb9f jmp 0x14593d10f
14593d170: 42c74480080000803f mov dword ptr [rax + r8*4 + 8], 0x3f800000
14593d179: eb32 jmp 0x14593d1ad
14593d17b: 31c0 xor eax, eax
14593d17d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14593d181: 48894538 mov qword ptr [rbp + 0x38], rax
14593d185: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14593d18d: 4c894548 mov qword ptr [rbp + 0x48], r8
14593d191: 48c7455091000000 mov qword ptr [rbp + 0x50], 0x91
14593d199: 488d4df8 lea rcx, [rbp - 8]
14593d19d: 488d5530 lea rdx, [rbp + 0x30]
14593d1a1: 41b80000803f mov r8d, 0x3f800000
14593d1a7: e84410faff call 0x1458de1f0
14593d1ac: 90 nop
14593d1ad: 4c8b8668040000 mov r8, qword ptr [rsi + 0x468]
14593d1b4: 488d5d18 lea rbx, [rbp + 0x18]
14593d1b8: 4889d9 mov rcx, rbx
14593d1bb: 66ba1000 mov dx, 0x10
14593d1bf: e8ec47f8ff call 0x1458c19b0
14593d1c4: 90 nop
14593d1c5: 4c8bb5f8000000 mov r14, qword ptr [rbp + 0xf8]
14593d1cc: f30f108ed0040000 movss xmm1, dword ptr [rsi + 0x4d0]
14593d1d4: f30f1086d4040000 movss xmm0, dword ptr [rsi + 0x4d4]
14593d1dc: f3410f5c4604 subss xmm0, dword ptr [r14 + 4]
14593d1e2: f3410f5c0e subss xmm1, dword ptr [r14]
14593d1e7: e85bd22c00 call 0x145c0a447
14593d1ec: c745f000000000 mov dword ptr [rbp - 0x10], 0
14593d1f3: 48c745d800000000 mov qword ptr [rbp - 0x28], 0
14593d1fb: 48c745e001000000 mov qword ptr [rbp - 0x20], 1
14593d203: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
14593d20b: 0f100d92c82c01 movups xmm1, xmmword ptr [rip + 0x12cc892]
14593d212: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
14593d216: 48b800002040db0f4940 movabs rax, 0x40490fdb40200000
14593d220: 488945d0 mov qword ptr [rbp - 0x30], rax
14593d224: c745c40000e040 mov dword ptr [rbp - 0x3c], 0x40e00000
14593d22b: c6456701 mov byte ptr [rbp + 0x67], 1
14593d22f: 48895c2438 mov qword ptr [rsp + 0x38], rbx
14593d234: 488d45c0 lea rax, [rbp - 0x40]
14593d238: 4889442430 mov qword ptr [rsp + 0x30], rax
14593d23d: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
14593d243: 4c89742420 mov qword ptr [rsp + 0x20], r14
14593d248: 488d4dd8 lea rcx, [rbp - 0x28]
14593d24c: 4889fa mov rdx, rdi
14593d24f: 41b003 mov r8b, 3
14593d252: 4531c9 xor r9d, r9d
14593d255: e85637f8ff call 0x1458c09b0
14593d25a: 90 nop
14593d25b: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
14593d25f: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
14593d263: 0f294d40 movaps xmmword ptr [rbp + 0x40], xmm1
14593d267: 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
14593d26b: c6456700 mov byte ptr [rbp + 0x67], 0
14593d26f: 488d4df8 lea rcx, [rbp - 8]
14593d273: 488d5530 lea rdx, [rbp + 0x30]
14593d277: e8043ff8ff call 0x1458c1180
14593d27c: 90 nop
14593d27d: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
14593d284: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
14593d28b: 750d jne 0x14593d29a
14593d28d: 488d8e20060000 lea rcx, [rsi + 0x620]
14593d294: e837092d00 call 0x145c0dbd0
14593d299: 90 nop
14593d29a: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14593d2a1: 4889f9 mov rcx, rdi
14593d2a4: 48c1e105 shl rcx, 5
14593d2a8: 0f1045f8 movups xmm0, xmmword ptr [rbp - 8]
14593d2ac: 0f104d08 movups xmm1, xmmword ptr [rbp + 8]
14593d2b0: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14593d2b5: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14593d2b9: 48ffc7 inc rdi
14593d2bc: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
14593d2c3: 488d4d18 lea rcx, [rbp + 0x18]
14593d2c7: e8d4680800 call 0x1459c3ba0
14593d2cc: 0f287570 movaps xmm6, xmmword ptr [rbp + 0x70]
14593d2d0: 4881c400010000 add rsp, 0x100
14593d2d7: 5b pop rbx
14593d2d8: 5f pop rdi
14593d2d9: 5e pop rsi
14593d2da: 415c pop r12
14593d2dc: 415e pop r14
14593d2de: 415f pop r15
14593d2e0: 5d pop rbp
14593d2e1: c3 ret
