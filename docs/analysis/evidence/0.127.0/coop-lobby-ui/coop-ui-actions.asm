0x1402df790: push rbp
0x1402df791: push r15
0x1402df793: push r14
0x1402df795: push r13
0x1402df797: push r12
0x1402df799: push rsi
0x1402df79a: push rdi
0x1402df79b: push rbx
0x1402df79c: sub rsp, 0x378
0x1402df7a3: lea rbp, [rsp + 0x80]
0x1402df7ab: mov qword ptr [rbp + 0x2f0], 0xfffffffffffffffe
0x1402df7b6: mov rax, qword ptr [rbp + 0x370]
0x1402df7bd: mov rcx, qword ptr [rbp + 0x368]
0x1402df7c4: mov r10, qword ptr [rbp + 0x360]
0x1402df7cb: mov r13, qword ptr [rdx]
0x1402df7ce: mov rbx, qword ptr [rdx + 8]
0x1402df7d2: mov r11d, dword ptr [rdx + 0x14]
0x1402df7d6: mov rsi, qword ptr [r8]
0x1402df7d9: mov rdi, qword ptr [r8 + 0x10]
0x1402df7dd: mov qword ptr [rbp + 0x2d8], rdi
0x1402df7e4: mov r8d, dword ptr [r8 + 0x1c]
0x1402df7e8: mov dword ptr [rbp + 0x2ec], r8d
0x1402df7ef: mov r8, qword ptr [r9]
0x1402df7f2: mov qword ptr [rbp + 0x140], r8
0x1402df7f9: mov dword ptr [rbp + 0x260], r11d
0x1402df800: mov r8d, r11d
0x1402df803: sub r8d, dword ptr [rdx + 0x10]
0x1402df807: cmp r8d, 0xc233b000
0x1402df80e: mov edx, 0xc233b000
0x1402df813: cmovb edx, r8d
0x1402df817: mov dword ptr [rbp + 0x264], edx
0x1402df81d: mov rdx, qword ptr [r9 + 0x10]
0x1402df821: mov qword ptr [rbp + 0x148], rdx
0x1402df828: mov edx, dword ptr [r9 + 0x1c]
0x1402df82c: mov dword ptr [rbp + 0x18c], edx
0x1402df832: mov rdx, qword ptr [r10]
0x1402df835: mov rcx, qword ptr [rcx]
0x1402df838: mov qword ptr [rbp + 0x2a8], rcx
0x1402df83f: mov rax, qword ptr [rax]
0x1402df842: mov qword ptr [rbp + 0x168], rax
0x1402df849: mov rdi, qword ptr [r13 + 0xf8]
0x1402df850: mov rax, qword ptr [r13 + 0x100]
0x1402df857: lea r14, [rdi + rax*4]
0x1402df85b: movzx ecx, byte ptr [r13 + 0x108]
0x1402df863: mov qword ptr [rbp + 0x2e0], rsi
0x1402df86a: lea rax, [rsi + 0x180]
0x1402df871: mov qword ptr [rbp + 0x190], rax
0x1402df878: lea rax, [rdx + 0x18]
0x1402df87c: mov qword ptr [rbp + 0x150], rax
0x1402df883: mov qword ptr [rbp + 0x228], rdx
0x1402df88a: lea rax, [rdx + 0x33]
0x1402df88e: mov qword ptr [rbp + 0x158], rax
0x1402df895: xor r15d, r15d
0x1402df898: mov eax, 8
0x1402df89d: mov qword ptr [rbp + 0x160], rax
0x1402df8a4: mov qword ptr [rbp + 0x298], 0
0x1402df8af: mov qword ptr [rbp + 0x220], 0
0x1402df8ba: xor r12d, r12d
0x1402df8bd: xor esi, esi
0x1402df8bf: mov byte ptr [rbp + 0x2eb], cl
0x1402df8c5: test cl, cl
0x1402df8c7: je 0x1402df9f0
0x1402df8cd: mov rcx, r15
0x1402df8d0: cmp esi, r12d
0x1402df8d3: jne 0x1402df950
0x1402df8d5: nop word ptr cs:[rax + rax]
0x1402df8e0: cmp rdi, r14
0x1402df8e3: je 0x1402e0bd5
0x1402df8e9: mov ecx, dword ptr [rdi]
0x1402df8eb: add rdi, 4
0x1402df8ef: mov rax, qword ptr [rbx + 0x1a8]
0x1402df8f6: lea rcx, [rcx + rcx*8]
0x1402df8fa: cmp qword ptr [rax + rcx*8 + 0x10], 0
0x1402df900: je 0x1402df8e0
0x1402df902: lea r12, [rax + rcx*8]
0x1402df906: mov rcx, qword ptr [r13 + 0x110]
0x1402df90d: mov rax, qword ptr [r12 + 0x40]
0x1402df912: cmp rcx, rax
0x1402df915: jae 0x1402df955
0x1402df917: mov rdx, qword ptr [r12 + 0x38]
0x1402df91c: mov rcx, qword ptr [rdx + rcx*8]
0x1402df920: test rcx, rcx
0x1402df923: je 0x1402df955
0x1402df925: mov rdx, qword ptr [r12 + 0x18]
0x1402df92a: not rcx
0x1402df92d: lea rcx, [rcx + rcx*2]
0x1402df931: shl rcx, 4
0x1402df935: mov r15, qword ptr [rdx + rcx + 0x10]
0x1402df93a: mov rcx, qword ptr [r13 + 0x118]
0x1402df941: cmp rcx, rax
0x1402df944: jb 0x1402df964
0x1402df946: jmp 0x1402df990
0x1402df948: nop dword ptr [rax + rax]
0x1402df950: mov r15, rcx
0x1402df953: jmp 0x1402df9bb
0x1402df955: xor r15d, r15d
0x1402df958: mov rcx, qword ptr [r13 + 0x118]
0x1402df95f: cmp rcx, rax
0x1402df962: jae 0x1402df990
0x1402df964: mov rax, qword ptr [r12 + 0x38]
0x1402df969: mov rax, qword ptr [rax + rcx*8]
0x1402df96d: test rax, rax
0x1402df970: je 0x1402df990
0x1402df972: mov rcx, qword ptr [r12 + 0x18]
0x1402df977: not rax
0x1402df97a: lea rax, [rax + rax*2]
0x1402df97e: shl rax, 4
0x1402df982: mov rax, qword ptr [rcx + rax + 0x10]
0x1402df987: mov qword ptr [rbp + 0x298], rax
0x1402df98e: jmp 0x1402df99b
0x1402df990: mov qword ptr [rbp + 0x298], 0
0x1402df99b: mov rdx, qword ptr [r13 + 0x120]
0x1402df9a2: mov rcx, r12
0x1402df9a5: call 0x1450755e0
0x1402df9aa: mov qword ptr [rbp + 0x220], rax
0x1402df9b1: mov r12, qword ptr [r12 + 0x10]
0x1402df9b6: xor esi, esi
0x1402df9b8: mov rcx, r15
0x1402df9bb: mov eax, esi
0x1402df9bd: inc esi
0x1402df9bf: mov edx, dword ptr [rbp + 0x260]
0x1402df9c5: mov r8, qword ptr [rbp + 0x220]
0x1402df9cc: sub edx, dword ptr [r8 + rax*4]
0x1402df9d0: cmp edx, dword ptr [rbp + 0x264]
0x1402df9d6: jae 0x1402df8d0
0x1402df9dc: mov ecx, 0
0x1402df9e1: test r15, r15
0x1402df9e4: je 0x1402df8d0
0x1402df9ea: jmp 0x1402dfb30
0x1402df9ef: nop 
0x1402df9f0: mov rcx, r15
0x1402df9f3: cmp esi, r12d
0x1402df9f6: jne 0x1402dfa80
0x1402df9fc: nop dword ptr [rax]
0x1402dfa00: cmp rdi, r14
0x1402dfa03: je 0x1402e0bd5
0x1402dfa09: mov eax, dword ptr [rdi]
0x1402dfa0b: add rdi, 4
0x1402dfa0f: mov rsi, qword ptr [rbx + 0x108]
0x1402dfa16: lea rax, [rax + rax*4]
0x1402dfa1a: shl rax, 5
0x1402dfa1e: cmp qword ptr [rsi + rax + 0x58], 0
0x1402dfa24: je 0x1402dfa00
0x1402dfa26: add rsi, rax
0x1402dfa29: mov eax, dword ptr [rsi + 0x94]
0x1402dfa2f: mov r8, qword ptr [rbx + 0x1a8]
0x1402dfa36: lea rax, [rax + rax*8]
0x1402dfa3a: lea rcx, [r8 + rax*8]
0x1402dfa3e: mov rdx, qword ptr [r13 + 0x110]
0x1402dfa45: mov rax, qword ptr [r8 + rax*8 + 0x40]
0x1402dfa4a: cmp rdx, rax
0x1402dfa4d: jae 0x1402dfa85
0x1402dfa4f: mov r8, qword ptr [rcx + 0x38]
0x1402dfa53: mov rdx, qword ptr [r8 + rdx*8]
0x1402dfa57: test rdx, rdx
0x1402dfa5a: je 0x1402dfa85
0x1402dfa5c: mov r8, qword ptr [rcx + 0x18]
0x1402dfa60: not rdx
0x1402dfa63: lea rdx, [rdx + rdx*2]
0x1402dfa67: shl rdx, 4
0x1402dfa6b: mov r15, qword ptr [r8 + rdx + 0x10]
0x1402dfa70: mov rdx, qword ptr [r13 + 0x118]
0x1402dfa77: cmp rdx, rax
0x1402dfa7a: jb 0x1402dfa94
0x1402dfa7c: jmp 0x1402dfabe
0x1402dfa7e: nop 
0x1402dfa80: mov r15, rcx
0x1402dfa83: jmp 0x1402dfaf0
0x1402dfa85: xor r15d, r15d
0x1402dfa88: mov rdx, qword ptr [r13 + 0x118]
0x1402dfa8f: cmp rdx, rax
0x1402dfa92: jae 0x1402dfabe
0x1402dfa94: mov rax, qword ptr [rcx + 0x38]
0x1402dfa98: mov rax, qword ptr [rax + rdx*8]
0x1402dfa9c: test rax, rax
0x1402dfa9f: je 0x1402dfabe
0x1402dfaa1: mov rdx, qword ptr [rcx + 0x18]
0x1402dfaa5: not rax
0x1402dfaa8: lea rax, [rax + rax*2]
0x1402dfaac: shl rax, 4
0x1402dfab0: mov rax, qword ptr [rdx + rax + 0x10]
0x1402dfab5: mov qword ptr [rbp + 0x298], rax
0x1402dfabc: jmp 0x1402dfac9
0x1402dfabe: mov qword ptr [rbp + 0x298], 0
0x1402dfac9: mov rdx, qword ptr [r13 + 0x120]
0x1402dfad0: call 0x1450755e0
0x1402dfad5: mov qword ptr [rbp + 0x220], rax
0x1402dfadc: mov rax, qword ptr [rsi + 0x50]
0x1402dfae0: mov qword ptr [rbp + 0x160], rax
0x1402dfae7: mov r12, qword ptr [rsi + 0x58]
0x1402dfaeb: xor esi, esi
0x1402dfaed: mov rcx, r15
0x1402dfaf0: mov eax, esi
0x1402dfaf2: shl rax, 4
0x1402dfaf6: inc esi
0x1402dfaf8: mov rdx, qword ptr [rbp + 0x160]
0x1402dfaff: mov eax, dword ptr [rdx + rax + 8]
0x1402dfb03: not eax
0x1402dfb05: mov edx, dword ptr [rbp + 0x260]
0x1402dfb0b: mov r8, qword ptr [rbp + 0x220]
0x1402dfb12: sub edx, dword ptr [r8 + rax*4]
0x1402dfb16: cmp edx, dword ptr [rbp + 0x264]
0x1402dfb1c: jae 0x1402df9f3
0x1402dfb22: mov ecx, 0
0x1402dfb27: test r15, r15
0x1402dfb2a: je 0x1402df9f3
0x1402dfb30: lea rcx, [r15 + rax]
0x1402dfb34: shl rax, 4
0x1402dfb38: add rax, qword ptr [rbp + 0x298]
0x1402dfb3f: cmp byte ptr [rcx], 0
0x1402dfb42: movzx ecx, byte ptr [rbp + 0x2eb]
0x1402dfb49: jne 0x1402df8c5
0x1402dfb4f: movzx ecx, byte ptr [rax]
0x1402dfb52: lea rdx, [rip + 0x5f9ae7b]
0x1402dfb59: movsxd rcx, dword ptr [rdx + rcx*4]
0x1402dfb5d: add rcx, rdx
0x1402dfb60: jmp rcx
0x1402dfb62: movzx eax, byte ptr [rax + 1]
0x1402dfb66: mov rcx, qword ptr [rbp + 0x2d8]
0x1402dfb6d: mov edx, dword ptr [rbp + 0x2ec]
0x1402dfb73: mov dword ptr [rcx], edx
0x1402dfb75: mov rcx, qword ptr [rbp + 0x2e0]
0x1402dfb7c: mov byte ptr [rcx + 0x1b9], al
0x1402dfb82: test eax, eax
0x1402dfb84: je 0x1402e05f8
0x1402dfb8a: cmp eax, 1
0x1402dfb8d: je 0x1402dfb91
0x1402dfb8f: mov al, 4
0x1402dfb91: mov r9, qword ptr [rbp + 0x2d8]
0x1402dfb98: mov r10d, dword ptr [rbp + 0x2ec]
0x1402dfb9f: mov dword ptr [r9], r10d
0x1402dfba2: mov r11, qword ptr [rbp + 0x2e0]
0x1402dfba9: mov byte ptr [r11 + 0x1ba], al
0x1402dfbb0: jmp 0x1402e07fa
0x1402dfbb5: mov rax, qword ptr [rbp + 0x2d8]
0x1402dfbbc: mov ecx, dword ptr [rbp + 0x2ec]
0x1402dfbc2: mov dword ptr [rax], ecx
0x1402dfbc4: mov rcx, qword ptr [rbp + 0x2e0]
0x1402dfbcb: mov rdx, qword ptr [rbp + 0x2a8]
0x1402dfbd2: call 0x1402b9760
0x1402dfbd7: jmp 0x1402e07e5
0x1402dfbdc: movzx eax, byte ptr [rax + 1]
0x1402dfbe0: mov r9, qword ptr [rbp + 0x2d8]
0x1402dfbe7: mov r10d, dword ptr [rbp + 0x2ec]
0x1402dfbee: mov dword ptr [r9], r10d
0x1402dfbf1: xor al, 1
0x1402dfbf3: mov r11, qword ptr [rbp + 0x2e0]
0x1402dfbfa: mov byte ptr [r11 + 0x1b8], al
0x1402dfc01: jmp 0x1402e07fa
0x1402dfc06: mov r11, qword ptr [rbp + 0x2e0]
0x1402dfc0d: movzx eax, byte ptr [r11 + 0x1b7]
0x1402dfc15: mov r9, qword ptr [rbp + 0x2d8]
0x1402dfc1c: mov r10d, dword ptr [rbp + 0x2ec]
0x1402dfc23: mov dword ptr [r9], r10d
0x1402dfc26: xor al, 1
0x1402dfc28: mov byte ptr [r11 + 0x1b7], al
0x1402dfc2f: jmp 0x1402e07fa
0x1402dfc34: mov rax, qword ptr [rbp + 0x2d8]
0x1402dfc3b: mov ecx, dword ptr [rbp + 0x2ec]
0x1402dfc41: mov dword ptr [rax], ecx
0x1402dfc43: mov rcx, qword ptr [rbp + 0x2e0]
0x1402dfc4a: mov rdx, qword ptr [rbp + 0x2a8]
0x1402dfc51: mov r8, qword ptr [rbp + 0x228]
0x1402dfc58: mov r9b, 2
0x1402dfc5b: jmp 0x1402e0135
0x1402dfc60: mov rax, qword ptr [rbp + 0x2e0]
0x1402dfc67: mov rcx, qword ptr [rax + 0x78]
0x1402dfc6b: imul rax, qword ptr [rax + 0x80], 0x128
0x1402dfc76: mov qword ptr [rbp + 0x1f0], 0
0x1402dfc81: mov qword ptr [rbp + 0x1f8], 8
0x1402dfc8c: mov qword ptr [rbp + 0x200], 0
0x1402dfc97: add rax, rcx
0x1402dfc9a: mov qword ptr [rbp + 0x2b0], rax
0x1402dfca1: mov qword ptr [rbp + 0x2c8], 0
0x1402dfcac: mov rax, qword ptr [rbp + 0x1f8]
0x1402dfcb3: mov qword ptr [rbp + 0x2a0], rax
0x1402dfcba: cmp rcx, qword ptr [rbp + 0x2b0]
0x1402dfcc1: je 0x1402e03fb
0x1402dfcc7: lea rax, [rcx + 0x128]
0x1402dfcce: mov qword ptr [rbp + 0x2d0], rax
0x1402dfcd5: add rcx, 0x90
0x1402dfcdc: mov rdx, qword ptr [rbp + 0x2a0]
0x1402dfce3: mov r8, qword ptr [rbp + 0x2c8]
0x1402dfcea: call 0x1401c09b0
0x1402dfcef: mov rdx, qword ptr [rbp + 0x2d0]
0x1402dfcf6: mov rcx, rdx
0x1402dfcf9: test al, al
0x1402dfcfb: jne 0x1402dfcba
0x1402dfcfd: add rdx, -0x98
0x1402dfd04: lea rcx, [rbp - 0x50]
0x1402dfd08: call 0x146034930
0x1402dfd0d: nop 
0x1402dfd0e: mov rax, qword ptr [rbp + 0x200]
0x1402dfd15: mov qword ptr [rbp + 0x2c8], rax
0x1402dfd1c: cmp rax, qword ptr [rbp + 0x1f0]
0x1402dfd23: jne 0x1402dfd32
0x1402dfd25: lea rcx, [rbp + 0x1f0]
0x1402dfd2c: call 0x1460995a0
0x1402dfd31: nop 
0x1402dfd32: mov rax, qword ptr [rbp + 0x1f8]
0x1402dfd39: mov r8, qword ptr [rbp + 0x2c8]
0x1402dfd40: lea rcx, [r8 + r8*2]
0x1402dfd44: mov rdx, qword ptr [rbp - 0x40]
0x1402dfd48: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x1402dfd4d: movups xmm0, xmmword ptr [rbp - 0x50]
0x1402dfd51: movups xmmword ptr [rax + rcx*8], xmm0
0x1402dfd55: inc r8
0x1402dfd58: mov qword ptr [rbp + 0x2c8], r8
0x1402dfd5f: mov qword ptr [rbp + 0x200], r8
0x1402dfd66: mov rcx, qword ptr [rbp + 0x2d0]
0x1402dfd6d: jmp 0x1402dfcac
0x1402dfd72: movzx eax, byte ptr [rax + 1]
0x1402dfd76: mov r9, qword ptr [rbp + 0x2d8]
0x1402dfd7d: mov r10d, dword ptr [rbp + 0x2ec]
0x1402dfd84: mov dword ptr [r9], r10d
0x1402dfd87: mov r11, qword ptr [rbp + 0x2e0]
0x1402dfd8e: mov byte ptr [r11 + 0x1bc], al
0x1402dfd95: jmp 0x1402e07fa
0x1402dfd9a: mov rax, qword ptr [rax + 8]
0x1402dfd9e: mov rcx, qword ptr [rbp + 0x2e0]
0x1402dfda5: cmp rax, qword ptr [rcx + 0x80]
0x1402dfdac: movzx ecx, byte ptr [rbp + 0x2eb]
0x1402dfdb3: jae 0x1402df8c5
0x1402dfdb9: mov rcx, qword ptr [rbp + 0x2e0]
0x1402dfdc0: mov rcx, qword ptr [rcx + 0x78]
0x1402dfdc4: mov qword ptr [rbp + 0x2b0], rcx
0x1402dfdcb: imul rax, rax, 0x128
0x1402dfdd2: mov qword ptr [rbp + 0x2c8], rax
0x1402dfdd9: lea rdx, [rcx + rax]
0x1402dfddd: lea rcx, [rbp + 0x128]
0x1402dfde4: mov qword ptr [rbp + 0x2d0], rdx
0x1402dfdeb: call 0x146034930
0x1402dfdf0: mov rax, qword ptr [rbp + 0x2c8]
0x1402dfdf7: mov rcx, qword ptr [rbp + 0x2b0]
0x1402dfdfe: lea rdx, [rcx + rax]
0x1402dfe02: add rdx, 0x18
0x1402dfe06: lea rcx, [rbp + 0x110]
0x1402dfe0d: call 0x146034930
0x1402dfe12: nop 
0x1402dfe13: mov rax, qword ptr [rbp + 0x2d0]
0x1402dfe1a: lea rdx, [rax + 0x30]
0x1402dfe1e: lea rcx, [rbp + 0xf8]
0x1402dfe25: call 0x146034930
0x1402dfe2a: nop 
0x1402dfe2b: mov rax, qword ptr [rbp + 0x2d0]
0x1402dfe32: lea rdx, [rax + 0x48]
0x1402dfe36: lea rcx, [rbp + 0xe0]
0x1402dfe3d: call 0x140111060
0x1402dfe42: nop 
0x1402dfe43: mov rax, qword ptr [rbp + 0x2d0]
0x1402dfe4a: lea rdx, [rax + 0x60]
0x1402dfe4e: lea rcx, [rbp + 0xc8]
0x1402dfe55: call 0x146034930
0x1402dfe5a: nop 
0x1402dfe5b: mov rax, qword ptr [rbp + 0x2d0]
0x1402dfe62: lea rdx, [rax + 0x78]
0x1402dfe66: lea rcx, [rbp + 0xb0]
0x1402dfe6d: call 0x146034930
0x1402dfe72: nop 
0x1402dfe73: mov rax, qword ptr [rbp + 0x2d0]
0x1402dfe7a: lea rdx, [rax + 0x90]
0x1402dfe81: lea rcx, [rbp + 0x98]
0x1402dfe88: call 0x146034930
0x1402dfe8d: nop 
0x1402dfe8e: mov rax, qword ptr [rbp + 0x2d0]
0x1402dfe95: movzx ecx, byte ptr [rax + 0x120]
0x1402dfe9c: mov byte ptr [rbp + 0x2c8], cl
0x1402dfea2: lea rdx, [rax + 0xa8]
0x1402dfea9: lea rcx, [rbp + 0x170]
0x1402dfeb0: call 0x146034930
0x1402dfeb5: nop 
0x1402dfeb6: mov rax, qword ptr [rbp + 0x2d0]
0x1402dfebd: lea rdx, [rax + 0xc0]
0x1402dfec4: lea rcx, [rbp + 0x270]
0x1402dfecb: call 0x146034930
0x1402dfed0: nop 
0x1402dfed1: mov rax, qword ptr [rbp + 0x2d0]
0x1402dfed8: movzx ecx, byte ptr [rax + 0x121]
0x1402dfedf: mov byte ptr [rbp + 0x268], cl
0x1402dfee5: lea rdx, [rax + 0xd8]
0x1402dfeec: lea rcx, [rbp + 0x1f0]
0x1402dfef3: call 0x146034930
0x1402dfef8: nop 
0x1402dfef9: mov rdx, qword ptr [rbp + 0x2d0]
0x1402dff00: add rdx, 0xf0
0x1402dff07: lea rcx, [rbp - 0x50]
0x1402dff0b: call 0x146034930
0x1402dff10: nop 
0x1402dff11: mov rdx, qword ptr [rbp + 0x128]
0x1402dff18: mov rcx, qword ptr [rbp + 0x130]
0x1402dff1f: mov rax, qword ptr [rbp + 0x110]
0x1402dff26: mov qword ptr [rbp + 0x250], rax
0x1402dff2d: mov rax, qword ptr [rbp + 0x118]
0x1402dff34: mov qword ptr [rbp + 0x1e0], rax
0x1402dff3b: mov rax, qword ptr [rbp + 0xf8]
0x1402dff42: mov qword ptr [rbp + 0x248], rax
0x1402dff49: mov rax, qword ptr [rbp + 0x100]
0x1402dff50: mov qword ptr [rbp + 0x1d8], rax
0x1402dff57: mov rax, qword ptr [rbp + 0xe0]
0x1402dff5e: mov qword ptr [rbp + 0x240], rax
0x1402dff65: mov rax, qword ptr [rbp + 0xe8]
0x1402dff6c: mov qword ptr [rbp + 0x1d0], rax
0x1402dff73: mov rax, qword ptr [rbp + 0xc8]
0x1402dff7a: mov qword ptr [rbp + 0x238], rax
0x1402dff81: mov rax, qword ptr [rbp + 0xd0]
0x1402dff88: mov qword ptr [rbp + 0x1c8], rax
0x1402dff8f: mov rax, qword ptr [rbp + 0xb0]
0x1402dff96: mov qword ptr [rbp + 0x230], rax
0x1402dff9d: mov rax, qword ptr [rbp + 0xb8]
0x1402dffa4: mov qword ptr [rbp + 0x1c0], rax
0x1402dffab: mov rax, qword ptr [rbp + 0x98]
0x1402dffb2: mov qword ptr [rbp + 0x288], rax
0x1402dffb9: mov rax, qword ptr [rbp + 0xa0]
0x1402dffc0: mov qword ptr [rbp + 0x1b8], rax
0x1402dffc7: mov rax, qword ptr [rbp + 0x170]
0x1402dffce: mov qword ptr [rbp + 0x2b8], rax
0x1402dffd5: mov r8, qword ptr [rbp + 0x178]
0x1402dffdc: mov rax, qword ptr [rbp + 0x270]
0x1402dffe3: mov qword ptr [rbp + 0x2a0], rax
0x1402dffea: mov r9, qword ptr [rbp + 0x278]
0x1402dfff1: mov rax, qword ptr [rbp + 0x1f0]
0x1402dfff8: mov qword ptr [rbp + 0x2b0], rax
0x1402dffff: mov r10, qword ptr [rbp + 0x1f8]
0x1402e0006: mov rax, qword ptr [rbp - 0x50]
0x1402e000a: mov qword ptr [rbp + 0x2d0], rax
0x1402e0011: mov rax, qword ptr [rbp - 0x48]
0x1402e0015: cmp byte ptr [rbp + 0x2c8], 0
0x1402e001c: mov qword ptr [rbp + 0x198], rax
0x1402e0023: mov qword ptr [rbp + 0x1a0], r10
0x1402e002a: mov qword ptr [rbp + 0x1a8], r9
0x1402e0031: mov qword ptr [rbp + 0x1b0], r8
0x1402e0038: je 0x1402e0649
0x1402e003e: mov rax, qword ptr [rbp + 0x138]
0x1402e0045: mov qword ptr [rbp + 0x2c8], rax
0x1402e004c: cmp byte ptr [rbp + 0x268], 0
0x1402e0053: mov qword ptr [rbp + 0x258], rdx
0x1402e005a: mov qword ptr [rbp + 0x1e8], rcx
0x1402e0061: je 0x1402e0810
0x1402e0067: mov r8, qword ptr [rbp + 0x2e0]
0x1402e006e: mov byte ptr [r8 + 0x1b9], 2
0x1402e0076: mov rax, qword ptr [rbp + 0x2d8]
0x1402e007d: mov ecx, dword ptr [rbp + 0x2ec]
0x1402e0083: mov dword ptr [rax], ecx
0x1402e0085: mov rdx, qword ptr [r8 + 0x118]
0x1402e008c: test rdx, rdx
0x1402e008f: je 0x1402e00aa
0x1402e0091: mov rcx, qword ptr [r8 + 0x120]
0x1402e0098: mov r8d, 1
0x1402e009e: call 0x1400021d0
0x1402e00a3: mov r8, qword ptr [rbp + 0x2e0]
0x1402e00aa: mov rax, qword ptr [rbp + 0x258]
0x1402e00b1: mov qword ptr [r8 + 0x118], rax
0x1402e00b8: mov rax, qword ptr [rbp + 0x1e8]
0x1402e00bf: mov qword ptr [r8 + 0x120], rax
0x1402e00c6: mov rax, qword ptr [rbp + 0x2c8]
0x1402e00cd: mov qword ptr [r8 + 0x128], rax
0x1402e00d4: mov rax, qword ptr [rbp + 0x2d8]
0x1402e00db: mov ecx, dword ptr [rbp + 0x2ec]
0x1402e00e1: mov dword ptr [rax], ecx
0x1402e00e3: mov byte ptr [r8 + 0x1ba], 5
0x1402e00eb: jmp 0x1402e0a06
0x1402e00f0: mov rax, qword ptr [rbp + 0x148]
0x1402e00f7: mov ecx, dword ptr [rbp + 0x18c]
0x1402e00fd: mov dword ptr [rax], ecx
0x1402e00ff: mov rax, qword ptr [rbp + 0x140]
0x1402e0106: mov byte ptr [rax], 1
0x1402e0109: jmp 0x1402e05de
0x1402e010e: mov rax, qword ptr [rbp + 0x2d8]
0x1402e0115: mov ecx, dword ptr [rbp + 0x2ec]
0x1402e011b: mov dword ptr [rax], ecx
0x1402e011d: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e0124: mov rdx, qword ptr [rbp + 0x2a8]
0x1402e012b: mov r8, qword ptr [rbp + 0x228]
0x1402e0132: mov r9b, 1
0x1402e0135: call 0x1402be2d0
0x1402e013a: jmp 0x1402e07e5
0x1402e013f: movzx eax, byte ptr [rax + 1]
0x1402e0143: mov r9, qword ptr [rbp + 0x2d8]
0x1402e014a: mov r10d, dword ptr [rbp + 0x2ec]
0x1402e0151: mov dword ptr [r9], r10d
0x1402e0154: mov r11, qword ptr [rbp + 0x2e0]
0x1402e015b: mov byte ptr [r11 + 0x1ba], al
0x1402e0162: jmp 0x1402e07fa
0x1402e0167: mov rax, qword ptr [rbp + 0x168]
0x1402e016e: movss xmm0, dword ptr [rax + 0x5c]
0x1402e0173: mov rax, qword ptr [rbp + 0x2d8]
0x1402e017a: mov ecx, dword ptr [rbp + 0x2ec]
0x1402e0180: mov dword ptr [rax], ecx
0x1402e0182: mov rax, qword ptr [rbp + 0x2e0]
0x1402e0189: movss dword ptr [rax + 0x1b0], xmm0
0x1402e0191: jmp 0x1402e062d
0x1402e0196: mov dword ptr [rbp - 0x50], 0x19
0x1402e019d: mov rcx, qword ptr [rbp + 0x2a8]
0x1402e01a4: lea rdx, [rbp - 0x50]
0x1402e01a8: call 0x140246550
0x1402e01ad: mov rax, qword ptr [rbp + 0x2d8]
0x1402e01b4: mov ecx, dword ptr [rbp + 0x2ec]
0x1402e01ba: mov dword ptr [rax], ecx
0x1402e01bc: mov rax, qword ptr [rbp + 0x2e0]
0x1402e01c3: mov qword ptr [rax + 0x50], 0
0x1402e01cb: call 0x140002200
0x1402e01d0: mov ecx, 3
0x1402e01d5: mov edx, 1
0x1402e01da: call 0x1400021c0
0x1402e01df: test rax, rax
0x1402e01e2: je 0x1402e0be9
0x1402e01e8: mov byte ptr [rax + 2], 0x66
0x1402e01ec: mov word ptr [rax], 0x666f
0x1402e01f1: mov rcx, qword ptr [rbp + 0x2d8]
0x1402e01f8: mov edx, dword ptr [rbp + 0x2ec]
0x1402e01fe: mov dword ptr [rcx], edx
0x1402e0200: mov r8, qword ptr [rbp + 0x2e0]
0x1402e0207: mov rdx, qword ptr [r8 + 0x10]
0x1402e020b: test rdx, rdx
0x1402e020e: je 0x1402e0234
0x1402e0210: mov rcx, qword ptr [r8 + 0x18]
0x1402e0214: mov r8d, 1
0x1402e021a: mov qword ptr [rbp + 0x2d0], rax
0x1402e0221: call 0x1400021d0
0x1402e0226: mov rax, qword ptr [rbp + 0x2d0]
0x1402e022d: mov r8, qword ptr [rbp + 0x2e0]
0x1402e0234: mov qword ptr [r8 + 0x10], 3
0x1402e023c: mov qword ptr [r8 + 0x18], rax
0x1402e0240: mov qword ptr [r8 + 0x20], 3
0x1402e0248: mov rax, qword ptr [rbp + 0x2d8]
0x1402e024f: mov ecx, dword ptr [rbp + 0x2ec]
0x1402e0255: mov dword ptr [rax], ecx
0x1402e0257: mov rax, qword ptr [r8 + 0x90]
0x1402e025e: mov rcx, qword ptr [r8 + 0x98]
0x1402e0265: mov qword ptr [r8 + 0x98], 0
0x1402e0270: test rcx, rcx
0x1402e0273: je 0x1402e02a8
0x1402e0275: mov qword ptr [rbp + 0x2c8], rcx
0x1402e027c: mov qword ptr [rbp + 0x2d0], rax
0x1402e0283: mov rcx, qword ptr [rbp + 0x2d0]
0x1402e028a: call 0x1400eaf60
0x1402e028f: mov rcx, qword ptr [rbp + 0x2c8]
0x1402e0296: mov rax, qword ptr [rbp + 0x2d0]
0x1402e029d: add rax, 0x90
0x1402e02a3: dec rcx
0x1402e02a6: jne 0x1402e0275
0x1402e02a8: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e02af: mov qword ptr [rcx + 0x68], 0
0x1402e02b7: mov rax, qword ptr [rbp + 0x2d8]
0x1402e02be: mov edx, dword ptr [rbp + 0x2ec]
0x1402e02c4: mov dword ptr [rax], edx
0x1402e02c6: call 0x1402af160
0x1402e02cb: jmp 0x1402e07e5
0x1402e02d0: mov rax, qword ptr [rbp + 0x2e0]
0x1402e02d7: mov rdx, qword ptr [rax + 0x78]
0x1402e02db: imul r8, qword ptr [rax + 0x80], 0x128
0x1402e02e6: add r8, rdx
0x1402e02e9: lea rcx, [rbp - 0x50]
0x1402e02ed: call 0x140105080
0x1402e02f2: mov rdx, qword ptr [rbp - 0x40]
0x1402e02f6: cmp rdx, 2
0x1402e02fa: jae 0x1402e0b4b
0x1402e0300: lea rcx, [rbp - 0x50]
0x1402e0304: call 0x1400e7180
0x1402e0309: mov rcx, qword ptr [rbp - 0x48]
0x1402e030d: mov rax, qword ptr [rbp - 0x40]
0x1402e0311: mov rdx, qword ptr [rbp + 0x2e0]
0x1402e0318: cmp byte ptr [rdx], 0
0x1402e031b: je 0x1402e04fc
0x1402e0321: test rax, rax
0x1402e0324: je 0x1402e07ac
0x1402e032a: mov rdx, qword ptr [rbp + 0x2e0]
0x1402e0331: mov r8, qword ptr [rdx + 8]
0x1402e0335: lea r9, [rax*8]
0x1402e033d: mov edx, 1
0x1402e0342: cmp qword ptr [rcx + rdx*8 - 8], r8
0x1402e0347: je 0x1402e079c
0x1402e034d: inc rdx
0x1402e0350: add r9, -8
0x1402e0354: jne 0x1402e0342
0x1402e0356: jmp 0x1402e07ac
0x1402e035b: mov r9, qword ptr [rbp + 0x2d8]
0x1402e0362: mov r10d, dword ptr [rbp + 0x2ec]
0x1402e0369: mov dword ptr [r9], r10d
0x1402e036c: mov r11, qword ptr [rbp + 0x2e0]
0x1402e0373: mov byte ptr [r11 + 0x1b4], 0
0x1402e037b: jmp 0x1402e07fa
0x1402e0380: mov r11, qword ptr [rbp + 0x2e0]
0x1402e0387: movzx eax, byte ptr [r11 + 0x1b6]
0x1402e038f: mov r9, qword ptr [rbp + 0x2d8]
0x1402e0396: mov r10d, dword ptr [rbp + 0x2ec]
0x1402e039d: mov dword ptr [r9], r10d
0x1402e03a0: xor al, 1
0x1402e03a2: mov byte ptr [r11 + 0x1b6], al
0x1402e03a9: jmp 0x1402e07fa
0x1402e03ae: mov rax, qword ptr [rax + 8]
0x1402e03b2: mov r11, qword ptr [rbp + 0x2e0]
0x1402e03b9: cmp rax, qword ptr [r11 + 0x98]
0x1402e03c0: mov r9, qword ptr [rbp + 0x2d8]
0x1402e03c7: mov r10d, dword ptr [rbp + 0x2ec]
0x1402e03ce: jae 0x1402e07fa
0x1402e03d4: mov rcx, qword ptr [r11 + 0x90]
0x1402e03db: lea rax, [rax + rax*8]
0x1402e03df: shl rax, 4
0x1402e03e3: mov rax, qword ptr [rcx + rax + 0x80]
0x1402e03eb: mov qword ptr [rbp - 0x48], rax
0x1402e03ef: mov dword ptr [rbp - 0x50], 0x1a
0x1402e03f6: jmp 0x1402e0634
0x1402e03fb: mov rax, qword ptr [rbp + 0x200]
0x1402e0402: mov qword ptr [rbp + 0x280], rax
0x1402e0409: movups xmm0, xmmword ptr [rbp + 0x1f0]
0x1402e0410: movaps xmmword ptr [rbp + 0x270], xmm0
0x1402e0417: mov rax, qword ptr [rbp + 0x2e0]
0x1402e041e: cmp qword ptr [rax + 0x178], -1
0x1402e0426: je 0x1402e050d
0x1402e042c: mov rax, qword ptr [rbp + 0x280]
0x1402e0433: test rax, rax
0x1402e0436: je 0x1402e0540
0x1402e043c: mov qword ptr [rbp + 0x2b8], 0xffffffffffffffff
0x1402e0447: mov rdx, qword ptr [rbp + 0x278]
0x1402e044e: mov qword ptr [rbp + 0x288], rax
0x1402e0455: lea rax, [rax*8]
0x1402e045d: lea rcx, [rax + rax*2]
0x1402e0461: mov rax, qword ptr [rbp + 0x2e0]
0x1402e0468: mov r8, qword ptr [rax + 0x188]
0x1402e046f: add rdx, 0x18
0x1402e0473: mov eax, 1
0x1402e0478: mov qword ptr [rbp + 0x2d0], r8
0x1402e047f: jmp 0x1402e0492
0x1402e0481: add rdx, 0x18
0x1402e0485: inc rax
0x1402e0488: add rcx, -0x18
0x1402e048c: je 0x1402e054b
0x1402e0492: cmp qword ptr [rdx - 8], r8
0x1402e0496: jne 0x1402e0481
0x1402e0498: mov qword ptr [rbp + 0x2b0], rcx
0x1402e049f: mov rcx, qword ptr [rdx - 0x10]
0x1402e04a3: mov qword ptr [rbp + 0x2a0], rax
0x1402e04aa: mov rax, qword ptr [rbp + 0x190]
0x1402e04b1: mov qword ptr [rbp + 0x2c8], rdx
0x1402e04b8: mov rdx, qword ptr [rax]
0x1402e04bb: mov r8, qword ptr [rbp + 0x2d0]
0x1402e04c2: call 0x146061721
0x1402e04c7: mov r8, qword ptr [rbp + 0x2d0]
0x1402e04ce: mov rcx, qword ptr [rbp + 0x2b0]
0x1402e04d5: mov rdx, qword ptr [rbp + 0x2c8]
0x1402e04dc: test eax, eax
0x1402e04de: mov rax, qword ptr [rbp + 0x2a0]
0x1402e04e5: jne 0x1402e0481
0x1402e04e7: cmp rax, qword ptr [rbp + 0x288]
0x1402e04ee: jae 0x1402e054b
0x1402e04f0: lea rcx, [rbp - 0x50]
0x1402e04f4: call 0x146034930
0x1402e04f9: nop 
0x1402e04fa: jmp 0x1402e0528
0x1402e04fc: test rax, rax
0x1402e04ff: je 0x1402e07ac
0x1402e0505: mov r8, qword ptr [rcx]
0x1402e0508: jmp 0x1402e07a5
0x1402e050d: cmp qword ptr [rbp + 0x280], 0
0x1402e0515: je 0x1402e0540
0x1402e0517: mov rdx, qword ptr [rbp + 0x278]
0x1402e051e: lea rcx, [rbp - 0x50]
0x1402e0522: call 0x146034930
0x1402e0527: nop 
0x1402e0528: mov rax, qword ptr [rbp - 0x50]
0x1402e052c: mov qword ptr [rbp + 0x2b8], rax
0x1402e0533: lea rax, [rbp - 0x48]
0x1402e0537: movups xmm0, xmmword ptr [rax]
0x1402e053a: movaps xmmword ptr [rbp - 0x60], xmm0
0x1402e053e: jmp 0x1402e054b
0x1402e0540: mov qword ptr [rbp + 0x2b8], 0xffffffffffffffff
0x1402e054b: mov rax, qword ptr [rbp + 0x2d8]
0x1402e0552: mov ecx, dword ptr [rbp + 0x2ec]
0x1402e0558: mov dword ptr [rax], ecx
0x1402e055a: mov rax, qword ptr [rbp + 0x2e0]
0x1402e0561: mov rdx, qword ptr [rax + 0x178]
0x1402e0568: cmp rdx, -1
0x1402e056c: je 0x1402e0588
0x1402e056e: test rdx, rdx
0x1402e0571: je 0x1402e0588
0x1402e0573: mov rax, qword ptr [rbp + 0x190]
0x1402e057a: mov rcx, qword ptr [rax]
0x1402e057d: mov r8d, 1
0x1402e0583: call 0x1400021d0
0x1402e0588: mov rax, qword ptr [rbp + 0x2e0]
0x1402e058f: mov rcx, qword ptr [rbp + 0x2b8]
0x1402e0596: mov qword ptr [rax + 0x178], rcx
0x1402e059d: movaps xmm0, xmmword ptr [rbp - 0x60]
0x1402e05a1: mov rax, qword ptr [rbp + 0x190]
0x1402e05a8: movups xmmword ptr [rax], xmm0
0x1402e05ab: lea rcx, [rbp + 0x270]
0x1402e05b2: call 0x140112d10
0x1402e05b7: nop 
0x1402e05b8: mov rax, qword ptr [rbp + 0x270]
0x1402e05bf: test rax, rax
0x1402e05c2: je 0x1402e05de
0x1402e05c4: mov rcx, qword ptr [rbp + 0x278]
0x1402e05cb: shl rax, 3
0x1402e05cf: lea rdx, [rax + rax*2]
0x1402e05d3: mov r8d, 8
0x1402e05d9: call 0x1400021d0
0x1402e05de: mov r11, qword ptr [rbp + 0x2e0]
0x1402e05e5: mov r9, qword ptr [rbp + 0x2d8]
0x1402e05ec: mov r10d, dword ptr [rbp + 0x2ec]
0x1402e05f3: jmp 0x1402e07fa
0x1402e05f8: mov rcx, qword ptr [rbp + 0x2d8]
0x1402e05ff: mov edx, dword ptr [rbp + 0x2ec]
0x1402e0605: mov dword ptr [rcx], edx
0x1402e0607: mov r8, qword ptr [rbp + 0x2e0]
0x1402e060e: mov byte ptr [r8 + 0x1ba], 0
0x1402e0616: mov rax, qword ptr [rbp + 0x168]
0x1402e061d: movss xmm0, dword ptr [rax + 0x5c]
0x1402e0622: mov dword ptr [rcx], edx
0x1402e0624: movss dword ptr [r8 + 0x1b0], xmm0
0x1402e062d: mov dword ptr [rbp - 0x50], 0x16
0x1402e0634: mov rcx, qword ptr [rbp + 0x2a8]
0x1402e063b: lea rdx, [rbp - 0x50]
0x1402e063f: call 0x140246550
0x1402e0644: jmp 0x1402e07e5
0x1402e0649: test rdx, rdx
0x1402e064c: je 0x1402e0659
0x1402e064e: mov r8d, 1
0x1402e0654: call 0x1400021d0
0x1402e0659: mov rdx, qword ptr [rbp + 0x250]
0x1402e0660: test rdx, rdx
0x1402e0663: je 0x1402e0677
0x1402e0665: mov r8d, 1
0x1402e066b: mov rcx, qword ptr [rbp + 0x1e0]
0x1402e0672: call 0x1400021d0
0x1402e0677: mov rdx, qword ptr [rbp + 0x248]
0x1402e067e: test rdx, rdx
0x1402e0681: je 0x1402e0695
0x1402e0683: mov r8d, 1
0x1402e0689: mov rcx, qword ptr [rbp + 0x1d8]
0x1402e0690: call 0x1400021d0
0x1402e0695: mov rdx, qword ptr [rbp + 0x240]
0x1402e069c: test rdx, rdx
0x1402e069f: je 0x1402e06b3
0x1402e06a1: mov r8d, 1
0x1402e06a7: mov rcx, qword ptr [rbp + 0x1d0]
0x1402e06ae: call 0x1400021d0
0x1402e06b3: mov rdx, qword ptr [rbp + 0x238]
0x1402e06ba: test rdx, rdx
0x1402e06bd: je 0x1402e06d1
0x1402e06bf: mov r8d, 1
0x1402e06c5: mov rcx, qword ptr [rbp + 0x1c8]
0x1402e06cc: call 0x1400021d0
0x1402e06d1: mov rdx, qword ptr [rbp + 0x230]
0x1402e06d8: test rdx, rdx
0x1402e06db: je 0x1402e06ef
0x1402e06dd: mov r8d, 1
0x1402e06e3: mov rcx, qword ptr [rbp + 0x1c0]
0x1402e06ea: call 0x1400021d0
0x1402e06ef: mov rdx, qword ptr [rbp + 0x288]
0x1402e06f6: test rdx, rdx
0x1402e06f9: je 0x1402e070d
0x1402e06fb: mov r8d, 1
0x1402e0701: mov rcx, qword ptr [rbp + 0x1b8]
0x1402e0708: call 0x1400021d0
0x1402e070d: mov rdx, qword ptr [rbp + 0x2b8]
0x1402e0714: test rdx, rdx
0x1402e0717: je 0x1402e072b
0x1402e0719: mov r8d, 1
0x1402e071f: mov rcx, qword ptr [rbp + 0x1b0]
0x1402e0726: call 0x1400021d0
0x1402e072b: mov rdx, qword ptr [rbp + 0x2a0]
0x1402e0732: test rdx, rdx
0x1402e0735: je 0x1402e0749
0x1402e0737: mov r8d, 1
0x1402e073d: mov rcx, qword ptr [rbp + 0x1a8]
0x1402e0744: call 0x1400021d0
0x1402e0749: mov rdx, qword ptr [rbp + 0x2b0]
0x1402e0750: test rdx, rdx
0x1402e0753: je 0x1402e0767
0x1402e0755: mov r8d, 1
0x1402e075b: mov rcx, qword ptr [rbp + 0x1a0]
0x1402e0762: call 0x1400021d0
0x1402e0767: mov rdx, qword ptr [rbp + 0x2d0]
0x1402e076e: test rdx, rdx
0x1402e0771: movzx ecx, byte ptr [rbp + 0x2eb]
0x1402e0778: je 0x1402df8c5
0x1402e077e: mov r8d, 1
0x1402e0784: mov rcx, qword ptr [rbp + 0x198]
0x1402e078b: call 0x1400021d0
0x1402e0790: movzx ecx, byte ptr [rbp + 0x2eb]
0x1402e0797: jmp 0x1402df8c5
0x1402e079c: cmp rdx, rax
0x1402e079f: jae 0x1402e07ac
0x1402e07a1: mov r8, qword ptr [rcx + rdx*8]
0x1402e07a5: mov eax, 1
0x1402e07aa: jmp 0x1402e07ae
0x1402e07ac: xor eax, eax
0x1402e07ae: mov rdx, qword ptr [rbp - 0x50]
0x1402e07b2: mov r9, qword ptr [rbp + 0x2d8]
0x1402e07b9: mov r10d, dword ptr [rbp + 0x2ec]
0x1402e07c0: mov dword ptr [r9], r10d
0x1402e07c3: mov r11, qword ptr [rbp + 0x2e0]
0x1402e07ca: mov qword ptr [r11], rax
0x1402e07cd: mov qword ptr [r11 + 8], r8
0x1402e07d1: test rdx, rdx
0x1402e07d4: je 0x1402e07fa
0x1402e07d6: shl rdx, 3
0x1402e07da: mov r8d, 8
0x1402e07e0: call 0x1400021d0
0x1402e07e5: mov r11, qword ptr [rbp + 0x2e0]
0x1402e07ec: mov r10d, dword ptr [rbp + 0x2ec]
0x1402e07f3: mov r9, qword ptr [rbp + 0x2d8]
0x1402e07fa: mov dword ptr [r9], r10d
0x1402e07fd: inc qword ptr [r11 + 0x1a8]
0x1402e0804: movzx ecx, byte ptr [rbp + 0x2eb]
0x1402e080b: jmp 0x1402df8c5
0x1402e0810: call 0x140002200
0x1402e0815: mov ecx, 7
0x1402e081a: mov edx, 1
0x1402e081f: call 0x1400021c0
0x1402e0824: test rax, rax
0x1402e0827: je 0x1402e0bfa
0x1402e082d: mov dword ptr [rax + 3], 0x676e696e
0x1402e0834: mov qword ptr [rbp + 0x268], rax
0x1402e083b: mov dword ptr [rax], 0x6e696f6a
0x1402e0841: mov rax, qword ptr [rbp + 0x2d8]
0x1402e0848: mov ecx, dword ptr [rbp + 0x2ec]
0x1402e084e: mov dword ptr [rax], ecx
0x1402e0850: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e0857: mov rdx, qword ptr [rcx + 0x10]
0x1402e085b: test rdx, rdx
0x1402e085e: je 0x1402e087d
0x1402e0860: mov rax, qword ptr [rbp + 0x2e0]
0x1402e0867: mov rcx, qword ptr [rax + 0x18]
0x1402e086b: mov r8d, 1
0x1402e0871: call 0x1400021d0
0x1402e0876: mov rcx, qword ptr [rbp + 0x2e0]
0x1402e087d: mov qword ptr [rcx + 0x10], 7
0x1402e0885: mov rax, qword ptr [rbp + 0x268]
0x1402e088c: mov qword ptr [rcx + 0x18], rax
0x1402e0890: mov qword ptr [rcx + 0x20], 7
0x1402e0898: mov rdx, qword ptr [rbp + 0x228]
0x1402e089f: movzx eax, byte ptr [rdx + 0x30]
0x1402e08a3: mov byte ptr [rbp + 0x268], al
0x1402e08a9: movzx eax, byte ptr [rdx + 0x31]
0x1402e08ad: mov byte ptr [rbp + 0x2c6], al
0x1402e08b3: movzx eax, byte ptr [rdx + 0x32]
0x1402e08b7: mov byte ptr [rbp + 0x2c7], al
0x1402e08bd: mov byte ptr [rbp + 0x2ea], 0
0x1402e08c4: lea rcx, [rbp + 0x170]
0x1402e08cb: call 0x146034930
0x1402e08d0: nop 
0x1402e08d1: lea rcx, [rbp + 0x270]
0x1402e08d8: mov rdx, qword ptr [rbp + 0x150]
0x1402e08df: call 0x146034930
0x1402e08e4: nop 
0x1402e08e5: mov rdx, qword ptr [rbp + 0x158]
0x1402e08ec: movzx eax, byte ptr [rdx + 4]
0x1402e08f0: lea r8, [rbp - 0x48]
0x1402e08f4: mov byte ptr [r8 + 0x37], al
0x1402e08f8: mov eax, dword ptr [rdx]
0x1402e08fa: mov dword ptr [r8 + 0x33], eax
0x1402e08fe: mov rax, qword ptr [rbp + 0x228]
0x1402e0905: movzx eax, byte ptr [rax + 0x38]
0x1402e0909: mov rcx, qword ptr [rbp + 0x180]
0x1402e0910: mov qword ptr [rbp + 0x200], rcx
0x1402e0917: movups xmm0, xmmword ptr [rbp + 0x170]
0x1402e091e: movaps xmmword ptr [rbp + 0x1f0], xmm0
0x1402e0925: mov rcx, qword ptr [rbp + 0x280]
0x1402e092c: lea rdx, [rbp + 0x208]
0x1402e0933: mov qword ptr [rdx + 0x10], rcx
0x1402e0937: movups xmm0, xmmword ptr [rbp + 0x270]
0x1402e093e: movups xmmword ptr [rdx], xmm0
0x1402e0941: movaps xmm0, xmmword ptr [rbp + 0x1f0]
0x1402e0948: mov rcx, qword ptr [rbp + 0x200]
0x1402e094f: mov rdx, qword ptr [rbp + 0x208]
0x1402e0956: movaps xmm1, xmmword ptr [rbp + 0x210]
0x1402e095d: movups xmmword ptr [r8 + 0x20], xmm1
0x1402e0962: mov qword ptr [r8 + 0x10], rcx
0x1402e0966: mov qword ptr [r8 + 0x18], rdx
0x1402e096a: movups xmmword ptr [r8], xmm0
0x1402e096e: movzx ecx, byte ptr [rbp + 0x268]
0x1402e0975: mov byte ptr [rbp - 0x18], cl
0x1402e0978: movzx ecx, byte ptr [rbp + 0x2c6]
0x1402e097f: mov byte ptr [rbp - 0x17], cl
0x1402e0982: movzx ecx, byte ptr [rbp + 0x2c7]
0x1402e0989: mov byte ptr [rbp - 0x16], cl
0x1402e098c: mov byte ptr [rbp - 0x10], al
0x1402e098f: mov dword ptr [rbp - 0x50], 0xc
0x1402e0996: mov byte ptr [rbp + 0x2ea], 0
0x1402e099d: mov rcx, qword ptr [rbp + 0x2a8]
0x1402e09a4: lea rdx, [rbp - 0x50]
0x1402e09a8: call 0x140246550
0x1402e09ad: nop 
0x1402e09ae: mov rax, qword ptr [rbp + 0x258]
0x1402e09b5: mov qword ptr [rbp - 0x48], rax
0x1402e09b9: mov rax, qword ptr [rbp + 0x1e8]
0x1402e09c0: mov qword ptr [rbp - 0x40], rax
0x1402e09c4: mov rax, qword ptr [rbp + 0x2c8]
0x1402e09cb: mov qword ptr [rbp - 0x38], rax
0x1402e09cf: mov qword ptr [rbp - 0x30], 0
0x1402e09d7: mov qword ptr [rbp - 0x28], 1
0x1402e09df: mov qword ptr [rbp - 0x20], 0
0x1402e09e7: mov dword ptr [rbp - 0x50], 0x18
0x1402e09ee: mov byte ptr [rbp + 0x2ea], 1
0x1402e09f5: mov rcx, qword ptr [rbp + 0x2a8]
0x1402e09fc: lea rdx, [rbp - 0x50]
0x1402e0a00: call 0x140246550
0x1402e0a05: nop 
0x1402e0a06: mov rdx, qword ptr [rbp + 0x250]
0x1402e0a0d: test rdx, rdx
0x1402e0a10: je 0x1402e0a24
0x1402e0a12: mov r8d, 1
0x1402e0a18: mov rcx, qword ptr [rbp + 0x1e0]
0x1402e0a1f: call 0x1400021d0
0x1402e0a24: mov rdx, qword ptr [rbp + 0x248]
0x1402e0a2b: test rdx, rdx
0x1402e0a2e: je 0x1402e0a42
0x1402e0a30: mov r8d, 1
0x1402e0a36: mov rcx, qword ptr [rbp + 0x1d8]
0x1402e0a3d: call 0x1400021d0
0x1402e0a42: mov rdx, qword ptr [rbp + 0x240]
0x1402e0a49: test rdx, rdx
0x1402e0a4c: je 0x1402e0a60
0x1402e0a4e: mov r8d, 1
0x1402e0a54: mov rcx, qword ptr [rbp + 0x1d0]
0x1402e0a5b: call 0x1400021d0
0x1402e0a60: mov rdx, qword ptr [rbp + 0x238]
0x1402e0a67: test rdx, rdx
0x1402e0a6a: je 0x1402e0a7e
0x1402e0a6c: mov r8d, 1
0x1402e0a72: mov rcx, qword ptr [rbp + 0x1c8]
0x1402e0a79: call 0x1400021d0
0x1402e0a7e: mov rdx, qword ptr [rbp + 0x230]
0x1402e0a85: test rdx, rdx
0x1402e0a88: je 0x1402e0a9c
0x1402e0a8a: mov r8d, 1
0x1402e0a90: mov rcx, qword ptr [rbp + 0x1c0]
0x1402e0a97: call 0x1400021d0
0x1402e0a9c: mov rdx, qword ptr [rbp + 0x288]
0x1402e0aa3: test rdx, rdx
0x1402e0aa6: je 0x1402e0aba
0x1402e0aa8: mov r8d, 1
0x1402e0aae: mov rcx, qword ptr [rbp + 0x1b8]
0x1402e0ab5: call 0x1400021d0
0x1402e0aba: mov rdx, qword ptr [rbp + 0x2b8]
0x1402e0ac1: test rdx, rdx
0x1402e0ac4: je 0x1402e0ad8
0x1402e0ac6: mov r8d, 1
0x1402e0acc: mov rcx, qword ptr [rbp + 0x1b0]
0x1402e0ad3: call 0x1400021d0
0x1402e0ad8: mov rdx, qword ptr [rbp + 0x2a0]
0x1402e0adf: test rdx, rdx
0x1402e0ae2: je 0x1402e0af6
0x1402e0ae4: mov r8d, 1
0x1402e0aea: mov rcx, qword ptr [rbp + 0x1a8]
0x1402e0af1: call 0x1400021d0
0x1402e0af6: mov rdx, qword ptr [rbp + 0x2b0]
0x1402e0afd: test rdx, rdx
0x1402e0b00: je 0x1402e0b14
0x1402e0b02: mov r8d, 1
0x1402e0b08: mov rcx, qword ptr [rbp + 0x1a0]
0x1402e0b0f: call 0x1400021d0
0x1402e0b14: mov rdx, qword ptr [rbp + 0x2d0]
0x1402e0b1b: test rdx, rdx
0x1402e0b1e: mov r11, qword ptr [rbp + 0x2e0]
0x1402e0b25: mov r9, qword ptr [rbp + 0x2d8]
0x1402e0b2c: mov r10d, dword ptr [rbp + 0x2ec]
0x1402e0b33: je 0x1402e07fa
0x1402e0b39: mov r8d, 1
0x1402e0b3f: mov rcx, qword ptr [rbp + 0x198]
0x1402e0b46: jmp 0x1402e07e0
0x1402e0b4b: mov rax, qword ptr [rbp - 0x48]
0x1402e0b4f: mov qword ptr [rbp + 0x2d0], rax
0x1402e0b56: cmp rdx, 0x15
0x1402e0b5a: jae 0x1402e0bbc
0x1402e0b5c: mov rcx, qword ptr [rbp + 0x2d0]
0x1402e0b63: lea rax, [rcx + rdx*8]
0x1402e0b67: add rcx, 8
0x1402e0b6b: mov edx, 8
0x1402e0b70: jmp 0x1402e0b89
0x1402e0b72: mov r9, r11
0x1402e0b75: mov qword ptr [r9], r8
0x1402e0b78: add rcx, 8
0x1402e0b7c: add rdx, 8
0x1402e0b80: cmp rcx, rax
0x1402e0b83: je 0x1402e0300
0x1402e0b89: mov r10, qword ptr [rcx - 8]
0x1402e0b8d: mov r8, qword ptr [rcx]
0x1402e0b90: cmp r8, r10
0x1402e0b93: jge 0x1402e0b78
0x1402e0b95: mov r9, rdx
0x1402e0b98: mov r11, qword ptr [rbp + 0x2d0]
0x1402e0b9f: mov qword ptr [r11 + r9], r10
0x1402e0ba3: cmp r9, 8
0x1402e0ba7: je 0x1402e0b72
0x1402e0ba9: mov r10, qword ptr [r11 + r9 - 0x10]
0x1402e0bae: add r9, -8
0x1402e0bb2: cmp r8, r10
0x1402e0bb5: jl 0x1402e0b9f
0x1402e0bb7: add r9, r11
0x1402e0bba: jmp 0x1402e0b75
0x1402e0bbc: mov rcx, qword ptr [rbp + 0x2d0]
0x1402e0bc3: lea r8, [rbp + 0x297]
0x1402e0bca: call 0x140276190
0x1402e0bcf: nop 
0x1402e0bd0: jmp 0x1402e0300
0x1402e0bd5: add rsp, 0x378
0x1402e0bdc: pop rbx
0x1402e0bdd: pop rdi
0x1402e0bde: pop rsi
0x1402e0bdf: pop r12
0x1402e0be1: pop r13
0x1402e0be3: pop r14
0x1402e0be5: pop r15
0x1402e0be7: pop rbp
0x1402e0be8: ret 
0x1402e0be9: mov ecx, 1
0x1402e0bee: mov edx, 3
0x1402e0bf3: call 0x14620896b
0x1402e0bf8: ud2 
0x1402e0bfa: mov byte ptr [rbp + 0x2ea], 0
0x1402e0c01: mov ecx, 1
0x1402e0c06: mov edx, 7
0x1402e0c0b: call 0x14620896b
0x1402e0c10: nop 
0x1402e0c11: ud2 
