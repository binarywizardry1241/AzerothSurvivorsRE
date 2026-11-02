0x14021ca40: push r15
0x14021ca42: push r14
0x14021ca44: push r13
0x14021ca46: push r12
0x14021ca48: push rsi
0x14021ca49: push rdi
0x14021ca4a: push rbp
0x14021ca4b: push rbx
0x14021ca4c: sub rsp, 0x98
0x14021ca53: mov r13, qword ptr [rdx]
0x14021ca56: mov rax, qword ptr [rdx + 8]
0x14021ca5a: mov r15, qword ptr [r8]
0x14021ca5d: cmp byte ptr [r15 + 0x12c], 0
0x14021ca65: je 0x14021d238
0x14021ca6b: cmp byte ptr [r15 + 0x132], 0
0x14021ca73: je 0x14021d238
0x14021ca79: mov rcx, qword ptr [rsp + 0x100]
0x14021ca81: mov r12, qword ptr [r8 + 0x10]
0x14021ca85: mov r10d, dword ptr [r8 + 0x1c]
0x14021ca89: mov rdx, qword ptr [r9]
0x14021ca8c: mov qword ptr [rsp + 0x78], rdx
0x14021ca91: mov rcx, qword ptr [rcx]
0x14021ca94: mov qword ptr [rsp + 0x70], rcx
0x14021ca99: cmp qword ptr [r15 + 0x40], 0
0x14021ca9e: je 0x14021cb0c
0x14021caa0: mov rcx, qword ptr [r15 + 8]
0x14021caa4: mov rdx, qword ptr [r15 + 0x10]
0x14021caa8: cmp rdx, 4
0x14021caac: je 0x14021d22c
0x14021cab2: cmp rdx, 6
0x14021cab6: je 0x14021caf3
0x14021cab8: cmp rdx, 7
0x14021cabc: jne 0x14021cb0c
0x14021cabe: mov edx, 0x74736f68
0x14021cac3: xor edx, dword ptr [rcx]
0x14021cac5: mov r8d, 0x676e6974
0x14021cacb: xor r8d, dword ptr [rcx + 3]
0x14021cacf: or r8d, edx
0x14021cad2: je 0x14021d238
0x14021cad8: mov edx, 0x6e696f6a
0x14021cadd: xor edx, dword ptr [rcx]
0x14021cadf: mov r8d, 0x676e696e
0x14021cae5: xor r8d, dword ptr [rcx + 3]
0x14021cae9: or r8d, edx
0x14021caec: jne 0x14021cb0c
0x14021caee: jmp 0x14021d238
0x14021caf3: mov edx, 0x6e696f6a
0x14021caf8: xor edx, dword ptr [rcx]
0x14021cafa: movzx ecx, word ptr [rcx + 4]
0x14021cafe: xor ecx, 0x6465
0x14021cb04: or ecx, edx
0x14021cb06: je 0x14021d238
0x14021cb0c: mov dword ptr [rsp + 0x54], r10d
0x14021cb11: mov rcx, qword ptr [r13]
0x14021cb15: xor r10d, r10d
0x14021cb18: mov rdx, rcx
0x14021cb1b: sub rdx, qword ptr [rax + 0x18]
0x14021cb1f: cmovb rdx, r10
0x14021cb23: sub rcx, qword ptr [rax + 0x38]
0x14021cb27: cmovb rcx, r10
0x14021cb2b: imul rbp, rdx, 0x58
0x14021cb2f: add rbp, qword ptr [rax + 8]
0x14021cb33: mov r8, qword ptr [rax + 0x10]
0x14021cb37: sub r8, rdx
0x14021cb3a: cmovb r8, r10
0x14021cb3e: mov edx, 8
0x14021cb43: cmovb rbp, rdx
0x14021cb47: imul rbx, rcx, 0x58
0x14021cb4b: add rbx, qword ptr [rax + 0x28]
0x14021cb4f: mov r9, qword ptr [rax + 0x30]
0x14021cb53: sub r9, rcx
0x14021cb56: cmovb rbx, rdx
0x14021cb5a: cmovb r9, r10
0x14021cb5e: mov rax, qword ptr [rax + 0x40]
0x14021cb62: sub rax, r9
0x14021cb65: sub rax, r8
0x14021cb68: mov qword ptr [r13], rax
0x14021cb6c: imul rax, r8, 0x58
0x14021cb70: add rax, rbp
0x14021cb73: mov qword ptr [rsp + 0x90], rax
0x14021cb7b: imul rax, r9, 0x58
0x14021cb7f: add rax, rbx
0x14021cb82: mov qword ptr [rsp + 0x88], rax
0x14021cb8a: lea rax, [r15 + 0xf0]
0x14021cb91: mov qword ptr [rsp + 0x48], rax
0x14021cb96: lea rax, [r15 + 0xd8]
0x14021cb9d: mov qword ptr [rsp + 0x58], rax
0x14021cba2: lea rax, [r15 + 0xa8]
0x14021cba9: mov qword ptr [rsp + 0x40], rax
0x14021cbae: lea rax, [r15 + 0xc0]
0x14021cbb5: mov qword ptr [rsp + 0x38], rax
0x14021cbba: lea rax, [r15 + 0x90]
0x14021cbc1: mov qword ptr [rsp + 0x30], rax
0x14021cbc6: xor edi, edi
0x14021cbc8: mov qword ptr [rsp + 0x80], r12
0x14021cbd0: mov edx, dword ptr [rsp + 0x54]
0x14021cbd4: mov r8, qword ptr [rsp + 0x90]
0x14021cbdc: mov r9, qword ptr [rsp + 0x88]
0x14021cbe4: lea r10, [rip + 0x5cf799d]
0x14021cbeb: nop dword ptr [rax + rax]
0x14021cbf0: test rbp, rbp
0x14021cbf3: je 0x14021cc10
0x14021cbf5: cmp rbp, r8
0x14021cbf8: je 0x14021cc10
0x14021cbfa: lea rcx, [rbp + 0x58]
0x14021cbfe: mov rax, rbp
0x14021cc01: inc qword ptr [r13]
0x14021cc05: mov rbp, rcx
0x14021cc08: cmp byte ptr [rax + 0x54], 0
0x14021cc0c: jne 0x14021cbf0
0x14021cc0e: jmp 0x14021cc38
0x14021cc10: test rbx, rbx
0x14021cc13: je 0x14021d219
0x14021cc19: cmp rbx, r9
0x14021cc1c: je 0x14021d219
0x14021cc22: mov rax, rbx
0x14021cc25: add rbx, 0x58
0x14021cc29: xor ecx, ecx
0x14021cc2b: inc qword ptr [r13]
0x14021cc2f: mov rbp, rcx
0x14021cc32: cmp byte ptr [rax + 0x54], 0
0x14021cc36: jne 0x14021cbf0
0x14021cc38: movzx esi, byte ptr [r15 + 0x132]
0x14021cc40: movzx ecx, sil
0x14021cc44: movsxd rcx, dword ptr [r10 + rcx*4]
0x14021cc48: add rcx, r10
0x14021cc4b: jmp rcx
0x14021cc4d: mov dword ptr [r12], edx
0x14021cc51: mov ecx, dword ptr [rax + 8]
0x14021cc54: cmp rcx, 0x1c
0x14021cc58: ja 0x14021cbf0
0x14021cc5a: lea r11, [rip + 0x5cf7b0f]
0x14021cc61: movsxd rcx, dword ptr [r11 + rcx*4]
0x14021cc65: add rcx, r11
0x14021cc68: jmp rcx
0x14021cc6a: mov dword ptr [r12], edx
0x14021cc6e: mov ecx, dword ptr [rax + 8]
0x14021cc71: cmp rcx, 0x1c
0x14021cc75: ja 0x14021cbf0
0x14021cc7b: lea r11, [rip + 0x5cf791e]
0x14021cc82: movsxd rcx, dword ptr [r11 + rcx*4]
0x14021cc86: add rcx, r11
0x14021cc89: jmp rcx
0x14021cc8b: mov dword ptr [r12], edx
0x14021cc8f: mov ecx, dword ptr [rax + 8]
0x14021cc92: cmp rcx, 0x1c
0x14021cc96: ja 0x14021cbf0
0x14021cc9c: lea r11, [rip + 0x5cf79e5]
0x14021cca3: movsxd rcx, dword ptr [r11 + rcx*4]
0x14021cca7: add rcx, r11
0x14021ccaa: jmp rcx
0x14021ccac: mov dword ptr [r12], edx
0x14021ccb0: mov ecx, dword ptr [rax + 8]
0x14021ccb3: cmp rcx, 0x1c
0x14021ccb7: ja 0x14021cbf0
0x14021ccbd: lea r11, [rip + 0x5cf7950]
0x14021ccc4: movsxd rcx, dword ptr [r11 + rcx*4]
0x14021ccc8: add rcx, r11
0x14021cccb: jmp rcx
0x14021cccd: mov dword ptr [r12], edx
0x14021ccd1: mov ecx, dword ptr [rax + 8]
0x14021ccd4: cmp rcx, 0x1c
0x14021ccd8: ja 0x14021cbf0
0x14021ccde: lea r11, [rip + 0x5cf7a17]
0x14021cce5: movsxd rcx, dword ptr [r11 + rcx*4]
0x14021cce9: add rcx, r11
0x14021ccec: jmp rcx
0x14021ccee: mov ecx, 0x78
0x14021ccf3: mov qword ptr [rsp + 0x28], rcx
0x14021ccf8: mov r14, qword ptr [rsp + 0x38]
0x14021ccfd: jmp 0x14021ceca
0x14021cd02: movzx r9d, byte ptr [r15 + 0x131]
0x14021cd0a: mov dword ptr [r12], edx
0x14021cd0e: mov rcx, r15
0x14021cd11: mov rdx, qword ptr [rsp + 0x70]
0x14021cd16: mov r8, qword ptr [rsp + 0x78]
0x14021cd1b: call 0x14020f670
0x14021cd20: mov dil, 1
0x14021cd23: jmp 0x14021cbd0
0x14021cd28: mov ecx, 5
0x14021cd2d: mov qword ptr [rsp + 0x28], rcx
0x14021cd32: mov r14, qword ptr [rsp + 0x58]
0x14021cd37: jmp 0x14021ceca
0x14021cd3c: mov rax, qword ptr [rsp + 0x58]
0x14021cd41: jmp 0x14021ce5a
0x14021cd46: mov al, 5
0x14021cd48: jmp 0x14021d19d
0x14021cd4d: mov esi, 0x20
0x14021cd52: mov r14, qword ptr [rsp + 0x48]
0x14021cd57: mov rcx, qword ptr [r14 + 8]
0x14021cd5b: mov rdx, qword ptr [r14 + 0x10]
0x14021cd5f: cmp rdx, 0x20
0x14021cd63: jb 0x14021cdd9
0x14021cd65: jmp 0x14021ce0b
0x14021cd6a: mov ecx, 0x20
0x14021cd6f: mov qword ptr [rsp + 0x28], rcx
0x14021cd74: mov r14, qword ptr [rsp + 0x40]
0x14021cd79: jmp 0x14021ceca
0x14021cd7e: mov esi, 0x78
0x14021cd83: mov r14, qword ptr [rsp + 0x38]
0x14021cd88: mov rcx, qword ptr [r14 + 8]
0x14021cd8c: mov rdx, qword ptr [r14 + 0x10]
0x14021cd90: cmp rdx, 0x20
0x14021cd94: jb 0x14021cdd9
0x14021cd96: jmp 0x14021ce0b
0x14021cd98: mov rax, qword ptr [rsp + 0x40]
0x14021cd9d: jmp 0x14021ce5a
0x14021cda2: mov al, 1
0x14021cda4: jmp 0x14021d19d
0x14021cda9: mov rax, qword ptr [rsp + 0x30]
0x14021cdae: jmp 0x14021ce5a
0x14021cdb3: mov al, 2
0x14021cdb5: jmp 0x14021d19d
0x14021cdba: mov al, 3
0x14021cdbc: jmp 0x14021d19d
0x14021cdc1: mov esi, 0x20
0x14021cdc6: mov r14, qword ptr [rsp + 0x40]
0x14021cdcb: mov rcx, qword ptr [r14 + 8]
0x14021cdcf: mov rdx, qword ptr [r14 + 0x10]
0x14021cdd3: cmp rdx, 0x20
0x14021cdd7: jae 0x14021ce0b
0x14021cdd9: call 0x145cefab0
0x14021cdde: mov dil, 1
0x14021cde1: cmp rax, rsi
0x14021cde4: jae 0x14021cbd0
0x14021cdea: jmp 0x14021ce1c
0x14021cdec: mov rax, qword ptr [rsp + 0x38]
0x14021cdf1: jmp 0x14021ce5a
0x14021cdf3: mov esi, 0x20
0x14021cdf8: mov r14, qword ptr [rsp + 0x30]
0x14021cdfd: mov rcx, qword ptr [r14 + 8]
0x14021ce01: mov rdx, qword ptr [r14 + 0x10]
0x14021ce05: cmp rdx, 0x20
0x14021ce09: jb 0x14021cdd9
0x14021ce0b: call 0x145cef490
0x14021ce10: mov dil, 1
0x14021ce13: cmp rax, rsi
0x14021ce16: jae 0x14021cbd0
0x14021ce1c: mov rsi, r15
0x14021ce1f: mov r15, qword ptr [r14 + 0x10]
0x14021ce23: cmp qword ptr [r14], r15
0x14021ce26: je 0x14021d1f4
0x14021ce2c: mov rax, qword ptr [r14 + 8]
0x14021ce30: mov byte ptr [rax + r15], 0x20
0x14021ce35: inc r15
0x14021ce38: mov qword ptr [r14 + 0x10], r15
0x14021ce3c: mov r15, rsi
0x14021ce3f: jmp 0x14021cbd0
0x14021ce44: mov ecx, 0x20
0x14021ce49: mov qword ptr [rsp + 0x28], rcx
0x14021ce4e: mov r14, qword ptr [rsp + 0x30]
0x14021ce53: jmp 0x14021ceca
0x14021ce55: mov rax, qword ptr [rsp + 0x48]
0x14021ce5a: mov rcx, qword ptr [rax + 0x10]
0x14021ce5e: mov dil, 1
0x14021ce61: test rcx, rcx
0x14021ce64: je 0x14021cbd0
0x14021ce6a: mov r10, qword ptr [rax + 8]
0x14021ce6e: mov rdx, 0xffffffffffffffff
0x14021ce75: cmp byte ptr [r10 + rcx - 1], 0
0x14021ce7b: jns 0x14021d1e8
0x14021ce81: movzx r8d, byte ptr [r10 + rcx - 2]
0x14021ce87: cmp r8b, 0xbf
0x14021ce8b: jg 0x14021d1b0
0x14021ce91: movzx r9d, byte ptr [r10 + rcx - 3]
0x14021ce97: cmp r9b, 0xbf
0x14021ce9b: jg 0x14021d1b6
0x14021cea1: movzx r10d, byte ptr [r10 + rcx - 4]
0x14021cea7: and r10d, 7
0x14021ceab: shl r10d, 6
0x14021ceaf: and r9d, 0x3f
0x14021ceb3: or r9d, r10d
0x14021ceb6: jmp 0x14021d1ba
0x14021cebb: mov ecx, 0x20
0x14021cec0: mov qword ptr [rsp + 0x28], rcx
0x14021cec5: mov r14, qword ptr [rsp + 0x48]
0x14021ceca: movzx r10d, byte ptr [rax + 0x10]
0x14021cecf: lea rcx, [r10 - 0x17]
0x14021ced3: cmp r10, 0x18
0x14021ced7: mov edx, 0
0x14021cedc: cmovb rcx, rdx
0x14021cee0: test rcx, rcx
0x14021cee3: mov qword ptr [rsp + 0x68], r15
0x14021cee8: mov qword ptr [rsp + 0x60], r13
0x14021ceed: je 0x14021cefa
0x14021ceef: cmp ecx, 1
0x14021cef2: jne 0x14021cf10
0x14021cef4: mov rdi, qword ptr [rax + 0x18]
0x14021cef8: jmp 0x14021cf18
0x14021cefa: cmp r10b, 0x18
0x14021cefe: jae 0x14021d254
0x14021cf04: add rax, 0x11
0x14021cf08: add r10, rax
0x14021cf0b: mov rdi, rax
0x14021cf0e: jmp 0x14021cf50
0x14021cf10: mov rdi, qword ptr [rax + 0x18]
0x14021cf14: add rdi, 0x10
0x14021cf18: mov r10, qword ptr [rax + 0x20]
0x14021cf1c: add r10, rdi
0x14021cf1f: jmp 0x14021cf50
0x14021cf21: or cl, 0xc0
0x14021cf24: mov byte ptr [rdx + r12], cl
0x14021cf28: mov byte ptr [rdx + r12 + 1], al
0x14021cf2d: mov eax, 2
0x14021cf32: add r12, rax
0x14021cf35: mov qword ptr [r14 + 0x10], r12
0x14021cf39: mov r12, qword ptr [rsp + 0x80]
0x14021cf41: nop word ptr cs:[rax + rax]
0x14021cf50: cmp rdi, r10
0x14021cf53: je 0x14021d189
0x14021cf59: movzx edx, byte ptr [rdi]
0x14021cf5c: movzx eax, dl
0x14021cf5f: test al, al
0x14021cf61: js 0x14021cf70
0x14021cf63: inc rdi
0x14021cf66: jmp 0x14021cfd0
0x14021cf68: nop dword ptr [rax + rax]
0x14021cf70: mov ecx, eax
0x14021cf72: and ecx, 0x1f
0x14021cf75: movzx r8d, byte ptr [rdi + 1]
0x14021cf7a: and r8d, 0x3f
0x14021cf7e: cmp al, 0xdf
0x14021cf80: jbe 0x14021cfb1
0x14021cf82: movzx eax, byte ptr [rdi + 2]
0x14021cf86: shl r8d, 6
0x14021cf8a: and eax, 0x3f
0x14021cf8d: or eax, r8d
0x14021cf90: cmp dl, 0xf0
0x14021cf93: jb 0x14021cfbf
0x14021cf95: movzx edx, byte ptr [rdi + 3]
0x14021cf99: add rdi, 4
0x14021cf9d: and ecx, 7
0x14021cfa0: shl ecx, 0x12
0x14021cfa3: shl eax, 6
0x14021cfa6: and edx, 0x3f
0x14021cfa9: or edx, eax
0x14021cfab: or edx, ecx
0x14021cfad: mov eax, edx
0x14021cfaf: jmp 0x14021cfd0
0x14021cfb1: add rdi, 2
0x14021cfb5: shl ecx, 6
0x14021cfb8: or ecx, r8d
0x14021cfbb: mov eax, ecx
0x14021cfbd: jmp 0x14021cfd0
0x14021cfbf: add rdi, 3
0x14021cfc3: shl ecx, 0xc
0x14021cfc6: or eax, ecx
0x14021cfc8: nop dword ptr [rax + rax]
0x14021cfd0: cmp eax, 0x20
0x14021cfd3: setb cl
0x14021cfd6: lea edx, [rax - 0x7f]
0x14021cfd9: cmp edx, 0x21
0x14021cfdc: setb dl
0x14021cfdf: or dl, cl
0x14021cfe1: jne 0x14021cf50
0x14021cfe7: mov r13, r10
0x14021cfea: lea ecx, [rax - 0x61]
0x14021cfed: mov r15d, eax
0x14021cff0: and r15d, 0x5f
0x14021cff4: cmp ecx, 0x1a
0x14021cff7: cmovae r15d, eax
0x14021cffb: cmp sil, 4
0x14021cfff: cmovne r15d, eax
0x14021d003: mov rcx, qword ptr [r14 + 8]
0x14021d007: mov rdx, qword ptr [r14 + 0x10]
0x14021d00b: cmp rdx, 0x20
0x14021d00f: jae 0x14021d030
0x14021d011: call 0x145cefab0
0x14021d016: cmp rax, qword ptr [rsp + 0x28]
0x14021d01b: mov r10, r13
0x14021d01e: jae 0x14021cf50
0x14021d024: jmp 0x14021d043
0x14021d026: nop word ptr cs:[rax + rax]
0x14021d030: call 0x145cef490
0x14021d035: cmp rax, qword ptr [rsp + 0x28]
0x14021d03a: mov r10, r13
0x14021d03d: jae 0x14021cf50
0x14021d043: cmp sil, 4
0x14021d047: jne 0x14021d06a
0x14021d049: lea eax, [r15 - 0x30]
0x14021d04d: cmp eax, 0xa
0x14021d050: jb 0x14021d064
0x14021d052: mov eax, r15d
0x14021d055: and eax, 0xffffffdf
0x14021d058: add eax, -0x41
0x14021d05b: cmp eax, 0x19
0x14021d05e: ja 0x14021cf50
0x14021d064: mov r12, qword ptr [r14 + 0x10]
0x14021d068: jmp 0x14021d077
0x14021d06a: mov r12, qword ptr [r14 + 0x10]
0x14021d06e: cmp r15d, 0x80
0x14021d075: jae 0x14021d092
0x14021d077: cmp qword ptr [r14], r12
0x14021d07a: je 0x14021d13f
0x14021d080: mov rax, qword ptr [r14 + 8]
0x14021d084: mov byte ptr [rax + r12], r15b
0x14021d088: mov eax, 1
0x14021d08d: jmp 0x14021cf32
0x14021d092: cmp r15d, 0x10000
0x14021d099: mov r8d, 4
0x14021d09f: sbb r8, 0
0x14021d0a3: cmp r15d, 0x800
0x14021d0aa: mov eax, 2
0x14021d0af: cmovb r8, rax
0x14021d0b3: mov rax, qword ptr [r14]
0x14021d0b6: sub rax, r12
0x14021d0b9: cmp r8, rax
0x14021d0bc: ja 0x14021d167
0x14021d0c2: mov eax, r15d
0x14021d0c5: and al, 0x3f
0x14021d0c7: or al, 0x80
0x14021d0c9: mov ecx, r15d
0x14021d0cc: shr ecx, 6
0x14021d0cf: mov rdx, qword ptr [r14 + 8]
0x14021d0d3: cmp r15d, 0x800
0x14021d0da: jb 0x14021cf21
0x14021d0e0: and cl, 0x3f
0x14021d0e3: or cl, 0x80
0x14021d0e6: mov r8d, r15d
0x14021d0e9: shr r8d, 0xc
0x14021d0ed: cmp r15d, 0xffff
0x14021d0f4: ja 0x14021d112
0x14021d0f6: or r8b, 0xe0
0x14021d0fa: mov byte ptr [rdx + r12], r8b
0x14021d0fe: mov byte ptr [rdx + r12 + 1], cl
0x14021d103: mov byte ptr [rdx + r12 + 2], al
0x14021d108: mov eax, 3
0x14021d10d: jmp 0x14021cf32
0x14021d112: and r8b, 0x3f
0x14021d116: or r8b, 0x80
0x14021d11a: shr r15d, 0x12
0x14021d11e: or r15b, 0xf0
0x14021d122: mov byte ptr [rdx + r12], r15b
0x14021d126: mov byte ptr [rdx + r12 + 1], r8b
0x14021d12b: mov byte ptr [rdx + r12 + 2], cl
0x14021d130: mov byte ptr [rdx + r12 + 3], al
0x14021d135: mov eax, 4
0x14021d13a: jmp 0x14021cf32
0x14021d13f: mov qword ptr [rsp + 0x20], 1
0x14021d148: mov r8d, 1
0x14021d14e: mov r9d, 1
0x14021d154: mov rcx, r14
0x14021d157: mov rdx, r12
0x14021d15a: call 0x145d14a10
0x14021d15f: mov r10, r13
0x14021d162: jmp 0x14021d080
0x14021d167: mov qword ptr [rsp + 0x20], 1
0x14021d170: mov r9d, 1
0x14021d176: mov rcx, r14
0x14021d179: mov rdx, r12
0x14021d17c: call 0x145d14a10
0x14021d181: mov r10, r13
0x14021d184: jmp 0x14021d0c2
0x14021d189: mov dil, 1
0x14021d18c: mov r15, qword ptr [rsp + 0x68]
0x14021d191: mov r13, qword ptr [rsp + 0x60]
0x14021d196: jmp 0x14021cbd0
0x14021d19b: mov al, 4
0x14021d19d: mov dword ptr [r12], edx
0x14021d1a1: mov byte ptr [r15 + 0x132], al
0x14021d1a8: mov dil, 1
0x14021d1ab: jmp 0x14021cbd0
0x14021d1b0: and r8d, 0x1f
0x14021d1b4: jmp 0x14021d1c5
0x14021d1b6: and r9d, 0xf
0x14021d1ba: shl r9d, 6
0x14021d1be: and r8d, 0x3f
0x14021d1c2: or r8d, r9d
0x14021d1c5: cmp r8d, 2
0x14021d1c9: jb 0x14021d1e8
0x14021d1cb: mov rdx, 0xfffffffffffffffe
0x14021d1d2: cmp r8d, 0x20
0x14021d1d6: jb 0x14021d1e8
0x14021d1d8: xor edx, edx
0x14021d1da: cmp r8d, 0x400
0x14021d1e1: setb dl
0x14021d1e4: or rdx, 0xfffffffffffffffc
0x14021d1e8: add rdx, rcx
0x14021d1eb: mov qword ptr [rax + 0x10], rdx
0x14021d1ef: jmp 0x14021cbd0
0x14021d1f4: mov qword ptr [rsp + 0x20], 1
0x14021d1fd: mov r8d, 1
0x14021d203: mov r9d, 1
0x14021d209: mov rcx, r14
0x14021d20c: mov rdx, r15
0x14021d20f: call 0x145d14a10
0x14021d214: jmp 0x14021ce2c
0x14021d219: test dil, 1
0x14021d21d: je 0x14021d240
0x14021d21f: mov dword ptr [r12], edx
0x14021d223: inc qword ptr [r15 + 0x120]
0x14021d22a: jmp 0x14021d240
0x14021d22c: cmp dword ptr [rcx], 0x7466656c
0x14021d232: jne 0x14021cb0c
0x14021d238: mov rax, qword ptr [rax + 0x40]
0x14021d23c: mov qword ptr [r13], rax
0x14021d240: add rsp, 0x98
0x14021d247: pop rbx
0x14021d248: pop rbp
0x14021d249: pop rdi
0x14021d24a: pop rsi
0x14021d24b: pop r12
0x14021d24d: pop r13
0x14021d24f: pop r14
0x14021d251: pop r15
0x14021d253: ret
0x14021d254: lea r9, [rip + 0x5cf36d5]
0x14021d25b: mov r8d, 0x17
0x14021d261: xor ecx, ecx
0x14021d263: mov rdx, r10
0x14021d266: call 0x145eb7570
0x14021d26b: ud2
