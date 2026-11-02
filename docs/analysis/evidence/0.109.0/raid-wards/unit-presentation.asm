14596ed40: 55 push rbp
14596ed41: 4157 push r15
14596ed43: 4156 push r14
14596ed45: 4154 push r12
14596ed47: 56 push rsi
14596ed48: 57 push rdi
14596ed49: 53 push rbx
14596ed4a: 4881ec00010000 sub rsp, 0x100
14596ed51: 488dac2480000000 lea rbp, [rsp + 0x80]
14596ed59: 660f7f7570 movdqa xmmword ptr [rbp + 0x70], xmm6
14596ed5e: 48c74568feffffff mov qword ptr [rbp + 0x68], 0xfffffffffffffffe
14596ed66: 4589ce mov r14d, r9d
14596ed69: 4589c4 mov r12d, r8d
14596ed6c: 4889d7 mov rdi, rdx
14596ed6f: 4889ce mov rsi, rcx
14596ed72: 0fb685f0000000 movzx eax, byte ptr [rbp + 0xf0]
14596ed79: 8d0440 lea eax, [rax + rax*2]
14596ed7c: 0381d8040000 add eax, dword ptr [rcx + 0x4d8]
14596ed82: 83f83f cmp eax, 0x3f
14596ed85: 41bf3f000000 mov r15d, 0x3f
14596ed8b: 440f42f8 cmovb r15d, eax
14596ed8f: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
14596ed97: 48c7452800000000 mov qword ptr [rbp + 0x28], 0
14596ed9f: 488d5d18 lea rbx, [rbp + 0x18]
14596eda3: 4889d9 mov rcx, rbx
14596eda6: 31d2 xor edx, edx
14596eda8: 4989f8 mov r8, rdi
14596edab: e85012f5ff call 0x1458c0000
14596edb0: 90 nop
14596edb1: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596edb5: 4885c0 test rax, rax
14596edb8: 7471 je 0x14596ee2b
14596edba: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596edbe: 66ba0200 mov dx, 2
14596edc2: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596edc7: 4589ca mov r10d, r9d
14596edca: 4501d2 add r10d, r10d
14596edcd: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596edd4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14596ede0: 4d85d2 test r10, r10
14596ede3: 742b je 0x14596ee10
14596ede5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596edeb: 410f97c3 seta r11b
14596edef: 4180db00 sbb r11b, 0
14596edf3: 49ffc0 inc r8
14596edf6: 4983c2fe add r10, -2
14596edfa: 4180fb01 cmp r11b, 1
14596edfe: 74e0 je 0x14596ede0
14596ee00: 450fb6cb movzx r9d, r11b
14596ee04: 4585c9 test r9d, r9d
14596ee07: 7417 je 0x14596ee20
14596ee09: eb08 jmp 0x14596ee13
14596ee0b: 0f1f440000 nop dword ptr [rax + rax]
14596ee10: 4d89c8 mov r8, r9
14596ee13: 4883e901 sub rcx, 1
14596ee17: 7214 jb 0x14596ee2d
14596ee19: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596ee1e: eba2 jmp 0x14596edc2
14596ee20: 42c744800809000000 mov dword ptr [rax + r8*4 + 8], 9
14596ee29: eb32 jmp 0x14596ee5d
14596ee2b: 31c0 xor eax, eax
14596ee2d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596ee31: 48894538 mov qword ptr [rbp + 0x38], rax
14596ee35: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596ee3d: 4c894548 mov qword ptr [rbp + 0x48], r8
14596ee41: 48c7455002000000 mov qword ptr [rbp + 0x50], 2
14596ee49: 488d4df8 lea rcx, [rbp - 8]
14596ee4d: 488d5530 lea rdx, [rbp + 0x30]
14596ee51: 41b809000000 mov r8d, 9
14596ee57: e8c4a7f6ff call 0x1458d9620
14596ee5c: 90 nop
14596ee5d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596ee61: 4885c0 test rax, rax
14596ee64: 7461 je 0x14596eec7
14596ee66: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596ee6a: 66ba0300 mov dx, 3
14596ee6e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596ee73: 4589ca mov r10d, r9d
14596ee76: 4501d2 add r10d, r10d
14596ee79: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596ee80: 4d85d2 test r10, r10
14596ee83: 742b je 0x14596eeb0
14596ee85: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596ee8b: 410f97c3 seta r11b
14596ee8f: 4180db00 sbb r11b, 0
14596ee93: 49ffc0 inc r8
14596ee96: 4983c2fe add r10, -2
14596ee9a: 4180fb01 cmp r11b, 1
14596ee9e: 74e0 je 0x14596ee80
14596eea0: 450fb6cb movzx r9d, r11b
14596eea4: 4585c9 test r9d, r9d
14596eea7: 7417 je 0x14596eec0
14596eea9: eb08 jmp 0x14596eeb3
14596eeab: 0f1f440000 nop dword ptr [rax + rax]
14596eeb0: 4d89c8 mov r8, r9
14596eeb3: 4883e901 sub rcx, 1
14596eeb7: 7210 jb 0x14596eec9
14596eeb9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596eebe: ebae jmp 0x14596ee6e
14596eec0: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
14596eec5: eb2f jmp 0x14596eef6
14596eec7: 31c0 xor eax, eax
14596eec9: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596eecd: 48894538 mov qword ptr [rbp + 0x38], rax
14596eed1: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596eed9: 4c894548 mov qword ptr [rbp + 0x48], r8
14596eedd: 48c7455003000000 mov qword ptr [rbp + 0x50], 3
14596eee5: 488d4df8 lea rcx, [rbp - 8]
14596eee9: 488d5530 lea rdx, [rbp + 0x30]
14596eeed: 4589e0 mov r8d, r12d
14596eef0: e82ba7f6ff call 0x1458d9620
14596eef5: 90 nop
14596eef6: 660f6eb5e0000000 movd xmm6, dword ptr [rbp + 0xe0]
14596eefe: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596ef02: 4885c0 test rax, rax
14596ef05: 7472 je 0x14596ef79
14596ef07: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596ef0b: 66ba0400 mov dx, 4
14596ef0f: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14596ef14: 4589c2 mov r10d, r8d
14596ef17: 4501d2 add r10d, r10d
14596ef1a: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14596ef21: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14596ef30: 4d85d2 test r10, r10
14596ef33: 742b je 0x14596ef60
14596ef35: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
14596ef3b: 410f97c3 seta r11b
14596ef3f: 4180db00 sbb r11b, 0
14596ef43: 49ffc1 inc r9
14596ef46: 4983c2fe add r10, -2
14596ef4a: 4180fb01 cmp r11b, 1
14596ef4e: 74e0 je 0x14596ef30
14596ef50: 450fb6c3 movzx r8d, r11b
14596ef54: 4585c0 test r8d, r8d
14596ef57: 7417 je 0x14596ef70
14596ef59: eb08 jmp 0x14596ef63
14596ef5b: 0f1f440000 nop dword ptr [rax + rax]
14596ef60: 4d89c1 mov r9, r8
14596ef63: 4883e901 sub rcx, 1
14596ef67: 7212 jb 0x14596ef7b
14596ef69: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14596ef6e: eb9f jmp 0x14596ef0f
14596ef70: 66420f7e748808 movd dword ptr [rax + r9*4 + 8], xmm6
14596ef77: eb31 jmp 0x14596efaa
14596ef79: 31c0 xor eax, eax
14596ef7b: 66410f7ef0 movd r8d, xmm6
14596ef80: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596ef84: 48894538 mov qword ptr [rbp + 0x38], rax
14596ef88: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596ef90: 4c894d48 mov qword ptr [rbp + 0x48], r9
14596ef94: 48c7455004000000 mov qword ptr [rbp + 0x50], 4
14596ef9c: 488d4df8 lea rcx, [rbp - 8]
14596efa0: 488d5530 lea rdx, [rbp + 0x30]
14596efa4: e877a6f6ff call 0x1458d9620
14596efa9: 90 nop
14596efaa: f30f1085e8000000 movss xmm0, dword ptr [rbp + 0xe8]
14596efb2: e88ab12800 call 0x145bfa141
14596efb7: f3480f2cc0 cvttss2si rax, xmm0
14596efbc: 31c9 xor ecx, ecx
14596efbe: 0f57c9 xorps xmm1, xmm1
14596efc1: 0f2ec1 ucomiss xmm0, xmm1
14596efc4: 0f42c1 cmovb eax, ecx
14596efc7: 0f2e05723e4600 ucomiss xmm0, dword ptr [rip + 0x463e72]
14596efce: 41bcffffffff mov r12d, 0xffffffff
14596efd4: 440f46e0 cmovbe r12d, eax
14596efd8: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596efdc: 4885c0 test rax, rax
14596efdf: 7466 je 0x14596f047
14596efe1: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596efe5: 66ba1600 mov dx, 0x16
14596efe9: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596efee: 4589ca mov r10d, r9d
14596eff1: 4501d2 add r10d, r10d
14596eff4: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596effb: 0f1f440000 nop dword ptr [rax + rax]
14596f000: 4d85d2 test r10, r10
14596f003: 742b je 0x14596f030
14596f005: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596f00b: 410f97c3 seta r11b
14596f00f: 4180db00 sbb r11b, 0
14596f013: 49ffc0 inc r8
14596f016: 4983c2fe add r10, -2
14596f01a: 4180fb01 cmp r11b, 1
14596f01e: 74e0 je 0x14596f000
14596f020: 450fb6cb movzx r9d, r11b
14596f024: 4585c9 test r9d, r9d
14596f027: 7417 je 0x14596f040
14596f029: eb08 jmp 0x14596f033
14596f02b: 0f1f440000 nop dword ptr [rax + rax]
14596f030: 4d89c8 mov r8, r9
14596f033: 4883e901 sub rcx, 1
14596f037: 7210 jb 0x14596f049
14596f039: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f03e: eba9 jmp 0x14596efe9
14596f040: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
14596f045: eb2f jmp 0x14596f076
14596f047: 31c0 xor eax, eax
14596f049: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f04d: 48894538 mov qword ptr [rbp + 0x38], rax
14596f051: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f059: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f05d: 48c7455016000000 mov qword ptr [rbp + 0x50], 0x16
14596f065: 488d4df8 lea rcx, [rbp - 8]
14596f069: 488d5530 lea rdx, [rbp + 0x30]
14596f06d: 4589e0 mov r8d, r12d
14596f070: e8aba5f6ff call 0x1458d9620
14596f075: 90 nop
14596f076: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f07a: 4885c0 test rax, rax
14596f07d: 7468 je 0x14596f0e7
14596f07f: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f083: 66ba1c00 mov dx, 0x1c
14596f087: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f08c: 4589ca mov r10d, r9d
14596f08f: 4501d2 add r10d, r10d
14596f092: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f099: 0f1f8000000000 nop dword ptr [rax]
14596f0a0: 4d85d2 test r10, r10
14596f0a3: 742b je 0x14596f0d0
14596f0a5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596f0ab: 410f97c3 seta r11b
14596f0af: 4180db00 sbb r11b, 0
14596f0b3: 49ffc0 inc r8
14596f0b6: 4983c2fe add r10, -2
14596f0ba: 4180fb01 cmp r11b, 1
14596f0be: 74e0 je 0x14596f0a0
14596f0c0: 450fb6cb movzx r9d, r11b
14596f0c4: 4585c9 test r9d, r9d
14596f0c7: 7417 je 0x14596f0e0
14596f0c9: eb08 jmp 0x14596f0d3
14596f0cb: 0f1f440000 nop dword ptr [rax + rax]
14596f0d0: 4d89c8 mov r8, r9
14596f0d3: 4883e901 sub rcx, 1
14596f0d7: 7210 jb 0x14596f0e9
14596f0d9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f0de: eba7 jmp 0x14596f087
14596f0e0: 4689648008 mov dword ptr [rax + r8*4 + 8], r12d
14596f0e5: eb2f jmp 0x14596f116
14596f0e7: 31c0 xor eax, eax
14596f0e9: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f0ed: 48894538 mov qword ptr [rbp + 0x38], rax
14596f0f1: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f0f9: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f0fd: 48c745501c000000 mov qword ptr [rbp + 0x50], 0x1c
14596f105: 488d4df8 lea rcx, [rbp - 8]
14596f109: 488d5530 lea rdx, [rbp + 0x30]
14596f10d: 4589e0 mov r8d, r12d
14596f110: e80ba5f6ff call 0x1458d9620
14596f115: 90 nop
14596f116: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f11a: 4885c0 test rax, rax
14596f11d: 7468 je 0x14596f187
14596f11f: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f123: 66ba2200 mov dx, 0x22
14596f127: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f12c: 4589ca mov r10d, r9d
14596f12f: 4501d2 add r10d, r10d
14596f132: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f139: 0f1f8000000000 nop dword ptr [rax]
14596f140: 4d85d2 test r10, r10
14596f143: 742b je 0x14596f170
14596f145: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596f14b: 410f97c3 seta r11b
14596f14f: 4180db00 sbb r11b, 0
14596f153: 49ffc0 inc r8
14596f156: 4983c2fe add r10, -2
14596f15a: 4180fb01 cmp r11b, 1
14596f15e: 74e0 je 0x14596f140
14596f160: 450fb6cb movzx r9d, r11b
14596f164: 4585c9 test r9d, r9d
14596f167: 7417 je 0x14596f180
14596f169: eb08 jmp 0x14596f173
14596f16b: 0f1f440000 nop dword ptr [rax + rax]
14596f170: 4d89c8 mov r8, r9
14596f173: 4883e901 sub rcx, 1
14596f177: 7210 jb 0x14596f189
14596f179: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f17e: eba7 jmp 0x14596f127
14596f180: 46897c8008 mov dword ptr [rax + r8*4 + 8], r15d
14596f185: eb2f jmp 0x14596f1b6
14596f187: 31c0 xor eax, eax
14596f189: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f18d: 48894538 mov qword ptr [rbp + 0x38], rax
14596f191: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f199: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f19d: 48c7455022000000 mov qword ptr [rbp + 0x50], 0x22
14596f1a5: 488d4df8 lea rcx, [rbp - 8]
14596f1a9: 488d5530 lea rdx, [rbp + 0x30]
14596f1ad: 4589f8 mov r8d, r15d
14596f1b0: e86ba4f6ff call 0x1458d9620
14596f1b5: 90 nop
14596f1b6: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f1ba: 4885c0 test rax, rax
14596f1bd: 746c je 0x14596f22b
14596f1bf: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f1c3: 66ba2300 mov dx, 0x23
14596f1c7: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f1cc: 4589ca mov r10d, r9d
14596f1cf: 4501d2 add r10d, r10d
14596f1d2: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f1d9: 0f1f8000000000 nop dword ptr [rax]
14596f1e0: 4d85d2 test r10, r10
14596f1e3: 742b je 0x14596f210
14596f1e5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596f1eb: 410f97c3 seta r11b
14596f1ef: 4180db00 sbb r11b, 0
14596f1f3: 49ffc0 inc r8
14596f1f6: 4983c2fe add r10, -2
14596f1fa: 4180fb01 cmp r11b, 1
14596f1fe: 74e0 je 0x14596f1e0
14596f200: 450fb6cb movzx r9d, r11b
14596f204: 4585c9 test r9d, r9d
14596f207: 7417 je 0x14596f220
14596f209: eb08 jmp 0x14596f213
14596f20b: 0f1f440000 nop dword ptr [rax + rax]
14596f210: 4d89c8 mov r8, r9
14596f213: 4883e901 sub rcx, 1
14596f217: 7214 jb 0x14596f22d
14596f219: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f21e: eba7 jmp 0x14596f1c7
14596f220: 42c74480080e000000 mov dword ptr [rax + r8*4 + 8], 0xe
14596f229: eb32 jmp 0x14596f25d
14596f22b: 31c0 xor eax, eax
14596f22d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f231: 48894538 mov qword ptr [rbp + 0x38], rax
14596f235: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f23d: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f241: 48c7455023000000 mov qword ptr [rbp + 0x50], 0x23
14596f249: 488d4df8 lea rcx, [rbp - 8]
14596f24d: 488d5530 lea rdx, [rbp + 0x30]
14596f251: 41b80e000000 mov r8d, 0xe
14596f257: e8c4a3f6ff call 0x1458d9620
14596f25c: 90 nop
14596f25d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f261: 4885c0 test rax, rax
14596f264: 7465 je 0x14596f2cb
14596f266: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f26a: 66ba2400 mov dx, 0x24
14596f26e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f273: 4589ca mov r10d, r9d
14596f276: 4501d2 add r10d, r10d
14596f279: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f280: 4d85d2 test r10, r10
14596f283: 742b je 0x14596f2b0
14596f285: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596f28b: 410f97c3 seta r11b
14596f28f: 4180db00 sbb r11b, 0
14596f293: 49ffc0 inc r8
14596f296: 4983c2fe add r10, -2
14596f29a: 4180fb01 cmp r11b, 1
14596f29e: 74e0 je 0x14596f280
14596f2a0: 450fb6cb movzx r9d, r11b
14596f2a4: 4585c9 test r9d, r9d
14596f2a7: 7417 je 0x14596f2c0
14596f2a9: eb08 jmp 0x14596f2b3
14596f2ab: 0f1f440000 nop dword ptr [rax + rax]
14596f2b0: 4d89c8 mov r8, r9
14596f2b3: 4883e901 sub rcx, 1
14596f2b7: 7214 jb 0x14596f2cd
14596f2b9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f2be: ebae jmp 0x14596f26e
14596f2c0: 42c744800800010000 mov dword ptr [rax + r8*4 + 8], 0x100
14596f2c9: eb32 jmp 0x14596f2fd
14596f2cb: 31c0 xor eax, eax
14596f2cd: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f2d1: 48894538 mov qword ptr [rbp + 0x38], rax
14596f2d5: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f2dd: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f2e1: 48c7455024000000 mov qword ptr [rbp + 0x50], 0x24
14596f2e9: 488d4df8 lea rcx, [rbp - 8]
14596f2ed: 488d5530 lea rdx, [rbp + 0x30]
14596f2f1: 41b800010000 mov r8d, 0x100
14596f2f7: e824a3f6ff call 0x1458d9620
14596f2fc: 90 nop
14596f2fd: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f301: 4885c0 test rax, rax
14596f304: 7465 je 0x14596f36b
14596f306: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f30a: 66ba2e00 mov dx, 0x2e
14596f30e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f313: 4589ca mov r10d, r9d
14596f316: 4501d2 add r10d, r10d
14596f319: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f320: 4d85d2 test r10, r10
14596f323: 742b je 0x14596f350
14596f325: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596f32b: 410f97c3 seta r11b
14596f32f: 4180db00 sbb r11b, 0
14596f333: 49ffc0 inc r8
14596f336: 4983c2fe add r10, -2
14596f33a: 4180fb01 cmp r11b, 1
14596f33e: 74e0 je 0x14596f320
14596f340: 450fb6cb movzx r9d, r11b
14596f344: 4585c9 test r9d, r9d
14596f347: 7417 je 0x14596f360
14596f349: eb08 jmp 0x14596f353
14596f34b: 0f1f440000 nop dword ptr [rax + rax]
14596f350: 4d89c8 mov r8, r9
14596f353: 4883e901 sub rcx, 1
14596f357: 7214 jb 0x14596f36d
14596f359: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f35e: ebae jmp 0x14596f30e
14596f360: 42c744800800000000 mov dword ptr [rax + r8*4 + 8], 0
14596f369: eb2f jmp 0x14596f39a
14596f36b: 31c0 xor eax, eax
14596f36d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f371: 48894538 mov qword ptr [rbp + 0x38], rax
14596f375: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f37d: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f381: 48c745502e000000 mov qword ptr [rbp + 0x50], 0x2e
14596f389: 488d4df8 lea rcx, [rbp - 8]
14596f38d: 488d5530 lea rdx, [rbp + 0x30]
14596f391: 4531c0 xor r8d, r8d
14596f394: e887a2f6ff call 0x1458d9620
14596f399: 90 nop
14596f39a: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f39e: 4885c0 test rax, rax
14596f3a1: 7468 je 0x14596f40b
14596f3a3: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f3a7: 66ba7e00 mov dx, 0x7e
14596f3ab: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f3b0: 4589ca mov r10d, r9d
14596f3b3: 4501d2 add r10d, r10d
14596f3b6: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f3bd: 0f1f00 nop dword ptr [rax]
14596f3c0: 4d85d2 test r10, r10
14596f3c3: 742b je 0x14596f3f0
14596f3c5: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596f3cb: 410f97c3 seta r11b
14596f3cf: 4180db00 sbb r11b, 0
14596f3d3: 49ffc0 inc r8
14596f3d6: 4983c2fe add r10, -2
14596f3da: 4180fb01 cmp r11b, 1
14596f3de: 74e0 je 0x14596f3c0
14596f3e0: 450fb6cb movzx r9d, r11b
14596f3e4: 4585c9 test r9d, r9d
14596f3e7: 7417 je 0x14596f400
14596f3e9: eb08 jmp 0x14596f3f3
14596f3eb: 0f1f440000 nop dword ptr [rax + rax]
14596f3f0: 4d89c8 mov r8, r9
14596f3f3: 4883e901 sub rcx, 1
14596f3f7: 7214 jb 0x14596f40d
14596f3f9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f3fe: ebab jmp 0x14596f3ab
14596f400: 42c7448008d0070000 mov dword ptr [rax + r8*4 + 8], 0x7d0
14596f409: eb32 jmp 0x14596f43d
14596f40b: 31c0 xor eax, eax
14596f40d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f411: 48894538 mov qword ptr [rbp + 0x38], rax
14596f415: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f41d: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f421: 48c745507e000000 mov qword ptr [rbp + 0x50], 0x7e
14596f429: 488d4df8 lea rcx, [rbp - 8]
14596f42d: 488d5530 lea rdx, [rbp + 0x30]
14596f431: 41b8d0070000 mov r8d, 0x7d0
14596f437: e8e4a1f6ff call 0x1458d9620
14596f43c: 90 nop
14596f43d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f441: 4885c0 test rax, rax
14596f444: 7465 je 0x14596f4ab
14596f446: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f44a: 66ba7f00 mov dx, 0x7f
14596f44e: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f453: 4589ca mov r10d, r9d
14596f456: 4501d2 add r10d, r10d
14596f459: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f460: 4d85d2 test r10, r10
14596f463: 742b je 0x14596f490
14596f465: 66423b54403a cmp dx, word ptr [rax + r8*2 + 0x3a]
14596f46b: 410f97c3 seta r11b
14596f46f: 4180db00 sbb r11b, 0
14596f473: 49ffc0 inc r8
14596f476: 4983c2fe add r10, -2
14596f47a: 4180fb01 cmp r11b, 1
14596f47e: 74e0 je 0x14596f460
14596f480: 450fb6cb movzx r9d, r11b
14596f484: 4585c9 test r9d, r9d
14596f487: 7417 je 0x14596f4a0
14596f489: eb08 jmp 0x14596f493
14596f48b: 0f1f440000 nop dword ptr [rax + rax]
14596f490: 4d89c8 mov r8, r9
14596f493: 4883e901 sub rcx, 1
14596f497: 7214 jb 0x14596f4ad
14596f499: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f49e: ebae jmp 0x14596f44e
14596f4a0: 42c7448008d0070000 mov dword ptr [rax + r8*4 + 8], 0x7d0
14596f4a9: eb32 jmp 0x14596f4dd
14596f4ab: 31c0 xor eax, eax
14596f4ad: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f4b1: 48894538 mov qword ptr [rbp + 0x38], rax
14596f4b5: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f4bd: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f4c1: 48c745507f000000 mov qword ptr [rbp + 0x50], 0x7f
14596f4c9: 488d4df8 lea rcx, [rbp - 8]
14596f4cd: 488d5530 lea rdx, [rbp + 0x30]
14596f4d1: 41b8d0070000 mov r8d, 0x7d0
14596f4d7: e844a1f6ff call 0x1458d9620
14596f4dc: 90 nop
14596f4dd: f30f1005bfdd4200 movss xmm0, dword ptr [rip + 0x42ddbf]
14596f4e5: f30f59c6 mulss xmm0, xmm6
14596f4e9: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f4ed: 4885c0 test rax, rax
14596f4f0: 7467 je 0x14596f559
14596f4f2: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f4f6: ba81000000 mov edx, 0x81
14596f4fb: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14596f500: 4589c2 mov r10d, r8d
14596f503: 4501d2 add r10d, r10d
14596f506: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14596f50d: 0f1f00 nop dword ptr [rax]
14596f510: 4d85d2 test r10, r10
14596f513: 742b je 0x14596f540
14596f515: 460fb75c483a movzx r11d, word ptr [rax + r9*2 + 0x3a]
14596f51b: 4439da cmp edx, r11d
14596f51e: 410f97c3 seta r11b
14596f522: 4180db00 sbb r11b, 0
14596f526: 49ffc1 inc r9
14596f529: 4983c2fe add r10, -2
14596f52d: 4180fb01 cmp r11b, 1
14596f531: 74dd je 0x14596f510
14596f533: 450fb6c3 movzx r8d, r11b
14596f537: 4585c0 test r8d, r8d
14596f53a: 7414 je 0x14596f550
14596f53c: eb05 jmp 0x14596f543
14596f53e: 6690 nop
14596f540: 4d89c1 mov r9, r8
14596f543: 4883e901 sub rcx, 1
14596f547: 7212 jb 0x14596f55b
14596f549: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14596f54e: ebab jmp 0x14596f4fb
14596f550: f3420f11448808 movss dword ptr [rax + r9*4 + 8], xmm0
14596f557: eb31 jmp 0x14596f58a
14596f559: 31c0 xor eax, eax
14596f55b: 66410f7ec0 movd r8d, xmm0
14596f560: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f564: 48894538 mov qword ptr [rbp + 0x38], rax
14596f568: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f570: 4c894d48 mov qword ptr [rbp + 0x48], r9
14596f574: 48c7455081000000 mov qword ptr [rbp + 0x50], 0x81
14596f57c: 488d4df8 lea rcx, [rbp - 8]
14596f580: 488d5530 lea rdx, [rbp + 0x30]
14596f584: e897a0f6ff call 0x1458d9620
14596f589: 90 nop
14596f58a: f30f593536574600 mulss xmm6, dword ptr [rip + 0x465736]
14596f592: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f596: 4885c0 test rax, rax
14596f599: 746e je 0x14596f609
14596f59b: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f59f: ba82000000 mov edx, 0x82
14596f5a4: 440fb74036 movzx r8d, word ptr [rax + 0x36]
14596f5a9: 4589c2 mov r10d, r8d
14596f5ac: 4501d2 add r10d, r10d
14596f5af: 49c7c1ffffffff mov r9, 0xffffffffffffffff
14596f5b6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14596f5c0: 4d85d2 test r10, r10
14596f5c3: 742b je 0x14596f5f0
14596f5c5: 460fb75c483a movzx r11d, word ptr [rax + r9*2 + 0x3a]
14596f5cb: 4439da cmp edx, r11d
14596f5ce: 410f97c3 seta r11b
14596f5d2: 4180db00 sbb r11b, 0
14596f5d6: 49ffc1 inc r9
14596f5d9: 4983c2fe add r10, -2
14596f5dd: 4180fb01 cmp r11b, 1
14596f5e1: 74dd je 0x14596f5c0
14596f5e3: 450fb6c3 movzx r8d, r11b
14596f5e7: 4585c0 test r8d, r8d
14596f5ea: 7414 je 0x14596f600
14596f5ec: eb05 jmp 0x14596f5f3
14596f5ee: 6690 nop
14596f5f0: 4d89c1 mov r9, r8
14596f5f3: 4883e901 sub rcx, 1
14596f5f7: 7212 jb 0x14596f60b
14596f5f9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
14596f5fe: eba4 jmp 0x14596f5a4
14596f600: f3420f11748808 movss dword ptr [rax + r9*4 + 8], xmm6
14596f607: eb31 jmp 0x14596f63a
14596f609: 31c0 xor eax, eax
14596f60b: 66410f7ef0 movd r8d, xmm6
14596f610: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f614: 48894538 mov qword ptr [rbp + 0x38], rax
14596f618: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f620: 4c894d48 mov qword ptr [rbp + 0x48], r9
14596f624: 48c7455082000000 mov qword ptr [rbp + 0x50], 0x82
14596f62c: 488d4df8 lea rcx, [rbp - 8]
14596f630: 488d5530 lea rdx, [rbp + 0x30]
14596f634: e8e79ff6ff call 0x1458d9620
14596f639: 90 nop
14596f63a: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f63e: 4885c0 test rax, rax
14596f641: 7464 je 0x14596f6a7
14596f643: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f647: ba83000000 mov edx, 0x83
14596f64c: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f651: 4589ca mov r10d, r9d
14596f654: 4501d2 add r10d, r10d
14596f657: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f65e: 6690 nop
14596f660: 4d85d2 test r10, r10
14596f663: 742b je 0x14596f690
14596f665: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14596f66b: 4439da cmp edx, r11d
14596f66e: 410f97c3 seta r11b
14596f672: 4180db00 sbb r11b, 0
14596f676: 49ffc0 inc r8
14596f679: 4983c2fe add r10, -2
14596f67d: 4180fb01 cmp r11b, 1
14596f681: 74dd je 0x14596f660
14596f683: 450fb6cb movzx r9d, r11b
14596f687: 4585c9 test r9d, r9d
14596f68a: 7414 je 0x14596f6a0
14596f68c: eb05 jmp 0x14596f693
14596f68e: 6690 nop
14596f690: 4d89c8 mov r8, r9
14596f693: 4883e901 sub rcx, 1
14596f697: 7210 jb 0x14596f6a9
14596f699: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f69e: ebac jmp 0x14596f64c
14596f6a0: 4689748008 mov dword ptr [rax + r8*4 + 8], r14d
14596f6a5: eb2f jmp 0x14596f6d6
14596f6a7: 31c0 xor eax, eax
14596f6a9: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f6ad: 48894538 mov qword ptr [rbp + 0x38], rax
14596f6b1: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f6b9: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f6bd: 48c7455083000000 mov qword ptr [rbp + 0x50], 0x83
14596f6c5: 488d4df8 lea rcx, [rbp - 8]
14596f6c9: 488d5530 lea rdx, [rbp + 0x30]
14596f6cd: 4589f0 mov r8d, r14d
14596f6d0: e84b9ff6ff call 0x1458d9620
14596f6d5: 90 nop
14596f6d6: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f6da: 4885c0 test rax, rax
14596f6dd: 7468 je 0x14596f747
14596f6df: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f6e3: ba84000000 mov edx, 0x84
14596f6e8: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f6ed: 4589ca mov r10d, r9d
14596f6f0: 4501d2 add r10d, r10d
14596f6f3: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f6fa: 660f1f440000 nop word ptr [rax + rax]
14596f700: 4d85d2 test r10, r10
14596f703: 742b je 0x14596f730
14596f705: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14596f70b: 4439da cmp edx, r11d
14596f70e: 410f97c3 seta r11b
14596f712: 4180db00 sbb r11b, 0
14596f716: 49ffc0 inc r8
14596f719: 4983c2fe add r10, -2
14596f71d: 4180fb01 cmp r11b, 1
14596f721: 74dd je 0x14596f700
14596f723: 450fb6cb movzx r9d, r11b
14596f727: 4585c9 test r9d, r9d
14596f72a: 7414 je 0x14596f740
14596f72c: eb05 jmp 0x14596f733
14596f72e: 6690 nop
14596f730: 4d89c8 mov r8, r9
14596f733: 4883e901 sub rcx, 1
14596f737: 7210 jb 0x14596f749
14596f739: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f73e: eba8 jmp 0x14596f6e8
14596f740: 4689748008 mov dword ptr [rax + r8*4 + 8], r14d
14596f745: eb2f jmp 0x14596f776
14596f747: 31c0 xor eax, eax
14596f749: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f74d: 48894538 mov qword ptr [rbp + 0x38], rax
14596f751: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f759: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f75d: 48c7455084000000 mov qword ptr [rbp + 0x50], 0x84
14596f765: 488d4df8 lea rcx, [rbp - 8]
14596f769: 488d5530 lea rdx, [rbp + 0x30]
14596f76d: 4589f0 mov r8d, r14d
14596f770: e8ab9ef6ff call 0x1458d9620
14596f775: 90 nop
14596f776: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f77a: 4885c0 test rax, rax
14596f77d: 746c je 0x14596f7eb
14596f77f: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f783: ba86000000 mov edx, 0x86
14596f788: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f78d: 4589ca mov r10d, r9d
14596f790: 4501d2 add r10d, r10d
14596f793: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f79a: 660f1f440000 nop word ptr [rax + rax]
14596f7a0: 4d85d2 test r10, r10
14596f7a3: 742b je 0x14596f7d0
14596f7a5: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14596f7ab: 4439da cmp edx, r11d
14596f7ae: 410f97c3 seta r11b
14596f7b2: 4180db00 sbb r11b, 0
14596f7b6: 49ffc0 inc r8
14596f7b9: 4983c2fe add r10, -2
14596f7bd: 4180fb01 cmp r11b, 1
14596f7c1: 74dd je 0x14596f7a0
14596f7c3: 450fb6cb movzx r9d, r11b
14596f7c7: 4585c9 test r9d, r9d
14596f7ca: 7414 je 0x14596f7e0
14596f7cc: eb05 jmp 0x14596f7d3
14596f7ce: 6690 nop
14596f7d0: 4d89c8 mov r8, r9
14596f7d3: 4883e901 sub rcx, 1
14596f7d7: 7214 jb 0x14596f7ed
14596f7d9: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f7de: eba8 jmp 0x14596f788
14596f7e0: 42c74480080000a040 mov dword ptr [rax + r8*4 + 8], 0x40a00000
14596f7e9: eb32 jmp 0x14596f81d
14596f7eb: 31c0 xor eax, eax
14596f7ed: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f7f1: 48894538 mov qword ptr [rbp + 0x38], rax
14596f7f5: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f7fd: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f801: 48c7455086000000 mov qword ptr [rbp + 0x50], 0x86
14596f809: 488d4df8 lea rcx, [rbp - 8]
14596f80d: 488d5530 lea rdx, [rbp + 0x30]
14596f811: 41b80000a040 mov r8d, 0x40a00000
14596f817: e8049ef6ff call 0x1458d9620
14596f81c: 90 nop
14596f81d: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f821: 4885c0 test rax, rax
14596f824: 7475 je 0x14596f89b
14596f826: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f82a: ba87000000 mov edx, 0x87
14596f82f: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f834: 4589ca mov r10d, r9d
14596f837: 4501d2 add r10d, r10d
14596f83a: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f841: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14596f850: 4d85d2 test r10, r10
14596f853: 742b je 0x14596f880
14596f855: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14596f85b: 4439da cmp edx, r11d
14596f85e: 410f97c3 seta r11b
14596f862: 4180db00 sbb r11b, 0
14596f866: 49ffc0 inc r8
14596f869: 4983c2fe add r10, -2
14596f86d: 4180fb01 cmp r11b, 1
14596f871: 74dd je 0x14596f850
14596f873: 450fb6cb movzx r9d, r11b
14596f877: 4585c9 test r9d, r9d
14596f87a: 7414 je 0x14596f890
14596f87c: eb05 jmp 0x14596f883
14596f87e: 6690 nop
14596f880: 4d89c8 mov r8, r9
14596f883: 4883e901 sub rcx, 1
14596f887: 7214 jb 0x14596f89d
14596f889: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f88e: eb9f jmp 0x14596f82f
14596f890: 42c744800800002041 mov dword ptr [rax + r8*4 + 8], 0x41200000
14596f899: eb32 jmp 0x14596f8cd
14596f89b: 31c0 xor eax, eax
14596f89d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f8a1: 48894538 mov qword ptr [rbp + 0x38], rax
14596f8a5: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f8ad: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f8b1: 48c7455087000000 mov qword ptr [rbp + 0x50], 0x87
14596f8b9: 488d4df8 lea rcx, [rbp - 8]
14596f8bd: 488d5530 lea rdx, [rbp + 0x30]
14596f8c1: 41b800002041 mov r8d, 0x41200000
14596f8c7: e8549df6ff call 0x1458d9620
14596f8cc: 90 nop
14596f8cd: 488b4518 mov rax, qword ptr [rbp + 0x18]
14596f8d1: 4885c0 test rax, rax
14596f8d4: 7475 je 0x14596f94b
14596f8d6: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
14596f8da: ba91000000 mov edx, 0x91
14596f8df: 440fb74836 movzx r9d, word ptr [rax + 0x36]
14596f8e4: 4589ca mov r10d, r9d
14596f8e7: 4501d2 add r10d, r10d
14596f8ea: 49c7c0ffffffff mov r8, 0xffffffffffffffff
14596f8f1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14596f900: 4d85d2 test r10, r10
14596f903: 742b je 0x14596f930
14596f905: 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
14596f90b: 4439da cmp edx, r11d
14596f90e: 410f97c3 seta r11b
14596f912: 4180db00 sbb r11b, 0
14596f916: 49ffc0 inc r8
14596f919: 4983c2fe add r10, -2
14596f91d: 4180fb01 cmp r11b, 1
14596f921: 74dd je 0x14596f900
14596f923: 450fb6cb movzx r9d, r11b
14596f927: 4585c9 test r9d, r9d
14596f92a: 7414 je 0x14596f940
14596f92c: eb05 jmp 0x14596f933
14596f92e: 6690 nop
14596f930: 4d89c8 mov r8, r9
14596f933: 4883e901 sub rcx, 1
14596f937: 7214 jb 0x14596f94d
14596f939: 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
14596f93e: eb9f jmp 0x14596f8df
14596f940: 42c74480080000803f mov dword ptr [rax + r8*4 + 8], 0x3f800000
14596f949: eb32 jmp 0x14596f97d
14596f94b: 31c0 xor eax, eax
14596f94d: 48895d30 mov qword ptr [rbp + 0x30], rbx
14596f951: 48894538 mov qword ptr [rbp + 0x38], rax
14596f955: 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14596f95d: 4c894548 mov qword ptr [rbp + 0x48], r8
14596f961: 48c7455091000000 mov qword ptr [rbp + 0x50], 0x91
14596f969: 488d4df8 lea rcx, [rbp - 8]
14596f96d: 488d5530 lea rdx, [rbp + 0x30]
14596f971: 41b80000803f mov r8d, 0x3f800000
14596f977: e8a49cf6ff call 0x1458d9620
14596f97c: 90 nop
14596f97d: 4c8b8660040000 mov r8, qword ptr [rsi + 0x460]
14596f984: 488d5d18 lea rbx, [rbp + 0x18]
14596f988: 4889d9 mov rcx, rbx
14596f98b: 66ba1000 mov dx, 0x10
14596f98f: e86c06f5ff call 0x1458c0000
14596f994: 90 nop
14596f995: 4c8bb5f8000000 mov r14, qword ptr [rbp + 0xf8]
14596f99c: f30f108ec8040000 movss xmm1, dword ptr [rsi + 0x4c8]
14596f9a4: f30f1086cc040000 movss xmm0, dword ptr [rsi + 0x4cc]
14596f9ac: f3410f5c4604 subss xmm0, dword ptr [r14 + 4]
14596f9b2: f3410f5c0e subss xmm1, dword ptr [r14]
14596f9b7: e867a72800 call 0x145bfa123
14596f9bc: c745f000000000 mov dword ptr [rbp - 0x10], 0
14596f9c3: 48c745d800000000 mov qword ptr [rbp - 0x28], 0
14596f9cb: 48c745e001000000 mov qword ptr [rbp - 0x20], 1
14596f9d3: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
14596f9db: 0f100d92ac8b01 movups xmm1, xmmword ptr [rip + 0x18bac92]
14596f9e2: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
14596f9e6: 48b800002040db0f4940 movabs rax, 0x40490fdb40200000
14596f9f0: 488945d0 mov qword ptr [rbp - 0x30], rax
14596f9f4: c745c40000e040 mov dword ptr [rbp - 0x3c], 0x40e00000
14596f9fb: c6456701 mov byte ptr [rbp + 0x67], 1
14596f9ff: 48895c2438 mov qword ptr [rsp + 0x38], rbx
14596fa04: 488d45c0 lea rax, [rbp - 0x40]
14596fa08: 4889442430 mov qword ptr [rsp + 0x30], rax
14596fa0d: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
14596fa13: 4c89742420 mov qword ptr [rsp + 0x20], r14
14596fa18: 488d4dd8 lea rcx, [rbp - 0x28]
14596fa1c: 4889fa mov rdx, rdi
14596fa1f: 41b003 mov r8b, 3
14596fa22: 4531c9 xor r9d, r9d
14596fa25: e866f5f4ff call 0x1458bef90
14596fa2a: 90 nop
14596fa2b: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
14596fa2f: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
14596fa33: 0f294d40 movaps xmmword ptr [rbp + 0x40], xmm1
14596fa37: 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
14596fa3b: c6456700 mov byte ptr [rbp + 0x67], 0
14596fa3f: 488d4df8 lea rcx, [rbp - 8]
14596fa43: 488d5530 lea rdx, [rbp + 0x30]
14596fa47: e814fdf4ff call 0x1458bf760
14596fa4c: 90 nop
14596fa4d: 488bbe28060000 mov rdi, qword ptr [rsi + 0x628]
14596fa54: 483bbe18060000 cmp rdi, qword ptr [rsi + 0x618]
14596fa5b: 750d jne 0x14596fa6a
14596fa5d: 488d8e18060000 lea rcx, [rsi + 0x618]
14596fa64: e8a7b32800 call 0x145bfae10
14596fa69: 90 nop
14596fa6a: 488b8620060000 mov rax, qword ptr [rsi + 0x620]
14596fa71: 4889f9 mov rcx, rdi
14596fa74: 48c1e105 shl rcx, 5
14596fa78: 0f1045f8 movups xmm0, xmmword ptr [rbp - 8]
14596fa7c: 0f104d08 movups xmm1, xmmword ptr [rbp + 8]
14596fa80: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14596fa85: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14596fa89: 48ffc7 inc rdi
14596fa8c: 4889be28060000 mov qword ptr [rsi + 0x628], rdi
14596fa93: 488d4d18 lea rcx, [rbp + 0x18]
14596fa97: e8044d0400 call 0x1459b47a0
14596fa9c: 0f287570 movaps xmm6, xmmword ptr [rbp + 0x70]
14596faa0: 4881c400010000 add rsp, 0x100
14596faa7: 5b pop rbx
14596faa8: 5f pop rdi
14596faa9: 5e pop rsi
14596faaa: 415c pop r12
14596faac: 415e pop r14
14596faae: 415f pop r15
14596fab0: 5d pop rbp
14596fab1: c3 ret
