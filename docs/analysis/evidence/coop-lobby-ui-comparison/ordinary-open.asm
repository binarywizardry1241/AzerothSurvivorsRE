0x140164ad0: push r15
0x140164ad2: push r14
0x140164ad4: push r13
0x140164ad6: push r12
0x140164ad8: push rsi
0x140164ad9: push rdi
0x140164ada: push rbp
0x140164adb: push rbx
0x140164adc: sub rsp, 0x2d8
0x140164ae3: mov rax, qword ptr [rsp + 0x340]
0x140164aeb: mov rcx, qword ptr [rdx + 0x20]
0x140164aef: mov qword ptr [rsp + 0xd0], rcx
0x140164af7: movups xmm0, xmmword ptr [rdx]
0x140164afa: movups xmm1, xmmword ptr [rdx + 0x10]
0x140164afe: movaps xmmword ptr [rsp + 0xc0], xmm1
0x140164b06: movaps xmmword ptr [rsp + 0xb0], xmm0
0x140164b0e: movups xmm0, xmmword ptr [r8]
0x140164b12: movups xmm1, xmmword ptr [r8 + 0x10]
0x140164b17: movups xmmword ptr [rsp + 0xe8], xmm1
0x140164b1f: movups xmmword ptr [rsp + 0xd8], xmm0
0x140164b27: movups xmm0, xmmword ptr [r9]
0x140164b2b: movups xmm1, xmmword ptr [r9 + 0x10]
0x140164b30: movups xmmword ptr [rsp + 0x108], xmm1
0x140164b38: movups xmmword ptr [rsp + 0xf8], xmm0
0x140164b40: mov rcx, qword ptr [rax + 0x10]
0x140164b44: mov qword ptr [rsp + 0x128], rcx
0x140164b4c: movups xmm0, xmmword ptr [rax]
0x140164b4f: movups xmmword ptr [rsp + 0x118], xmm0
0x140164b57: mov rbx, qword ptr [rsp + 0xf8]
0x140164b5f: cmp byte ptr [rbx], 0
0x140164b62: je 0x140164b8f
0x140164b64: mov rax, qword ptr [rsp + 0xd8]
0x140164b6c: cmp byte ptr [rax + 0xd], 0
0x140164b70: je 0x140164b7b
0x140164b72: cmp dword ptr [rax], 0
0x140164b75: je 0x1401650eb
0x140164b7b: mov eax, dword ptr [rsp + 0x114]
0x140164b82: mov rcx, qword ptr [rsp + 0x108]
0x140164b8a: mov dword ptr [rcx], eax
0x140164b8c: mov byte ptr [rbx], 0
0x140164b8f: xor eax, eax
0x140164b91: mov rcx, qword ptr [rsp + 0x118]
0x140164b99: mov r14, qword ptr [rsp + 0x120]
0x140164ba1: mov r15, qword ptr [rcx + 0xf8]
0x140164ba8: mov rdx, qword ptr [rcx + 0x100]
0x140164baf: movzx ecx, byte ptr [rcx + 0x108]
0x140164bb6: lea r8, [rdx*4]
0x140164bbe: xor r9d, r9d
0x140164bc1: test cl, cl
0x140164bc3: je 0x140164c00
0x140164bc5: nop word ptr cs:[rax + rax]
0x140164bd0: cmp r8, r9
0x140164bd3: je 0x140164c2d
0x140164bd5: mov r10d, dword ptr [r15 + r9]
0x140164bd9: mov r11, qword ptr [r14 + 0x1a8]
0x140164be0: lea r10, [r10 + r10*8]
0x140164be4: add r9, 4
0x140164be8: cmp qword ptr [r11 + r10*8 + 0x10], 0
0x140164bee: je 0x140164bd0
0x140164bf0: jmp 0x140164c24
0x140164bf2: nop word ptr cs:[rax + rax]
0x140164c00: cmp r8, r9
0x140164c03: je 0x140164c2d
0x140164c05: mov r10d, dword ptr [r15 + r9]
0x140164c09: mov r11, qword ptr [r14 + 0x108]
0x140164c10: lea r10, [r10 + r10*4]
0x140164c14: shl r10, 5
0x140164c18: add r9, 4
0x140164c1c: cmp qword ptr [r11 + r10 + 0x58], 0
0x140164c22: je 0x140164c00
0x140164c24: test al, al
0x140164c26: je 0x140164c35
0x140164c28: jmp 0x1401650d7
0x140164c2d: test al, al
0x140164c2f: je 0x1401650d7
0x140164c35: lea r12, [r15 + rdx*4]
0x140164c39: mov rax, qword ptr [rsp + 0xc0]
0x140164c41: mov qword ptr [rsp + 0x48], rax
0x140164c46: mov r11, qword ptr [rsp + 0xd0]
0x140164c4e: mov r13, qword ptr [rsp + 0xc8]
0x140164c56: mov r9, qword ptr [rsp + 0xb0]
0x140164c5e: mov r10, qword ptr [rsp + 0xb8]
0x140164c66: xor esi, esi
0x140164c68: mov edi, 8
0x140164c6d: test cl, cl
0x140164c6f: je 0x140164c81
0x140164c71: lea rcx, [rsp + 0x130]
0x140164c79: xor ebp, ebp
0x140164c7b: cmp ebp, esi
0x140164c7d: je 0x140164cc0
0x140164c7f: jmp 0x140164caa
0x140164c81: lea rdx, [rip + 0x6060a60]
0x140164c88: xor ebp, ebp
0x140164c8a: cmp ebp, esi
0x140164c8c: jne 0x140164d89
0x140164c92: jmp 0x140164da0
0x140164c97: nop word ptr [rax + rax]
0x140164ca0: lea rax, [rax + rdx*8]
0x140164ca4: mov rdi, qword ptr [rax + 8]
0x140164ca8: xor ebp, ebp
0x140164caa: mov eax, ebp
0x140164cac: inc ebp
0x140164cae: mov rax, qword ptr [rdi + rax*8]
0x140164cb2: test eax, eax
0x140164cb4: jne 0x140164ce7
0x140164cb6: cmp ebp, esi
0x140164cb8: jne 0x140164caa
0x140164cba: nop word ptr [rax + rax]
0x140164cc0: cmp r15, r12
0x140164cc3: je 0x140164e5a
0x140164cc9: mov edx, dword ptr [r15]
0x140164ccc: add r15, 4
0x140164cd0: mov rax, qword ptr [r14 + 0x1a8]
0x140164cd7: lea rdx, [rdx + rdx*8]
0x140164cdb: mov rsi, qword ptr [rax + rdx*8 + 0x10]
0x140164ce0: test rsi, rsi
0x140164ce3: je 0x140164cc0
0x140164ce5: jmp 0x140164ca0
0x140164ce7: mov rdx, qword ptr [rsp + 0x48]
0x140164cec: test rdx, rdx
0x140164cef: mov r8, qword ptr [rsp + 0x20]
0x140164cf4: cmovne r8, r11
0x140164cf8: mov qword ptr [rsp + 0x130], rax
0x140164d00: mov qword ptr [rsp + 0x138], r9
0x140164d08: mov qword ptr [rsp + 0x140], r10
0x140164d10: mov qword ptr [rsp + 0x148], rdx
0x140164d18: mov qword ptr [rsp + 0x150], r13
0x140164d20: mov qword ptr [rsp + 0x20], r8
0x140164d25: mov qword ptr [rsp + 0x158], r8
0x140164d2d: mov qword ptr [rsp + 0x40], r11
0x140164d32: lea rdx, [rip + 0x60609af]
0x140164d39: mov qword ptr [rsp + 0x38], r13
0x140164d3e: mov qword ptr [rsp + 0x30], r9
0x140164d43: mov qword ptr [rsp + 0x28], r10
0x140164d48: call 0x1450592f0
0x140164d4d: lea rcx, [rsp + 0x130]
0x140164d55: mov r10, qword ptr [rsp + 0x28]
0x140164d5a: mov r9, qword ptr [rsp + 0x30]
0x140164d5f: mov r13, qword ptr [rsp + 0x38]
0x140164d64: mov r11, qword ptr [rsp + 0x40]
0x140164d69: cmp ebp, esi
0x140164d6b: je 0x140164cc0
0x140164d71: jmp 0x140164caa
0x140164d76: nop word ptr cs:[rax + rax]
0x140164d80: add rax, rcx
0x140164d83: mov rdi, qword ptr [rax + 0x50]
0x140164d87: xor ebp, ebp
0x140164d89: mov eax, ebp
0x140164d8b: shl rax, 4
0x140164d8f: inc ebp
0x140164d91: mov rax, qword ptr [rdi + rax]
0x140164d95: test eax, eax
0x140164d97: jne 0x140164dcb
0x140164d99: cmp ebp, esi
0x140164d9b: jne 0x140164d89
0x140164d9d: nop dword ptr [rax]
0x140164da0: cmp r15, r12
0x140164da3: je 0x140164e5a
0x140164da9: mov ecx, dword ptr [r15]
0x140164dac: add r15, 4
0x140164db0: mov rax, qword ptr [r14 + 0x108]
0x140164db7: lea rcx, [rcx + rcx*4]
0x140164dbb: shl rcx, 5
0x140164dbf: mov rsi, qword ptr [rax + rcx + 0x58]
0x140164dc4: test rsi, rsi
0x140164dc7: je 0x140164da0
0x140164dc9: jmp 0x140164d80
0x140164dcb: mov r8, qword ptr [rsp + 0x48]
0x140164dd0: test r8, r8
0x140164dd3: mov rcx, qword ptr [rsp + 0x20]
0x140164dd8: cmovne rcx, r11
0x140164ddc: mov qword ptr [rsp + 0x130], rax
0x140164de4: mov qword ptr [rsp + 0x138], r9
0x140164dec: mov qword ptr [rsp + 0x140], r10
0x140164df4: mov qword ptr [rsp + 0x148], r8
0x140164dfc: mov qword ptr [rsp + 0x150], r13
0x140164e04: mov qword ptr [rsp + 0x20], rcx
0x140164e09: mov qword ptr [rsp + 0x158], rcx
0x140164e11: lea rcx, [rsp + 0x130]
0x140164e19: mov qword ptr [rsp + 0x40], r11
0x140164e1e: mov qword ptr [rsp + 0x38], r13
0x140164e23: mov qword ptr [rsp + 0x30], r9
0x140164e28: mov qword ptr [rsp + 0x28], r10
0x140164e2d: call 0x1450592f0
0x140164e32: lea rdx, [rip + 0x60608af]
0x140164e39: mov r10, qword ptr [rsp + 0x28]
0x140164e3e: mov r9, qword ptr [rsp + 0x30]
0x140164e43: mov r13, qword ptr [rsp + 0x38]
0x140164e48: mov r11, qword ptr [rsp + 0x40]
0x140164e4d: cmp ebp, esi
0x140164e4f: je 0x140164da0
0x140164e55: jmp 0x140164d89
0x140164e5a: cmp byte ptr [rbx], 1
0x140164e5d: jne 0x1401650d7
0x140164e63: movups xmm0, xmmword ptr [rip + 0x605f2a6]
0x140164e6a: movaps xmmword ptr [rsp + 0x50], xmm0
0x140164e6f: mov qword ptr [rsp + 0x60], 0
0x140164e78: movups xmm1, xmmword ptr [rip + 0x605f2a9]
0x140164e7f: movups xmmword ptr [rsp + 0x68], xmm1
0x140164e84: mov qword ptr [rsp + 0x78], 0
0x140164e8d: movups xmm1, xmmword ptr [rip + 0x605f2ac]
0x140164e94: movaps xmmword ptr [rsp + 0x80], xmm1
0x140164e9c: mov qword ptr [rsp + 0x90], 0
0x140164ea8: movups xmm2, xmmword ptr [rip + 0x605f2a9]
0x140164eaf: movups xmmword ptr [rsp + 0x98], xmm2
0x140164eb7: mov qword ptr [rsp + 0xa8], 0
0x140164ec3: movaps xmmword ptr [rsp + 0x130], xmm0
0x140164ecb: movaps xmmword ptr [rsp + 0x160], xmm1
0x140164ed3: mov rax, qword ptr [rsp + 0x60]
0x140164ed8: mov qword ptr [rsp + 0x140], rax
0x140164ee0: mov rax, qword ptr [rsp + 0x68]
0x140164ee5: mov qword ptr [rsp + 0x148], rax
0x140164eed: mov rax, qword ptr [rsp + 0x70]
0x140164ef2: mov qword ptr [rsp + 0x150], rax
0x140164efa: mov rax, qword ptr [rsp + 0x78]
0x140164eff: mov qword ptr [rsp + 0x158], rax
0x140164f07: mov rax, qword ptr [rsp + 0x90]
0x140164f0f: mov qword ptr [rsp + 0x170], rax
0x140164f17: mov rax, qword ptr [rsp + 0x98]
0x140164f1f: mov qword ptr [rsp + 0x178], rax
0x140164f27: movaps xmm0, xmmword ptr [rsp + 0xa0]
0x140164f2f: movaps xmmword ptr [rsp + 0x180], xmm0
0x140164f37: xorps xmm0, xmm0
0x140164f3a: movaps xmmword ptr [rsp + 0x1a0], xmm0
0x140164f42: movaps xmmword ptr [rsp + 0x190], xmm0
0x140164f4a: mov qword ptr [rsp + 0x1b0], 0
0x140164f56: movaps xmm1, xmmword ptr [rip + 0x604d6d3]
0x140164f5d: movups xmmword ptr [rsp + 0x1b8], xmm1
0x140164f65: movups xmmword ptr [rsp + 0x1d8], xmm0
0x140164f6d: movups xmmword ptr [rsp + 0x1c8], xmm0
0x140164f75: movups xmm1, xmmword ptr [rip + 0x605f25c]
0x140164f7c: movups xmmword ptr [rsp + 0x1f8], xmm1
0x140164f84: movups xmm1, xmmword ptr [rip + 0x605f23d]
0x140164f8b: movups xmmword ptr [rsp + 0x1e8], xmm1
0x140164f93: movups xmm1, xmmword ptr [rip + 0x605f25e]
0x140164f9a: movups xmmword ptr [rsp + 0x218], xmm1
0x140164fa2: movups xmm1, xmmword ptr [rip + 0x605f23f]
0x140164fa9: movups xmmword ptr [rsp + 0x208], xmm1
0x140164fb1: movups xmm1, xmmword ptr [rip + 0x605f260]
0x140164fb8: movups xmmword ptr [rsp + 0x238], xmm1
0x140164fc0: movups xmm1, xmmword ptr [rip + 0x605f241]
0x140164fc7: movups xmmword ptr [rsp + 0x228], xmm1
0x140164fcf: movups xmm1, xmmword ptr [rip + 0x605f262]
0x140164fd6: movups xmmword ptr [rsp + 0x258], xmm1
0x140164fde: movups xmm1, xmmword ptr [rip + 0x605f243]
0x140164fe5: movups xmmword ptr [rsp + 0x248], xmm1
0x140164fed: movaps xmm1, xmmword ptr [rip + 0x604d1fc]
0x140164ff4: movups xmmword ptr [rsp + 0x268], xmm1
0x140164ffc: mov dword ptr [rsp + 0x278], 1
0x140165007: mov qword ptr [rsp + 0x27c], 0
0x140165013: mov byte ptr [rsp + 0x284], 1
0x14016501b: mov qword ptr [rsp + 0x288], 0
0x140165027: mov dword ptr [rsp + 0x290], 0x3f800000
0x140165032: mov word ptr [rsp + 0x294], 0
0x14016503c: mov word ptr [rsp + 0x29a], 0
0x140165046: mov dword ptr [rsp + 0x296], 0x10000
0x140165051: mov word ptr [rsp + 0x2a0], 0
0x14016505b: mov dword ptr [rsp + 0x29c], 0x10000
0x140165066: mov word ptr [rsp + 0x2a2], 0x100
0x140165070: mov word ptr [rsp + 0x2ac], 0
0x14016507a: mov qword ptr [rsp + 0x2a4], 0
0x140165086: movaps xmmword ptr [rsp + 0x2b0], xmm0
0x14016508e: movabs rax, 0x15e03f400000
0x140165098: mov qword ptr [rsp + 0x2c0], rax
0x1401650a0: mov word ptr [rsp + 0x2c8], 2
0x1401650aa: lea r9, [rip + 0x606061f]
0x1401650b1: lea rsi, [rsp + 0x50]
0x1401650b6: lea rdx, [rsp + 0xb0]
0x1401650be: lea r8, [rsp + 0x130]
0x1401650c6: mov rcx, rsi
0x1401650c9: call 0x140260700
0x1401650ce: mov rcx, rsi
0x1401650d1: call 0x1402ec670
0x1401650d6: nop 
0x1401650d7: add rsp, 0x2d8
0x1401650de: pop rbx
0x1401650df: pop rbp
0x1401650e0: pop rdi
0x1401650e1: pop rsi
0x1401650e2: pop r12
0x1401650e4: pop r13
0x1401650e6: pop r14
0x1401650e8: pop r15
0x1401650ea: ret 
0x1401650eb: mov al, 1
0x1401650ed: jmp 0x140164b91
