0x1400c5cc0: push rbp
0x1400c5cc1: push r15
0x1400c5cc3: push r14
0x1400c5cc5: push r13
0x1400c5cc7: push r12
0x1400c5cc9: push rsi
0x1400c5cca: push rdi
0x1400c5ccb: push rbx
0x1400c5ccc: sub rsp, 0xb8
0x1400c5cd3: lea rbp, [rsp + 0x80]
0x1400c5cdb: mov qword ptr [rbp + 0x30], 0xfffffffffffffffe
0x1400c5ce3: mov rax, qword ptr [r8]
0x1400c5ce6: mov r9, qword ptr [r8 + 8]
0x1400c5cea: cmp rcx, rdx
0x1400c5ced: je 0x1400c633f
0x1400c5cf3: mov rsi, rdx
0x1400c5cf6: mov rdi, rcx
0x1400c5cf9: mov rcx, qword ptr [r8 + 0x10]
0x1400c5cfd: mov qword ptr [rbp - 0x60], rcx
0x1400c5d01: sub rsi, rdi
0x1400c5d04: shr rsi, 5
0x1400c5d08: lea rcx, [rip + 0x618375e]
0x1400c5d0f: xor r14d, r14d
0x1400c5d12: mov qword ptr [rbp - 0x50], rax
0x1400c5d16: mov qword ptr [rbp - 0x58], r9
0x1400c5d1a: mov r13, r14
0x1400c5d1d: shl r13, 5
0x1400c5d21: add r13, rdi
0x1400c5d24: mov edx, 2
0x1400c5d29: mov r15, rcx
0x1400c5d2c: mov r8, r13
0x1400c5d2f: call 0x142d23770
0x1400c5d34: nop 
0x1400c5d35: test rax, rax
0x1400c5d38: jne 0x1400c5d41
0x1400c5d3a: mov rax, qword ptr [rip + 0x856e5ef]
0x1400c5d41: cmp byte ptr [rax], 3
0x1400c5d44: jne 0x1400c5e30
0x1400c5d4a: mov rcx, qword ptr [rax + 0x18]
0x1400c5d4e: test rcx, rcx
0x1400c5d51: je 0x1400c5d7a
0x1400c5d53: mov r8, qword ptr [rax + 0x10]
0x1400c5d57: cmp rcx, 1
0x1400c5d5b: jne 0x1400c5d82
0x1400c5d5d: movzx eax, byte ptr [r8]
0x1400c5d61: cmp eax, 0x2b
0x1400c5d64: je 0x1400c5e30
0x1400c5d6a: mov ebx, 0
0x1400c5d6f: cmp eax, 0x2d
0x1400c5d72: je 0x1400c5e32
0x1400c5d78: jmp 0x1400c5d86
0x1400c5d7a: mov rbx, rcx
0x1400c5d7d: jmp 0x1400c5e32
0x1400c5d82: movzx eax, byte ptr [r8]
0x1400c5d86: xor r9d, r9d
0x1400c5d89: cmp al, 0x2b
0x1400c5d8b: sete r9b
0x1400c5d8f: mov rdx, rcx
0x1400c5d92: sub rdx, r9
0x1400c5d95: add r8, r9
0x1400c5d98: mov rax, r9
0x1400c5d9b: neg rax
0x1400c5d9e: cmp rdx, 0x11
0x1400c5da2: jae 0x1400c5de4
0x1400c5da4: test rdx, rdx
0x1400c5da7: je 0x1400c5e30
0x1400c5dad: add rcx, rax
0x1400c5db0: neg rcx
0x1400c5db3: xor eax, eax
0x1400c5db5: xor ebx, ebx
0x1400c5db7: nop word ptr [rax + rax]
0x1400c5dc0: movzx edx, byte ptr [r8 + rax]
0x1400c5dc5: add edx, -0x30
0x1400c5dc8: cmp edx, 9
0x1400c5dcb: ja 0x1400c5e30
0x1400c5dcd: lea r9, [rbx + rbx*4]
0x1400c5dd1: mov edx, edx
0x1400c5dd3: lea rbx, [rdx + r9*2]
0x1400c5dd7: inc rax
0x1400c5dda: mov rdx, rcx
0x1400c5ddd: add rdx, rax
0x1400c5de0: jne 0x1400c5dc0
0x1400c5de2: jmp 0x1400c5e32
0x1400c5de4: add rcx, rax
0x1400c5de7: neg rcx
0x1400c5dea: xor r9d, r9d
0x1400c5ded: xor eax, eax
0x1400c5def: mov rdx, rcx
0x1400c5df2: add rdx, r9
0x1400c5df5: je 0x1400c6337
0x1400c5dfb: mov edx, 0xa
0x1400c5e00: mul rdx
0x1400c5e03: jo 0x1400c5e30
0x1400c5e05: movzx r10d, byte ptr [r8 + r9]
0x1400c5e0a: add r10d, -0x30
0x1400c5e0e: add rax, r10
0x1400c5e11: setb dl
0x1400c5e14: cmp r10d, 9
0x1400c5e18: ja 0x1400c5e30
0x1400c5e1a: inc r9
0x1400c5e1d: mov ebx, 0
0x1400c5e22: test dl, dl
0x1400c5e24: je 0x1400c5def
0x1400c5e26: jmp 0x1400c5e32
0x1400c5e28: nop dword ptr [rax + rax]
0x1400c5e30: xor ebx, ebx
0x1400c5e32: mov edx, 4
0x1400c5e37: lea rcx, [rip + 0x61835f6]
0x1400c5e3e: mov r8, r13
0x1400c5e41: call 0x142d23770
0x1400c5e46: nop 
0x1400c5e47: test rax, rax
0x1400c5e4a: jne 0x1400c5e53
0x1400c5e4c: mov rax, qword ptr [rip + 0x856e4dd]
0x1400c5e53: cmp byte ptr [rax], 3
0x1400c5e56: jne 0x1400c5eb0
0x1400c5e58: mov rcx, qword ptr [rax + 0x18]
0x1400c5e5c: test rcx, rcx
0x1400c5e5f: js 0x1400c6356
0x1400c5e65: mov qword ptr [rbp - 8], rcx
0x1400c5e69: je 0x1400c5eb0
0x1400c5e6b: mov rax, qword ptr [rax + 0x10]
0x1400c5e6f: mov qword ptr [rbp + 0x20], rax
0x1400c5e73: call 0x140002200
0x1400c5e78: mov r12d, 1
0x1400c5e7e: mov edx, 1
0x1400c5e83: mov rcx, qword ptr [rbp - 8]
0x1400c5e87: call 0x1400021c0
0x1400c5e8c: mov qword ptr [rbp - 0x10], rax
0x1400c5e90: test rax, rax
0x1400c5e93: je 0x1400c6394
0x1400c5e99: mov rcx, qword ptr [rbp - 0x10]
0x1400c5e9d: mov rdx, qword ptr [rbp + 0x20]
0x1400c5ea1: mov r8, qword ptr [rbp - 8]
0x1400c5ea5: call 0x14606171b
0x1400c5eaa: jmp 0x1400c5ec1
0x1400c5eac: nop dword ptr [rax]
0x1400c5eb0: mov eax, 1
0x1400c5eb5: mov qword ptr [rbp - 0x10], rax
0x1400c5eb9: mov qword ptr [rbp - 8], 0
0x1400c5ec1: mov edx, 4
0x1400c5ec6: lea rcx, [rip + 0x61835a2]
0x1400c5ecd: mov r8, r13
0x1400c5ed0: call 0x142d23770
0x1400c5ed5: nop 
0x1400c5ed6: test rax, rax
0x1400c5ed9: jne 0x1400c5ee2
0x1400c5edb: mov rax, qword ptr [rip + 0x856e44e]
0x1400c5ee2: cmp byte ptr [rax], 3
0x1400c5ee5: mov rdx, qword ptr [rbp - 0x30]
0x1400c5ee9: jne 0x1400c5f34
0x1400c5eeb: mov rcx, qword ptr [rax + 0x18]
0x1400c5eef: test rcx, rcx
0x1400c5ef2: js 0x1400c6368
0x1400c5ef8: mov qword ptr [rbp + 0x20], rcx
0x1400c5efc: je 0x1400c5f34
0x1400c5efe: mov r12, qword ptr [rax + 0x10]
0x1400c5f02: call 0x140002200
0x1400c5f07: mov edx, 1
0x1400c5f0c: mov rcx, qword ptr [rbp + 0x20]
0x1400c5f10: call 0x1400021c0
0x1400c5f15: mov qword ptr [rbp - 0x30], rax
0x1400c5f19: test rax, rax
0x1400c5f1c: je 0x1400c639e
0x1400c5f22: mov rcx, qword ptr [rbp - 0x30]
0x1400c5f26: mov rdx, r12
0x1400c5f29: mov r8, qword ptr [rbp + 0x20]
0x1400c5f2d: call 0x14606171b
0x1400c5f32: jmp 0x1400c5f45
0x1400c5f34: mov eax, 1
0x1400c5f39: mov qword ptr [rbp - 0x30], rax
0x1400c5f3d: mov qword ptr [rbp + 0x20], 0
0x1400c5f45: mov edx, 5
0x1400c5f4a: lea rcx, [rip + 0x6183522]
0x1400c5f51: mov r8, r13
0x1400c5f54: call 0x142d23770
0x1400c5f59: nop 
0x1400c5f5a: test rax, rax
0x1400c5f5d: jne 0x1400c5f66
0x1400c5f5f: mov rax, qword ptr [rip + 0x856e3ca]
0x1400c5f66: cmp byte ptr [rax], 3
0x1400c5f69: mov rdx, qword ptr [rbp - 0x28]
0x1400c5f6d: jne 0x1400c5fb8
0x1400c5f6f: mov rcx, qword ptr [rax + 0x18]
0x1400c5f73: test rcx, rcx
0x1400c5f76: js 0x1400c6372
0x1400c5f7c: mov qword ptr [rbp], rcx
0x1400c5f80: je 0x1400c5fb8
0x1400c5f82: mov r12, qword ptr [rax + 0x10]
0x1400c5f86: call 0x140002200
0x1400c5f8b: mov edx, 1
0x1400c5f90: mov rcx, qword ptr [rbp]
0x1400c5f94: call 0x1400021c0
0x1400c5f99: mov qword ptr [rbp - 0x28], rax
0x1400c5f9d: test rax, rax
0x1400c5fa0: je 0x1400c63a9
0x1400c5fa6: mov rcx, qword ptr [rbp - 0x28]
0x1400c5faa: mov rdx, r12
0x1400c5fad: mov r8, qword ptr [rbp]
0x1400c5fb1: call 0x14606171b
0x1400c5fb6: jmp 0x1400c5fc9
0x1400c5fb8: mov eax, 1
0x1400c5fbd: mov qword ptr [rbp - 0x28], rax
0x1400c5fc1: mov qword ptr [rbp], 0
0x1400c5fc9: mov edx, 7
0x1400c5fce: lea rcx, [rip + 0x61834a3]
0x1400c5fd5: mov r8, r13
0x1400c5fd8: call 0x142d23770
0x1400c5fdd: nop 
0x1400c5fde: test rax, rax
0x1400c5fe1: jne 0x1400c5fea
0x1400c5fe3: mov rax, qword ptr [rip + 0x856e346]
0x1400c5fea: cmp byte ptr [rax], 2
0x1400c5fed: jne 0x1400c5ffa
0x1400c5fef: cmp qword ptr [rax + 8], 0
0x1400c5ff4: je 0x1400c61ed
0x1400c5ffa: mov dword ptr [rbp - 0x14], 0
0x1400c6001: mov edx, 5
0x1400c6006: lea rcx, [rip + 0x6183472]
0x1400c600d: mov r8, r13
0x1400c6010: call 0x142d23770
0x1400c6015: nop 
0x1400c6016: test rax, rax
0x1400c6019: jne 0x1400c6022
0x1400c601b: mov rax, qword ptr [rip + 0x856e30e]
0x1400c6022: cmp byte ptr [rax], 3
0x1400c6025: mov rdx, qword ptr [rbp - 0x20]
0x1400c6029: jne 0x1400c6074
0x1400c602b: mov rcx, qword ptr [rax + 0x18]
0x1400c602f: test rcx, rcx
0x1400c6032: js 0x1400c637c
0x1400c6038: mov qword ptr [rbp + 8], rcx
0x1400c603c: je 0x1400c6074
0x1400c603e: mov r12, qword ptr [rax + 0x10]
0x1400c6042: call 0x140002200
0x1400c6047: mov edx, 1
0x1400c604c: mov rcx, qword ptr [rbp + 8]
0x1400c6050: call 0x1400021c0
0x1400c6055: mov qword ptr [rbp - 0x20], rax
0x1400c6059: test rax, rax
0x1400c605c: je 0x1400c63b4
0x1400c6062: mov rcx, qword ptr [rbp - 0x20]
0x1400c6066: mov rdx, r12
0x1400c6069: mov r8, qword ptr [rbp + 8]
0x1400c606d: call 0x14606171b
0x1400c6072: jmp 0x1400c6085
0x1400c6074: mov eax, 1
0x1400c6079: mov qword ptr [rbp - 0x20], rax
0x1400c607d: mov qword ptr [rbp + 8], 0
0x1400c6085: mov edx, 6
0x1400c608a: lea rcx, [rip + 0x61833f3]
0x1400c6091: mov r8, r13
0x1400c6094: call 0x142d23770
0x1400c6099: nop 
0x1400c609a: test rax, rax
0x1400c609d: jne 0x1400c60a6
0x1400c609f: mov rax, qword ptr [rip + 0x856e28a]
0x1400c60a6: mov dword ptr [rbp - 0x34], 0
0x1400c60ad: cmp byte ptr [rax], 2
0x1400c60b0: jne 0x1400c60bf
0x1400c60b2: cmp qword ptr [rax + 8], 0
0x1400c60b7: jne 0x1400c60bf
0x1400c60b9: mov eax, dword ptr [rax + 0x10]
0x1400c60bc: mov dword ptr [rbp - 0x34], eax
0x1400c60bf: mov edx, 6
0x1400c60c4: lea rcx, [rip + 0x61833bf]
0x1400c60cb: mov r8, r13
0x1400c60ce: call 0x142d23770
0x1400c60d3: nop 
0x1400c60d4: test rax, rax
0x1400c60d7: jne 0x1400c60e0
0x1400c60d9: mov rax, qword ptr [rip + 0x856e250]
0x1400c60e0: mov byte ptr [rbp + 0x2f], 1
0x1400c60e4: cmp byte ptr [rax], 1
0x1400c60e7: jne 0x1400c60f0
0x1400c60e9: movzx eax, byte ptr [rax + 1]
0x1400c60ed: mov byte ptr [rbp + 0x2f], al
0x1400c60f0: mov edx, 4
0x1400c60f5: lea rcx, [rip + 0x6183394]
0x1400c60fc: mov r8, r13
0x1400c60ff: call 0x142d23770
0x1400c6104: nop 
0x1400c6105: test rax, rax
0x1400c6108: jne 0x1400c6111
0x1400c610a: mov rax, qword ptr [rip + 0x856e21f]
0x1400c6111: cmp byte ptr [rax], 2
0x1400c6114: jne 0x1400c6136
0x1400c6116: mov rcx, qword ptr [rax + 8]
0x1400c611a: cmp rcx, 2
0x1400c611e: je 0x1400c6136
0x1400c6120: cmp ecx, 1
0x1400c6123: jne 0x1400c6323
0x1400c6129: mov rax, qword ptr [rax + 0x10]
0x1400c612d: mov qword ptr [rbp - 0x48], rax
0x1400c6131: mov r12b, 1
0x1400c6134: jmp 0x1400c6139
0x1400c6136: xor r12d, r12d
0x1400c6139: mov edx, 7
0x1400c613e: lea rcx, [rip + 0x618334f]
0x1400c6145: mov r8, r13
0x1400c6148: call 0x142d23770
0x1400c614d: nop 
0x1400c614e: test rax, rax
0x1400c6151: jne 0x1400c615a
0x1400c6153: mov rax, qword ptr [rip + 0x856e1d6]
0x1400c615a: cmp byte ptr [rax], 3
0x1400c615d: jne 0x1400c61ad
0x1400c615f: mov rcx, qword ptr [rax + 0x18]
0x1400c6163: test rcx, rcx
0x1400c6166: js 0x1400c6386
0x1400c616c: mov qword ptr [rbp + 0x18], rcx
0x1400c6170: je 0x1400c61ad
0x1400c6172: mov rax, qword ptr [rax + 0x10]
0x1400c6176: mov qword ptr [rbp - 0x40], rax
0x1400c617a: call 0x140002200
0x1400c617f: mov edx, 1
0x1400c6184: mov rcx, qword ptr [rbp + 0x18]
0x1400c6188: call 0x1400021c0
0x1400c618d: mov qword ptr [rbp + 0x10], rax
0x1400c6191: test rax, rax
0x1400c6194: je 0x1400c63bf
0x1400c619a: mov rcx, qword ptr [rbp + 0x10]
0x1400c619e: mov rdx, qword ptr [rbp - 0x40]
0x1400c61a2: mov r8, qword ptr [rbp + 0x18]
0x1400c61a6: call 0x14606171b
0x1400c61ab: jmp 0x1400c61be
0x1400c61ad: mov eax, 1
0x1400c61b2: mov qword ptr [rbp + 0x10], rax
0x1400c61b6: mov qword ptr [rbp + 0x18], 0
0x1400c61be: mov edx, 4
0x1400c61c3: lea rcx, [rip + 0x61832d1]
0x1400c61ca: mov r8, r13
0x1400c61cd: call 0x142d23770
0x1400c61d2: nop 
0x1400c61d3: test rax, rax
0x1400c61d6: jne 0x1400c61df
0x1400c61d8: mov rax, qword ptr [rip + 0x856e151]
0x1400c61df: cmp byte ptr [rax], 1
0x1400c61e2: jne 0x1400c61f9
0x1400c61e4: movzx eax, byte ptr [rax + 1]
0x1400c61e8: mov dword ptr [rbp - 0x40], eax
0x1400c61eb: jmp 0x1400c6200
0x1400c61ed: movzx eax, byte ptr [rax + 0x10]
0x1400c61f1: mov dword ptr [rbp - 0x14], eax
0x1400c61f4: jmp 0x1400c6001
0x1400c61f9: mov dword ptr [rbp - 0x40], 0
0x1400c6200: mov edx, 2
0x1400c6205: lea rcx, [rip + 0x6183293]
0x1400c620c: mov r8, r13
0x1400c620f: call 0x142d23770
0x1400c6214: nop 
0x1400c6215: test rax, rax
0x1400c6218: jne 0x1400c6221
0x1400c621a: mov rax, qword ptr [rip + 0x856e10f]
0x1400c6221: cmp byte ptr [rax], 1
0x1400c6224: jne 0x1400c622c
0x1400c6226: movzx eax, byte ptr [rax + 1]
0x1400c622a: jmp 0x1400c622e
0x1400c622c: xor eax, eax
0x1400c622e: mov r13, qword ptr [rbp - 0x48]
0x1400c6232: test r13, r13
0x1400c6235: setns cl
0x1400c6238: mov r8, qword ptr [rbp - 0x58]
0x1400c623c: lea rdx, [r8 + r8*8]
0x1400c6240: shl rdx, 4
0x1400c6244: mov r10, qword ptr [rbp - 0x60]
0x1400c6248: mov r11, qword ptr [rbp - 8]
0x1400c624c: mov qword ptr [r10 + rdx], r11
0x1400c6250: mov r9, qword ptr [rbp - 0x10]
0x1400c6254: mov qword ptr [r10 + rdx + 8], r9
0x1400c6259: mov qword ptr [r10 + rdx + 0x10], r11
0x1400c625e: mov r11, qword ptr [rbp + 0x20]
0x1400c6262: mov qword ptr [r10 + rdx + 0x18], r11
0x1400c6267: mov r9, qword ptr [rbp - 0x30]
0x1400c626b: mov qword ptr [r10 + rdx + 0x20], r9
0x1400c6270: mov qword ptr [r10 + rdx + 0x28], r11
0x1400c6275: mov r11, qword ptr [rbp]
0x1400c6279: mov qword ptr [r10 + rdx + 0x30], r11
0x1400c627e: mov r9, qword ptr [rbp - 0x28]
0x1400c6282: mov qword ptr [r10 + rdx + 0x38], r9
0x1400c6287: mov qword ptr [r10 + rdx + 0x40], r11
0x1400c628c: mov r11, qword ptr [rbp + 8]
0x1400c6290: mov qword ptr [r10 + rdx + 0x48], r11
0x1400c6295: mov r9, qword ptr [rbp - 0x20]
0x1400c6299: mov qword ptr [r10 + rdx + 0x50], r9
0x1400c629e: mov qword ptr [r10 + rdx + 0x58], r11
0x1400c62a3: mov r11, qword ptr [rbp + 0x18]
0x1400c62a7: mov qword ptr [r10 + rdx + 0x60], r11
0x1400c62ac: mov r9, qword ptr [rbp + 0x10]
0x1400c62b0: mov qword ptr [r10 + rdx + 0x68], r9
0x1400c62b5: mov qword ptr [r10 + rdx + 0x70], r11
0x1400c62ba: and r12b, cl
0x1400c62bd: movzx ecx, r12b
0x1400c62c1: mov dword ptr [r10 + rdx + 0x78], ecx
0x1400c62c6: mov r9, r8
0x1400c62c9: mov dword ptr [r10 + rdx + 0x7c], r13d
0x1400c62ce: mov qword ptr [r10 + rdx + 0x80], rbx
0x1400c62d6: mov ecx, dword ptr [rbp - 0x34]
0x1400c62d9: mov dword ptr [r10 + rdx + 0x88], ecx
0x1400c62e1: mov ecx, dword ptr [rbp - 0x40]
0x1400c62e4: mov byte ptr [r10 + rdx + 0x8c], cl
0x1400c62ec: mov byte ptr [r10 + rdx + 0x8d], al
0x1400c62f4: movzx eax, byte ptr [rbp + 0x2f]
0x1400c62f8: mov byte ptr [r10 + rdx + 0x8e], al
0x1400c6300: mov eax, dword ptr [rbp - 0x14]
0x1400c6303: mov byte ptr [r10 + rdx + 0x8f], al
0x1400c630b: inc r9
0x1400c630e: inc r14
0x1400c6311: cmp r14, rsi
0x1400c6314: mov rax, qword ptr [rbp - 0x50]
0x1400c6318: mov rcx, r15
0x1400c631b: jne 0x1400c5d16
0x1400c6321: jmp 0x1400c633f
0x1400c6323: mov rax, qword ptr [rax + 0x10]
0x1400c6327: mov qword ptr [rbp - 0x48], rax
0x1400c632b: test rax, rax
0x1400c632e: setns r12b
0x1400c6332: jmp 0x1400c6139
0x1400c6337: mov rbx, rax
0x1400c633a: jmp 0x1400c5e32
0x1400c633f: mov qword ptr [rax], r9
0x1400c6342: add rsp, 0xb8
0x1400c6349: pop rbx
0x1400c634a: pop rdi
0x1400c634b: pop rsi
0x1400c634c: pop r12
0x1400c634e: pop r13
0x1400c6350: pop r14
0x1400c6352: pop r15
0x1400c6354: pop rbp
0x1400c6355: ret 
0x1400c6356: xor r12d, r12d
0x1400c6359: mov rcx, r12
0x1400c635c: mov rdx, qword ptr [rbp - 0x10]
0x1400c6360: call 0x14620896b
0x1400c6365: nop 
0x1400c6366: jmp 0x1400c6392
0x1400c6368: xor ecx, ecx
0x1400c636a: call 0x14620896b
0x1400c636f: nop 
0x1400c6370: jmp 0x1400c6392
0x1400c6372: xor ecx, ecx
0x1400c6374: call 0x14620896b
0x1400c6379: nop 
0x1400c637a: jmp 0x1400c6392
0x1400c637c: xor ecx, ecx
0x1400c637e: call 0x14620896b
0x1400c6383: nop 
0x1400c6384: jmp 0x1400c6392
0x1400c6386: xor ecx, ecx
0x1400c6388: mov rdx, qword ptr [rbp + 0x10]
0x1400c638c: call 0x14620896b
0x1400c6391: nop 
0x1400c6392: ud2 
0x1400c6394: mov rax, qword ptr [rbp - 8]
0x1400c6398: mov qword ptr [rbp - 0x10], rax
0x1400c639c: jmp 0x1400c6359
0x1400c639e: mov rdx, qword ptr [rbp + 0x20]
0x1400c63a2: mov ecx, 1
0x1400c63a7: jmp 0x1400c636a
0x1400c63a9: mov rdx, qword ptr [rbp]
0x1400c63ad: mov ecx, 1
0x1400c63b2: jmp 0x1400c6374
0x1400c63b4: mov rdx, qword ptr [rbp + 8]
0x1400c63b8: mov ecx, 1
0x1400c63bd: jmp 0x1400c637e
0x1400c63bf: mov rax, qword ptr [rbp + 0x18]
0x1400c63c3: mov qword ptr [rbp + 0x10], rax
0x1400c63c7: mov ecx, 1
0x1400c63cc: jmp 0x1400c6388
