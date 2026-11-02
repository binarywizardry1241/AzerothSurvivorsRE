0x1401f6c60: push rbp
0x1401f6c61: push r15
0x1401f6c63: push r14
0x1401f6c65: push r13
0x1401f6c67: push r12
0x1401f6c69: push rsi
0x1401f6c6a: push rdi
0x1401f6c6b: push rbx
0x1401f6c6c: sub rsp, 0x58
0x1401f6c70: lea rbp, [rsp + 0x50]
0x1401f6c75: mov qword ptr [rbp], 0xfffffffffffffffe
0x1401f6c7d: mov qword ptr [rbp - 0x10], rcx
0x1401f6c81: cmp rdx, 2
0x1401f6c85: jb 0x1401f72c7
0x1401f6c8b: mov rdi, rdx
0x1401f6c8e: lea rax, [rdx + 0x10]
0x1401f6c92: cmp r9, rax
0x1401f6c95: jb 0x1401f732d
0x1401f6c9b: mov r15, r8
0x1401f6c9e: mov r13, rdi
0x1401f6ca1: shr r13, 1
0x1401f6ca4: cmp rdi, 7
0x1401f6ca8: mov qword ptr [rbp - 0x18], r8
0x1401f6cac: mov qword ptr [rbp - 0x20], r13
0x1401f6cb0: jbe 0x1401f6f54
0x1401f6cb6: mov r12, qword ptr [rbp - 0x10]
0x1401f6cba: cmp qword ptr [r12 + 0x1c0], 0
0x1401f6cc3: setne al
0x1401f6cc6: cmp qword ptr [r12 + 0xd0], 0
0x1401f6ccf: sete cl
0x1401f6cd2: and cl, al
0x1401f6cd4: cmp qword ptr [r12 + 0x3a0], 0
0x1401f6cdd: setne dl
0x1401f6ce0: cmp qword ptr [r12 + 0x2b0], 0
0x1401f6ce9: sete r8b
0x1401f6ced: movzx eax, cl
0x1401f6cf0: imul rcx, rax, 0xf0
0x1401f6cf7: xor al, 1
0x1401f6cf9: movzx eax, al
0x1401f6cfc: imul r9, rax, 0xf0
0x1401f6d03: lea r10, [r12 + 0x1e0]
0x1401f6d0b: lea rax, [r12 + 0x2d0]
0x1401f6d13: test dl, r8b
0x1401f6d16: mov rbx, r10
0x1401f6d19: cmovne rbx, rax
0x1401f6d1d: cmovne rax, r10
0x1401f6d21: cmp qword ptr [rbx + 0xd0], 0
0x1401f6d29: setne r8b
0x1401f6d2d: cmp qword ptr [r12 + rcx + 0xd0], 0
0x1401f6d36: mov r13, rdi
0x1401f6d39: lea rdi, [r12 + r9]
0x1401f6d3d: sete r10b
0x1401f6d41: cmp qword ptr [rax + 0xd0], 0
0x1401f6d49: setne r11b
0x1401f6d4d: cmp qword ptr [r12 + r9 + 0xd0], 0
0x1401f6d56: sete r9b
0x1401f6d5a: test r11b, r9b
0x1401f6d5d: mov rsi, rdi
0x1401f6d60: cmovne rsi, rbx
0x1401f6d64: lea rdx, [r12 + rcx]
0x1401f6d68: test r8b, r10b
0x1401f6d6b: cmovne rsi, rdx
0x1401f6d6f: cmovne rdx, rbx
0x1401f6d73: cmovne rbx, rdi
0x1401f6d77: test r11b, r9b
0x1401f6d7a: cmove rdi, rax
0x1401f6d7e: cmovne rbx, rax
0x1401f6d82: cmp qword ptr [rbx + 0xd0], 0
0x1401f6d8a: setne al
0x1401f6d8d: cmp qword ptr [rsi + 0xd0], 0
0x1401f6d95: sete cl
0x1401f6d98: test al, cl
0x1401f6d9a: mov r14, rsi
0x1401f6d9d: cmovne r14, rbx
0x1401f6da1: cmovne rbx, rsi
0x1401f6da5: mov r8d, 0xf0
0x1401f6dab: mov rcx, r15
0x1401f6dae: call 0x145d145fb
0x1401f6db3: lea rcx, [r15 + 0xf0]
0x1401f6dba: mov r8d, 0xf0
0x1401f6dc0: mov rdx, r14
0x1401f6dc3: call 0x145d145fb
0x1401f6dc8: lea rcx, [r15 + 0x1e0]
0x1401f6dcf: mov r8d, 0xf0
0x1401f6dd5: mov rdx, rbx
0x1401f6dd8: call 0x145d145fb
0x1401f6ddd: lea rcx, [r15 + 0x2d0]
0x1401f6de4: mov r8d, 0xf0
0x1401f6dea: mov rdx, rdi
0x1401f6ded: call 0x145d145fb
0x1401f6df2: imul rsi, qword ptr [rbp - 0x20], 0xf0
0x1401f6dfa: cmp qword ptr [r12 + rsi + 0x1c0], 0
0x1401f6e03: setne al
0x1401f6e06: cmp qword ptr [r12 + rsi + 0xd0], 0
0x1401f6e0f: sete cl
0x1401f6e12: and cl, al
0x1401f6e14: cmp qword ptr [r12 + rsi + 0x3a0], 0
0x1401f6e1d: setne al
0x1401f6e20: cmp qword ptr [r12 + rsi + 0x2b0], 0
0x1401f6e29: sete dl
0x1401f6e2c: movzx r8d, cl
0x1401f6e30: imul rcx, r8, 0xf0
0x1401f6e37: xor r8b, 1
0x1401f6e3b: movzx r8d, r8b
0x1401f6e3f: imul r8, r8, 0xf0
0x1401f6e46: test al, dl
0x1401f6e48: lea rdx, [r12 + rsi + 0x2d0]
0x1401f6e50: lea rax, [r12 + rsi + 0x1e0]
0x1401f6e58: mov rbx, rax
0x1401f6e5b: cmovne rbx, rdx
0x1401f6e5f: cmove rax, rdx
0x1401f6e63: cmp qword ptr [rbx + 0xd0], 0
0x1401f6e6b: lea rdx, [r12 + rsi]
0x1401f6e6f: setne r9b
0x1401f6e73: cmp qword ptr [rcx + rdx + 0xd0], 0
0x1401f6e7c: lea rdi, [rdx + r8]
0x1401f6e80: sete r10b
0x1401f6e84: cmp qword ptr [rax + 0xd0], 0
0x1401f6e8c: setne r11b
0x1401f6e90: cmp qword ptr [r8 + rdx + 0xd0], 0
0x1401f6e99: sete r8b
0x1401f6e9d: test r11b, r8b
0x1401f6ea0: mov r12, r15
0x1401f6ea3: mov r15, rdi
0x1401f6ea6: cmovne r15, rbx
0x1401f6eaa: add rdx, rcx
0x1401f6ead: test r9b, r10b
0x1401f6eb0: cmovne r15, rdx
0x1401f6eb4: cmovne rdx, rbx
0x1401f6eb8: cmovne rbx, rdi
0x1401f6ebc: test r11b, r8b
0x1401f6ebf: cmove rdi, rax
0x1401f6ec3: cmovne rbx, rax
0x1401f6ec7: cmp qword ptr [rbx + 0xd0], 0
0x1401f6ecf: setne al
0x1401f6ed2: cmp qword ptr [r15 + 0xd0], 0
0x1401f6eda: lea rcx, [r12 + rsi]
0x1401f6ede: sete r8b
0x1401f6ee2: test al, r8b
0x1401f6ee5: mov r14, r15
0x1401f6ee8: cmovne r14, rbx
0x1401f6eec: cmovne rbx, r15
0x1401f6ef0: mov r8d, 0xf0
0x1401f6ef6: call 0x145d145fb
0x1401f6efb: lea rcx, [r12 + rsi]
0x1401f6eff: add rcx, 0xf0
0x1401f6f06: mov r8d, 0xf0
0x1401f6f0c: mov rdx, r14
0x1401f6f0f: call 0x145d145fb
0x1401f6f14: lea rcx, [r12 + rsi]
0x1401f6f18: add rcx, 0x1e0
0x1401f6f1f: mov r8d, 0xf0
0x1401f6f25: mov rdx, rbx
0x1401f6f28: call 0x145d145fb
0x1401f6f2d: lea rcx, [r12 + rsi]
0x1401f6f31: add rcx, 0x2d0
0x1401f6f38: mov r8d, 0xf0
0x1401f6f3e: mov rdx, rdi
0x1401f6f41: mov rdi, r13
0x1401f6f44: mov r13, qword ptr [rbp - 0x20]
0x1401f6f48: call 0x145d145fb
0x1401f6f4d: mov ebx, 4
0x1401f6f52: jmp 0x1401f6f87
0x1401f6f54: mov r8d, 0xf0
0x1401f6f5a: mov rcx, r15
0x1401f6f5d: mov rsi, qword ptr [rbp - 0x10]
0x1401f6f61: mov rdx, rsi
0x1401f6f64: call 0x145d145fb
0x1401f6f69: imul rcx, r13, 0xf0
0x1401f6f70: lea rdx, [rsi + rcx]
0x1401f6f74: add rcx, r15
0x1401f6f77: mov r8d, 0xf0
0x1401f6f7d: call 0x145d145fb
0x1401f6f82: mov ebx, 1
0x1401f6f87: mov qword ptr [rbp - 0x30], rdi
0x1401f6f8b: sub rdi, r13
0x1401f6f8e: mov qword ptr [rbp - 0x28], rdi
0x1401f6f92: cmp rbx, r13
0x1401f6f95: jae 0x1401f7093
0x1401f6f9b: imul rsi, rbx, 0xf0
0x1401f6fa2: mov r14, rbx
0x1401f6fa5: jmp 0x1401f6ff3
0x1401f6fa7: nop word ptr [rax + rax]
0x1401f6fb0: mov rcx, r15
0x1401f6fb3: mov r8d, 0xd0
0x1401f6fb9: mov rdx, rdi
0x1401f6fbc: call 0x145d145fb
0x1401f6fc1: mov qword ptr [r15 + r13 - 0x20], r12
0x1401f6fc6: mov rax, qword ptr [rbp - 8]
0x1401f6fca: movups xmm0, xmmword ptr [rax]
0x1401f6fcd: movups xmmword ptr [r15 + r13 - 0x18], xmm0
0x1401f6fd3: mov rax, qword ptr [rax + 0x10]
0x1401f6fd7: mov qword ptr [r15 + r13 - 8], rax
0x1401f6fdc: mov r13, qword ptr [rbp - 0x20]
0x1401f6fe0: inc r14
0x1401f6fe3: add rsi, 0xf0
0x1401f6fea: cmp r14, r13
0x1401f6fed: je 0x1401f7093
0x1401f6ff3: imul r15, r14, 0xf0
0x1401f6ffa: mov rax, qword ptr [rbp - 0x10]
0x1401f6ffe: lea rdi, [rax + r15]
0x1401f7002: mov r12, qword ptr [rbp - 0x18]
0x1401f7006: lea rcx, [r12 + r15]
0x1401f700a: mov r8d, 0xf0
0x1401f7010: mov rdx, rdi
0x1401f7013: call 0x145d145fb
0x1401f7018: mov r12, qword ptr [r12 + r15 + 0xd0]
0x1401f7020: test r12, r12
0x1401f7023: je 0x1401f6fe0
0x1401f7025: mov rax, qword ptr [rbp - 0x18]
0x1401f7029: cmp qword ptr [rax + r15 - 0x20], 0
0x1401f702f: jne 0x1401f6fe0
0x1401f7031: lea rax, [rdi + 0xd8]
0x1401f7038: mov qword ptr [rbp - 8], rax
0x1401f703c: mov rcx, rsi
0x1401f703f: mov r15, qword ptr [rbp - 0x18]
0x1401f7043: nop word ptr cs:[rax + rax]
0x1401f7050: mov r13, rcx
0x1401f7053: add rcx, r15
0x1401f7056: lea rdx, [r15 + r13]
0x1401f705a: add rdx, -0xf0
0x1401f7061: mov r8d, 0xf0
0x1401f7067: call 0x145d145fb
0x1401f706c: cmp r13, 0xf0
0x1401f7073: je 0x1401f6fb0
0x1401f7079: lea rcx, [r13 - 0xf0]
0x1401f7080: cmp qword ptr [r15 + r13 - 0x110], 0
0x1401f7089: je 0x1401f7050
0x1401f708b: add rcx, r15
0x1401f708e: jmp 0x1401f6fb3
0x1401f7093: imul rax, r13, 0xf0
0x1401f709a: mov qword ptr [rbp - 8], rax
0x1401f709e: mov rcx, qword ptr [rbp - 0x18]
0x1401f70a2: lea r14, [rcx + rax]
0x1401f70a6: cmp rbx, qword ptr [rbp - 0x28]
0x1401f70aa: jae 0x1401f7193
0x1401f70b0: mov rax, qword ptr [rbp - 8]
0x1401f70b4: add rax, qword ptr [rbp - 0x10]
0x1401f70b8: mov qword ptr [rbp - 8], rax
0x1401f70bc: imul r13, rbx, 0xf0
0x1401f70c3: jmp 0x1401f710d
0x1401f70c5: nop word ptr cs:[rax + rax]
0x1401f70d0: mov rcx, r14
0x1401f70d3: mov r8d, 0xd0
0x1401f70d9: mov rdx, rdi
0x1401f70dc: call 0x145d145fb
0x1401f70e1: mov qword ptr [r14 + rsi - 0x20], r12
0x1401f70e6: movups xmm0, xmmword ptr [r15]
0x1401f70ea: movups xmmword ptr [r14 + rsi - 0x18], xmm0
0x1401f70f0: mov rax, qword ptr [r15 + 0x10]
0x1401f70f4: mov qword ptr [r14 + rsi - 8], rax
0x1401f70f9: inc rbx
0x1401f70fc: add r13, 0xf0
0x1401f7103: cmp rbx, qword ptr [rbp - 0x28]
0x1401f7107: je 0x1401f7193
0x1401f710d: imul rsi, rbx, 0xf0
0x1401f7114: mov rax, qword ptr [rbp - 8]
0x1401f7118: lea rdi, [rax + rsi]
0x1401f711c: lea rcx, [r14 + rsi]
0x1401f7120: mov r8d, 0xf0
0x1401f7126: mov rdx, rdi
0x1401f7129: call 0x145d145fb
0x1401f712e: mov r12, qword ptr [r14 + rsi + 0xd0]
0x1401f7136: test r12, r12
0x1401f7139: je 0x1401f70f9
0x1401f713b: cmp qword ptr [r14 + rsi - 0x20], 0
0x1401f7141: jne 0x1401f70f9
0x1401f7143: lea r15, [rdi + 0xd8]
0x1401f714a: mov rcx, r13
0x1401f714d: nop dword ptr [rax]
0x1401f7150: mov rsi, rcx
0x1401f7153: add rcx, r14
0x1401f7156: lea rdx, [r14 + rsi]
0x1401f715a: add rdx, -0xf0
0x1401f7161: mov r8d, 0xf0
0x1401f7167: call 0x145d145fb
0x1401f716c: cmp rsi, 0xf0
0x1401f7173: je 0x1401f70d0
0x1401f7179: lea rcx, [rsi - 0xf0]
0x1401f7180: cmp qword ptr [r14 + rsi - 0x110], 0
0x1401f7189: je 0x1401f7150
0x1401f718b: add rcx, r14
0x1401f718e: jmp 0x1401f70d3
0x1401f7193: imul rax, qword ptr [rbp - 0x30], 0xf0
0x1401f719b: mov rdi, qword ptr [rbp - 0x10]
0x1401f719f: lea rbx, [rdi + rax]
0x1401f71a3: add rbx, -0xf0
0x1401f71aa: mov qword ptr [rbp - 8], rax
0x1401f71ae: mov r15, qword ptr [rbp - 0x18]
0x1401f71b2: lea r13, [r15 + rax]
0x1401f71b6: add r13, -0xf0
0x1401f71bd: lea r12, [r14 - 0xf0]
0x1401f71c4: mov rax, qword ptr [rbp - 0x20]
0x1401f71c8: jmp 0x1401f723c
0x1401f71ca: nop word ptr [rax + rax]
0x1401f71d0: movzx eax, r15b
0x1401f71d4: xor r15b, 1
0x1401f71d8: imul rax, rax, 0xf0
0x1401f71df: add r14, rax
0x1401f71e2: movzx eax, r15b
0x1401f71e6: imul rax, rax, 0xf0
0x1401f71ed: mov r15, qword ptr [rbp - 0x28]
0x1401f71f1: add r15, rax
0x1401f71f4: add rdi, 0xf0
0x1401f71fb: mov r8d, 0xf0
0x1401f7201: mov rcx, rbx
0x1401f7204: call 0x145d145fb
0x1401f7209: movzx eax, r13b
0x1401f720d: imul rcx, rax, 0xf0
0x1401f7214: lea r13, [rcx + rsi]
0x1401f7218: add r13, -0xf0
0x1401f721f: neg rax
0x1401f7222: imul rax, rax, 0xf0
0x1401f7229: add r12, rax
0x1401f722c: add rbx, -0xf0
0x1401f7233: mov rax, qword ptr [rbp - 0x20]
0x1401f7237: dec rax
0x1401f723a: je 0x1401f72a4
0x1401f723c: mov qword ptr [rbp - 0x20], rax
0x1401f7240: cmp qword ptr [r14 + 0xd0], 0
0x1401f7248: setne al
0x1401f724b: mov qword ptr [rbp - 0x28], r15
0x1401f724f: cmp qword ptr [r15 + 0xd0], 0
0x1401f7257: sete r15b
0x1401f725b: mov rdx, r14
0x1401f725e: and r15b, al
0x1401f7261: jne 0x1401f7267
0x1401f7263: mov rdx, qword ptr [rbp - 0x28]
0x1401f7267: mov r8d, 0xf0
0x1401f726d: mov rcx, rdi
0x1401f7270: call 0x145d145fb
0x1401f7275: cmp qword ptr [r13 + 0xd0], 0
0x1401f727d: setne al
0x1401f7280: cmp qword ptr [r12 + 0xd0], 0
0x1401f7289: mov rsi, r13
0x1401f728c: sete r13b
0x1401f7290: mov rdx, r12
0x1401f7293: and r13b, al
0x1401f7296: jne 0x1401f71d0
0x1401f729c: mov rdx, rsi
0x1401f729f: jmp 0x1401f71d0
0x1401f72a4: add r12, 0xf0
0x1401f72ab: add r13, 0xf0
0x1401f72b2: test byte ptr [rbp - 0x30], 1
0x1401f72b6: jne 0x1401f72d8
0x1401f72b8: cmp r14, r13
0x1401f72bb: setne al
0x1401f72be: cmp r15, r12
0x1401f72c1: jne 0x1401f7321
0x1401f72c3: test al, al
0x1401f72c5: jne 0x1401f7327
0x1401f72c7: add rsp, 0x58
0x1401f72cb: pop rbx
0x1401f72cc: pop rdi
0x1401f72cd: pop rsi
0x1401f72ce: pop r12
0x1401f72d0: pop r13
0x1401f72d2: pop r14
0x1401f72d4: pop r15
0x1401f72d6: pop rbp
0x1401f72d7: ret
0x1401f72d8: xor ebx, ebx
0x1401f72da: mov rsi, r15
0x1401f72dd: xor r15d, r15d
0x1401f72e0: cmp rsi, r12
0x1401f72e3: setae bl
0x1401f72e6: setb r15b
0x1401f72ea: mov rdx, r14
0x1401f72ed: cmovb rdx, rsi
0x1401f72f1: mov r8d, 0xf0
0x1401f72f7: mov rcx, rdi
0x1401f72fa: call 0x145d145fb
0x1401f72ff: imul rax, r15, 0xf0
0x1401f7306: mov r15, rsi
0x1401f7309: add r15, rax
0x1401f730c: imul rax, rbx, 0xf0
0x1401f7313: add r14, rax
0x1401f7316: cmp r14, r13
0x1401f7319: setne al
0x1401f731c: cmp r15, r12
0x1401f731f: je 0x1401f72c3
0x1401f7321: mov al, 1
0x1401f7323: test al, al
0x1401f7325: je 0x1401f72c7
0x1401f7327: call 0x145eb7700
0x1401f732c: nop
0x1401f732d: ud2
