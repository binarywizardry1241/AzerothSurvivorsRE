14592bcd0: 55 push rbp
14592bcd1: 4157 push r15
14592bcd3: 4156 push r14
14592bcd5: 56 push rsi
14592bcd6: 57 push rdi
14592bcd7: 53 push rbx
14592bcd8: 4881ecf8000000 sub rsp, 0xf8
14592bcdf: 488dac2480000000 lea rbp, [rsp + 0x80]
14592bce7: 0f297d60 movaps xmmword ptr [rbp + 0x60], xmm7
14592bceb: 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
14592bcef: 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
14592bcf7: 0f28f3 movaps xmm6, xmm3
14592bcfa: 4c89c3 mov rbx, r8
14592bcfd: 4189d7 mov r15d, edx
14592bd00: 4889cf mov rdi, rcx
14592bd03: 8b81780a0000 mov eax, dword ptr [rcx + 0xa78]
14592bd09: ffc0 inc eax
14592bd0b: 8981780a0000 mov dword ptr [rcx + 0xa78], eax
14592bd11: 48be00000000000000f1 movabs rsi, 0xf100000000000000
14592bd1b: 4809c6 or rsi, rax
14592bd1e: 89d1 mov ecx, edx
14592bd20: e86b0d0400 call 0x14596ca90
14592bd25: a801 test al, 1
14592bd27: 750a jne 0x14592bd33
14592bd29: f30f103d2f154800 movss xmm7, dword ptr [rip + 0x48152f]
14592bd31: eb07 jmp 0x14592bd3a
14592bd33: 0f28fe movaps xmm7, xmm6
14592bd36: f30f5ef8 divss xmm7, xmm0
14592bd3a: 48c745f800000000 mov qword ptr [rbp - 8], 0
14592bd42: 48c7450800000000 mov qword ptr [rbp + 8], 0
14592bd4a: 4c8d75f8 lea r14, [rbp - 8]
14592bd4e: 4c89f1 mov rcx, r14
14592bd51: 31d2 xor edx, edx
14592bd53: 4989f0 mov r8, rsi
14592bd56: e8555cf9ff call 0x1458c19b0
14592bd5b: 90 nop
14592bd5c: 488b45f8 mov rax, qword ptr [rbp - 8]
14592bd60: 4885c0 test rax, rax
14592bd63: 7466 je 0x14592bdcb
14592bd65: 488b4d00 mov rcx, qword ptr [rbp]
14592bd69: 66ba0200 mov dx, 2
14592bd6d: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14592bd72: 4589ca mov r10d, r9d
14592bd75: 4501d2 add r10d, r10d
14592bd78: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14592bd7f: 90 nop
14592bd80: 4d85d2 test r10, r10
14592bd83: 742b je 0x14592bdb0
14592bd85: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14592bd8b: 410f97c3 seta r11b
14592bd8f: 4180db00 sbb r11b, 0
14592bd93: 49ffc0 inc r8
14592bd96: 4983c2fe add r10, -2
14592bd9a: 4180fb01 cmp r11b, 1
14592bd9e: 74e0 je 0x14592bd80
14592bda0: 450fb6cb movzx r9d, r11b
14592bda4: 4585c9 test r9d, r9d
14592bda7: 7417 je 0x14592bdc0
14592bda9: eb08 jmp 0x14592bdb3
14592bdab: 0f1f440000 nop dword ptr [rax + rax]
14592bdb0: 4d89c8 mov r8, r9
14592bdb3: 4883e901 sub rcx, 1
14592bdb7: 7214 jb 0x14592bdcd
14592bdb9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14592bdbe: ebad jmp 0x14592bd6d
14592bdc0: 42c744800841000000 mov dword ptr [rax + r8*4 + 8], 0x41
14592bdc9: eb32 jmp 0x14592bdfd
14592bdcb: 31c0 xor eax, eax
14592bdcd: 4c897510 mov qword ptr [rbp + 0x10], r14
14592bdd1: 48894518 mov qword ptr [rbp + 0x18], rax
14592bdd5: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592bddd: 4c894528 mov qword ptr [rbp + 0x28], r8
14592bde1: 48c7453002000000 mov qword ptr [rbp + 0x30], 2
14592bde9: 488d4dd8 lea rcx, [rbp - 0x28]
14592bded: 488d5510 lea rdx, [rbp + 0x10]
14592bdf1: 41b841000000 mov r8d, 0x41
14592bdf7: e8f423fbff call 0x1458de1f0
14592bdfc: 90 nop
14592bdfd: 488b45f8 mov rax, qword ptr [rbp - 8]
14592be01: 4885c0 test rax, rax
14592be04: 7461 je 0x14592be67
14592be06: 488b4d00 mov rcx, qword ptr [rbp]
14592be0a: 66ba0300 mov dx, 3
14592be0e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14592be13: 4589ca mov r10d, r9d
14592be16: 4501d2 add r10d, r10d
14592be19: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14592be20: 4d85d2 test r10, r10
14592be23: 742b je 0x14592be50
14592be25: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14592be2b: 410f97c3 seta r11b
14592be2f: 4180db00 sbb r11b, 0
14592be33: 49ffc0 inc r8
14592be36: 4983c2fe add r10, -2
14592be3a: 4180fb01 cmp r11b, 1
14592be3e: 74e0 je 0x14592be20
14592be40: 450fb6cb movzx r9d, r11b
14592be44: 4585c9 test r9d, r9d
14592be47: 7417 je 0x14592be60
14592be49: eb08 jmp 0x14592be53
14592be4b: 0f1f440000 nop dword ptr [rax + rax]
14592be50: 4d89c8 mov r8, r9
14592be53: 4883e901 sub rcx, 1
14592be57: 7210 jb 0x14592be69
14592be59: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14592be5e: ebae jmp 0x14592be0e
14592be60: 46897c8008 mov dword ptr [rax + r8*4 + 8], r15d
14592be65: eb2f jmp 0x14592be96
14592be67: 31c0 xor eax, eax
14592be69: 4c897510 mov qword ptr [rbp + 0x10], r14
14592be6d: 48894518 mov qword ptr [rbp + 0x18], rax
14592be71: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592be79: 4c894528 mov qword ptr [rbp + 0x28], r8
14592be7d: 48c7453003000000 mov qword ptr [rbp + 0x30], 3
14592be85: 488d4dd8 lea rcx, [rbp - 0x28]
14592be89: 488d5510 lea rdx, [rbp + 0x10]
14592be8d: 4589f8 mov r8d, r15d
14592be90: e85b23fbff call 0x1458de1f0
14592be95: 90 nop
14592be96: 488b45f8 mov rax, qword ptr [rbp - 8]
14592be9a: 4885c0 test rax, rax
14592be9d: 746a je 0x14592bf09
14592be9f: 488b4d00 mov rcx, qword ptr [rbp]
14592bea3: 66ba0400 mov dx, 4
14592bea7: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14592beac: 4589c2 mov r10d, r8d
14592beaf: 4501d2 add r10d, r10d
14592beb2: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14592beb9: 0f1f8000000000 nop dword ptr [rax]
14592bec0: 4d85d2 test r10, r10
14592bec3: 742b je 0x14592bef0
14592bec5: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14592becb: 410f97c3 seta r11b
14592becf: 4180db00 sbb r11b, 0
14592bed3: 49ffc1 inc r9
14592bed6: 4983c2fe add r10, -2
14592beda: 4180fb01 cmp r11b, 1
14592bede: 74e0 je 0x14592bec0
14592bee0: 450fb6c3 movzx r8d, r11b
14592bee4: 4585c0 test r8d, r8d
14592bee7: 7417 je 0x14592bf00
14592bee9: eb08 jmp 0x14592bef3
14592beeb: 0f1f440000 nop dword ptr [rax + rax]
14592bef0: 4d89c1 mov r9, r8
14592bef3: 4883e901 sub rcx, 1
14592bef7: 7212 jb 0x14592bf0b
14592bef9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592befe: eba7 jmp 0x14592bea7
14592bf00: f3420f117c8808 movss dword ptr [rax + r9*4 + 8], xmm7
14592bf07: eb31 jmp 0x14592bf3a
14592bf09: 31c0 xor eax, eax
14592bf0b: 66410f7ef8 movd r8d, xmm7
14592bf10: 4c897510 mov qword ptr [rbp + 0x10], r14
14592bf14: 48894518 mov qword ptr [rbp + 0x18], rax
14592bf18: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592bf20: 4c894d28 mov qword ptr [rbp + 0x28], r9
14592bf24: 48c7453004000000 mov qword ptr [rbp + 0x30], 4
14592bf2c: 488d4dd8 lea rcx, [rbp - 0x28]
14592bf30: 488d5510 lea rdx, [rbp + 0x10]
14592bf34: e8b722fbff call 0x1458de1f0
14592bf39: 90 nop
14592bf3a: 4c8b8768040000 mov r8, qword ptr [rdi + 0x468]
14592bf41: 4c8d75f8 lea r14, [rbp - 8]
14592bf45: 4c89f1 mov rcx, r14
14592bf48: 66ba0600 mov dx, 6
14592bf4c: e85f5af9ff call 0x1458c19b0
14592bf51: 90 nop
14592bf52: 488b45f8 mov rax, qword ptr [rbp - 8]
14592bf56: 4885c0 test rax, rax
14592bf59: 7470 je 0x14592bfcb
14592bf5b: 488b4d00 mov rcx, qword ptr [rbp]
14592bf5f: 66ba0800 mov dx, 8
14592bf63: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14592bf68: 4589ca mov r10d, r9d
14592bf6b: 4501d2 add r10d, r10d
14592bf6e: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14592bf75: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592bf80: 4d85d2 test r10, r10
14592bf83: 742b je 0x14592bfb0
14592bf85: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14592bf8b: 410f97c3 seta r11b
14592bf8f: 4180db00 sbb r11b, 0
14592bf93: 49ffc0 inc r8
14592bf96: 4983c2fe add r10, -2
14592bf9a: 4180fb01 cmp r11b, 1
14592bf9e: 74e0 je 0x14592bf80
14592bfa0: 450fb6cb movzx r9d, r11b
14592bfa4: 4585c9 test r9d, r9d
14592bfa7: 7417 je 0x14592bfc0
14592bfa9: eb08 jmp 0x14592bfb3
14592bfab: 0f1f440000 nop dword ptr [rax + rax]
14592bfb0: 4d89c8 mov r8, r9
14592bfb3: 4883e901 sub rcx, 1
14592bfb7: 7214 jb 0x14592bfcd
14592bfb9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14592bfbe: eba3 jmp 0x14592bf63
14592bfc0: 42c744800801000000 mov dword ptr [rax + r8*4 + 8], 1
14592bfc9: eb32 jmp 0x14592bffd
14592bfcb: 31c0 xor eax, eax
14592bfcd: 4c897510 mov qword ptr [rbp + 0x10], r14
14592bfd1: 48894518 mov qword ptr [rbp + 0x18], rax
14592bfd5: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592bfdd: 4c894528 mov qword ptr [rbp + 0x28], r8
14592bfe1: 48c7453008000000 mov qword ptr [rbp + 0x30], 8
14592bfe9: 488d4dd8 lea rcx, [rbp - 0x28]
14592bfed: 488d5510 lea rdx, [rbp + 0x10]
14592bff1: 41b801000000 mov r8d, 1
14592bff7: e8f421fbff call 0x1458de1f0
14592bffc: 90 nop
14592bffd: 488b45f8 mov rax, qword ptr [rbp - 8]
14592c001: 4885c0 test rax, rax
14592c004: 7461 je 0x14592c067
14592c006: 488b4d00 mov rcx, qword ptr [rbp]
14592c00a: 66ba0900 mov dx, 9
14592c00e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14592c013: 4589ca mov r10d, r9d
14592c016: 4501d2 add r10d, r10d
14592c019: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14592c020: 4d85d2 test r10, r10
14592c023: 742b je 0x14592c050
14592c025: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14592c02b: 410f97c3 seta r11b
14592c02f: 4180db00 sbb r11b, 0
14592c033: 49ffc0 inc r8
14592c036: 4983c2fe add r10, -2
14592c03a: 4180fb01 cmp r11b, 1
14592c03e: 74e0 je 0x14592c020
14592c040: 450fb6cb movzx r9d, r11b
14592c044: 4585c9 test r9d, r9d
14592c047: 7417 je 0x14592c060
14592c049: eb08 jmp 0x14592c053
14592c04b: 0f1f440000 nop dword ptr [rax + rax]
14592c050: 4d89c8 mov r8, r9
14592c053: 4883e901 sub rcx, 1
14592c057: 7210 jb 0x14592c069
14592c059: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14592c05e: ebae jmp 0x14592c00e
14592c060: 46897c8008 mov dword ptr [rax + r8*4 + 8], r15d
14592c065: eb2f jmp 0x14592c096
14592c067: 31c0 xor eax, eax
14592c069: 4c897510 mov qword ptr [rbp + 0x10], r14
14592c06d: 48894518 mov qword ptr [rbp + 0x18], rax
14592c071: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592c079: 4c894528 mov qword ptr [rbp + 0x28], r8
14592c07d: 48c7453009000000 mov qword ptr [rbp + 0x30], 9
14592c085: 488d4dd8 lea rcx, [rbp - 0x28]
14592c089: 488d5510 lea rdx, [rbp + 0x10]
14592c08d: 4589f8 mov r8d, r15d
14592c090: e85b21fbff call 0x1458de1f0
14592c095: 90 nop
14592c096: 488b45f8 mov rax, qword ptr [rbp - 8]
14592c09a: 4885c0 test rax, rax
14592c09d: 746a je 0x14592c109
14592c09f: 488b4d00 mov rcx, qword ptr [rbp]
14592c0a3: 66ba0a00 mov dx, 0xa
14592c0a7: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14592c0ac: 4589c2 mov r10d, r8d
14592c0af: 4501d2 add r10d, r10d
14592c0b2: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14592c0b9: 0f1f8000000000 nop dword ptr [rax]
14592c0c0: 4d85d2 test r10, r10
14592c0c3: 742b je 0x14592c0f0
14592c0c5: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14592c0cb: 410f97c3 seta r11b
14592c0cf: 4180db00 sbb r11b, 0
14592c0d3: 49ffc1 inc r9
14592c0d6: 4983c2fe add r10, -2
14592c0da: 4180fb01 cmp r11b, 1
14592c0de: 74e0 je 0x14592c0c0
14592c0e0: 450fb6c3 movzx r8d, r11b
14592c0e4: 4585c0 test r8d, r8d
14592c0e7: 7417 je 0x14592c100
14592c0e9: eb08 jmp 0x14592c0f3
14592c0eb: 0f1f440000 nop dword ptr [rax + rax]
14592c0f0: 4d89c1 mov r9, r8
14592c0f3: 4883e901 sub rcx, 1
14592c0f7: 7212 jb 0x14592c10b
14592c0f9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592c0fe: eba7 jmp 0x14592c0a7
14592c100: f3420f11748808 movss dword ptr [rax + r9*4 + 8], xmm6
14592c107: eb31 jmp 0x14592c13a
14592c109: 31c0 xor eax, eax
14592c10b: 66410f7ef0 movd r8d, xmm6
14592c110: 4c897510 mov qword ptr [rbp + 0x10], r14
14592c114: 48894518 mov qword ptr [rbp + 0x18], rax
14592c118: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592c120: 4c894d28 mov qword ptr [rbp + 0x28], r9
14592c124: 48c745300a000000 mov qword ptr [rbp + 0x30], 0xa
14592c12c: 488d4dd8 lea rcx, [rbp - 0x28]
14592c130: 488d5510 lea rdx, [rbp + 0x10]
14592c134: e8b720fbff call 0x1458de1f0
14592c139: 90 nop
14592c13a: 660f6e03 movd xmm0, dword ptr [rbx]
14592c13e: 488b45f8 mov rax, qword ptr [rbp - 8]
14592c142: 4885c0 test rax, rax
14592c145: 7472 je 0x14592c1b9
14592c147: 488b4d00 mov rcx, qword ptr [rbp]
14592c14b: 66ba0b00 mov dx, 0xb
14592c14f: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14592c154: 4589c2 mov r10d, r8d
14592c157: 4501d2 add r10d, r10d
14592c15a: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14592c161: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592c170: 4d85d2 test r10, r10
14592c173: 742b je 0x14592c1a0
14592c175: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14592c17b: 410f97c3 seta r11b
14592c17f: 4180db00 sbb r11b, 0
14592c183: 49ffc1 inc r9
14592c186: 4983c2fe add r10, -2
14592c18a: 4180fb01 cmp r11b, 1
14592c18e: 74e0 je 0x14592c170
14592c190: 450fb6c3 movzx r8d, r11b
14592c194: 4585c0 test r8d, r8d
14592c197: 7417 je 0x14592c1b0
14592c199: eb08 jmp 0x14592c1a3
14592c19b: 0f1f440000 nop dword ptr [rax + rax]
14592c1a0: 4d89c1 mov r9, r8
14592c1a3: 4883e901 sub rcx, 1
14592c1a7: 7212 jb 0x14592c1bb
14592c1a9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592c1ae: eb9f jmp 0x14592c14f
14592c1b0: 66420f7e448808 movd dword ptr [rax + r9*4 + 8], xmm0
14592c1b7: eb31 jmp 0x14592c1ea
14592c1b9: 31c0 xor eax, eax
14592c1bb: 66410f7ec0 movd r8d, xmm0
14592c1c0: 4c897510 mov qword ptr [rbp + 0x10], r14
14592c1c4: 48894518 mov qword ptr [rbp + 0x18], rax
14592c1c8: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592c1d0: 4c894d28 mov qword ptr [rbp + 0x28], r9
14592c1d4: 48c745300b000000 mov qword ptr [rbp + 0x30], 0xb
14592c1dc: 488d4dd8 lea rcx, [rbp - 0x28]
14592c1e0: 488d5510 lea rdx, [rbp + 0x10]
14592c1e4: e80720fbff call 0x1458de1f0
14592c1e9: 90 nop
14592c1ea: 660f6e4304 movd xmm0, dword ptr [rbx + 4]
14592c1ef: 488b45f8 mov rax, qword ptr [rbp - 8]
14592c1f3: 4885c0 test rax, rax
14592c1f6: 7471 je 0x14592c269
14592c1f8: 488b4d00 mov rcx, qword ptr [rbp]
14592c1fc: 66ba0c00 mov dx, 0xc
14592c200: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14592c205: 4589c2 mov r10d, r8d
14592c208: 4501d2 add r10d, r10d
14592c20b: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14592c212: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592c220: 4d85d2 test r10, r10
14592c223: 742b je 0x14592c250
14592c225: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14592c22b: 410f97c3 seta r11b
14592c22f: 4180db00 sbb r11b, 0
14592c233: 49ffc1 inc r9
14592c236: 4983c2fe add r10, -2
14592c23a: 4180fb01 cmp r11b, 1
14592c23e: 74e0 je 0x14592c220
14592c240: 450fb6c3 movzx r8d, r11b
14592c244: 4585c0 test r8d, r8d
14592c247: 7417 je 0x14592c260
14592c249: eb08 jmp 0x14592c253
14592c24b: 0f1f440000 nop dword ptr [rax + rax]
14592c250: 4d89c1 mov r9, r8
14592c253: 4883e901 sub rcx, 1
14592c257: 7212 jb 0x14592c26b
14592c259: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592c25e: eba0 jmp 0x14592c200
14592c260: 66420f7e448808 movd dword ptr [rax + r9*4 + 8], xmm0
14592c267: eb31 jmp 0x14592c29a
14592c269: 31c0 xor eax, eax
14592c26b: 66410f7ec0 movd r8d, xmm0
14592c270: 4c897510 mov qword ptr [rbp + 0x10], r14
14592c274: 48894518 mov qword ptr [rbp + 0x18], rax
14592c278: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592c280: 4c894d28 mov qword ptr [rbp + 0x28], r9
14592c284: 48c745300c000000 mov qword ptr [rbp + 0x30], 0xc
14592c28c: 488d4dd8 lea rcx, [rbp - 0x28]
14592c290: 488d5510 lea rdx, [rbp + 0x10]
14592c294: e8571ffbff call 0x1458de1f0
14592c299: 90 nop
14592c29a: 660f6e4308 movd xmm0, dword ptr [rbx + 8]
14592c29f: 488b45f8 mov rax, qword ptr [rbp - 8]
14592c2a3: 4885c0 test rax, rax
14592c2a6: 7471 je 0x14592c319
14592c2a8: 488b4d00 mov rcx, qword ptr [rbp]
14592c2ac: 66ba0d00 mov dx, 0xd
14592c2b0: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14592c2b5: 4589c2 mov r10d, r8d
14592c2b8: 4501d2 add r10d, r10d
14592c2bb: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14592c2c2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14592c2d0: 4d85d2 test r10, r10
14592c2d3: 742b je 0x14592c300
14592c2d5: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14592c2db: 410f97c3 seta r11b
14592c2df: 4180db00 sbb r11b, 0
14592c2e3: 49ffc1 inc r9
14592c2e6: 4983c2fe add r10, -2
14592c2ea: 4180fb01 cmp r11b, 1
14592c2ee: 74e0 je 0x14592c2d0
14592c2f0: 450fb6c3 movzx r8d, r11b
14592c2f4: 4585c0 test r8d, r8d
14592c2f7: 7417 je 0x14592c310
14592c2f9: eb08 jmp 0x14592c303
14592c2fb: 0f1f440000 nop dword ptr [rax + rax]
14592c300: 4d89c1 mov r9, r8
14592c303: 4883e901 sub rcx, 1
14592c307: 7212 jb 0x14592c31b
14592c309: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14592c30e: eba0 jmp 0x14592c2b0
14592c310: 66420f7e448808 movd dword ptr [rax + r9*4 + 8], xmm0
14592c317: eb31 jmp 0x14592c34a
14592c319: 31c0 xor eax, eax
14592c31b: 66410f7ec0 movd r8d, xmm0
14592c320: 4c897510 mov qword ptr [rbp + 0x10], r14
14592c324: 48894518 mov qword ptr [rbp + 0x18], rax
14592c328: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592c330: 4c894d28 mov qword ptr [rbp + 0x28], r9
14592c334: 48c745300d000000 mov qword ptr [rbp + 0x30], 0xd
14592c33c: 488d4dd8 lea rcx, [rbp - 0x28]
14592c340: 488d5510 lea rdx, [rbp + 0x10]
14592c344: e8a71efbff call 0x1458de1f0
14592c349: 90 nop
14592c34a: 488b45f8 mov rax, qword ptr [rbp - 8]
14592c34e: 4885c0 test rax, rax
14592c351: 7468 je 0x14592c3bb
14592c353: 488b4d00 mov rcx, qword ptr [rbp]
14592c357: 66ba0e00 mov dx, 0xe
14592c35b: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14592c360: 4589ca mov r10d, r9d
14592c363: 4501d2 add r10d, r10d
14592c366: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14592c36d: 0f1f00 nop dword ptr [rax]
14592c370: 4d85d2 test r10, r10
14592c373: 742b je 0x14592c3a0
14592c375: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14592c37b: 410f97c3 seta r11b
14592c37f: 4180db00 sbb r11b, 0
14592c383: 49ffc0 inc r8
14592c386: 4983c2fe add r10, -2
14592c38a: 4180fb01 cmp r11b, 1
14592c38e: 74e0 je 0x14592c370
14592c390: 450fb6cb movzx r9d, r11b
14592c394: 4585c9 test r9d, r9d
14592c397: 7417 je 0x14592c3b0
14592c399: eb08 jmp 0x14592c3a3
14592c39b: 0f1f440000 nop dword ptr [rax + rax]
14592c3a0: 4d89c8 mov r8, r9
14592c3a3: 4883e901 sub rcx, 1
14592c3a7: 7214 jb 0x14592c3bd
14592c3a9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14592c3ae: ebab jmp 0x14592c35b
14592c3b0: 42c744800800000000 mov dword ptr [rax + r8*4 + 8], 0
14592c3b9: eb2f jmp 0x14592c3ea
14592c3bb: 31c0 xor eax, eax
14592c3bd: 4c897510 mov qword ptr [rbp + 0x10], r14
14592c3c1: 48894518 mov qword ptr [rbp + 0x18], rax
14592c3c5: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14592c3cd: 4c894528 mov qword ptr [rbp + 0x28], r8
14592c3d1: 48c745300e000000 mov qword ptr [rbp + 0x30], 0xe
14592c3d9: 488d4dd8 lea rcx, [rbp - 0x28]
14592c3dd: 488d5510 lea rdx, [rbp + 0x10]
14592c3e1: 4531c0 xor r8d, r8d
14592c3e4: e8071efbff call 0x1458de1f0
14592c3e9: 90 nop
14592c3ea: c745d000000000 mov dword ptr [rbp - 0x30], 0
14592c3f1: 48c745b800000000 mov qword ptr [rbp - 0x48], 0
14592c3f9: 48c745c001000000 mov qword ptr [rbp - 0x40], 1
14592c401: 48c745c800000000 mov qword ptr [rbp - 0x38], 0
14592c409: c6454701 mov byte ptr [rbp + 0x47], 1
14592c40d: 4c89742428 mov qword ptr [rsp + 0x28], r14
14592c412: c744242000000000 mov dword ptr [rsp + 0x20], 0
14592c41a: 488d4db8 lea rcx, [rbp - 0x48]
14592c41e: 4889f2 mov rdx, rsi
14592c421: 41b006 mov r8b, 6
14592c424: 4989d9 mov r9, rbx
14592c427: e8f44af9ff call 0x1458c0f20
14592c42c: 90 nop
14592c42d: f30f6f45b8 movdqu xmm0, xmmword ptr [rbp - 0x48]
14592c432: 0f104dc8 movups xmm1, xmmword ptr [rbp - 0x38]
14592c436: 0f294d20 movaps xmmword ptr [rbp + 0x20], xmm1
14592c43a: 660f7f4510 movdqa xmmword ptr [rbp + 0x10], xmm0
14592c43f: c6454700 mov byte ptr [rbp + 0x47], 0
14592c443: 488d4dd8 lea rcx, [rbp - 0x28]
14592c447: 488d5510 lea rdx, [rbp + 0x10]
14592c44b: e8304df9ff call 0x1458c1180
14592c450: 90 nop
14592c451: 488b9f30060000 mov rbx, qword ptr [rdi + 0x630]
14592c458: 483b9f20060000 cmp rbx, qword ptr [rdi + 0x620]
14592c45f: 750d jne 0x14592c46e
14592c461: 488d8f20060000 lea rcx, [rdi + 0x620]
14592c468: e863172e00 call 0x145c0dbd0
14592c46d: 90 nop
14592c46e: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
14592c475: 4889d9 mov rcx, rbx
14592c478: 48c1e105 shl rcx, 5
14592c47c: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
14592c480: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
14592c484: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14592c489: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14592c48d: 48ffc3 inc rbx
14592c490: 48899f30060000 mov qword ptr [rdi + 0x630], rbx
14592c497: 488d4df8 lea rcx, [rbp - 8]
14592c49b: e800770900 call 0x1459c3ba0
14592c4a0: 4889f0 mov rax, rsi
14592c4a3: 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
14592c4a7: 0f287d60 movaps xmm7, xmmword ptr [rbp + 0x60]
14592c4ab: 4881c4f8000000 add rsp, 0xf8
14592c4b2: 5b pop rbx
14592c4b3: 5f pop rdi
14592c4b4: 5e pop rsi
14592c4b5: 415e pop r14
14592c4b7: 415f pop r15
14592c4b9: 5d pop rbp
14592c4ba: c3 ret
