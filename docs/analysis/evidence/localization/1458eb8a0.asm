; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458eb8a0..0x1458ebfee SHA256 b544d8f478e52f147946aae1c9805b247a5945d1323c3dd92a4b2a76f8d37061
0x1458eb8a0: push rbp
0x1458eb8a1: push r15
0x1458eb8a3: push r14
0x1458eb8a5: push r13
0x1458eb8a7: push r12
0x1458eb8a9: push rsi
0x1458eb8aa: push rdi
0x1458eb8ab: push rbx
0x1458eb8ac: sub rsp, 0x1d8
0x1458eb8b3: lea rbp, [rsp + 0x80]
0x1458eb8bb: mov qword ptr [rbp + 0x150], 0xfffffffffffffffe
0x1458eb8c6: mov rdi, rcx
0x1458eb8c9: mov qword ptr [rbp - 8], rdx
0x1458eb8cd: mov qword ptr [rbp], r8
0x1458eb8d1: lea rax, [rbp - 8]
0x1458eb8d5: mov qword ptr [rbp + 0x118], rax
0x1458eb8dc: lea rax, [rip - 0x58e9823]
0x1458eb8e3: mov qword ptr [rbp + 0x120], rax
0x1458eb8ea: lea rdx, [rip + 0x13060d0]
0x1458eb8f1: lea rcx, [rbp + 0x58]
0x1458eb8f5: lea r8, [rbp + 0x118]
0x1458eb8fc: call 0x145bcce30
0x1458eb901: mov qword ptr [rbp + 0xe8], 0
0x1458eb90c: mov qword ptr [rbp + 0xf0], 8
0x1458eb917: mov qword ptr [rbp + 0xf8], 0
0x1458eb922: mov byte ptr [rbp + 0x14f], 1
0x1458eb929: lea rcx, [rbp + 0x118]
0x1458eb930: call 0x145bb4380
0x1458eb935: nop
0x1458eb936: mov rax, qword ptr [rbp + 0x118]
0x1458eb93d: cmp rax, -1
0x1458eb941: je 0x1458eba2b
0x1458eb947: mov qword ptr [rbp + 0x140], rax
0x1458eb94e: mov rcx, qword ptr [rbp + 0x120]
0x1458eb955: mov rdx, qword ptr [rbp + 0x128]
0x1458eb95c: mov qword ptr [rbp + 0x138], rcx
0x1458eb963: call 0x145ba6e70
0x1458eb968: nop
0x1458eb969: test rax, rax
0x1458eb96c: je 0x1458ebfd2
0x1458eb972: mov r8, rdx
0x1458eb975: lea rcx, [rbp + 0x118]
0x1458eb97c: mov rdx, rax
0x1458eb97f: call 0x145bcc5b0
0x1458eb984: nop
0x1458eb985: mov rsi, qword ptr [rbp + 0x118]
0x1458eb98c: mov rax, qword ptr [rbp + 0x120]
0x1458eb993: mov qword ptr [rbp + 0x100], rax
0x1458eb99a: movups xmm0, xmmword ptr [rbp + 0x128]
0x1458eb9a1: movaps xmmword ptr [rbp - 0x50], xmm0
0x1458eb9a5: mov rdx, qword ptr [rbp + 0x140]
0x1458eb9ac: test rdx, rdx
0x1458eb9af: je 0x1458eb9c3
0x1458eb9b1: mov r8d, 1
0x1458eb9b7: mov rcx, qword ptr [rbp + 0x138]
0x1458eb9be: call 0x1400021d0
0x1458eb9c3: cmp rsi, -1
0x1458eb9c7: je 0x1458eba69
0x1458eb9cd: mov qword ptr [rbp + 0x140], rsi
0x1458eb9d4: mov rsi, qword ptr [rbp + 0xf8]
0x1458eb9db: cmp rsi, qword ptr [rbp + 0xe8]
0x1458eb9e2: jne 0x1458eb9f1
0x1458eb9e4: lea rcx, [rbp + 0xe8]
0x1458eb9eb: call 0x145bfae10
0x1458eb9f0: nop
0x1458eb9f1: mov rax, qword ptr [rbp + 0xf0]
0x1458eb9f8: mov rcx, rsi
0x1458eb9fb: shl rcx, 5
0x1458eb9ff: mov rdx, qword ptr [rbp + 0x140]
0x1458eba06: mov qword ptr [rax + rcx], rdx
0x1458eba0a: mov rdx, qword ptr [rbp + 0x100]
0x1458eba11: mov qword ptr [rax + rcx + 8], rdx
0x1458eba16: movaps xmm0, xmmword ptr [rbp - 0x50]
0x1458eba1a: movups xmmword ptr [rax + rcx + 0x10], xmm0
0x1458eba1f: inc rsi
0x1458eba22: mov qword ptr [rbp + 0xf8], rsi
0x1458eba29: jmp 0x1458eba69
0x1458eba2b: mov rax, qword ptr [rbp + 0x120]
0x1458eba32: mov ecx, eax
0x1458eba34: and ecx, 3
0x1458eba37: lea edx, [rcx - 2]
0x1458eba3a: cmp edx, 2
0x1458eba3d: jb 0x1458eba69
0x1458eba3f: test rcx, rcx
0x1458eba42: je 0x1458eba69
0x1458eba44: dec rax
0x1458eba47: lea rcx, [rbp + 0x98]
0x1458eba4e: mov qword ptr [rbp + 0x98], rax
0x1458eba55: mov byte ptr [rbp + 0x90], 3
0x1458eba5c: mov byte ptr [rbp + 0x14f], 1
0x1458eba63: call 0x145bdf7c0
0x1458eba68: nop
0x1458eba69: mov byte ptr [rbp + 0x14f], 1
0x1458eba70: lea rcx, [rbp + 0x118]
0x1458eba77: call 0x1458ef170
0x1458eba7c: nop
0x1458eba7d: mov rax, qword ptr [rbp + 0x118]
0x1458eba84: cmp rax, -1
0x1458eba88: mov qword ptr [rbp + 0x40], rdi
0x1458eba8c: je 0x1458ebaf1
0x1458eba8e: mov qword ptr [rbp + 0x140], rax
0x1458eba95: mov rbx, qword ptr [rbp + 0xf8]
0x1458eba9c: cmp rbx, qword ptr [rbp + 0xe8]
0x1458ebaa3: jne 0x1458ebac0
0x1458ebaa5: mov rax, qword ptr [rbp + 0x120]
0x1458ebaac: mov qword ptr [rbp + 0x138], rax
0x1458ebab3: lea rcx, [rbp + 0xe8]
0x1458ebaba: call 0x145bfae10
0x1458ebabf: nop
0x1458ebac0: mov rdi, qword ptr [rbp + 0xf0]
0x1458ebac7: mov rax, rbx
0x1458ebaca: shl rax, 5
0x1458ebace: movups xmm0, xmmword ptr [rbp + 0x118]
0x1458ebad5: movups xmm1, xmmword ptr [rbp + 0x128]
0x1458ebadc: movups xmmword ptr [rdi + rax + 0x10], xmm1
0x1458ebae1: movups xmmword ptr [rdi + rax], xmm0
0x1458ebae5: inc rbx
0x1458ebae8: mov qword ptr [rbp + 0xf8], rbx
0x1458ebaef: jmp 0x1458ebaff
0x1458ebaf1: mov rdi, qword ptr [rbp + 0xf0]
0x1458ebaf8: mov rbx, qword ptr [rbp + 0xf8]
0x1458ebaff: mov qword ptr [rbp + 0xc0], 0
0x1458ebb0a: mov qword ptr [rbp + 0xc8], 8
0x1458ebb15: mov qword ptr [rbp + 0xd0], 0
0x1458ebb20: mov rax, qword ptr [rbp + 0xe8]
0x1458ebb27: shl rbx, 5
0x1458ebb2b: add rbx, rdi
0x1458ebb2e: mov qword ptr [rbp - 0x28], rdi
0x1458ebb32: mov qword ptr [rbp - 0x20], rdi
0x1458ebb36: mov qword ptr [rbp + 0x48], rax
0x1458ebb3a: mov qword ptr [rbp - 0x18], rax
0x1458ebb3e: mov qword ptr [rbp - 0x10], rbx
0x1458ebb42: mov eax, 8
0x1458ebb47: mov qword ptr [rbp + 0xb0], rax
0x1458ebb4e: mov qword ptr [rbp + 0xe0], 0
0x1458ebb59: lea r12, [rbp + 0x118]
0x1458ebb60: lea r13, [rbp + 8]
0x1458ebb64: mov qword ptr [rbp + 0x50], rdi
0x1458ebb68: mov rsi, qword ptr [rbp + 0x60]
0x1458ebb6c: mov r15, qword ptr [rbp + 0x68]
0x1458ebb70: mov r14, rdi
0x1458ebb73: jmp 0x1458ebb93
0x1458ebb75: nop word ptr cs:[rax + rax]
0x1458ebb80: mov r14, rdi
0x1458ebb83: mov rdx, qword ptr [rbp + 0x140]
0x1458ebb8a: test rdx, rdx
0x1458ebb8d: jne 0x1458ebede
0x1458ebb93: cmp r14, rbx
0x1458ebb96: je 0x1458ebf31
0x1458ebb9c: lea rdi, [r14 + 0x20]
0x1458ebba0: mov qword ptr [rbp - 0x20], rdi
0x1458ebba4: mov rax, qword ptr [r14]
0x1458ebba7: cmp rax, -1
0x1458ebbab: je 0x1458ebf2e
0x1458ebbb1: mov qword ptr [rbp + 0x140], rax
0x1458ebbb8: mov rdx, qword ptr [r14 + 8]
0x1458ebbbc: mov r8, qword ptr [r14 + 0x10]
0x1458ebbc0: mov qword ptr [rsp + 0x20], 4
0x1458ebbc9: mov rcx, r12
0x1458ebbcc: mov qword ptr [rbp + 0x100], rdx
0x1458ebbd3: lea r9, [rip + 0x1305def]
0x1458ebbda: call 0x145ba6d40
0x1458ebbdf: nop
0x1458ebbe0: mov rdx, qword ptr [rbp + 0x120]
0x1458ebbe7: mov r8, qword ptr [rbp + 0x128]
0x1458ebbee: mov qword ptr [rsp + 0x20], r15
0x1458ebbf3: mov rcx, r13
0x1458ebbf6: mov qword ptr [rbp + 0x138], rdx
0x1458ebbfd: mov r9, rsi
0x1458ebc00: call 0x145ba6d40
0x1458ebc05: nop
0x1458ebc06: mov rdx, qword ptr [rbp + 0x118]
0x1458ebc0d: test rdx, rdx
0x1458ebc10: je 0x1458ebc24
0x1458ebc12: mov r8d, 1
0x1458ebc18: mov rcx, qword ptr [rbp + 0x138]
0x1458ebc1f: call 0x1400021d0
0x1458ebc24: mov rdx, qword ptr [rbp + 0x10]
0x1458ebc28: mov r14, qword ptr [rbp + 0x18]
0x1458ebc2c: mov rcx, r12
0x1458ebc2f: mov qword ptr [rbp + 0x138], rdx
0x1458ebc36: mov r8, r14
0x1458ebc39: call 0x145bbd290
0x1458ebc3e: nop
0x1458ebc3f: mov rax, qword ptr [rbp + 0x118]
0x1458ebc46: cmp rax, -1
0x1458ebc4a: jne 0x1458ebcb0
0x1458ebc4c: mov rax, qword ptr [rbp + 0x120]
0x1458ebc53: mov ecx, eax
0x1458ebc55: and ecx, 3
0x1458ebc58: lea edx, [rcx - 2]
0x1458ebc5b: cmp edx, 2
0x1458ebc5e: jb 0x1458ebc83
0x1458ebc60: test rcx, rcx
0x1458ebc63: je 0x1458ebc83
0x1458ebc65: dec rax
0x1458ebc68: mov qword ptr [rbp + 0x98], rax
0x1458ebc6f: mov byte ptr [rbp + 0x90], 3
0x1458ebc76: lea rcx, [rbp + 0x98]
0x1458ebc7d: call 0x145bdf7c0
0x1458ebc82: nop
0x1458ebc83: mov rdx, qword ptr [rbp + 8]
0x1458ebc87: test rdx, rdx
0x1458ebc8a: je 0x1458ebb80
0x1458ebc90: mov r8d, 1
0x1458ebc96: mov rcx, qword ptr [rbp + 0x138]
0x1458ebc9d: call 0x1400021d0
0x1458ebca2: jmp 0x1458ebb80
0x1458ebca7: nop word ptr [rax + rax]
0x1458ebcb0: mov qword ptr [rbp + 0x108], rax
0x1458ebcb7: mov rdx, qword ptr [rbp + 0x120]
0x1458ebcbe: mov r8, qword ptr [rbp + 0x128]
0x1458ebcc5: lea rcx, [rbp + 0x90]
0x1458ebccc: mov qword ptr [rbp + 0xd8], rdx
0x1458ebcd3: call 0x1458ed780
0x1458ebcd8: nop
0x1458ebcd9: cmp dword ptr [rbp + 0x90], 1
0x1458ebce0: jne 0x1458ebdd8
0x1458ebce6: lea rcx, [rbp + 0x98]
0x1458ebced: mov rax, qword ptr [rcx + 0x10]
0x1458ebcf1: mov qword ptr [rbp + 0x80], rax
0x1458ebcf8: movups xmm0, xmmword ptr [rcx]
0x1458ebcfb: movaps xmmword ptr [rbp + 0x70], xmm0
0x1458ebcff: mov rax, qword ptr [rbp + 0x138]
0x1458ebd06: mov qword ptr [rbp - 0x38], rax
0x1458ebd0a: mov qword ptr [rbp - 0x30], r14
0x1458ebd0e: lea rax, [rbp - 0x38]
0x1458ebd12: mov qword ptr [rbp + 0x118], rax
0x1458ebd19: lea rax, [rip + 0x2d3fc0]
0x1458ebd20: mov qword ptr [rbp + 0x120], rax
0x1458ebd27: lea rax, [rbp + 0x70]
0x1458ebd2b: mov qword ptr [rbp + 0x128], rax
0x1458ebd32: lea rax, [rip - 0x58e9c59]
0x1458ebd39: mov qword ptr [rbp + 0x130], rax
0x1458ebd40: lea rsi, [rbp + 0x28]
0x1458ebd44: mov rcx, rsi
0x1458ebd47: lea rdx, [rip + 0x1305c7f]
0x1458ebd4e: mov r8, r12
0x1458ebd51: call 0x145bcce30
0x1458ebd56: nop
0x1458ebd57: mov rax, qword ptr [rbp + 0x28]
0x1458ebd5b: mov qword ptr [rbp + 0x110], rax
0x1458ebd62: mov rcx, qword ptr [rbp + 0x30]
0x1458ebd66: mov rax, qword ptr [rbp + 0x38]
0x1458ebd6a: mov qword ptr [rbp + 0xb8], rcx
0x1458ebd71: mov qword ptr [rbp + 0x28], rcx
0x1458ebd75: mov qword ptr [rbp + 0x30], rax
0x1458ebd79: mov qword ptr [rbp + 0x118], rsi
0x1458ebd80: lea rax, [rip - 0x58e9cc7]
0x1458ebd87: mov qword ptr [rbp + 0x120], rax
0x1458ebd8e: lea rcx, [rip + 0x1305d23]
0x1458ebd95: mov rdx, r12
0x1458ebd98: call 0x145bb6590
0x1458ebd9d: nop
0x1458ebd9e: mov rdx, qword ptr [rbp + 0x110]
0x1458ebda5: test rdx, rdx
0x1458ebda8: je 0x1458ebdbc
0x1458ebdaa: mov r8d, 1
0x1458ebdb0: mov rcx, qword ptr [rbp + 0xb8]
0x1458ebdb7: call 0x1400021d0
0x1458ebdbc: mov rdx, qword ptr [rbp + 0x70]
0x1458ebdc0: test rdx, rdx
0x1458ebdc3: je 0x1458ebe95
0x1458ebdc9: mov rcx, qword ptr [rbp + 0x78]
0x1458ebdcd: mov r8d, 1
0x1458ebdd3: jmp 0x1458ebe90
0x1458ebdd8: mov r15, qword ptr [rbp + 0x98]
0x1458ebddf: mov rsi, qword ptr [rbp + 0xa0]
0x1458ebde6: mov r14, qword ptr [rbp + 0xa8]
0x1458ebded: mov rax, r14
0x1458ebdf0: shl rax, 4
0x1458ebdf4: lea rax, [rax + rax*2]
0x1458ebdf8: mov qword ptr [rbp + 0x110], rax
0x1458ebdff: add rax, rsi
0x1458ebe02: mov qword ptr [rbp + 0x118], rsi
0x1458ebe09: mov qword ptr [rbp + 0x128], r15
0x1458ebe10: mov qword ptr [rbp + 0x120], rsi
0x1458ebe17: mov qword ptr [rbp + 0x130], rax
0x1458ebe1e: mov rax, qword ptr [rbp + 0xc0]
0x1458ebe25: mov rdx, qword ptr [rbp + 0xe0]
0x1458ebe2c: sub rax, rdx
0x1458ebe2f: cmp r14, rax
0x1458ebe32: ja 0x1458ebef5
0x1458ebe38: test r14, r14
0x1458ebe3b: je 0x1458ebe69
0x1458ebe3d: mov qword ptr [rbp + 0xe0], rdx
0x1458ebe44: lea rcx, [rdx + rdx*2]
0x1458ebe48: shl rcx, 4
0x1458ebe4c: add rcx, qword ptr [rbp + 0xb0]
0x1458ebe53: mov rdx, rsi
0x1458ebe56: mov r8, qword ptr [rbp + 0x110]
0x1458ebe5d: call 0x145bfa0e7
0x1458ebe62: mov rdx, qword ptr [rbp + 0xe0]
0x1458ebe69: add rdx, r14
0x1458ebe6c: mov qword ptr [rbp + 0xe0], rdx
0x1458ebe73: mov qword ptr [rbp + 0xd0], rdx
0x1458ebe7a: test r15, r15
0x1458ebe7d: je 0x1458ebe95
0x1458ebe7f: shl r15, 4
0x1458ebe83: lea rdx, [r15 + r15*2]
0x1458ebe87: mov r8d, 8
0x1458ebe8d: mov rcx, rsi
0x1458ebe90: call 0x1400021d0
0x1458ebe95: mov rdx, qword ptr [rbp + 0x108]
0x1458ebe9c: test rdx, rdx
0x1458ebe9f: je 0x1458ebeb3
0x1458ebea1: mov r8d, 1
0x1458ebea7: mov rcx, qword ptr [rbp + 0xd8]
0x1458ebeae: call 0x1400021d0
0x1458ebeb3: mov rdx, qword ptr [rbp + 8]
0x1458ebeb7: test rdx, rdx
0x1458ebeba: je 0x1458ebece
0x1458ebebc: mov r8d, 1
0x1458ebec2: mov rcx, qword ptr [rbp + 0x138]
0x1458ebec9: call 0x1400021d0
0x1458ebece: mov rdx, qword ptr [rbp + 0x140]
0x1458ebed5: test rdx, rdx
0x1458ebed8: je 0x1458ebb68
0x1458ebede: mov r8d, 1
0x1458ebee4: mov rcx, qword ptr [rbp + 0x100]
0x1458ebeeb: call 0x1400021d0
0x1458ebef0: jmp 0x1458ebb68
0x1458ebef5: mov qword ptr [rsp + 0x20], 0x30
0x1458ebefe: mov r9d, 8
0x1458ebf04: lea rcx, [rbp + 0xc0]
0x1458ebf0b: mov r8, r14
0x1458ebf0e: call 0x145bfa970
0x1458ebf13: nop
0x1458ebf14: mov rax, qword ptr [rbp + 0xc8]
0x1458ebf1b: mov qword ptr [rbp + 0xb0], rax
0x1458ebf22: mov rdx, qword ptr [rbp + 0xd0]
0x1458ebf29: jmp 0x1458ebe3d
0x1458ebf2e: mov r14, rdi
0x1458ebf31: sub rbx, r14
0x1458ebf34: mov rsi, qword ptr [rbp + 0x40]
0x1458ebf38: je 0x1458ebf72
0x1458ebf3a: shr rbx, 5
0x1458ebf3e: add r14, 8
0x1458ebf42: jmp 0x1458ebf59
0x1458ebf44: nop word ptr cs:[rax + rax]
0x1458ebf50: add r14, 0x20
0x1458ebf54: dec rbx
0x1458ebf57: je 0x1458ebf72
0x1458ebf59: mov rdx, qword ptr [r14 - 8]
0x1458ebf5d: test rdx, rdx
0x1458ebf60: je 0x1458ebf50
0x1458ebf62: mov rcx, qword ptr [r14]
0x1458ebf65: mov r8d, 1
0x1458ebf6b: call 0x1400021d0
0x1458ebf70: jmp 0x1458ebf50
0x1458ebf72: mov rdx, qword ptr [rbp + 0x48]
0x1458ebf76: test rdx, rdx
0x1458ebf79: je 0x1458ebf8e
0x1458ebf7b: shl rdx, 5
0x1458ebf7f: mov r8d, 8
0x1458ebf85: mov rcx, qword ptr [rbp + 0x50]
0x1458ebf89: call 0x1400021d0
0x1458ebf8e: mov rax, qword ptr [rbp + 0xd0]
0x1458ebf95: mov qword ptr [rsi + 0x10], rax
0x1458ebf99: movups xmm0, xmmword ptr [rbp + 0xc0]
0x1458ebfa0: movups xmmword ptr [rsi], xmm0
0x1458ebfa3: mov rdx, qword ptr [rbp + 0x58]
0x1458ebfa7: test rdx, rdx
0x1458ebfaa: je 0x1458ebfbb
0x1458ebfac: mov rcx, qword ptr [rbp + 0x60]
0x1458ebfb0: mov r8d, 1
0x1458ebfb6: call 0x1400021d0
0x1458ebfbb: mov rax, rsi
0x1458ebfbe: add rsp, 0x1d8
0x1458ebfc5: pop rbx
0x1458ebfc6: pop rdi
0x1458ebfc7: pop rsi
0x1458ebfc8: pop r12
0x1458ebfca: pop r13
0x1458ebfcc: pop r14
0x1458ebfce: pop r15
0x1458ebfd0: pop rbp
0x1458ebfd1: ret
0x1458ebfd2: mov rsi, 0xffffffffffffffff
0x1458ebfd9: mov rdx, qword ptr [rbp + 0x140]
0x1458ebfe0: test rdx, rdx
0x1458ebfe3: jne 0x1458eb9b1
0x1458ebfe9: jmp 0x1458eb9c3
