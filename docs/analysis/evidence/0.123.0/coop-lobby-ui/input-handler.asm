0x14015f820: push rbp
0x14015f821: push r15
0x14015f823: push r14
0x14015f825: push r13
0x14015f827: push r12
0x14015f829: push rsi
0x14015f82a: push rdi
0x14015f82b: push rbx
0x14015f82c: sub rsp, 0x378
0x14015f833: lea rbp, [rsp + 0x80]
0x14015f83b: mov qword ptr [rbp + 0x2f0], 0xfffffffffffffffe
0x14015f846: mov rax, qword ptr [rbp + 0x370]
0x14015f84d: mov rcx, qword ptr [rbp + 0x368]
0x14015f854: mov r10, qword ptr [rbp + 0x360]
0x14015f85b: mov r13, qword ptr [rdx]
0x14015f85e: mov r12, qword ptr [rdx + 8]
0x14015f862: mov r11d, dword ptr [rdx + 0x14]
0x14015f866: mov r15, qword ptr [r8]
0x14015f869: mov rdi, qword ptr [r8 + 0x10]
0x14015f86d: mov r8d, dword ptr [r8 + 0x1c]
0x14015f871: mov dword ptr [rbp + 0x2ec], r8d
0x14015f878: mov r8, qword ptr [r9]
0x14015f87b: mov qword ptr [rbp + 0x130], r8
0x14015f882: mov dword ptr [rbp + 0x26c], r11d
0x14015f889: mov r8d, r11d
0x14015f88c: sub r8d, dword ptr [rdx + 0x10]
0x14015f890: cmp r8d, 0xc233b000
0x14015f897: mov ebx, 0xc233b000
0x14015f89c: cmovb ebx, r8d
0x14015f8a0: mov rdx, qword ptr [r9 + 0x10]
0x14015f8a4: mov qword ptr [rbp + 0x138], rdx
0x14015f8ab: mov edx, dword ptr [r9 + 0x1c]
0x14015f8af: mov dword ptr [rbp + 0x184], edx
0x14015f8b5: mov rdx, qword ptr [r10]
0x14015f8b8: mov rcx, qword ptr [rcx]
0x14015f8bb: mov qword ptr [rbp + 0x2b8], rcx
0x14015f8c2: mov rax, qword ptr [rax]
0x14015f8c5: mov qword ptr [rbp + 0x150], rax
0x14015f8cc: mov rsi, qword ptr [r13 + 0xf8]
0x14015f8d3: mov rax, qword ptr [r13 + 0x100]
0x14015f8da: lea rax, [rsi + rax*4]
0x14015f8de: mov qword ptr [rbp + 0x200], rax
0x14015f8e5: movzx eax, byte ptr [r13 + 0x108]
0x14015f8ed: mov byte ptr [rbp + 0x2db], al
0x14015f8f3: lea rax, [r15 + 0x150]
0x14015f8fa: mov qword ptr [rbp + 0x188], rax
0x14015f901: lea rax, [rdx + 0x18]
0x14015f905: mov qword ptr [rbp + 0x140], rax
0x14015f90c: mov qword ptr [rbp + 0x218], rdx
0x14015f913: lea rax, [rdx + 0x33]
0x14015f917: mov qword ptr [rbp + 0x148], rax
0x14015f91e: mov qword ptr [rbp + 0x208], 0
0x14015f929: mov r11d, 8
0x14015f92f: mov qword ptr [rbp + 0x2a0], 0
0x14015f93a: mov dword ptr [rbp + 0x2dc], 0
0x14015f944: mov qword ptr [rbp + 0x2b0], 0
0x14015f94f: mov qword ptr [rbp + 0x2a8], 0
0x14015f95a: mov qword ptr [rbp + 0x2c0], r12
0x14015f961: mov qword ptr [rbp + 0x2c8], r15
0x14015f968: mov qword ptr [rbp + 0x2e0], rdi
0x14015f96f: mov dword ptr [rbp + 0x294], ebx
0x14015f975: jmp 0x14015f9a6
0x14015f977: movzx eax, byte ptr [r9 + 1]
0x14015f97c: mov ebx, dword ptr [rbp + 0x2ec]
0x14015f982: mov dword ptr [rdi], ebx
0x14015f984: xor al, 1
0x14015f986: mov byte ptr [r15 + 0x170], al
0x14015f98d: nop dword ptr [rax]
0x14015f990: mov dword ptr [rdi], ebx
0x14015f992: inc qword ptr [r15 + 0x160]
0x14015f999: mov ebx, dword ptr [rbp + 0x294]
0x14015f99f: mov r11, qword ptr [rbp + 0x210]
0x14015f9a6: cmp byte ptr [rbp + 0x2db], 0
0x14015f9ad: je 0x14015fb50
0x14015f9b3: mov r10d, dword ptr [rbp + 0x2dc]
0x14015f9ba: jmp 0x14015f9e6
0x14015f9bc: nop dword ptr [rax]
0x14015f9c0: mov rax, qword ptr [rbp + 0x208]
0x14015f9c7: mov r9d, r10d
0x14015f9ca: inc r10d
0x14015f9cd: mov ecx, dword ptr [rbp + 0x26c]
0x14015f9d3: mov qword ptr [rbp + 0x208], rax
0x14015f9da: sub ecx, dword ptr [rax + r9*4]
0x14015f9de: cmp ecx, ebx
0x14015f9e0: jb 0x14015fd40
0x14015f9e6: cmp r10d, dword ptr [rbp + 0x2a0]
0x14015f9ed: jne 0x14015f9c0
0x14015f9ef: cmp rsi, qword ptr [rbp + 0x200]
0x14015f9f6: je 0x14015fd00
0x14015f9fc: mov r14, r11
0x14015f9ff: mov ecx, dword ptr [rsi]
0x14015fa01: add rsi, 4
0x14015fa05: mov rax, qword ptr [r12 + 0x1a8]
0x14015fa0d: lea rdx, [rcx + rcx*8]
0x14015fa11: cmp qword ptr [rax + rdx*8 + 0x10], 0
0x14015fa17: je 0x14015fa3b
0x14015fa19: lea rcx, [rax + rdx*8]
0x14015fa1d: lea rdi, [rax + rdx*8]
0x14015fa21: add rdi, 0x10
0x14015fa25: mov rdx, qword ptr [r13 + 0x110]
0x14015fa2c: mov rax, qword ptr [rcx + 0x40]
0x14015fa30: cmp rdx, rax
0x14015fa33: jae 0x14015fac0
0x14015fa39: jmp 0x14015fa7f
0x14015fa3b: mov r11, r14
0x14015fa3e: nop 
0x14015fa40: cmp rsi, qword ptr [rbp + 0x200]
0x14015fa47: je 0x14015fd00
0x14015fa4d: mov ecx, dword ptr [rsi]
0x14015fa4f: add rsi, 4
0x14015fa53: mov rax, qword ptr [r12 + 0x1a8]
0x14015fa5b: lea rcx, [rcx + rcx*8]
0x14015fa5f: cmp qword ptr [rax + rcx*8 + 0x10], 0
0x14015fa65: je 0x14015fa40
0x14015fa67: lea rcx, [rax + rcx*8]
0x14015fa6b: lea rdi, [rcx + 0x10]
0x14015fa6f: mov rdx, qword ptr [r13 + 0x110]
0x14015fa76: mov rax, qword ptr [rcx + 0x40]
0x14015fa7a: cmp rdx, rax
0x14015fa7d: jae 0x14015fac0
0x14015fa7f: mov r8, qword ptr [rcx + 0x38]
0x14015fa83: mov rdx, qword ptr [r8 + rdx*8]
0x14015fa87: test rdx, rdx
0x14015fa8a: je 0x14015fac0
0x14015fa8c: mov r8, qword ptr [rcx + 0x18]
0x14015fa90: not rdx
0x14015fa93: lea rdx, [rdx + rdx*2]
0x14015fa97: shl rdx, 4
0x14015fa9b: mov rdx, qword ptr [r8 + rdx + 0x10]
0x14015faa0: mov qword ptr [rbp + 0x2a8], rdx
0x14015faa7: mov rdx, qword ptr [r13 + 0x118]
0x14015faae: cmp rdx, rax
0x14015fab1: jb 0x14015fad7
0x14015fab3: jmp 0x14015fb10
0x14015fab5: nop word ptr cs:[rax + rax]
0x14015fac0: mov qword ptr [rbp + 0x2a8], 0
0x14015facb: mov rdx, qword ptr [r13 + 0x118]
0x14015fad2: cmp rdx, rax
0x14015fad5: jae 0x14015fb10
0x14015fad7: mov rax, qword ptr [rcx + 0x38]
0x14015fadb: mov rax, qword ptr [rax + rdx*8]
0x14015fadf: test rax, rax
0x14015fae2: je 0x14015fb10
0x14015fae4: mov rdx, qword ptr [rcx + 0x18]
0x14015fae8: not rax
0x14015faeb: lea rax, [rax + rax*2]
0x14015faef: shl rax, 4
0x14015faf3: mov rax, qword ptr [rdx + rax + 0x10]
0x14015faf8: mov qword ptr [rbp + 0x2b0], rax
0x14015faff: jmp 0x14015fb1b
0x14015fb01: nop word ptr cs:[rax + rax]
0x14015fb10: mov qword ptr [rbp + 0x2b0], 0
0x14015fb1b: mov rdx, qword ptr [r13 + 0x120]
0x14015fb22: call 0x14502d4a0
0x14015fb27: mov rcx, qword ptr [rdi]
0x14015fb2a: mov qword ptr [rbp + 0x2a0], rcx
0x14015fb31: xor r10d, r10d
0x14015fb34: mov rdi, qword ptr [rbp + 0x2e0]
0x14015fb3b: mov r11, r14
0x14015fb3e: jmp 0x14015f9c7
0x14015fb43: nop word ptr cs:[rax + rax]
0x14015fb50: mov r10d, dword ptr [rbp + 0x2dc]
0x14015fb57: jmp 0x14015fb98
0x14015fb59: nop dword ptr [rax]
0x14015fb60: mov r8d, r10d
0x14015fb63: mov rax, qword ptr [rbp + 0x208]
0x14015fb6a: mov ecx, r8d
0x14015fb6d: shl rcx, 4
0x14015fb71: inc r8d
0x14015fb74: mov r10d, r8d
0x14015fb77: mov r9d, dword ptr [r11 + rcx + 8]
0x14015fb7c: not r9d
0x14015fb7f: mov ecx, dword ptr [rbp + 0x26c]
0x14015fb85: mov qword ptr [rbp + 0x208], rax
0x14015fb8c: sub ecx, dword ptr [rax + r9*4]
0x14015fb90: cmp ecx, ebx
0x14015fb92: jb 0x14015fd40
0x14015fb98: cmp r10d, dword ptr [rbp + 0x2a0]
0x14015fb9f: jne 0x14015fb60
0x14015fba1: cmp rsi, qword ptr [rbp + 0x200]
0x14015fba8: je 0x14015fd00
0x14015fbae: mov ecx, dword ptr [rsi]
0x14015fbb0: add rsi, 4
0x14015fbb4: mov rax, qword ptr [r12 + 0x108]
0x14015fbbc: lea rcx, [rcx + rcx*4]
0x14015fbc0: shl rcx, 5
0x14015fbc4: cmp qword ptr [rax + rcx + 0x58], 0
0x14015fbca: je 0x14015fbe0
0x14015fbcc: lea rdi, [rax + rcx]
0x14015fbd0: lea rbx, [rax + rcx]
0x14015fbd4: add rbx, 0x58
0x14015fbd8: jmp 0x14015fc12
0x14015fbda: nop word ptr [rax + rax]
0x14015fbe0: cmp rsi, qword ptr [rbp + 0x200]
0x14015fbe7: je 0x14015fd20
0x14015fbed: mov eax, dword ptr [rsi]
0x14015fbef: add rsi, 4
0x14015fbf3: mov rdi, qword ptr [r12 + 0x108]
0x14015fbfb: lea rax, [rax + rax*4]
0x14015fbff: shl rax, 5
0x14015fc03: cmp qword ptr [rdi + rax + 0x58], 0
0x14015fc09: je 0x14015fbe0
0x14015fc0b: add rdi, rax
0x14015fc0e: lea rbx, [rdi + 0x58]
0x14015fc12: mov eax, dword ptr [rdi + 0x94]
0x14015fc18: mov r8, qword ptr [r12 + 0x1a8]
0x14015fc20: lea rax, [rax + rax*8]
0x14015fc24: lea rcx, [r8 + rax*8]
0x14015fc28: mov rdx, qword ptr [r13 + 0x110]
0x14015fc2f: mov rax, qword ptr [r8 + rax*8 + 0x40]
0x14015fc34: cmp rdx, rax
0x14015fc37: jae 0x14015fc70
0x14015fc39: mov r8, qword ptr [rcx + 0x38]
0x14015fc3d: mov rdx, qword ptr [r8 + rdx*8]
0x14015fc41: test rdx, rdx
0x14015fc44: je 0x14015fc70
0x14015fc46: mov r8, qword ptr [rcx + 0x18]
0x14015fc4a: not rdx
0x14015fc4d: lea rdx, [rdx + rdx*2]
0x14015fc51: shl rdx, 4
0x14015fc55: mov rdx, qword ptr [r8 + rdx + 0x10]
0x14015fc5a: mov qword ptr [rbp + 0x2a8], rdx
0x14015fc61: mov rdx, qword ptr [r13 + 0x118]
0x14015fc68: cmp rdx, rax
0x14015fc6b: jb 0x14015fc87
0x14015fc6d: jmp 0x14015fcc0
0x14015fc6f: nop 
0x14015fc70: mov qword ptr [rbp + 0x2a8], 0
0x14015fc7b: mov rdx, qword ptr [r13 + 0x118]
0x14015fc82: cmp rdx, rax
0x14015fc85: jae 0x14015fcc0
0x14015fc87: mov rax, qword ptr [rcx + 0x38]
0x14015fc8b: mov rax, qword ptr [rax + rdx*8]
0x14015fc8f: test rax, rax
0x14015fc92: je 0x14015fcc0
0x14015fc94: mov rdx, qword ptr [rcx + 0x18]
0x14015fc98: not rax
0x14015fc9b: lea rax, [rax + rax*2]
0x14015fc9f: shl rax, 4
0x14015fca3: mov rax, qword ptr [rdx + rax + 0x10]
0x14015fca8: mov qword ptr [rbp + 0x2b0], rax
0x14015fcaf: jmp 0x14015fccb
0x14015fcb1: nop word ptr cs:[rax + rax]
0x14015fcc0: mov qword ptr [rbp + 0x2b0], 0
0x14015fccb: mov rdx, qword ptr [r13 + 0x120]
0x14015fcd2: call 0x14502d4a0
0x14015fcd7: mov r11, qword ptr [rdi + 0x50]
0x14015fcdb: mov rcx, qword ptr [rbx]
0x14015fcde: mov qword ptr [rbp + 0x2a0], rcx
0x14015fce5: xor r8d, r8d
0x14015fce8: mov rdi, qword ptr [rbp + 0x2e0]
0x14015fcef: mov ebx, dword ptr [rbp + 0x294]
0x14015fcf5: jmp 0x14015fb6a
0x14015fcfa: nop word ptr [rax + rax]
0x14015fd00: mov rax, qword ptr [rbp + 0x2a0]
0x14015fd07: mov dword ptr [rbp + 0x2dc], eax
0x14015fd0d: xor ecx, ecx
0x14015fd0f: test rcx, rcx
0x14015fd12: jne 0x14015fd65
0x14015fd14: jmp 0x140160d9f
0x14015fd19: nop dword ptr [rax]
0x14015fd20: mov rax, qword ptr [rbp + 0x2a0]
0x14015fd27: mov dword ptr [rbp + 0x2dc], eax
0x14015fd2d: xor ecx, ecx
0x14015fd2f: mov rdi, qword ptr [rbp + 0x2e0]
0x14015fd36: test rcx, rcx
0x14015fd39: jne 0x14015fd65
0x14015fd3b: jmp 0x140160d9f
0x14015fd40: mov dword ptr [rbp + 0x2dc], r10d
0x14015fd47: mov rcx, qword ptr [rbp + 0x2a8]
0x14015fd4e: add rcx, r9
0x14015fd51: shl r9, 4
0x14015fd55: add r9, qword ptr [rbp + 0x2b0]
0x14015fd5c: test rcx, rcx
0x14015fd5f: je 0x140160d9f
0x14015fd65: cmp byte ptr [rcx], 0
0x14015fd68: jne 0x14015f9a6
0x14015fd6e: mov qword ptr [rbp + 0x210], r11
0x14015fd75: movzx ecx, byte ptr [r9]
0x14015fd79: lea rdx, [rip + 0x6067d0c]
0x14015fd80: movsxd rcx, dword ptr [rdx + rcx*4]
0x14015fd84: add rcx, rdx
0x14015fd87: jmp rcx
0x14015fd89: movzx eax, byte ptr [r9 + 1]
0x14015fd8e: mov ecx, dword ptr [rbp + 0x2ec]
0x14015fd94: mov dword ptr [rdi], ecx
0x14015fd96: mov byte ptr [r15 + 0x171], al
0x14015fd9d: test eax, eax
0x14015fd9f: je 0x140160412
0x14015fda5: cmp eax, 1
0x14015fda8: je 0x14015fdac
0x14015fdaa: mov al, 4
0x14015fdac: mov ebx, dword ptr [rbp + 0x2ec]
0x14015fdb2: mov dword ptr [rdi], ebx
0x14015fdb4: mov byte ptr [r15 + 0x172], al
0x14015fdbb: jmp 0x14015f990
0x14015fdc0: movzx eax, byte ptr [r15 + 0x16f]
0x14015fdc8: mov ebx, dword ptr [rbp + 0x2ec]
0x14015fdce: mov dword ptr [rdi], ebx
0x14015fdd0: xor al, 1
0x14015fdd2: mov byte ptr [r15 + 0x16f], al
0x14015fdd9: jmp 0x14015f990
0x14015fdde: mov ebx, dword ptr [rbp + 0x2ec]
0x14015fde4: mov dword ptr [rdi], ebx
0x14015fde6: mov rcx, r15
0x14015fde9: mov rdx, qword ptr [rbp + 0x2b8]
0x14015fdf0: mov r8, qword ptr [rbp + 0x218]
0x14015fdf7: mov r9b, 2
0x14015fdfa: call 0x14014a670
0x14015fdff: jmp 0x14015f990
0x14015fe04: mov qword ptr [rbp + 0x298], r13
0x14015fe0b: mov rbx, qword ptr [r15 + 0x78]
0x14015fe0f: imul rax, qword ptr [r15 + 0x80], 0x128
0x14015fe1a: mov qword ptr [rbp + 0x1d0], 0
0x14015fe25: mov qword ptr [rbp + 0x1d8], 8
0x14015fe30: mov qword ptr [rbp + 0x1e0], 0
0x14015fe3b: add rax, rbx
0x14015fe3e: mov qword ptr [rbp + 0x288], rax
0x14015fe45: xor r14d, r14d
0x14015fe48: jmp 0x14015fe76
0x14015fe4a: nop word ptr [rax + rax]
0x14015fe50: mov rax, qword ptr [rbp + 0x1d8]
0x14015fe57: lea rcx, [r14 + r14*2]
0x14015fe5b: mov rdx, qword ptr [rbp - 0x38]
0x14015fe5f: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x14015fe64: movups xmm0, xmmword ptr [rbp - 0x48]
0x14015fe68: movups xmmword ptr [rax + rcx*8], xmm0
0x14015fe6c: inc r14
0x14015fe6f: mov qword ptr [rbp + 0x1e0], r14
0x14015fe76: mov rdi, qword ptr [rbp + 0x1d8]
0x14015fe7d: mov qword ptr [rbp + 0x280], r14
0x14015fe84: lea rax, [r14*8]
0x14015fe8c: lea r13, [rax + rax*2]
0x14015fe90: mov r14, rbx
0x14015fe93: cmp r14, qword ptr [rbp + 0x288]
0x14015fe9a: je 0x1401602ef
0x14015fea0: lea rbx, [r14 + 0x128]
0x14015fea7: cmp qword ptr [rbp + 0x280], 0
0x14015feaf: je 0x14015ff6f
0x14015feb5: mov qword ptr [rbp + 0x2d0], rbx
0x14015febc: mov r12, qword ptr [r14 + 0x98]
0x14015fec3: mov rbx, qword ptr [r14 + 0xa0]
0x14015feca: xor r15d, r15d
0x14015fecd: jmp 0x14015fed9
0x14015fecf: nop 
0x14015fed0: add r15, 0x18
0x14015fed4: cmp r13, r15
0x14015fed7: je 0x14015ff20
0x14015fed9: cmp qword ptr [rdi + r15 + 0x10], rbx
0x14015fede: jne 0x14015fed0
0x14015fee0: mov rcx, qword ptr [rdi + r15 + 8]
0x14015fee5: mov rdx, r12
0x14015fee8: mov r8, rbx
0x14015feeb: call 0x146005051
0x14015fef0: test eax, eax
0x14015fef2: jne 0x14015fed0
0x14015fef4: mov r14, qword ptr [rbp + 0x2d0]
0x14015fefb: mov r12, qword ptr [rbp + 0x2c0]
0x14015ff02: mov r15, qword ptr [rbp + 0x2c8]
0x14015ff09: cmp r14, qword ptr [rbp + 0x288]
0x14015ff10: jne 0x14015fea0
0x14015ff12: jmp 0x1401602ef
0x14015ff17: nop word ptr [rax + rax]
0x14015ff20: add r14, 0x90
0x14015ff27: mov r12, qword ptr [rbp + 0x2c0]
0x14015ff2e: mov r15, qword ptr [rbp + 0x2c8]
0x14015ff35: mov rbx, qword ptr [rbp + 0x2d0]
0x14015ff3c: lea rcx, [rbp - 0x48]
0x14015ff40: mov rdx, r14
0x14015ff43: call 0x145fd8260
0x14015ff48: nop 
0x14015ff49: mov r14, qword ptr [rbp + 0x1e0]
0x14015ff50: cmp r14, qword ptr [rbp + 0x1d0]
0x14015ff57: jne 0x14015fe50
0x14015ff5d: lea rcx, [rbp + 0x1d0]
0x14015ff64: call 0x14603dc60
0x14015ff69: nop 
0x14015ff6a: jmp 0x14015fe50
0x14015ff6f: add r14, 0x90
0x14015ff76: jmp 0x14015ff3c
0x14015ff78: movzx eax, byte ptr [r9 + 1]
0x14015ff7d: mov ebx, dword ptr [rbp + 0x2ec]
0x14015ff83: mov dword ptr [rdi], ebx
0x14015ff85: mov byte ptr [r15 + 0x174], al
0x14015ff8c: jmp 0x14015f990
0x14015ff91: mov rax, qword ptr [r9 + 8]
0x14015ff95: cmp rax, qword ptr [r15 + 0x80]
0x14015ff9c: mov r11, qword ptr [rbp + 0x210]
0x14015ffa3: jae 0x14015f9a6
0x14015ffa9: mov rdi, qword ptr [r15 + 0x78]
0x14015ffad: imul rbx, rax, 0x128
0x14015ffb4: lea r14, [rdi + rbx]
0x14015ffb8: lea rcx, [rbp + 0x118]
0x14015ffbf: mov rdx, r14
0x14015ffc2: call 0x145fd8260
0x14015ffc7: lea rdx, [rdi + rbx]
0x14015ffcb: add rdx, 0x18
0x14015ffcf: lea rcx, [rbp + 0x100]
0x14015ffd6: call 0x145fd8260
0x14015ffdb: nop 
0x14015ffdc: lea rdx, [r14 + 0x30]
0x14015ffe0: lea rcx, [rbp + 0xe8]
0x14015ffe7: call 0x145fd8260
0x14015ffec: nop 
0x14015ffed: mov rdi, qword ptr [r14 + 0x58]
0x14015fff1: test rdi, rdi
0x14015fff4: js 0x140160db3
0x14015fffa: mov qword ptr [rbp + 0x2d0], rdi
0x140160001: je 0x140160576
0x140160007: mov rbx, qword ptr [r14 + 0x50]
0x14016000b: call 0x140002200
0x140160010: mov r12d, 1
0x140160016: mov edx, 1
0x14016001b: mov rcx, rdi
0x14016001e: call 0x1400021c0
0x140160023: test rax, rax
0x140160026: je 0x140160db6
0x14016002c: mov qword ptr [rbp + 0x270], rax
0x140160033: mov rcx, rax
0x140160036: mov rdx, rbx
0x140160039: mov r8, rdi
0x14016003c: call 0x14600504b
0x140160041: mov r12, qword ptr [rbp + 0x2c0]
0x140160048: jmp 0x140160582
0x14016004d: mov rax, qword ptr [rbp + 0x138]
0x140160054: mov ecx, dword ptr [rbp + 0x184]
0x14016005a: mov dword ptr [rax], ecx
0x14016005c: mov rax, qword ptr [rbp + 0x130]
0x140160063: mov byte ptr [rax], 1
0x140160066: jmp 0x14016056b
0x14016006b: mov ebx, dword ptr [rbp + 0x2ec]
0x140160071: mov dword ptr [rdi], ebx
0x140160073: mov rcx, r15
0x140160076: mov rdx, qword ptr [rbp + 0x2b8]
0x14016007d: mov r8, qword ptr [rbp + 0x218]
0x140160084: mov r9b, 1
0x140160087: call 0x14014a670
0x14016008c: jmp 0x14015f990
0x140160091: movzx eax, byte ptr [r9 + 1]
0x140160096: mov ebx, dword ptr [rbp + 0x2ec]
0x14016009c: mov dword ptr [rdi], ebx
0x14016009e: mov byte ptr [r15 + 0x172], al
0x1401600a5: jmp 0x14015f990
0x1401600aa: mov rax, qword ptr [rbp + 0x150]
0x1401600b1: movss xmm0, dword ptr [rax + 0x5c]
0x1401600b6: mov ebx, dword ptr [rbp + 0x2ec]
0x1401600bc: jmp 0x14016042e
0x1401600c1: mov dword ptr [rbp - 0x48], 0x19
0x1401600c8: mov rcx, qword ptr [rbp + 0x2b8]
0x1401600cf: lea rdx, [rbp - 0x48]
0x1401600d3: call 0x1401e7be0
0x1401600d8: mov r14d, dword ptr [rbp + 0x2ec]
0x1401600df: mov dword ptr [rdi], r14d
0x1401600e2: mov qword ptr [r15 + 0x50], 0
0x1401600ea: call 0x140002200
0x1401600ef: mov ecx, 3
0x1401600f4: mov edx, 1
0x1401600f9: call 0x1400021c0
0x1401600fe: test rax, rax
0x140160101: je 0x140160dc4
0x140160107: mov rbx, rax
0x14016010a: mov byte ptr [rax + 2], 0x66
0x14016010e: mov word ptr [rax], 0x666f
0x140160113: mov dword ptr [rdi], r14d
0x140160116: mov rdx, qword ptr [r15 + 0x10]
0x14016011a: test rdx, rdx
0x14016011d: je 0x14016012e
0x14016011f: mov rcx, qword ptr [r15 + 0x18]
0x140160123: mov r8d, 1
0x140160129: call 0x1400021d0
0x14016012e: mov qword ptr [r15 + 0x10], 3
0x140160136: mov qword ptr [r15 + 0x18], rbx
0x14016013a: mov qword ptr [r15 + 0x20], 3
0x140160142: mov eax, dword ptr [rbp + 0x2ec]
0x140160148: mov dword ptr [rdi], eax
0x14016014a: mov rdi, qword ptr [r15 + 0x90]
0x140160151: mov rbx, qword ptr [r15 + 0x98]
0x140160158: mov qword ptr [r15 + 0x98], 0
0x140160163: test rbx, rbx
0x140160166: je 0x1401602d3
0x14016016c: add rdi, 0x50
0x140160170: jmp 0x14016018d
0x140160172: nop word ptr cs:[rax + rax]
0x140160180: add rdi, 0x70
0x140160184: dec rbx
0x140160187: je 0x1401602d3
0x14016018d: mov rdx, qword ptr [rdi - 0x50]
0x140160191: test rdx, rdx
0x140160194: je 0x1401601a5
0x140160196: mov rcx, qword ptr [rdi - 0x48]
0x14016019a: mov r8d, 1
0x1401601a0: call 0x1400021d0
0x1401601a5: mov rdx, qword ptr [rdi - 0x38]
0x1401601a9: test rdx, rdx
0x1401601ac: je 0x1401601bd
0x1401601ae: mov rcx, qword ptr [rdi - 0x30]
0x1401601b2: mov r8d, 1
0x1401601b8: call 0x1400021d0
0x1401601bd: mov rdx, qword ptr [rdi - 0x20]
0x1401601c1: test rdx, rdx
0x1401601c4: je 0x1401601d5
0x1401601c6: mov rcx, qword ptr [rdi - 0x18]
0x1401601ca: mov r8d, 1
0x1401601d0: call 0x1400021d0
0x1401601d5: mov rdx, qword ptr [rdi - 8]
0x1401601d9: test rdx, rdx
0x1401601dc: je 0x140160180
0x1401601de: mov rcx, qword ptr [rdi]
0x1401601e1: mov r8d, 1
0x1401601e7: call 0x1400021d0
0x1401601ec: jmp 0x140160180
0x1401601ee: mov rdx, qword ptr [r15 + 0x78]
0x1401601f2: imul r8, qword ptr [r15 + 0x80], 0x128
0x1401601fd: add r8, rdx
0x140160200: lea rcx, [rbp - 0x48]
0x140160204: call 0x140085820
0x140160209: mov rcx, qword ptr [rbp - 0x40]
0x14016020d: mov r14, qword ptr [rbp - 0x38]
0x140160211: cmp r14, 2
0x140160215: jae 0x140160c20
0x14016021b: mov rdx, qword ptr [rbp - 0x48]
0x14016021f: cmp byte ptr [r15], 0
0x140160223: je 0x1401603be
0x140160229: test r14, r14
0x14016022c: je 0x140160483
0x140160232: mov r9, qword ptr [r15 + 8]
0x140160236: lea r8, [r14*8]
0x14016023e: mov eax, 1
0x140160243: nop word ptr cs:[rax + rax]
0x140160250: cmp qword ptr [rcx + rax*8 - 8], r9
0x140160255: je 0x140160473
0x14016025b: inc rax
0x14016025e: add r8, -8
0x140160262: jne 0x140160250
0x140160264: jmp 0x140160483
0x140160269: mov ebx, dword ptr [rbp + 0x2ec]
0x14016026f: mov dword ptr [rdi], ebx
0x140160271: mov byte ptr [r15 + 0x16c], 0
0x140160279: jmp 0x14015f990
0x14016027e: movzx eax, byte ptr [r15 + 0x16e]
0x140160286: mov ebx, dword ptr [rbp + 0x2ec]
0x14016028c: mov dword ptr [rdi], ebx
0x14016028e: xor al, 1
0x140160290: mov byte ptr [r15 + 0x16e], al
0x140160297: jmp 0x14015f990
0x14016029c: mov rax, qword ptr [r9 + 8]
0x1401602a0: cmp rax, qword ptr [r15 + 0x98]
0x1401602a7: mov ebx, dword ptr [rbp + 0x2ec]
0x1401602ad: jae 0x14015f990
0x1401602b3: mov rcx, qword ptr [r15 + 0x90]
0x1401602ba: imul rax, rax, 0x70
0x1401602be: mov rax, qword ptr [rcx + rax + 0x60]
0x1401602c3: mov qword ptr [rbp - 0x40], rax
0x1401602c7: mov dword ptr [rbp - 0x48], 0x1a
0x1401602ce: jmp 0x140160440
0x1401602d3: mov rdi, qword ptr [rbp + 0x2e0]
0x1401602da: mov ebx, dword ptr [rbp + 0x2ec]
0x1401602e0: mov dword ptr [rdi], ebx
0x1401602e2: mov qword ptr [r15 + 0x68], 0
0x1401602ea: jmp 0x14015f990
0x1401602ef: mov rax, qword ptr [rbp + 0x1e0]
0x1401602f6: mov qword ptr [rbp + 0x260], rax
0x1401602fd: movups xmm0, xmmword ptr [rbp + 0x1d0]
0x140160304: movaps xmmword ptr [rbp + 0x250], xmm0
0x14016030b: cmp qword ptr [r15 + 0x148], -1
0x140160313: je 0x1401603cf
0x140160319: mov rbx, qword ptr [rbp + 0x260]
0x140160320: mov r14, 0xffffffffffffffff
0x140160327: test rbx, rbx
0x14016032a: mov r13, qword ptr [rbp + 0x298]
0x140160331: je 0x1401604b8
0x140160337: mov r14, qword ptr [rbp + 0x258]
0x14016033e: lea rax, [rbx*8]
0x140160346: lea rdi, [rax + rax*2]
0x14016034a: mov r12, qword ptr [r15 + 0x158]
0x140160351: add r14, 0x18
0x140160355: mov r15d, 1
0x14016035b: jmp 0x140160371
0x14016035d: nop dword ptr [rax]
0x140160360: add r14, 0x18
0x140160364: inc r15
0x140160367: add rdi, -0x18
0x14016036b: je 0x140160455
0x140160371: cmp qword ptr [r14 - 8], r12
0x140160375: jne 0x140160360
0x140160377: mov rcx, qword ptr [r14 - 0x10]
0x14016037b: mov rax, qword ptr [rbp + 0x188]
0x140160382: mov rdx, qword ptr [rax]
0x140160385: mov r8, r12
0x140160388: call 0x146005051
0x14016038d: test eax, eax
0x14016038f: jne 0x140160360
0x140160391: cmp r15, rbx
0x140160394: mov r12, qword ptr [rbp + 0x2c0]
0x14016039b: mov rdi, qword ptr [rbp + 0x2e0]
0x1401603a2: jae 0x14016090d
0x1401603a8: lea rcx, [rbp - 0x48]
0x1401603ac: mov rdx, r14
0x1401603af: call 0x145fd8260
0x1401603b4: nop 
0x1401603b5: mov r15, qword ptr [rbp + 0x2c8]
0x1401603bc: jmp 0x1401603fe
0x1401603be: test r14, r14
0x1401603c1: je 0x140160483
0x1401603c7: mov r8, qword ptr [rcx]
0x1401603ca: jmp 0x14016047c
0x1401603cf: mov rbx, qword ptr [rbp + 0x260]
0x1401603d6: test rbx, rbx
0x1401603d9: mov r13, qword ptr [rbp + 0x298]
0x1401603e0: je 0x1401604b1
0x1401603e6: mov rdx, qword ptr [rbp + 0x258]
0x1401603ed: lea rcx, [rbp - 0x48]
0x1401603f1: call 0x145fd8260
0x1401603f6: nop 
0x1401603f7: mov rdi, qword ptr [rbp + 0x2e0]
0x1401603fe: mov r14, qword ptr [rbp - 0x48]
0x140160402: lea rax, [rbp - 0x40]
0x140160406: movups xmm0, xmmword ptr [rax]
0x140160409: movaps xmmword ptr [rbp - 0x60], xmm0
0x14016040d: jmp 0x1401604c1
0x140160412: mov ebx, dword ptr [rbp + 0x2ec]
0x140160418: mov dword ptr [rdi], ebx
0x14016041a: mov byte ptr [r15 + 0x172], 0
0x140160422: mov rax, qword ptr [rbp + 0x150]
0x140160429: movss xmm0, dword ptr [rax + 0x5c]
0x14016042e: mov dword ptr [rdi], ebx
0x140160430: movss dword ptr [r15 + 0x168], xmm0
0x140160439: mov dword ptr [rbp - 0x48], 0x16
0x140160440: mov rcx, qword ptr [rbp + 0x2b8]
0x140160447: lea rdx, [rbp - 0x48]
0x14016044b: call 0x1401e7be0
0x140160450: jmp 0x14015f990
0x140160455: mov r12, qword ptr [rbp + 0x2c0]
0x14016045c: mov r15, qword ptr [rbp + 0x2c8]
0x140160463: mov rdi, qword ptr [rbp + 0x2e0]
0x14016046a: mov r14, 0xffffffffffffffff
0x140160471: jmp 0x1401604c1
0x140160473: cmp rax, r14
0x140160476: jae 0x140160483
0x140160478: mov r8, qword ptr [rcx + rax*8]
0x14016047c: mov eax, 1
0x140160481: jmp 0x140160485
0x140160483: xor eax, eax
0x140160485: mov ebx, dword ptr [rbp + 0x2ec]
0x14016048b: mov dword ptr [rdi], ebx
0x14016048d: mov qword ptr [r15], rax
0x140160490: mov qword ptr [r15 + 8], r8
0x140160494: test rdx, rdx
0x140160497: je 0x14015f990
0x14016049d: shl rdx, 3
0x1401604a1: mov r8d, 8
0x1401604a7: call 0x1400021d0
0x1401604ac: jmp 0x14015f990
0x1401604b1: mov r14, 0xffffffffffffffff
0x1401604b8: xor ebx, ebx
0x1401604ba: mov rdi, qword ptr [rbp + 0x2e0]
0x1401604c1: mov eax, dword ptr [rbp + 0x2ec]
0x1401604c7: mov dword ptr [rdi], eax
0x1401604c9: mov rdx, qword ptr [r15 + 0x148]
0x1401604d0: cmp rdx, -1
0x1401604d4: je 0x1401604f0
0x1401604d6: test rdx, rdx
0x1401604d9: je 0x1401604f0
0x1401604db: mov rax, qword ptr [rbp + 0x188]
0x1401604e2: mov rcx, qword ptr [rax]
0x1401604e5: mov r8d, 1
0x1401604eb: call 0x1400021d0
0x1401604f0: mov qword ptr [r15 + 0x148], r14
0x1401604f7: movaps xmm0, xmmword ptr [rbp - 0x60]
0x1401604fb: mov rax, qword ptr [rbp + 0x188]
0x140160502: movups xmmword ptr [rax], xmm0
0x140160505: mov r14, qword ptr [rbp + 0x258]
0x14016050c: test rbx, rbx
0x14016050f: je 0x140160542
0x140160511: lea rdi, [r14 + 8]
0x140160515: jmp 0x140160529
0x140160517: nop word ptr [rax + rax]
0x140160520: add rdi, 0x18
0x140160524: dec rbx
0x140160527: je 0x140160542
0x140160529: mov rdx, qword ptr [rdi - 8]
0x14016052d: test rdx, rdx
0x140160530: je 0x140160520
0x140160532: mov rcx, qword ptr [rdi]
0x140160535: mov r8d, 1
0x14016053b: call 0x1400021d0
0x140160540: jmp 0x140160520
0x140160542: mov rax, qword ptr [rbp + 0x250]
0x140160549: test rax, rax
0x14016054c: je 0x140160564
0x14016054e: shl rax, 3
0x140160552: lea rdx, [rax + rax*2]
0x140160556: mov r8d, 8
0x14016055c: mov rcx, r14
0x14016055f: call 0x1400021d0
0x140160564: mov rdi, qword ptr [rbp + 0x2e0]
0x14016056b: mov ebx, dword ptr [rbp + 0x2ec]
0x140160571: jmp 0x14015f990
0x140160576: mov eax, 1
0x14016057b: mov qword ptr [rbp + 0x270], rax
0x140160582: lea rdx, [r14 + 0x60]
0x140160586: lea rcx, [rbp + 0xd0]
0x14016058d: call 0x145fd8260
0x140160592: nop 
0x140160593: lea rdx, [r14 + 0x78]
0x140160597: lea rcx, [rbp + 0xb8]
0x14016059e: call 0x145fd8260
0x1401605a3: nop 
0x1401605a4: lea rdx, [r14 + 0x90]
0x1401605ab: lea rcx, [rbp + 0xa0]
0x1401605b2: call 0x145fd8260
0x1401605b7: nop 
0x1401605b8: mov bl, byte ptr [r14 + 0x120]
0x1401605bf: lea rdx, [r14 + 0xa8]
0x1401605c6: lea rcx, [rbp + 0x168]
0x1401605cd: call 0x145fd8260
0x1401605d2: nop 
0x1401605d3: lea rdx, [r14 + 0xc0]
0x1401605da: lea rcx, [rbp + 0x250]
0x1401605e1: call 0x145fd8260
0x1401605e6: nop 
0x1401605e7: mov dil, byte ptr [r14 + 0x121]
0x1401605ee: lea rdx, [r14 + 0xd8]
0x1401605f5: lea rcx, [rbp + 0x1d0]
0x1401605fc: call 0x145fd8260
0x140160601: nop 
0x140160602: add r14, 0xf0
0x140160609: lea rcx, [rbp - 0x48]
0x14016060d: mov rdx, r14
0x140160610: call 0x145fd8260
0x140160615: nop 
0x140160616: mov r9, qword ptr [rbp + 0x118]
0x14016061d: mov r10, qword ptr [rbp + 0x120]
0x140160624: mov rax, qword ptr [rbp + 0x100]
0x14016062b: mov qword ptr [rbp + 0x248], rax
0x140160632: mov rax, qword ptr [rbp + 0x108]
0x140160639: mov qword ptr [rbp + 0x1c8], rax
0x140160640: mov rax, qword ptr [rbp + 0xe8]
0x140160647: mov qword ptr [rbp + 0x240], rax
0x14016064e: mov rax, qword ptr [rbp + 0xf0]
0x140160655: mov qword ptr [rbp + 0x1c0], rax
0x14016065c: mov rax, qword ptr [rbp + 0xd0]
0x140160663: mov qword ptr [rbp + 0x238], rax
0x14016066a: mov rax, qword ptr [rbp + 0xd8]
0x140160671: mov qword ptr [rbp + 0x1b8], rax
0x140160678: mov rax, qword ptr [rbp + 0xb8]
0x14016067f: mov qword ptr [rbp + 0x230], rax
0x140160686: mov rax, qword ptr [rbp + 0xc0]
0x14016068d: mov qword ptr [rbp + 0x1b0], rax
0x140160694: mov rax, qword ptr [rbp + 0xa0]
0x14016069b: mov qword ptr [rbp + 0x228], rax
0x1401606a2: mov rax, qword ptr [rbp + 0xa8]
0x1401606a9: mov qword ptr [rbp + 0x1a8], rax
0x1401606b0: mov rax, qword ptr [rbp + 0x168]
0x1401606b7: mov qword ptr [rbp + 0x220], rax
0x1401606be: mov rax, qword ptr [rbp + 0x170]
0x1401606c5: mov qword ptr [rbp + 0x1a0], rax
0x1401606cc: mov rax, qword ptr [rbp + 0x250]
0x1401606d3: mov qword ptr [rbp + 0x298], rax
0x1401606da: mov rax, qword ptr [rbp + 0x258]
0x1401606e1: mov qword ptr [rbp + 0x198], rax
0x1401606e8: mov rcx, qword ptr [rbp + 0x1d0]
0x1401606ef: mov rdx, qword ptr [rbp + 0x1d8]
0x1401606f6: mov rax, qword ptr [rbp - 0x48]
0x1401606fa: mov qword ptr [rbp + 0x280], rax
0x140160701: mov r14, qword ptr [rbp - 0x40]
0x140160705: test bl, bl
0x140160707: mov qword ptr [rbp + 0x288], rcx
0x14016070e: mov qword ptr [rbp + 0x190], rdx
0x140160715: je 0x1401607ab
0x14016071b: mov qword ptr [rbp + 0x158], r14
0x140160722: mov r14, qword ptr [rbp + 0x128]
0x140160729: test dil, dil
0x14016072c: je 0x140160920
0x140160732: mov byte ptr [r15 + 0x171], 2
0x14016073a: mov rdi, qword ptr [rbp + 0x2e0]
0x140160741: mov eax, dword ptr [rbp + 0x2ec]
0x140160747: mov dword ptr [rdi], eax
0x140160749: mov rdx, qword ptr [r15 + 0x118]
0x140160750: test rdx, rdx
0x140160753: je 0x140160781
0x140160755: mov rcx, qword ptr [r15 + 0x120]
0x14016075c: mov r8d, 1
0x140160762: mov rbx, r9
0x140160765: mov qword ptr [rbp + 0x278], r14
0x14016076c: mov r14, r10
0x14016076f: call 0x1400021d0
0x140160774: mov r10, r14
0x140160777: mov r14, qword ptr [rbp + 0x278]
0x14016077e: mov r9, rbx
0x140160781: mov qword ptr [r15 + 0x118], r9
0x140160788: mov qword ptr [r15 + 0x120], r10
0x14016078f: mov qword ptr [r15 + 0x128], r14
0x140160796: mov eax, dword ptr [rbp + 0x2ec]
0x14016079c: mov dword ptr [rdi], eax
0x14016079e: mov byte ptr [r15 + 0x172], 5
0x1401607a6: jmp 0x140160ae5
0x1401607ab: test r9, r9
0x1401607ae: mov ebx, dword ptr [rbp + 0x294]
0x1401607b4: je 0x1401607c7
0x1401607b6: mov r8d, 1
0x1401607bc: mov rcx, r10
0x1401607bf: mov rdx, r9
0x1401607c2: call 0x1400021d0
0x1401607c7: mov rdx, qword ptr [rbp + 0x248]
0x1401607ce: test rdx, rdx
0x1401607d1: mov rdi, qword ptr [rbp + 0x2e0]
0x1401607d8: je 0x1401607ec
0x1401607da: mov r8d, 1
0x1401607e0: mov rcx, qword ptr [rbp + 0x1c8]
0x1401607e7: call 0x1400021d0
0x1401607ec: mov rdx, qword ptr [rbp + 0x240]
0x1401607f3: test rdx, rdx
0x1401607f6: je 0x14016080a
0x1401607f8: mov r8d, 1
0x1401607fe: mov rcx, qword ptr [rbp + 0x1c0]
0x140160805: call 0x1400021d0
0x14016080a: mov rdx, qword ptr [rbp + 0x2d0]
0x140160811: test rdx, rdx
0x140160814: je 0x140160828
0x140160816: mov r8d, 1
0x14016081c: mov rcx, qword ptr [rbp + 0x270]
0x140160823: call 0x1400021d0
0x140160828: mov rdx, qword ptr [rbp + 0x238]
0x14016082f: test rdx, rdx
0x140160832: je 0x140160846
0x140160834: mov r8d, 1
0x14016083a: mov rcx, qword ptr [rbp + 0x1b8]
0x140160841: call 0x1400021d0
0x140160846: mov rdx, qword ptr [rbp + 0x230]
0x14016084d: test rdx, rdx
0x140160850: je 0x140160864
0x140160852: mov r8d, 1
0x140160858: mov rcx, qword ptr [rbp + 0x1b0]
0x14016085f: call 0x1400021d0
0x140160864: mov rdx, qword ptr [rbp + 0x228]
0x14016086b: test rdx, rdx
0x14016086e: je 0x140160882
0x140160870: mov r8d, 1
0x140160876: mov rcx, qword ptr [rbp + 0x1a8]
0x14016087d: call 0x1400021d0
0x140160882: mov rdx, qword ptr [rbp + 0x220]
0x140160889: test rdx, rdx
0x14016088c: je 0x1401608a0
0x14016088e: mov r8d, 1
0x140160894: mov rcx, qword ptr [rbp + 0x1a0]
0x14016089b: call 0x1400021d0
0x1401608a0: mov rdx, qword ptr [rbp + 0x298]
0x1401608a7: test rdx, rdx
0x1401608aa: je 0x1401608be
0x1401608ac: mov r8d, 1
0x1401608b2: mov rcx, qword ptr [rbp + 0x198]
0x1401608b9: call 0x1400021d0
0x1401608be: mov rdx, qword ptr [rbp + 0x288]
0x1401608c5: test rdx, rdx
0x1401608c8: je 0x1401608dc
0x1401608ca: mov r8d, 1
0x1401608d0: mov rcx, qword ptr [rbp + 0x190]
0x1401608d7: call 0x1400021d0
0x1401608dc: mov rdx, qword ptr [rbp + 0x280]
0x1401608e3: test rdx, rdx
0x1401608e6: mov r11, qword ptr [rbp + 0x210]
0x1401608ed: je 0x14015f9a6
0x1401608f3: mov r8d, 1
0x1401608f9: mov rcx, r14
0x1401608fc: call 0x1400021d0
0x140160901: mov r11, qword ptr [rbp + 0x210]
0x140160908: jmp 0x14015f9a6
0x14016090d: mov r15, qword ptr [rbp + 0x2c8]
0x140160914: mov r14, 0xffffffffffffffff
0x14016091b: jmp 0x1401604c1
0x140160920: mov qword ptr [rbp + 0x160], r10
0x140160927: mov qword ptr [rbp + 0x278], r9
0x14016092e: call 0x140002200
0x140160933: mov ecx, 7
0x140160938: mov edx, 1
0x14016093d: call 0x1400021c0
0x140160942: mov rbx, rax
0x140160945: test rax, rax
0x140160948: mov rax, qword ptr [rbp + 0x2e0]
0x14016094f: je 0x140160dd5
0x140160955: mov dword ptr [rbx + 3], 0x676e696e
0x14016095c: mov dword ptr [rbx], 0x6e696f6a
0x140160962: mov ecx, dword ptr [rbp + 0x2ec]
0x140160968: mov dword ptr [rax], ecx
0x14016096a: mov rdx, qword ptr [r15 + 0x10]
0x14016096e: test rdx, rdx
0x140160971: je 0x140160982
0x140160973: mov rcx, qword ptr [r15 + 0x18]
0x140160977: mov r8d, 1
0x14016097d: call 0x1400021d0
0x140160982: mov qword ptr [r15 + 0x10], 7
0x14016098a: mov qword ptr [r15 + 0x18], rbx
0x14016098e: mov qword ptr [r15 + 0x20], 7
0x140160996: mov rdx, qword ptr [rbp + 0x218]
0x14016099d: mov bl, byte ptr [rdx + 0x30]
0x1401609a0: mov dil, byte ptr [rdx + 0x31]
0x1401609a4: mov r15b, byte ptr [rdx + 0x32]
0x1401609a8: mov byte ptr [rbp + 0x2eb], 0
0x1401609af: lea rcx, [rbp + 0x168]
0x1401609b6: call 0x145fd8260
0x1401609bb: nop 
0x1401609bc: lea rcx, [rbp + 0x250]
0x1401609c3: mov rdx, qword ptr [rbp + 0x140]
0x1401609ca: call 0x145fd8260
0x1401609cf: nop 
0x1401609d0: mov rdx, qword ptr [rbp + 0x148]
0x1401609d7: movzx eax, byte ptr [rdx + 4]
0x1401609db: lea r8, [rbp - 0x40]
0x1401609df: mov byte ptr [r8 + 0x37], al
0x1401609e3: mov eax, dword ptr [rdx]
0x1401609e5: mov dword ptr [r8 + 0x33], eax
0x1401609e9: mov rax, qword ptr [rbp + 0x218]
0x1401609f0: movzx eax, byte ptr [rax + 0x38]
0x1401609f4: mov rcx, qword ptr [rbp + 0x178]
0x1401609fb: mov qword ptr [rbp + 0x1e0], rcx
0x140160a02: movups xmm0, xmmword ptr [rbp + 0x168]
0x140160a09: movaps xmmword ptr [rbp + 0x1d0], xmm0
0x140160a10: mov rcx, qword ptr [rbp + 0x260]
0x140160a17: lea rdx, [rbp + 0x1e8]
0x140160a1e: mov qword ptr [rdx + 0x10], rcx
0x140160a22: movups xmm0, xmmword ptr [rbp + 0x250]
0x140160a29: movups xmmword ptr [rdx], xmm0
0x140160a2c: movaps xmm0, xmmword ptr [rbp + 0x1d0]
0x140160a33: mov rcx, qword ptr [rbp + 0x1e0]
0x140160a3a: mov rdx, qword ptr [rbp + 0x1e8]
0x140160a41: movaps xmm1, xmmword ptr [rbp + 0x1f0]
0x140160a48: movups xmmword ptr [r8 + 0x20], xmm1
0x140160a4d: mov qword ptr [r8 + 0x10], rcx
0x140160a51: mov qword ptr [r8 + 0x18], rdx
0x140160a55: movups xmmword ptr [r8], xmm0
0x140160a59: mov byte ptr [rbp - 0x10], bl
0x140160a5c: mov byte ptr [rbp - 0xf], dil
0x140160a60: mov byte ptr [rbp - 0xe], r15b
0x140160a64: mov byte ptr [rbp - 8], al
0x140160a67: mov dword ptr [rbp - 0x48], 0xc
0x140160a6e: mov byte ptr [rbp + 0x2eb], 0
0x140160a75: mov rcx, qword ptr [rbp + 0x2b8]
0x140160a7c: lea rdx, [rbp - 0x48]
0x140160a80: call 0x1401e7be0
0x140160a85: nop 
0x140160a86: mov rax, qword ptr [rbp + 0x278]
0x140160a8d: mov qword ptr [rbp - 0x40], rax
0x140160a91: mov rax, qword ptr [rbp + 0x160]
0x140160a98: mov qword ptr [rbp - 0x38], rax
0x140160a9c: mov qword ptr [rbp - 0x30], r14
0x140160aa0: mov qword ptr [rbp - 0x28], 0
0x140160aa8: mov qword ptr [rbp - 0x20], 1
0x140160ab0: mov qword ptr [rbp - 0x18], 0
0x140160ab8: mov dword ptr [rbp - 0x48], 0x18
0x140160abf: mov byte ptr [rbp + 0x2eb], 1
0x140160ac6: mov rcx, qword ptr [rbp + 0x2b8]
0x140160acd: lea rdx, [rbp - 0x48]
0x140160ad1: call 0x1401e7be0
0x140160ad6: nop 
0x140160ad7: mov r15, qword ptr [rbp + 0x2c8]
0x140160ade: mov rdi, qword ptr [rbp + 0x2e0]
0x140160ae5: mov rdx, qword ptr [rbp + 0x248]
0x140160aec: test rdx, rdx
0x140160aef: je 0x140160b03
0x140160af1: mov r8d, 1
0x140160af7: mov rcx, qword ptr [rbp + 0x1c8]
0x140160afe: call 0x1400021d0
0x140160b03: mov rdx, qword ptr [rbp + 0x240]
0x140160b0a: test rdx, rdx
0x140160b0d: je 0x140160b21
0x140160b0f: mov r8d, 1
0x140160b15: mov rcx, qword ptr [rbp + 0x1c0]
0x140160b1c: call 0x1400021d0
0x140160b21: mov rdx, qword ptr [rbp + 0x2d0]
0x140160b28: test rdx, rdx
0x140160b2b: je 0x140160b3f
0x140160b2d: mov r8d, 1
0x140160b33: mov rcx, qword ptr [rbp + 0x270]
0x140160b3a: call 0x1400021d0
0x140160b3f: mov rdx, qword ptr [rbp + 0x238]
0x140160b46: test rdx, rdx
0x140160b49: je 0x140160b5d
0x140160b4b: mov r8d, 1
0x140160b51: mov rcx, qword ptr [rbp + 0x1b8]
0x140160b58: call 0x1400021d0
0x140160b5d: mov rdx, qword ptr [rbp + 0x230]
0x140160b64: test rdx, rdx
0x140160b67: je 0x140160b7b
0x140160b69: mov r8d, 1
0x140160b6f: mov rcx, qword ptr [rbp + 0x1b0]
0x140160b76: call 0x1400021d0
0x140160b7b: mov rdx, qword ptr [rbp + 0x228]
0x140160b82: test rdx, rdx
0x140160b85: je 0x140160b99
0x140160b87: mov r8d, 1
0x140160b8d: mov rcx, qword ptr [rbp + 0x1a8]
0x140160b94: call 0x1400021d0
0x140160b99: mov rdx, qword ptr [rbp + 0x220]
0x140160ba0: test rdx, rdx
0x140160ba3: je 0x140160bb7
0x140160ba5: mov r8d, 1
0x140160bab: mov rcx, qword ptr [rbp + 0x1a0]
0x140160bb2: call 0x1400021d0
0x140160bb7: mov rdx, qword ptr [rbp + 0x298]
0x140160bbe: test rdx, rdx
0x140160bc1: je 0x140160bd5
0x140160bc3: mov r8d, 1
0x140160bc9: mov rcx, qword ptr [rbp + 0x198]
0x140160bd0: call 0x1400021d0
0x140160bd5: mov rdx, qword ptr [rbp + 0x288]
0x140160bdc: test rdx, rdx
0x140160bdf: je 0x140160bf3
0x140160be1: mov r8d, 1
0x140160be7: mov rcx, qword ptr [rbp + 0x190]
0x140160bee: call 0x1400021d0
0x140160bf3: mov rdx, qword ptr [rbp + 0x280]
0x140160bfa: test rdx, rdx
0x140160bfd: mov ebx, dword ptr [rbp + 0x2ec]
0x140160c03: je 0x14015f990
0x140160c09: mov r8d, 1
0x140160c0f: mov rcx, qword ptr [rbp + 0x158]
0x140160c16: call 0x1400021d0
0x140160c1b: jmp 0x14015f990
0x140160c20: cmp r14, 0x15
0x140160c24: jae 0x140160d67
0x140160c2a: lea rax, [rcx + r14*8]
0x140160c2e: lea r11, [rcx + 8]
0x140160c32: mov edx, 8
0x140160c37: jmp 0x140160c4c
0x140160c39: mov r9, rcx
0x140160c3c: mov qword ptr [r9], r8
0x140160c3f: add r11, 8
0x140160c43: add rdx, 8
0x140160c47: cmp r11, rax
0x140160c4a: je 0x140160c78
0x140160c4c: mov r10, qword ptr [r11 - 8]
0x140160c50: mov r8, qword ptr [r11]
0x140160c53: cmp r8, r10
0x140160c56: jge 0x140160c3f
0x140160c58: mov r9, rdx
0x140160c5b: mov qword ptr [rcx + r9], r10
0x140160c5f: cmp r9, 8
0x140160c63: je 0x140160c39
0x140160c65: mov r10, qword ptr [rcx + r9 - 0x10]
0x140160c6a: add r9, -8
0x140160c6e: cmp r8, r10
0x140160c71: jl 0x140160c5b
0x140160c73: add r9, rcx
0x140160c76: jmp 0x140160c3c
0x140160c78: mov rcx, qword ptr [rbp - 0x40]
0x140160c7c: mov r14, qword ptr [rbp - 0x38]
0x140160c80: cmp r14, 2
0x140160c84: jb 0x14016021b
0x140160c8a: lea rax, [r14 - 1]
0x140160c8e: xor edx, edx
0x140160c90: mov r8, qword ptr [rcx + rdx*8 + 8]
0x140160c95: cmp r8, qword ptr [rcx + rdx*8]
0x140160c99: je 0x140160ca8
0x140160c9b: inc rdx
0x140160c9e: cmp rax, rdx
0x140160ca1: jne 0x140160c90
0x140160ca3: jmp 0x14016021b
0x140160ca8: mov r10, rcx
0x140160cab: lea r9, [rdx + 2]
0x140160caf: lea rax, [rdx + 1]
0x140160cb3: cmp r9, r14
0x140160cb6: jae 0x140160d47
0x140160cbc: mov r8d, r14d
0x140160cbf: sub r8d, edx
0x140160cc2: test r8b, 1
0x140160cc6: je 0x140160ce0
0x140160cc8: mov rcx, qword ptr [r10 + rdx*8 + 0x10]
0x140160ccd: cmp rcx, qword ptr [r10 + rdx*8]
0x140160cd1: je 0x140160cdc
0x140160cd3: mov qword ptr [r10 + rdx*8 + 8], rcx
0x140160cd8: lea rax, [rdx + 2]
0x140160cdc: lea r9, [rdx + 3]
0x140160ce0: lea r8, [r14 - 3]
0x140160ce4: cmp r8, rdx
0x140160ce7: mov rcx, r10
0x140160cea: jne 0x140160d12
0x140160cec: mov r14, rax
0x140160cef: mov r12, qword ptr [rbp + 0x2c0]
0x140160cf6: mov r15, qword ptr [rbp + 0x2c8]
0x140160cfd: mov rdi, qword ptr [rbp + 0x2e0]
0x140160d04: jmp 0x14016021b
0x140160d09: add r9, 2
0x140160d0d: cmp r14, r9
0x140160d10: je 0x140160cec
0x140160d12: mov rdx, qword ptr [rcx + r9*8]
0x140160d16: cmp rdx, qword ptr [rcx + rax*8 - 8]
0x140160d1b: jne 0x140160d2b
0x140160d1d: mov rdx, qword ptr [rcx + r9*8 + 8]
0x140160d22: cmp rdx, qword ptr [rcx + rax*8 - 8]
0x140160d27: je 0x140160d09
0x140160d29: jmp 0x140160d3e
0x140160d2b: mov qword ptr [rcx + rax*8], rdx
0x140160d2f: inc rax
0x140160d32: mov rdx, qword ptr [rcx + r9*8 + 8]
0x140160d37: cmp rdx, qword ptr [rcx + rax*8 - 8]
0x140160d3c: je 0x140160d09
0x140160d3e: mov qword ptr [rcx + rax*8], rdx
0x140160d42: inc rax
0x140160d45: jmp 0x140160d09
0x140160d47: mov r14, rax
0x140160d4a: mov r12, qword ptr [rbp + 0x2c0]
0x140160d51: mov r15, qword ptr [rbp + 0x2c8]
0x140160d58: mov rdi, qword ptr [rbp + 0x2e0]
0x140160d5f: mov rcx, r10
0x140160d62: jmp 0x14016021b
0x140160d67: mov qword ptr [rbp + 0x2d0], rcx
0x140160d6e: mov rdx, r14
0x140160d71: lea r8, [rbp + 0x293]
0x140160d78: call 0x140095970
0x140160d7d: nop 
0x140160d7e: mov r12, qword ptr [rbp + 0x2c0]
0x140160d85: mov r15, qword ptr [rbp + 0x2c8]
0x140160d8c: mov rdi, qword ptr [rbp + 0x2e0]
0x140160d93: mov rcx, qword ptr [rbp + 0x2d0]
0x140160d9a: jmp 0x140160c8a
0x140160d9f: add rsp, 0x378
0x140160da6: pop rbx
0x140160da7: pop rdi
0x140160da8: pop rsi
0x140160da9: pop r12
0x140160dab: pop r13
0x140160dad: pop r14
0x140160daf: pop r15
0x140160db1: pop rbp
0x140160db2: ret 
0x140160db3: xor r12d, r12d
0x140160db6: mov rcx, r12
0x140160db9: mov rdx, rdi
0x140160dbc: call 0x1461add5b
0x140160dc1: nop 
0x140160dc2: jmp 0x140160dec
0x140160dc4: mov ecx, 1
0x140160dc9: mov edx, 3
0x140160dce: call 0x1461add5b
0x140160dd3: ud2 
0x140160dd5: mov byte ptr [rbp + 0x2eb], 0
0x140160ddc: mov ecx, 1
0x140160de1: mov edx, 7
0x140160de6: call 0x1461add5b
0x140160deb: nop 
0x140160dec: ud2 
