0x1400749a0: push rbp
0x1400749a1: push r15
0x1400749a3: push r14
0x1400749a5: push r13
0x1400749a7: push r12
0x1400749a9: push rsi
0x1400749aa: push rdi
0x1400749ab: push rbx
0x1400749ac: sub rsp, 0x118
0x1400749b3: lea rbp, [rsp + 0x80]
0x1400749bb: mov qword ptr [rbp + 0x90], 0xfffffffffffffffe
0x1400749c6: mov rax, qword ptr [r8]
0x1400749c9: mov r9, qword ptr [r8 + 8]
0x1400749cd: cmp rcx, rdx
0x1400749d0: je 0x1400750bc
0x1400749d6: mov rsi, rdx
0x1400749d9: mov rdi, rcx
0x1400749dc: mov r15, qword ptr [r8 + 0x10]
0x1400749e0: sub rsi, rcx
0x1400749e3: shr rsi, 5
0x1400749e7: lea rcx, [rip + 0x5e6f6c8]
0x1400749ee: xor ebx, ebx
0x1400749f0: mov qword ptr [rbp - 0x10], rax
0x1400749f4: mov qword ptr [rbp - 0x18], r9
0x1400749f8: mov r13, rbx
0x1400749fb: shl r13, 5
0x1400749ff: add r13, rdi
0x140074a02: mov edx, 4
0x140074a07: mov r14, rcx
0x140074a0a: mov r8, r13
0x140074a0d: call 0x142a769a0
0x140074a12: nop
0x140074a13: test rax, rax
0x140074a16: jne 0x140074a1f
0x140074a18: mov rax, qword ptr [rip + 0x81757f1]
0x140074a1f: cmp byte ptr [rax], 3
0x140074a22: jne 0x140074a80
0x140074a24: mov rcx, qword ptr [rax + 0x18]
0x140074a28: test rcx, rcx
0x140074a2b: js 0x1400750d3
0x140074a31: mov qword ptr [rbp + 0x48], rcx
0x140074a35: je 0x140074a80
0x140074a37: mov rax, qword ptr [rax + 0x10]
0x140074a3b: mov qword ptr [rbp + 0x80], rax
0x140074a42: call 0x140002200
0x140074a47: mov r12d, 1
0x140074a4d: mov edx, 1
0x140074a52: mov rcx, qword ptr [rbp + 0x48]
0x140074a56: call 0x1400021c0
0x140074a5b: mov qword ptr [rbp + 0x40], rax
0x140074a5f: test rax, rax
0x140074a62: je 0x140075133
0x140074a68: mov rcx, qword ptr [rbp + 0x40]
0x140074a6c: mov rdx, qword ptr [rbp + 0x80]
0x140074a73: mov r8, qword ptr [rbp + 0x48]
0x140074a77: call 0x145d145fb
0x140074a7c: jmp 0x140074a91
0x140074a7e: nop
0x140074a80: mov eax, 1
0x140074a85: mov qword ptr [rbp + 0x40], rax
0x140074a89: mov qword ptr [rbp + 0x48], 0
0x140074a91: mov edx, 4
0x140074a96: lea rcx, [rip + 0x5e6f5b7]
0x140074a9d: mov r8, r13
0x140074aa0: call 0x142a769a0
0x140074aa5: nop
0x140074aa6: test rax, rax
0x140074aa9: jne 0x140074ab2
0x140074aab: mov rax, qword ptr [rip + 0x817575e]
0x140074ab2: cmp byte ptr [rax], 3
0x140074ab5: mov rdx, qword ptr [rbp + 0x18]
0x140074ab9: jne 0x140074b0d
0x140074abb: mov rcx, qword ptr [rax + 0x18]
0x140074abf: test rcx, rcx
0x140074ac2: js 0x1400750e5
0x140074ac8: mov qword ptr [rbp + 0x80], rcx
0x140074acf: je 0x140074b0d
0x140074ad1: mov r12, qword ptr [rax + 0x10]
0x140074ad5: call 0x140002200
0x140074ada: mov edx, 1
0x140074adf: mov rcx, qword ptr [rbp + 0x80]
0x140074ae6: call 0x1400021c0
0x140074aeb: mov qword ptr [rbp + 0x18], rax
0x140074aef: test rax, rax
0x140074af2: je 0x14007513d
0x140074af8: mov rcx, qword ptr [rbp + 0x18]
0x140074afc: mov rdx, r12
0x140074aff: mov r8, qword ptr [rbp + 0x80]
0x140074b06: call 0x145d145fb
0x140074b0b: jmp 0x140074b21
0x140074b0d: mov eax, 1
0x140074b12: mov qword ptr [rbp + 0x18], rax
0x140074b16: mov qword ptr [rbp + 0x80], 0
0x140074b21: mov edx, 0xb
0x140074b26: lea rcx, [rip + 0x5e6f58d]
0x140074b2d: mov r8, r13
0x140074b30: call 0x142a769a0
0x140074b35: nop
0x140074b36: test rax, rax
0x140074b39: jne 0x140074b42
0x140074b3b: mov rax, qword ptr [rip + 0x81756ce]
0x140074b42: cmp byte ptr [rax], 3
0x140074b45: mov rdx, qword ptr [rbp + 0x20]
0x140074b49: jne 0x140074b94
0x140074b4b: mov rcx, qword ptr [rax + 0x18]
0x140074b4f: test rcx, rcx
0x140074b52: js 0x1400750ef
0x140074b58: mov qword ptr [rbp + 0x50], rcx
0x140074b5c: je 0x140074b94
0x140074b5e: mov r12, qword ptr [rax + 0x10]
0x140074b62: call 0x140002200
0x140074b67: mov edx, 1
0x140074b6c: mov rcx, qword ptr [rbp + 0x50]
0x140074b70: call 0x1400021c0
0x140074b75: mov qword ptr [rbp + 0x20], rax
0x140074b79: test rax, rax
0x140074b7c: je 0x14007514b
0x140074b82: mov rcx, qword ptr [rbp + 0x20]
0x140074b86: mov rdx, r12
0x140074b89: mov r8, qword ptr [rbp + 0x50]
0x140074b8d: call 0x145d145fb
0x140074b92: jmp 0x140074ba5
0x140074b94: mov eax, 1
0x140074b99: mov qword ptr [rbp + 0x20], rax
0x140074b9d: mov qword ptr [rbp + 0x50], 0
0x140074ba5: mov edx, 9
0x140074baa: lea rcx, [rip + 0x5e6f514]
0x140074bb1: mov r8, r13
0x140074bb4: call 0x142a769a0
0x140074bb9: nop
0x140074bba: test rax, rax
0x140074bbd: jne 0x140074bc6
0x140074bbf: mov rax, qword ptr [rip + 0x817564a]
0x140074bc6: cmp byte ptr [rax], 3
0x140074bc9: jne 0x140074c14
0x140074bcb: mov rcx, qword ptr [rax + 0x18]
0x140074bcf: test rcx, rcx
0x140074bd2: js 0x1400750f9
0x140074bd8: mov qword ptr [rbp + 0x60], rcx
0x140074bdc: je 0x140074c14
0x140074bde: mov r12, qword ptr [rax + 0x10]
0x140074be2: call 0x140002200
0x140074be7: mov edx, 1
0x140074bec: mov rcx, qword ptr [rbp + 0x60]
0x140074bf0: call 0x1400021c0
0x140074bf5: mov qword ptr [rbp + 0x58], rax
0x140074bf9: test rax, rax
0x140074bfc: je 0x140075156
0x140074c02: mov rcx, qword ptr [rbp + 0x58]
0x140074c06: mov rdx, r12
0x140074c09: mov r8, qword ptr [rbp + 0x60]
0x140074c0d: call 0x145d145fb
0x140074c12: jmp 0x140074c25
0x140074c14: mov eax, 1
0x140074c19: mov qword ptr [rbp + 0x58], rax
0x140074c1d: mov qword ptr [rbp + 0x60], 0
0x140074c25: mov edx, 7
0x140074c2a: lea rcx, [rip + 0x5e6f49d]
0x140074c31: mov r8, r13
0x140074c34: call 0x142a769a0
0x140074c39: nop
0x140074c3a: test rax, rax
0x140074c3d: jne 0x140074c46
0x140074c3f: mov rax, qword ptr [rip + 0x81755ca]
0x140074c46: lea rcx, [rax + 8]
0x140074c4a: cmp byte ptr [rax], 4
0x140074c4d: mov eax, 0
0x140074c52: cmovne rcx, rax
0x140074c56: mov qword ptr [rbp - 0x60], 1
0x140074c5e: mov qword ptr [rbp - 0x58], rcx
0x140074c62: mov qword ptr [rbp - 0x50], 0
0x140074c6a: mov qword ptr [rbp - 0x40], 0
0x140074c72: lea rcx, [rbp - 0x30]
0x140074c76: lea rdx, [rbp - 0x60]
0x140074c7a: call 0x1400e2240
0x140074c7f: nop
0x140074c80: mov edx, 4
0x140074c85: lea rcx, [rip + 0x5e6f449]
0x140074c8c: mov r8, r13
0x140074c8f: call 0x142a769a0
0x140074c94: nop
0x140074c95: test rax, rax
0x140074c98: jne 0x140074ca1
0x140074c9a: mov rax, qword ptr [rip + 0x817556f]
0x140074ca1: cmp byte ptr [rax], 3
0x140074ca4: mov rdx, qword ptr [rbp + 0x28]
0x140074ca8: jne 0x140074cf3
0x140074caa: mov rcx, qword ptr [rax + 0x18]
0x140074cae: test rcx, rcx
0x140074cb1: js 0x140075107
0x140074cb7: mov qword ptr [rbp + 0x68], rcx
0x140074cbb: je 0x140074cf3
0x140074cbd: mov r12, qword ptr [rax + 0x10]
0x140074cc1: call 0x140002200
0x140074cc6: mov edx, 1
0x140074ccb: mov rcx, qword ptr [rbp + 0x68]
0x140074ccf: call 0x1400021c0
0x140074cd4: mov qword ptr [rbp + 0x28], rax
0x140074cd8: test rax, rax
0x140074cdb: je 0x140075165
0x140074ce1: mov rcx, qword ptr [rbp + 0x28]
0x140074ce5: mov rdx, r12
0x140074ce8: mov r8, qword ptr [rbp + 0x68]
0x140074cec: call 0x145d145fb
0x140074cf1: jmp 0x140074d04
0x140074cf3: mov eax, 1
0x140074cf8: mov qword ptr [rbp + 0x28], rax
0x140074cfc: mov qword ptr [rbp + 0x68], 0
0x140074d04: mov edx, 5
0x140074d09: lea rcx, [rip + 0x5e6f383]
0x140074d10: mov r8, r13
0x140074d13: call 0x142a769a0
0x140074d18: nop
0x140074d19: test rax, rax
0x140074d1c: jne 0x140074d25
0x140074d1e: mov rax, qword ptr [rip + 0x81754eb]
0x140074d25: cmp byte ptr [rax], 3
0x140074d28: mov rdx, qword ptr [rbp + 0x30]
0x140074d2c: jne 0x140074d77
0x140074d2e: mov rcx, qword ptr [rax + 0x18]
0x140074d32: test rcx, rcx
0x140074d35: js 0x140075111
0x140074d3b: mov qword ptr [rbp + 0x70], rcx
0x140074d3f: je 0x140074d77
0x140074d41: mov r12, qword ptr [rax + 0x10]
0x140074d45: call 0x140002200
0x140074d4a: mov edx, 1
0x140074d4f: mov rcx, qword ptr [rbp + 0x70]
0x140074d53: call 0x1400021c0
0x140074d58: mov qword ptr [rbp + 0x30], rax
0x140074d5c: test rax, rax
0x140074d5f: je 0x140075170
0x140074d65: mov rcx, qword ptr [rbp + 0x30]
0x140074d69: mov rdx, r12
0x140074d6c: mov r8, qword ptr [rbp + 0x70]
0x140074d70: call 0x145d145fb
0x140074d75: jmp 0x140074d88
0x140074d77: mov eax, 1
0x140074d7c: mov qword ptr [rbp + 0x30], rax
0x140074d80: mov qword ptr [rbp + 0x70], 0
0x140074d88: mov edx, 4
0x140074d8d: lea rcx, [rip + 0x5e6f345]
0x140074d94: mov r8, r13
0x140074d97: call 0x142a769a0
0x140074d9c: nop
0x140074d9d: test rax, rax
0x140074da0: jne 0x140074da9
0x140074da2: mov rax, qword ptr [rip + 0x8175467]
0x140074da9: cmp byte ptr [rax], 3
0x140074dac: mov rdx, qword ptr [rbp + 0x38]
0x140074db0: jne 0x140074dfb
0x140074db2: mov rcx, qword ptr [rax + 0x18]
0x140074db6: test rcx, rcx
0x140074db9: js 0x14007511b
0x140074dbf: mov qword ptr [rbp + 0x78], rcx
0x140074dc3: je 0x140074dfb
0x140074dc5: mov r12, qword ptr [rax + 0x10]
0x140074dc9: call 0x140002200
0x140074dce: mov edx, 1
0x140074dd3: mov rcx, qword ptr [rbp + 0x78]
0x140074dd7: call 0x1400021c0
0x140074ddc: mov qword ptr [rbp + 0x38], rax
0x140074de0: test rax, rax
0x140074de3: je 0x14007517b
0x140074de9: mov rcx, qword ptr [rbp + 0x38]
0x140074ded: mov rdx, r12
0x140074df0: mov r8, qword ptr [rbp + 0x78]
0x140074df4: call 0x145d145fb
0x140074df9: jmp 0x140074e0c
0x140074dfb: mov eax, 1
0x140074e00: mov qword ptr [rbp + 0x38], rax
0x140074e04: mov qword ptr [rbp + 0x78], 0
0x140074e0c: mov edx, 6
0x140074e11: lea rcx, [rip + 0x5e6f2c5]
0x140074e18: mov r8, r13
0x140074e1b: call 0x142a769a0
0x140074e20: nop
0x140074e21: test rax, rax
0x140074e24: jne 0x140074e2d
0x140074e26: mov rax, qword ptr [rip + 0x81753e3]
0x140074e2d: mov r12b, 1
0x140074e30: cmp byte ptr [rax], 1
0x140074e33: jne 0x140074e3a
0x140074e35: movzx r12d, byte ptr [rax + 1]
0x140074e3a: mov edx, 7
0x140074e3f: lea rcx, [rip + 0x5e6f29d]
0x140074e46: mov r8, r13
0x140074e49: call 0x142a769a0
0x140074e4e: nop
0x140074e4f: test rax, rax
0x140074e52: jne 0x140074e5b
0x140074e54: mov rax, qword ptr [rip + 0x81753b5]
0x140074e5b: mov ecx, 1
0x140074e60: mov qword ptr [rbp - 8], rcx
0x140074e64: cmp byte ptr [rax], 2
0x140074e67: jne 0x140074e78
0x140074e69: cmp qword ptr [rax + 8], 0
0x140074e6e: jne 0x140074e78
0x140074e70: mov rax, qword ptr [rax + 0x10]
0x140074e74: mov qword ptr [rbp - 8], rax
0x140074e78: mov edx, 3
0x140074e7d: lea rcx, [rip + 0x5e6f266]
0x140074e84: mov r8, r13
0x140074e87: call 0x142a769a0
0x140074e8c: nop
0x140074e8d: test rax, rax
0x140074e90: jne 0x140074e99
0x140074e92: mov rax, qword ptr [rip + 0x8175377]
0x140074e99: mov ecx, 5
0x140074e9e: mov qword ptr [rbp], rcx
0x140074ea2: cmp byte ptr [rax], 2
0x140074ea5: jne 0x140074eb6
0x140074ea7: cmp qword ptr [rax + 8], 0
0x140074eac: jne 0x140074eb6
0x140074eae: mov rax, qword ptr [rax + 0x10]
0x140074eb2: mov qword ptr [rbp], rax
0x140074eb6: mov edx, 6
0x140074ebb: lea rcx, [rip + 0x5e6f22b]
0x140074ec2: mov r8, r13
0x140074ec5: call 0x142a769a0
0x140074eca: nop
0x140074ecb: test rax, rax
0x140074ece: jne 0x140074ed7
0x140074ed0: mov rax, qword ptr [rip + 0x8175339]
0x140074ed7: cmp byte ptr [rax], 1
0x140074eda: jne 0x140074ee5
0x140074edc: movzx eax, byte ptr [rax + 1]
0x140074ee0: mov dword ptr [rbp + 0x14], eax
0x140074ee3: jmp 0x140074eec
0x140074ee5: mov dword ptr [rbp + 0x14], 0
0x140074eec: mov edx, 7
0x140074ef1: lea rcx, [rip + 0x5e6f1fb]
0x140074ef8: mov r8, r13
0x140074efb: call 0x142a769a0
0x140074f00: nop
0x140074f01: test rax, rax
0x140074f04: jne 0x140074f0d
0x140074f06: mov rax, qword ptr [rip + 0x8175303]
0x140074f0d: cmp byte ptr [rax], 3
0x140074f10: jne 0x140074f5f
0x140074f12: mov r13, qword ptr [rax + 0x18]
0x140074f16: test r13, r13
0x140074f19: js 0x140075125
0x140074f1f: mov byte ptr [rbp + 0x8f], r12b
0x140074f26: je 0x140074f66
0x140074f28: mov rax, qword ptr [rax + 0x10]
0x140074f2c: mov qword ptr [rbp + 8], rax
0x140074f30: call 0x140002200
0x140074f35: mov edx, 1
0x140074f3a: mov rcx, r13
0x140074f3d: call 0x1400021c0
0x140074f42: test rax, rax
0x140074f45: je 0x140075186
0x140074f4b: mov r12, rax
0x140074f4e: mov rcx, rax
0x140074f51: mov rdx, qword ptr [rbp + 8]
0x140074f55: mov r8, r13
0x140074f58: call 0x145d145fb
0x140074f5d: jmp 0x140074f6f
0x140074f5f: mov byte ptr [rbp + 0x8f], r12b
0x140074f66: mov r12d, 1
0x140074f6c: xor r13d, r13d
0x140074f6f: mov rax, qword ptr [rbp - 0x20]
0x140074f73: mov qword ptr [rbp - 0x50], rax
0x140074f77: movups xmm0, xmmword ptr [rbp - 0x30]
0x140074f7b: movaps xmmword ptr [rbp - 0x60], xmm0
0x140074f7f: mov r9, qword ptr [rbp - 0x18]
0x140074f83: imul rax, r9, 0xf0
0x140074f8a: mov r8, qword ptr [rbp + 0x48]
0x140074f8e: mov qword ptr [r15 + rax], r8
0x140074f92: mov rcx, qword ptr [rbp + 0x40]
0x140074f96: mov qword ptr [r15 + rax + 8], rcx
0x140074f9b: mov qword ptr [r15 + rax + 0x10], r8
0x140074fa0: mov r8, qword ptr [rbp + 0x80]
0x140074fa7: mov qword ptr [r15 + rax + 0x18], r8
0x140074fac: mov rcx, qword ptr [rbp + 0x18]
0x140074fb0: mov qword ptr [r15 + rax + 0x20], rcx
0x140074fb5: mov qword ptr [r15 + rax + 0x28], r8
0x140074fba: mov r8, qword ptr [rbp + 0x50]
0x140074fbe: mov qword ptr [r15 + rax + 0x30], r8
0x140074fc3: mov rcx, qword ptr [rbp + 0x20]
0x140074fc7: mov qword ptr [r15 + rax + 0x38], rcx
0x140074fcc: mov qword ptr [r15 + rax + 0x40], r8
0x140074fd1: movaps xmm0, xmmword ptr [rbp - 0x60]
0x140074fd5: movups xmmword ptr [r15 + rax + 0x48], xmm0
0x140074fdb: mov rcx, qword ptr [rbp - 0x50]
0x140074fdf: mov qword ptr [r15 + rax + 0x58], rcx
0x140074fe4: mov r8, qword ptr [rbp + 0x68]
0x140074fe8: mov qword ptr [r15 + rax + 0x60], r8
0x140074fed: mov rcx, qword ptr [rbp + 0x28]
0x140074ff1: mov qword ptr [r15 + rax + 0x68], rcx
0x140074ff6: mov qword ptr [r15 + rax + 0x70], r8
0x140074ffb: mov r8, qword ptr [rbp + 0x70]
0x140074fff: mov qword ptr [r15 + rax + 0x78], r8
0x140075004: mov rcx, qword ptr [rbp + 0x30]
0x140075008: mov qword ptr [r15 + rax + 0x80], rcx
0x140075010: mov qword ptr [r15 + rax + 0x88], r8
0x140075018: mov r8, qword ptr [rbp + 0x78]
0x14007501c: mov qword ptr [r15 + rax + 0x90], r8
0x140075024: mov rcx, qword ptr [rbp + 0x38]
0x140075028: mov qword ptr [r15 + rax + 0x98], rcx
0x140075030: mov qword ptr [r15 + rax + 0xa0], r8
0x140075038: mov qword ptr [r15 + rax + 0xa8], r13
0x140075040: mov qword ptr [rbp + 8], r12
0x140075044: mov qword ptr [r15 + rax + 0xb0], r12
0x14007504c: mov qword ptr [r15 + rax + 0xb8], r13
0x140075054: mov r8, qword ptr [rbp + 0x60]
0x140075058: mov qword ptr [r15 + rax + 0xc0], r8
0x140075060: mov rcx, qword ptr [rbp + 0x58]
0x140075064: mov qword ptr [r15 + rax + 0xc8], rcx
0x14007506c: mov qword ptr [r15 + rax + 0xd0], r8
0x140075074: mov rcx, qword ptr [rbp - 8]
0x140075078: mov qword ptr [r15 + rax + 0xd8], rcx
0x140075080: mov rcx, qword ptr [rbp]
0x140075084: mov qword ptr [r15 + rax + 0xe0], rcx
0x14007508c: movzx ecx, byte ptr [rbp + 0x8f]
0x140075093: mov byte ptr [r15 + rax + 0xe8], cl
0x14007509b: mov ecx, dword ptr [rbp + 0x14]
0x14007509e: mov byte ptr [r15 + rax + 0xe9], cl
0x1400750a6: inc r9
0x1400750a9: inc rbx
0x1400750ac: cmp rbx, rsi
0x1400750af: mov rax, qword ptr [rbp - 0x10]
0x1400750b3: mov rcx, r14
0x1400750b6: jne 0x1400749f4
0x1400750bc: mov qword ptr [rax], r9
0x1400750bf: add rsp, 0x118
0x1400750c6: pop rbx
0x1400750c7: pop rdi
0x1400750c8: pop rsi
0x1400750c9: pop r12
0x1400750cb: pop r13
0x1400750cd: pop r14
0x1400750cf: pop r15
0x1400750d1: pop rbp
0x1400750d2: ret
0x1400750d3: xor r12d, r12d
0x1400750d6: mov rcx, r12
0x1400750d9: mov rdx, qword ptr [rbp + 0x40]
0x1400750dd: call 0x145eb6fcb
0x1400750e2: nop
0x1400750e3: jmp 0x140075131
0x1400750e5: xor ecx, ecx
0x1400750e7: call 0x145eb6fcb
0x1400750ec: nop
0x1400750ed: jmp 0x140075131
0x1400750ef: xor ecx, ecx
0x1400750f1: call 0x145eb6fcb
0x1400750f6: nop
0x1400750f7: jmp 0x140075131
0x1400750f9: xor ecx, ecx
0x1400750fb: mov rdx, qword ptr [rbp + 0x58]
0x1400750ff: call 0x145eb6fcb
0x140075104: nop
0x140075105: jmp 0x140075131
0x140075107: xor ecx, ecx
0x140075109: call 0x145eb6fcb
0x14007510e: nop
0x14007510f: jmp 0x140075131
0x140075111: xor ecx, ecx
0x140075113: call 0x145eb6fcb
0x140075118: nop
0x140075119: jmp 0x140075131
0x14007511b: xor ecx, ecx
0x14007511d: call 0x145eb6fcb
0x140075122: nop
0x140075123: jmp 0x140075131
0x140075125: xor ecx, ecx
0x140075127: mov rdx, qword ptr [rbp + 8]
0x14007512b: call 0x145eb6fcb
0x140075130: nop
0x140075131: ud2
0x140075133: mov rax, qword ptr [rbp + 0x48]
0x140075137: mov qword ptr [rbp + 0x40], rax
0x14007513b: jmp 0x1400750d6
0x14007513d: mov rdx, qword ptr [rbp + 0x80]
0x140075144: mov ecx, 1
0x140075149: jmp 0x1400750e7
0x14007514b: mov rdx, qword ptr [rbp + 0x50]
0x14007514f: mov ecx, 1
0x140075154: jmp 0x1400750f1
0x140075156: mov rax, qword ptr [rbp + 0x60]
0x14007515a: mov qword ptr [rbp + 0x58], rax
0x14007515e: mov ecx, 1
0x140075163: jmp 0x1400750fb
0x140075165: mov rdx, qword ptr [rbp + 0x68]
0x140075169: mov ecx, 1
0x14007516e: jmp 0x140075109
0x140075170: mov rdx, qword ptr [rbp + 0x70]
0x140075174: mov ecx, 1
0x140075179: jmp 0x140075113
0x14007517b: mov rdx, qword ptr [rbp + 0x78]
0x14007517f: mov ecx, 1
0x140075184: jmp 0x14007511d
0x140075186: mov qword ptr [rbp + 8], r13
0x14007518a: mov ecx, 1
0x14007518f: jmp 0x140075127
