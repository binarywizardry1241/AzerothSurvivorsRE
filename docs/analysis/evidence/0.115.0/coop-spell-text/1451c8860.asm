0x1451c8860: push r15
0x1451c8862: push r14
0x1451c8864: push r12
0x1451c8866: push rsi
0x1451c8867: push rdi
0x1451c8868: push rbx
0x1451c8869: sub rsp, 0x318
0x1451c8870: mov rdi, r8
0x1451c8873: mov rbx, rdx
0x1451c8876: mov rsi, rcx
0x1451c8879: lea rcx, [rsp + 0x70]
0x1451c887e: call 0x14525ec60
0x1451c8883: movzx eax, byte ptr [rsp + 0x70]
0x1451c8888: cmp al, 0xff
0x1451c888a: je 0x1451c88f4
0x1451c888c: mov rcx, qword ptr [rsp + 0xa0]
0x1451c8894: mov qword ptr [rsp + 0x5f], rcx
0x1451c8899: movups xmm0, xmmword ptr [rsp + 0x71]
0x1451c889e: movups xmm1, xmmword ptr [rsp + 0x81]
0x1451c88a6: movups xmm2, xmmword ptr [rsp + 0x91]
0x1451c88ae: movaps xmmword ptr [rsp + 0x50], xmm2
0x1451c88b3: movaps xmmword ptr [rsp + 0x40], xmm1
0x1451c88b8: movaps xmmword ptr [rsp + 0x30], xmm0
0x1451c88bd: movups xmm0, xmmword ptr [rsp + 0xa8]
0x1451c88c5: movups xmmword ptr [rsi + 0x38], xmm0
0x1451c88c9: mov rcx, qword ptr [rsp + 0x5f]
0x1451c88ce: mov qword ptr [rsi + 0x30], rcx
0x1451c88d2: movaps xmm0, xmmword ptr [rsp + 0x30]
0x1451c88d7: movaps xmm1, xmmword ptr [rsp + 0x40]
0x1451c88dc: movaps xmm2, xmmword ptr [rsp + 0x50]
0x1451c88e1: movups xmmword ptr [rsi + 0x21], xmm2
0x1451c88e5: movups xmmword ptr [rsi + 0x11], xmm1
0x1451c88e9: movups xmmword ptr [rsi + 1], xmm0
0x1451c88ed: mov byte ptr [rsi], al
0x1451c88ef: jmp 0x1451c899f
0x1451c88f4: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c88f9: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8901: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8909: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c890e: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8913: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8918: movaps xmmword ptr [rsp + 0x130], xmm0
0x1451c8920: movaps xmmword ptr [rsp + 0x140], xmm1
0x1451c8928: movaps xmmword ptr [rsp + 0x150], xmm2
0x1451c8930: lea rax, [rsp + 0x130]
0x1451c8938: mov qword ptr [rsp + 0x20], rax
0x1451c893d: lea r8, [rip + 0x1abfb7c]
0x1451c8944: lea rcx, [rsp + 0xb8]
0x1451c894c: mov r9d, 8
0x1451c8952: mov rdx, rdi
0x1451c8955: call 0x1452cbf10
0x1451c895a: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8962: je 0x1451c89b3
0x1451c8964: mov rax, qword ptr [rsp + 0xf8]
0x1451c896c: mov qword ptr [rsi + 0x40], rax
0x1451c8970: movups xmm0, xmmword ptr [rsp + 0xb8]
0x1451c8978: movups xmm1, xmmword ptr [rsp + 0xc8]
0x1451c8980: movups xmm2, xmmword ptr [rsp + 0xd8]
0x1451c8988: movups xmm3, xmmword ptr [rsp + 0xe8]
0x1451c8990: movups xmmword ptr [rsi + 0x30], xmm3
0x1451c8994: movups xmmword ptr [rsi + 0x20], xmm2
0x1451c8998: movups xmmword ptr [rsi + 0x10], xmm1
0x1451c899c: movups xmmword ptr [rsi], xmm0
0x1451c899f: mov rax, rsi
0x1451c89a2: add rsp, 0x318
0x1451c89a9: pop rbx
0x1451c89aa: pop rdi
0x1451c89ab: pop rsi
0x1451c89ac: pop r12
0x1451c89ae: pop r14
0x1451c89b0: pop r15
0x1451c89b2: ret
0x1451c89b3: lea rcx, [rsp + 0x70]
0x1451c89b8: mov rdx, rbx
0x1451c89bb: call 0x14525fb70
0x1451c89c0: movzx eax, byte ptr [rsp + 0x70]
0x1451c89c5: cmp al, 0xff
0x1451c89c7: jne 0x1451c888c
0x1451c89cd: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c89d2: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c89da: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c89e2: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c89e7: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c89ec: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c89f1: movaps xmmword ptr [rsp + 0x160], xmm0
0x1451c89f9: movaps xmmword ptr [rsp + 0x170], xmm1
0x1451c8a01: movaps xmmword ptr [rsp + 0x180], xmm2
0x1451c8a09: lea rax, [rsp + 0x160]
0x1451c8a11: mov qword ptr [rsp + 0x20], rax
0x1451c8a16: lea r8, [rip + 0x1abfaab]
0x1451c8a1d: lea rcx, [rsp + 0xb8]
0x1451c8a25: mov r9d, 0xd
0x1451c8a2b: mov rdx, rdi
0x1451c8a2e: call 0x1452cbf10
0x1451c8a33: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8a3b: jne 0x1451c8964
0x1451c8a41: lea rcx, [rsp + 0x70]
0x1451c8a46: mov rdx, rbx
0x1451c8a49: call 0x14525ede0
0x1451c8a4e: movzx eax, byte ptr [rsp + 0x70]
0x1451c8a53: cmp al, 0xff
0x1451c8a55: jne 0x1451c888c
0x1451c8a5b: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c8a60: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8a68: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8a70: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c8a75: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8a7a: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8a7f: movaps xmmword ptr [rsp + 0x190], xmm0
0x1451c8a87: movaps xmmword ptr [rsp + 0x1a0], xmm1
0x1451c8a8f: movaps xmmword ptr [rsp + 0x1b0], xmm2
0x1451c8a97: lea rax, [rsp + 0x190]
0x1451c8a9f: mov qword ptr [rsp + 0x20], rax
0x1451c8aa4: lea r8, [rip + 0x1abfa2a]
0x1451c8aab: lea rcx, [rsp + 0xb8]
0x1451c8ab3: mov r9d, 0xc
0x1451c8ab9: mov rdx, rdi
0x1451c8abc: call 0x1452cbf10
0x1451c8ac1: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8ac9: jne 0x1451c8964
0x1451c8acf: lea rcx, [rsp + 0x70]
0x1451c8ad4: mov rdx, rbx
0x1451c8ad7: call 0x14525ef60
0x1451c8adc: movzx eax, byte ptr [rsp + 0x70]
0x1451c8ae1: cmp al, 0xff
0x1451c8ae3: jne 0x1451c888c
0x1451c8ae9: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c8aee: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8af6: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8afe: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c8b03: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8b08: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8b0d: movaps xmmword ptr [rsp + 0x1c0], xmm0
0x1451c8b15: movaps xmmword ptr [rsp + 0x1d0], xmm1
0x1451c8b1d: movaps xmmword ptr [rsp + 0x1e0], xmm2
0x1451c8b25: lea rax, [rsp + 0x1c0]
0x1451c8b2d: mov qword ptr [rsp + 0x20], rax
0x1451c8b32: lea r8, [rip + 0x1abf9a8]
0x1451c8b39: lea rcx, [rsp + 0xb8]
0x1451c8b41: mov r9d, 0xd
0x1451c8b47: mov rdx, rdi
0x1451c8b4a: call 0x1452cbf10
0x1451c8b4f: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8b57: jne 0x1451c8964
0x1451c8b5d: lea rcx, [rsp + 0x70]
0x1451c8b62: mov rdx, rbx
0x1451c8b65: mov r8b, 1
0x1451c8b68: call 0x14525f0e0
0x1451c8b6d: movzx eax, byte ptr [rsp + 0x70]
0x1451c8b72: cmp al, 0xff
0x1451c8b74: jne 0x1451c888c
0x1451c8b7a: lea r15, [rsp + 0x78]
0x1451c8b7f: lea r14, [rsp + 0x37]
0x1451c8b84: movups xmm0, xmmword ptr [r15]
0x1451c8b88: movups xmm1, xmmword ptr [r15 + 0x10]
0x1451c8b8d: movups xmm2, xmmword ptr [r15 + 0x20]
0x1451c8b92: movups xmmword ptr [r14 + 0x20], xmm2
0x1451c8b97: movups xmmword ptr [r14 + 0x10], xmm1
0x1451c8b9c: movups xmmword ptr [r14], xmm0
0x1451c8ba0: movups xmm0, xmmword ptr [r14]
0x1451c8ba4: movups xmm1, xmmword ptr [r14 + 0x10]
0x1451c8ba9: movups xmm2, xmmword ptr [r14 + 0x20]
0x1451c8bae: movaps xmmword ptr [rsp + 0x100], xmm0
0x1451c8bb6: movaps xmmword ptr [rsp + 0x110], xmm1
0x1451c8bbe: movaps xmmword ptr [rsp + 0x120], xmm2
0x1451c8bc6: lea r12, [rsp + 0x100]
0x1451c8bce: mov qword ptr [rsp + 0x20], r12
0x1451c8bd3: lea r8, [rip + 0x1abf914]
0x1451c8bda: lea rcx, [rsp + 0xb8]
0x1451c8be2: mov r9d, 0xb
0x1451c8be8: mov rdx, rdi
0x1451c8beb: call 0x1452cbf10
0x1451c8bf0: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8bf8: jne 0x1451c8964
0x1451c8bfe: lea rcx, [rsp + 0x70]
0x1451c8c03: mov rdx, rbx
0x1451c8c06: xor r8d, r8d
0x1451c8c09: call 0x14525f0e0
0x1451c8c0e: movzx eax, byte ptr [rsp + 0x70]
0x1451c8c13: cmp al, 0xff
0x1451c8c15: jne 0x1451c888c
0x1451c8c1b: movups xmm0, xmmword ptr [r15]
0x1451c8c1f: movups xmm1, xmmword ptr [r15 + 0x10]
0x1451c8c24: movups xmm2, xmmword ptr [r15 + 0x20]
0x1451c8c29: movups xmmword ptr [r14 + 0x20], xmm2
0x1451c8c2e: movups xmmword ptr [r14 + 0x10], xmm1
0x1451c8c33: movups xmmword ptr [r14], xmm0
0x1451c8c37: movups xmm0, xmmword ptr [r14]
0x1451c8c3b: movups xmm1, xmmword ptr [r14 + 0x10]
0x1451c8c40: movups xmm2, xmmword ptr [r14 + 0x20]
0x1451c8c45: movaps xmmword ptr [rsp + 0x100], xmm0
0x1451c8c4d: movaps xmmword ptr [rsp + 0x110], xmm1
0x1451c8c55: movaps xmmword ptr [rsp + 0x120], xmm2
0x1451c8c5d: mov qword ptr [rsp + 0x20], r12
0x1451c8c62: lea r8, [rip + 0x1abf890]
0x1451c8c69: lea rcx, [rsp + 0xb8]
0x1451c8c71: mov r9d, 0xd
0x1451c8c77: mov rdx, rdi
0x1451c8c7a: call 0x1452cbf10
0x1451c8c7f: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8c87: jne 0x1451c8964
0x1451c8c8d: lea rcx, [rsp + 0x70]
0x1451c8c92: mov rdx, rbx
0x1451c8c95: call 0x14525f270
0x1451c8c9a: movzx eax, byte ptr [rsp + 0x70]
0x1451c8c9f: cmp al, 0xff
0x1451c8ca1: jne 0x1451c888c
0x1451c8ca7: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c8cac: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8cb4: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8cbc: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c8cc1: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8cc6: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8ccb: movaps xmmword ptr [rsp + 0x1f0], xmm0
0x1451c8cd3: movaps xmmword ptr [rsp + 0x200], xmm1
0x1451c8cdb: movaps xmmword ptr [rsp + 0x210], xmm2
0x1451c8ce3: lea rax, [rsp + 0x1f0]
0x1451c8ceb: mov qword ptr [rsp + 0x20], rax
0x1451c8cf0: lea r8, [rip + 0x1abf80f]
0x1451c8cf7: lea rcx, [rsp + 0xb8]
0x1451c8cff: mov r9d, 0x10
0x1451c8d05: mov rdx, rdi
0x1451c8d08: call 0x1452cbf10
0x1451c8d0d: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8d15: jne 0x1451c8964
0x1451c8d1b: lea rcx, [rsp + 0x70]
0x1451c8d20: mov rdx, rbx
0x1451c8d23: call 0x14525f3f0
0x1451c8d28: movzx eax, byte ptr [rsp + 0x70]
0x1451c8d2d: cmp al, 0xff
0x1451c8d2f: jne 0x1451c888c
0x1451c8d35: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c8d3a: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8d42: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8d4a: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c8d4f: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8d54: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8d59: movaps xmmword ptr [rsp + 0x220], xmm0
0x1451c8d61: movaps xmmword ptr [rsp + 0x230], xmm1
0x1451c8d69: movaps xmmword ptr [rsp + 0x240], xmm2
0x1451c8d71: lea rax, [rsp + 0x220]
0x1451c8d79: mov qword ptr [rsp + 0x20], rax
0x1451c8d7e: lea r8, [rip + 0x1abf791]
0x1451c8d85: lea rcx, [rsp + 0xb8]
0x1451c8d8d: mov r9d, 0x13
0x1451c8d93: mov rdx, rdi
0x1451c8d96: call 0x1452cbf10
0x1451c8d9b: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8da3: jne 0x1451c8964
0x1451c8da9: lea rcx, [rsp + 0x70]
0x1451c8dae: mov rdx, rbx
0x1451c8db1: call 0x14525f570
0x1451c8db6: movzx eax, byte ptr [rsp + 0x70]
0x1451c8dbb: cmp al, 0xff
0x1451c8dbd: jne 0x1451c888c
0x1451c8dc3: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c8dc8: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8dd0: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8dd8: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c8ddd: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8de2: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8de7: movaps xmmword ptr [rsp + 0x250], xmm0
0x1451c8def: movaps xmmword ptr [rsp + 0x260], xmm1
0x1451c8df7: movaps xmmword ptr [rsp + 0x270], xmm2
0x1451c8dff: lea rax, [rsp + 0x250]
0x1451c8e07: mov qword ptr [rsp + 0x20], rax
0x1451c8e0c: lea r8, [rip + 0x1abf716]
0x1451c8e13: lea rcx, [rsp + 0xb8]
0x1451c8e1b: mov r9d, 0x16
0x1451c8e21: mov rdx, rdi
0x1451c8e24: call 0x1452cbf10
0x1451c8e29: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8e31: jne 0x1451c8964
0x1451c8e37: lea rcx, [rsp + 0x70]
0x1451c8e3c: mov rdx, rbx
0x1451c8e3f: call 0x14525f6f0
0x1451c8e44: movzx eax, byte ptr [rsp + 0x70]
0x1451c8e49: cmp al, 0xff
0x1451c8e4b: jne 0x1451c888c
0x1451c8e51: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c8e56: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8e5e: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8e66: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c8e6b: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8e70: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8e75: movaps xmmword ptr [rsp + 0x280], xmm0
0x1451c8e7d: movaps xmmword ptr [rsp + 0x290], xmm1
0x1451c8e85: movaps xmmword ptr [rsp + 0x2a0], xmm2
0x1451c8e8d: lea rax, [rsp + 0x280]
0x1451c8e95: mov qword ptr [rsp + 0x20], rax
0x1451c8e9a: lea r8, [rip + 0x1abf69e]
0x1451c8ea1: lea rcx, [rsp + 0xb8]
0x1451c8ea9: mov r9d, 9
0x1451c8eaf: mov rdx, rdi
0x1451c8eb2: call 0x1452cbf10
0x1451c8eb7: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8ebf: jne 0x1451c8964
0x1451c8ec5: lea rcx, [rsp + 0x70]
0x1451c8eca: mov rdx, rbx
0x1451c8ecd: call 0x14525f870
0x1451c8ed2: movzx eax, byte ptr [rsp + 0x70]
0x1451c8ed7: cmp al, 0xff
0x1451c8ed9: jne 0x1451c888c
0x1451c8edf: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c8ee4: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8eec: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8ef4: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c8ef9: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8efe: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8f03: movaps xmmword ptr [rsp + 0x2b0], xmm0
0x1451c8f0b: movaps xmmword ptr [rsp + 0x2c0], xmm1
0x1451c8f13: movaps xmmword ptr [rsp + 0x2d0], xmm2
0x1451c8f1b: lea rax, [rsp + 0x2b0]
0x1451c8f23: mov qword ptr [rsp + 0x20], rax
0x1451c8f28: lea r8, [rip + 0x1abf619]
0x1451c8f2f: lea rcx, [rsp + 0xb8]
0x1451c8f37: mov r9d, 0x11
0x1451c8f3d: mov rdx, rdi
0x1451c8f40: call 0x1452cbf10
0x1451c8f45: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8f4d: jne 0x1451c8964
0x1451c8f53: lea rcx, [rsp + 0x70]
0x1451c8f58: mov rdx, rbx
0x1451c8f5b: call 0x14525f9f0
0x1451c8f60: movzx eax, byte ptr [rsp + 0x70]
0x1451c8f65: cmp al, 0xff
0x1451c8f67: jne 0x1451c888c
0x1451c8f6d: movups xmm0, xmmword ptr [rsp + 0x78]
0x1451c8f72: movups xmm1, xmmword ptr [rsp + 0x88]
0x1451c8f7a: movups xmm2, xmmword ptr [rsp + 0x98]
0x1451c8f82: movups xmmword ptr [rsp + 0x57], xmm2
0x1451c8f87: movups xmmword ptr [rsp + 0x47], xmm1
0x1451c8f8c: movups xmmword ptr [rsp + 0x37], xmm0
0x1451c8f91: movaps xmmword ptr [rsp + 0x2e0], xmm0
0x1451c8f99: movaps xmmword ptr [rsp + 0x2f0], xmm1
0x1451c8fa1: movaps xmmword ptr [rsp + 0x300], xmm2
0x1451c8fa9: lea rax, [rsp + 0x2e0]
0x1451c8fb1: mov qword ptr [rsp + 0x20], rax
0x1451c8fb6: lea r8, [rip + 0x1abf59c]
0x1451c8fbd: lea rcx, [rsp + 0xb8]
0x1451c8fc5: mov r9d, 0xd
0x1451c8fcb: mov rdx, rdi
0x1451c8fce: call 0x1452cbf10
0x1451c8fd3: cmp byte ptr [rsp + 0xb8], 0xff
0x1451c8fdb: jne 0x1451c8964
0x1451c8fe1: mov byte ptr [rsi], 0xff
0x1451c8fe4: jmp 0x1451c899f
