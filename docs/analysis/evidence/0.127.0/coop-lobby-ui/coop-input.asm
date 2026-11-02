0x1402deba0: push r15
0x1402deba2: push r14
0x1402deba4: push r13
0x1402deba6: push r12
0x1402deba8: push rsi
0x1402deba9: push rdi
0x1402debaa: push rbp
0x1402debab: push rbx
0x1402debac: sub rsp, 0x2d8
0x1402debb3: mov rax, qword ptr [rsp + 0x340]
0x1402debbb: mov rcx, qword ptr [rdx + 0x20]
0x1402debbf: mov qword ptr [rsp + 0x70], rcx
0x1402debc4: movups xmm0, xmmword ptr [rdx]
0x1402debc7: movups xmm1, xmmword ptr [rdx + 0x10]
0x1402debcb: movaps xmmword ptr [rsp + 0x60], xmm1
0x1402debd0: movaps xmmword ptr [rsp + 0x50], xmm0
0x1402debd5: movups xmm0, xmmword ptr [r8]
0x1402debd9: movups xmm1, xmmword ptr [r8 + 0x10]
0x1402debde: movups xmmword ptr [rsp + 0x88], xmm1
0x1402debe6: movups xmmword ptr [rsp + 0x78], xmm0
0x1402debeb: movups xmm0, xmmword ptr [r9]
0x1402debef: movups xmm1, xmmword ptr [r9 + 0x10]
0x1402debf4: movups xmmword ptr [rsp + 0xa8], xmm1
0x1402debfc: movups xmmword ptr [rsp + 0x98], xmm0
0x1402dec04: mov rcx, qword ptr [rax + 0x10]
0x1402dec08: mov qword ptr [rsp + 0xc8], rcx
0x1402dec10: movups xmm0, xmmword ptr [rax]
0x1402dec13: movups xmmword ptr [rsp + 0xb8], xmm0
0x1402dec1b: mov rbx, qword ptr [rsp + 0x98]
0x1402dec23: cmp byte ptr [rbx + 0x1b4], 0
0x1402dec2a: je 0x1402dec58
0x1402dec2c: mov rax, qword ptr [rsp + 0x78]
0x1402dec31: cmp byte ptr [rax + 0xd], 0
0x1402dec35: je 0x1402dec40
0x1402dec37: cmp dword ptr [rax], 0
0x1402dec3a: je 0x1402df1da
0x1402dec40: mov eax, dword ptr [rsp + 0xb4]
0x1402dec47: mov rcx, qword ptr [rsp + 0xa8]
0x1402dec4f: mov dword ptr [rcx], eax
0x1402dec51: mov byte ptr [rbx + 0x1b4], 0
0x1402dec58: xor eax, eax
0x1402dec5a: mov rcx, qword ptr [rsp + 0xb8]
0x1402dec62: mov r14, qword ptr [rsp + 0xc0]
0x1402dec6a: mov r15, qword ptr [rcx + 0xf8]
0x1402dec71: mov rdx, qword ptr [rcx + 0x100]
0x1402dec78: movzx ecx, byte ptr [rcx + 0x108]
0x1402dec7f: lea r8, [rdx*4]
0x1402dec87: xor r9d, r9d
0x1402dec8a: test cl, cl
0x1402dec8c: je 0x1402decc0
0x1402dec8e: nop 
0x1402dec90: cmp r8, r9
0x1402dec93: je 0x1402deced
0x1402dec95: mov r10d, dword ptr [r15 + r9]
0x1402dec99: mov r11, qword ptr [r14 + 0x1a8]
0x1402deca0: lea r10, [r10 + r10*8]
0x1402deca4: add r9, 4
0x1402deca8: cmp qword ptr [r11 + r10*8 + 0x10], 0
0x1402decae: je 0x1402dec90
0x1402decb0: jmp 0x1402dece4
0x1402decb2: nop word ptr cs:[rax + rax]
0x1402decc0: cmp r8, r9
0x1402decc3: je 0x1402deced
0x1402decc5: mov r10d, dword ptr [r15 + r9]
0x1402decc9: mov r11, qword ptr [r14 + 0x108]
0x1402decd0: lea r10, [r10 + r10*4]
0x1402decd4: shl r10, 5
0x1402decd8: add r9, 4
0x1402decdc: cmp qword ptr [r11 + r10 + 0x58], 0
0x1402dece2: je 0x1402decc0
0x1402dece4: test al, al
0x1402dece6: je 0x1402decf5
0x1402dece8: jmp 0x1402df1c6
0x1402deced: test al, al
0x1402decef: je 0x1402df1c6
0x1402decf5: lea r12, [r15 + rdx*4]
0x1402decf9: mov rax, qword ptr [rsp + 0x60]
0x1402decfe: mov qword ptr [rsp + 0x48], rax
0x1402ded03: mov r11, qword ptr [rsp + 0x70]
0x1402ded08: mov r13, qword ptr [rsp + 0x68]
0x1402ded0d: mov r9, qword ptr [rsp + 0x50]
0x1402ded12: mov r10, qword ptr [rsp + 0x58]
0x1402ded17: xor esi, esi
0x1402ded19: mov edi, 8
0x1402ded1e: test cl, cl
0x1402ded20: je 0x1402ded32
0x1402ded22: lea rcx, [rsp + 0x130]
0x1402ded2a: xor ebp, ebp
0x1402ded2c: cmp ebp, esi
0x1402ded2e: je 0x1402ded70
0x1402ded30: jmp 0x1402ded5a
0x1402ded32: lea rdx, [rip + 0x5f99bf7]
0x1402ded39: xor ebp, ebp
0x1402ded3b: cmp ebp, esi
0x1402ded3d: jne 0x1402dee39
0x1402ded43: jmp 0x1402dee50
0x1402ded48: nop dword ptr [rax + rax]
0x1402ded50: lea rax, [rax + rdx*8]
0x1402ded54: mov rdi, qword ptr [rax + 8]
0x1402ded58: xor ebp, ebp
0x1402ded5a: mov eax, ebp
0x1402ded5c: inc ebp
0x1402ded5e: mov rax, qword ptr [rdi + rax*8]
0x1402ded62: test eax, eax
0x1402ded64: jne 0x1402ded97
0x1402ded66: cmp ebp, esi
0x1402ded68: jne 0x1402ded5a
0x1402ded6a: nop word ptr [rax + rax]
0x1402ded70: cmp r15, r12
0x1402ded73: je 0x1402def0a
0x1402ded79: mov edx, dword ptr [r15]
0x1402ded7c: add r15, 4
0x1402ded80: mov rax, qword ptr [r14 + 0x1a8]
0x1402ded87: lea rdx, [rdx + rdx*8]
0x1402ded8b: mov rsi, qword ptr [rax + rdx*8 + 0x10]
0x1402ded90: test rsi, rsi
0x1402ded93: je 0x1402ded70
0x1402ded95: jmp 0x1402ded50
0x1402ded97: mov rdx, qword ptr [rsp + 0x48]
0x1402ded9c: test rdx, rdx
0x1402ded9f: mov r8, qword ptr [rsp + 0x20]
0x1402deda4: cmovne r8, r11
0x1402deda8: mov qword ptr [rsp + 0x130], rax
0x1402dedb0: mov qword ptr [rsp + 0x138], r9
0x1402dedb8: mov qword ptr [rsp + 0x140], r10
0x1402dedc0: mov qword ptr [rsp + 0x148], rdx
0x1402dedc8: mov qword ptr [rsp + 0x150], r13
0x1402dedd0: mov qword ptr [rsp + 0x20], r8
0x1402dedd5: mov qword ptr [rsp + 0x158], r8
0x1402deddd: mov qword ptr [rsp + 0x40], r11
0x1402dede2: lea rdx, [rip + 0x5f99b47]
0x1402dede9: mov qword ptr [rsp + 0x38], r13
0x1402dedee: mov qword ptr [rsp + 0x30], r9
0x1402dedf3: mov qword ptr [rsp + 0x28], r10
0x1402dedf8: call 0x1450b3990
0x1402dedfd: lea rcx, [rsp + 0x130]
0x1402dee05: mov r10, qword ptr [rsp + 0x28]
0x1402dee0a: mov r9, qword ptr [rsp + 0x30]
0x1402dee0f: mov r13, qword ptr [rsp + 0x38]
0x1402dee14: mov r11, qword ptr [rsp + 0x40]
0x1402dee19: cmp ebp, esi
0x1402dee1b: je 0x1402ded70
0x1402dee21: jmp 0x1402ded5a
0x1402dee26: nop word ptr cs:[rax + rax]
0x1402dee30: add rax, rcx
0x1402dee33: mov rdi, qword ptr [rax + 0x50]
0x1402dee37: xor ebp, ebp
0x1402dee39: mov eax, ebp
0x1402dee3b: shl rax, 4
0x1402dee3f: inc ebp
0x1402dee41: mov rax, qword ptr [rdi + rax]
0x1402dee45: test eax, eax
0x1402dee47: jne 0x1402dee7b
0x1402dee49: cmp ebp, esi
0x1402dee4b: jne 0x1402dee39
0x1402dee4d: nop dword ptr [rax]
0x1402dee50: cmp r15, r12
0x1402dee53: je 0x1402def0a
0x1402dee59: mov ecx, dword ptr [r15]
0x1402dee5c: add r15, 4
0x1402dee60: mov rax, qword ptr [r14 + 0x108]
0x1402dee67: lea rcx, [rcx + rcx*4]
0x1402dee6b: shl rcx, 5
0x1402dee6f: mov rsi, qword ptr [rax + rcx + 0x58]
0x1402dee74: test rsi, rsi
0x1402dee77: je 0x1402dee50
0x1402dee79: jmp 0x1402dee30
0x1402dee7b: mov r8, qword ptr [rsp + 0x48]
0x1402dee80: test r8, r8
0x1402dee83: mov rcx, qword ptr [rsp + 0x20]
0x1402dee88: cmovne rcx, r11
0x1402dee8c: mov qword ptr [rsp + 0x130], rax
0x1402dee94: mov qword ptr [rsp + 0x138], r9
0x1402dee9c: mov qword ptr [rsp + 0x140], r10
0x1402deea4: mov qword ptr [rsp + 0x148], r8
0x1402deeac: mov qword ptr [rsp + 0x150], r13
0x1402deeb4: mov qword ptr [rsp + 0x20], rcx
0x1402deeb9: mov qword ptr [rsp + 0x158], rcx
0x1402deec1: lea rcx, [rsp + 0x130]
0x1402deec9: mov qword ptr [rsp + 0x40], r11
0x1402deece: mov qword ptr [rsp + 0x38], r13
0x1402deed3: mov qword ptr [rsp + 0x30], r9
0x1402deed8: mov qword ptr [rsp + 0x28], r10
0x1402deedd: call 0x1450b3990
0x1402deee2: lea rdx, [rip + 0x5f99a47]
0x1402deee9: mov r10, qword ptr [rsp + 0x28]
0x1402deeee: mov r9, qword ptr [rsp + 0x30]
0x1402deef3: mov r13, qword ptr [rsp + 0x38]
0x1402deef8: mov r11, qword ptr [rsp + 0x40]
0x1402deefd: cmp ebp, esi
0x1402deeff: je 0x1402dee50
0x1402def05: jmp 0x1402dee39
0x1402def0a: cmp byte ptr [rbx + 0x1b4], 1
0x1402def11: jne 0x1402df1c6
0x1402def17: mov eax, dword ptr [rsp + 0xb4]
0x1402def1e: mov rcx, qword ptr [rsp + 0xa8]
0x1402def26: mov qword ptr [rbx + 0x1a0], 0
0x1402def31: mov dword ptr [rcx], eax
0x1402def33: inc qword ptr [rbx + 0x1a8]
0x1402def3a: movups xmm0, xmmword ptr [rip + 0x5f98f57]
0x1402def41: movaps xmmword ptr [rsp + 0xd0], xmm0
0x1402def49: mov qword ptr [rsp + 0xe0], 0
0x1402def55: movups xmm1, xmmword ptr [rip + 0x5f98f54]
0x1402def5c: movups xmmword ptr [rsp + 0xe8], xmm1
0x1402def64: mov qword ptr [rsp + 0xf8], 0
0x1402def70: movups xmm1, xmmword ptr [rip + 0x5f98f51]
0x1402def77: movaps xmmword ptr [rsp + 0x100], xmm1
0x1402def7f: mov qword ptr [rsp + 0x110], 0
0x1402def8b: movups xmm2, xmmword ptr [rip + 0x5f98f4e]
0x1402def92: movups xmmword ptr [rsp + 0x118], xmm2
0x1402def9a: mov qword ptr [rsp + 0x128], 0
0x1402defa6: movaps xmmword ptr [rsp + 0x130], xmm0
0x1402defae: movaps xmmword ptr [rsp + 0x160], xmm1
0x1402defb6: mov rax, qword ptr [rsp + 0xe0]
0x1402defbe: mov qword ptr [rsp + 0x140], rax
0x1402defc6: mov rax, qword ptr [rsp + 0xe8]
0x1402defce: mov qword ptr [rsp + 0x148], rax
0x1402defd6: mov rax, qword ptr [rsp + 0xf0]
0x1402defde: mov qword ptr [rsp + 0x150], rax
0x1402defe6: mov rax, qword ptr [rsp + 0xf8]
0x1402defee: mov qword ptr [rsp + 0x158], rax
0x1402deff6: mov rax, qword ptr [rsp + 0x110]
0x1402deffe: mov qword ptr [rsp + 0x170], rax
0x1402df006: mov rax, qword ptr [rsp + 0x118]
0x1402df00e: mov qword ptr [rsp + 0x178], rax
0x1402df016: movaps xmm0, xmmword ptr [rsp + 0x120]
0x1402df01e: movaps xmmword ptr [rsp + 0x180], xmm0
0x1402df026: xorps xmm0, xmm0
0x1402df029: movaps xmmword ptr [rsp + 0x1a0], xmm0
0x1402df031: movaps xmmword ptr [rsp + 0x190], xmm0
0x1402df039: mov qword ptr [rsp + 0x1b0], 0
0x1402df045: movaps xmm1, xmmword ptr [rip + 0x5f54074]
0x1402df04c: movups xmmword ptr [rsp + 0x1b8], xmm1
0x1402df054: movups xmmword ptr [rsp + 0x1d8], xmm0
0x1402df05c: movups xmmword ptr [rsp + 0x1c8], xmm0
0x1402df064: movups xmm1, xmmword ptr [rip + 0x5f98ef5]
0x1402df06b: movups xmmword ptr [rsp + 0x1f8], xmm1
0x1402df073: movups xmm1, xmmword ptr [rip + 0x5f98ed6]
0x1402df07a: movups xmmword ptr [rsp + 0x1e8], xmm1
0x1402df082: movups xmm1, xmmword ptr [rip + 0x5f98ef7]
0x1402df089: movups xmmword ptr [rsp + 0x218], xmm1
0x1402df091: movups xmm1, xmmword ptr [rip + 0x5f98ed8]
0x1402df098: movups xmmword ptr [rsp + 0x208], xmm1
0x1402df0a0: movups xmm1, xmmword ptr [rip + 0x5f98ef9]
0x1402df0a7: movups xmmword ptr [rsp + 0x238], xmm1
0x1402df0af: movups xmm1, xmmword ptr [rip + 0x5f98eda]
0x1402df0b6: movups xmmword ptr [rsp + 0x228], xmm1
0x1402df0be: movups xmm1, xmmword ptr [rip + 0x5f98efb]
0x1402df0c5: movups xmmword ptr [rsp + 0x258], xmm1
0x1402df0cd: movups xmm1, xmmword ptr [rip + 0x5f98edc]
0x1402df0d4: movups xmmword ptr [rsp + 0x248], xmm1
0x1402df0dc: movaps xmm1, xmmword ptr [rip + 0x5f53e6d]
0x1402df0e3: movups xmmword ptr [rsp + 0x268], xmm1
0x1402df0eb: mov dword ptr [rsp + 0x278], 1
0x1402df0f6: mov qword ptr [rsp + 0x27c], 0
0x1402df102: mov byte ptr [rsp + 0x284], 1
0x1402df10a: mov qword ptr [rsp + 0x288], 0
0x1402df116: mov dword ptr [rsp + 0x290], 0x3f800000
0x1402df121: mov word ptr [rsp + 0x294], 0
0x1402df12b: mov word ptr [rsp + 0x29a], 0
0x1402df135: mov dword ptr [rsp + 0x296], 0x10000
0x1402df140: mov word ptr [rsp + 0x2a0], 0
0x1402df14a: mov dword ptr [rsp + 0x29c], 0x10000
0x1402df155: mov word ptr [rsp + 0x2a2], 0x100
0x1402df15f: mov word ptr [rsp + 0x2ac], 0
0x1402df169: mov qword ptr [rsp + 0x2a4], 0
0x1402df175: movaps xmmword ptr [rsp + 0x2b0], xmm0
0x1402df17d: movabs rax, 0x157c3f400000
0x1402df187: mov qword ptr [rsp + 0x2c0], rax
0x1402df18f: mov word ptr [rsp + 0x2c8], 2
0x1402df199: lea r9, [rip + 0x5f99778]
0x1402df1a0: lea rsi, [rsp + 0xd0]
0x1402df1a8: lea rdx, [rsp + 0x50]
0x1402df1ad: lea r8, [rsp + 0x130]
0x1402df1b5: mov rcx, rsi
0x1402df1b8: call 0x14030e4a0
0x1402df1bd: mov rcx, rsi
0x1402df1c0: call 0x1403358e0
0x1402df1c5: nop 
0x1402df1c6: add rsp, 0x2d8
0x1402df1cd: pop rbx
0x1402df1ce: pop rbp
0x1402df1cf: pop rdi
0x1402df1d0: pop rsi
0x1402df1d1: pop r12
0x1402df1d3: pop r13
0x1402df1d5: pop r14
0x1402df1d7: pop r15
0x1402df1d9: ret 
0x1402df1da: mov al, 1
0x1402df1dc: jmp 0x1402dec5a
