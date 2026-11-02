0x145850b20: push rbp
0x145850b21: push r14
0x145850b23: push rsi
0x145850b24: push rdi
0x145850b25: push rbx
0x145850b26: sub rsp, 0x160
0x145850b2d: lea rbp, [rsp + 0x80]
0x145850b35: mov qword ptr [rbp + 0xd8], 0xfffffffffffffffe
0x145850b40: mov rdi, r9
0x145850b43: mov qword ptr [rbp + 0xb0], rdx
0x145850b4a: mov rsi, rcx
0x145850b4d: mov rbx, qword ptr [rbp + 0x138]
0x145850b54: test r8b, 1
0x145850b58: jne 0x145850cee
0x145850b5e: mov r14, qword ptr [rip + 0x29c3ecb]
0x145850b65: mov rdi, qword ptr [r14]
0x145850b68: test rdi, rdi
0x145850b6b: je 0x145850b75
0x145850b6d: dec rdi
0x145850b70: jmp 0x145850cee
0x145850b75: mov byte ptr [rbp + 0xd7], 1
0x145850b7c: mov byte ptr [rbp + 0xd6], 1
0x145850b83: mov byte ptr [rbp + 0xd5], 1
0x145850b8a: lea rdx, [rip + 0x17bbf6f]
0x145850b91: lea rcx, [rbp - 0x40]
0x145850b95: mov r8d, 0xe
0x145850b9b: call 0x145cd3d10
0x145850ba0: nop
0x145850ba1: mov rax, qword ptr [rbp - 0x40]
0x145850ba5: cmp rax, -1
0x145850ba9: je 0x145850c04
0x145850bab: mov qword ptr [rbp + 0xc0], rax
0x145850bb2: mov rdx, qword ptr [rbp - 0x38]
0x145850bb6: mov r8, qword ptr [rbp - 0x30]
0x145850bba: lea rcx, [rbp + 0x30]
0x145850bbe: mov qword ptr [rbp + 0xa8], rdx
0x145850bc5: call 0x145cefb70
0x145850bca: nop
0x145850bcb: cmp dword ptr [rbp + 0x30], 1
0x145850bcf: je 0x145850ca1
0x145850bd5: mov rcx, qword ptr [rbp + 0x40]
0x145850bd9: test rcx, rcx
0x145850bdc: je 0x145850ca1
0x145850be2: mov r8, qword ptr [rbp + 0x38]
0x145850be6: cmp rcx, 1
0x145850bea: jne 0x145850c0e
0x145850bec: movzx eax, byte ptr [r8]
0x145850bf0: cmp eax, 0x2b
0x145850bf3: je 0x145850ca1
0x145850bf9: cmp eax, 0x2d
0x145850bfc: je 0x145850ca1
0x145850c02: jmp 0x145850c12
0x145850c04: mov edi, 0x200000
0x145850c09: jmp 0x145850ce7
0x145850c0e: movzx eax, byte ptr [r8]
0x145850c12: xor r9d, r9d
0x145850c15: cmp al, 0x2b
0x145850c17: sete r9b
0x145850c1b: mov rdx, rcx
0x145850c1e: sub rdx, r9
0x145850c21: add r8, r9
0x145850c24: mov rax, r9
0x145850c27: neg rax
0x145850c2a: cmp rdx, 0x11
0x145850c2e: jae 0x145850c63
0x145850c30: test rdx, rdx
0x145850c33: je 0x145850cb4
0x145850c35: add rcx, rax
0x145850c38: neg rcx
0x145850c3b: xor edi, edi
0x145850c3d: xor eax, eax
0x145850c3f: movzx edx, byte ptr [r8 + rax]
0x145850c44: add edx, -0x30
0x145850c47: cmp edx, 9
0x145850c4a: ja 0x145850cc4
0x145850c4c: lea r9, [rdi + rdi*4]
0x145850c50: mov edx, edx
0x145850c52: lea rdi, [rdx + r9*2]
0x145850c56: inc rax
0x145850c59: mov rdx, rcx
0x145850c5c: add rdx, rax
0x145850c5f: jne 0x145850c3f
0x145850c61: jmp 0x145850cc9
0x145850c63: add rcx, rax
0x145850c66: neg rcx
0x145850c69: xor edi, edi
0x145850c6b: mov r9d, 0xa
0x145850c71: xor r10d, r10d
0x145850c74: mov rax, rcx
0x145850c77: add rax, r10
0x145850c7a: je 0x145850cc9
0x145850c7c: mov rax, rdi
0x145850c7f: mul r9
0x145850c82: jo 0x145850ca1
0x145850c84: mov rdi, rax
0x145850c87: movzx edx, byte ptr [r8 + r10]
0x145850c8c: add edx, -0x30
0x145850c8f: add rdi, rdx
0x145850c92: setb al
0x145850c95: cmp edx, 9
0x145850c98: ja 0x145850ca1
0x145850c9a: inc r10
0x145850c9d: test al, al
0x145850c9f: je 0x145850c74
0x145850ca1: mov edi, 0x200000
0x145850ca6: mov rdx, qword ptr [rbp + 0xc0]
0x145850cad: test rdx, rdx
0x145850cb0: jne 0x145850cd5
0x145850cb2: jmp 0x145850ce7
0x145850cb4: xor edi, edi
0x145850cb6: mov rdx, qword ptr [rbp + 0xc0]
0x145850cbd: test rdx, rdx
0x145850cc0: jne 0x145850cd5
0x145850cc2: jmp 0x145850ce7
0x145850cc4: mov edi, 0x200000
0x145850cc9: mov rdx, qword ptr [rbp + 0xc0]
0x145850cd0: test rdx, rdx
0x145850cd3: je 0x145850ce7
0x145850cd5: mov r8d, 1
0x145850cdb: mov rcx, qword ptr [rbp + 0xa8]
0x145850ce2: call 0x1400021d0
0x145850ce7: lea rax, [rdi + 1]
0x145850ceb: mov qword ptr [r14], rax
0x145850cee: mov byte ptr [rbp + 0xd7], 1
0x145850cf5: mov byte ptr [rbp + 0xd6], 1
0x145850cfc: mov byte ptr [rbp + 0xd5], 1
0x145850d03: call 0x145cbeb60
0x145850d08: nop
0x145850d09: mov byte ptr [rbp + 0xd7], 1
0x145850d10: mov byte ptr [rbp + 0xd6], 1
0x145850d17: mov byte ptr [rbp + 0xd5], 0
0x145850d1e: mov rcx, rax
0x145850d21: mov rdx, qword ptr [rbp + 0xb0]
0x145850d28: call 0x145cc8ff0
0x145850d2d: nop
0x145850d2e: movzx ecx, byte ptr [rbp + 0x130]
0x145850d35: mov qword ptr [rbp + 0xc8], rax
0x145850d3c: test cl, cl
0x145850d3e: je 0x145850d59
0x145850d40: mov qword ptr [rbp - 0x60], 0
0x145850d48: mov qword ptr [rbp - 0x58], 8
0x145850d50: xorps xmm0, xmm0
0x145850d53: movups xmmword ptr [rbp - 0x50], xmm0
0x145850d57: jmp 0x145850d78
0x145850d59: mov byte ptr [rbp + 0xd3], 1
0x145850d60: mov byte ptr [rbp + 0xd2], 1
0x145850d67: lea rcx, [rbp - 0x60]
0x145850d6b: lea rdx, [rbp + 0xc8]
0x145850d72: call 0x145cd1c10
0x145850d77: nop
0x145850d78: mov qword ptr [rbp - 0x40], 1
0x145850d80: mov qword ptr [rbp - 0x38], 1
0x145850d88: mov qword ptr [rbp - 0x30], rbx
0x145850d8c: mov qword ptr [rbp - 0x28], 0
0x145850d94: call 0x140002200
0x145850d99: mov ecx, 0x30
0x145850d9e: mov edx, 8
0x145850da3: call 0x1400021c0
0x145850da8: test rax, rax
0x145850dab: mov qword ptr [rbp + 0xc0], rax
0x145850db2: je 0x145850fd8
0x145850db8: mov rdx, rax
0x145850dbb: movups xmm0, xmmword ptr [rbp - 0x40]
0x145850dbf: movups xmm1, xmmword ptr [rbp - 0x30]
0x145850dc3: movups xmm2, xmmword ptr [rbp - 0x20]
0x145850dc7: movups xmmword ptr [rax + 0x20], xmm2
0x145850dcb: movups xmmword ptr [rax + 0x10], xmm1
0x145850dcf: movups xmmword ptr [rax], xmm0
0x145850dd2: mov qword ptr [rbp + 0xb8], rax
0x145850dd9: lock inc qword ptr [rax]
0x145850ddd: jle 0x14585100c
0x145850de3: mov rcx, qword ptr [rbp + 0x140]
0x145850dea: mov rax, qword ptr [rcx + 0x40]
0x145850dee: mov qword ptr [rbp + 0x70], rax
0x145850df2: movups xmm0, xmmword ptr [rcx]
0x145850df5: movups xmm1, xmmword ptr [rcx + 0x10]
0x145850df9: movups xmm2, xmmword ptr [rcx + 0x20]
0x145850dfd: movups xmm3, xmmword ptr [rcx + 0x30]
0x145850e01: movaps xmmword ptr [rbp + 0x60], xmm3
0x145850e05: movaps xmmword ptr [rbp + 0x50], xmm2
0x145850e09: movaps xmmword ptr [rbp + 0x40], xmm1
0x145850e0d: movaps xmmword ptr [rbp + 0x30], xmm0
0x145850e11: movups xmm0, xmmword ptr [rbp - 0x60]
0x145850e15: movups xmm1, xmmword ptr [rbp - 0x50]
0x145850e19: movups xmmword ptr [rbp + 0x88], xmm1
0x145850e20: movups xmmword ptr [rbp + 0x78], xmm0
0x145850e24: mov qword ptr [rbp + 0x98], rdx
0x145850e2b: mov rcx, qword ptr [rdx + 0x10]
0x145850e2f: test rcx, rcx
0x145850e32: je 0x145850e45
0x145850e34: add rcx, 0x10
0x145850e38: mov byte ptr [rbp + 0xd4], 1
0x145850e3f: call 0x145cbebe0
0x145850e44: nop
0x145850e45: mov rax, qword ptr [rbp + 0x90]
0x145850e4c: mov qword ptr [rbp + 0x20], rax
0x145850e50: mov rax, qword ptr [rbp + 0x98]
0x145850e57: mov qword ptr [rbp + 0x28], rax
0x145850e5b: movaps xmm0, xmmword ptr [rbp + 0x80]
0x145850e62: movaps xmmword ptr [rbp + 0x10], xmm0
0x145850e66: movaps xmm0, xmmword ptr [rbp + 0x70]
0x145850e6a: movaps xmmword ptr [rbp], xmm0
0x145850e6e: movaps xmm0, xmmword ptr [rbp + 0x30]
0x145850e72: movaps xmm1, xmmword ptr [rbp + 0x40]
0x145850e76: movaps xmm2, xmmword ptr [rbp + 0x50]
0x145850e7a: movaps xmm3, xmmword ptr [rbp + 0x60]
0x145850e7e: movaps xmmword ptr [rbp - 0x10], xmm3
0x145850e82: movaps xmmword ptr [rbp - 0x20], xmm2
0x145850e86: movaps xmmword ptr [rbp - 0x30], xmm1
0x145850e8a: movaps xmmword ptr [rbp - 0x40], xmm0
0x145850e8e: call 0x140002200
0x145850e93: mov ecx, 0x70
0x145850e98: mov edx, 8
0x145850e9d: call 0x1400021c0
0x145850ea2: test rax, rax
0x145850ea5: je 0x145850fea
0x145850eab: movaps xmm0, xmmword ptr [rbp + 0x90]
0x145850eb2: movups xmmword ptr [rax + 0x60], xmm0
0x145850eb6: movaps xmm0, xmmword ptr [rbp + 0x80]
0x145850ebd: movups xmmword ptr [rax + 0x50], xmm0
0x145850ec1: movaps xmm0, xmmword ptr [rbp + 0x70]
0x145850ec5: movups xmmword ptr [rax + 0x40], xmm0
0x145850ec9: movaps xmm0, xmmword ptr [rbp + 0x30]
0x145850ecd: movaps xmm1, xmmword ptr [rbp + 0x40]
0x145850ed1: movaps xmm2, xmmword ptr [rbp + 0x50]
0x145850ed5: movaps xmm3, xmmword ptr [rbp + 0x60]
0x145850ed9: movups xmmword ptr [rax + 0x30], xmm3
0x145850edd: movups xmmword ptr [rax + 0x20], xmm2
0x145850ee1: movups xmmword ptr [rax + 0x10], xmm1
0x145850ee5: movups xmmword ptr [rax], xmm0
0x145850ee8: mov rcx, qword ptr [rbp + 0xc8]
0x145850eef: lock inc qword ptr [rcx]
0x145850ef3: jle 0x14585100c
0x145850ef9: mov rcx, qword ptr [rbp + 0xc8]
0x145850f00: mov qword ptr [rbp - 0x40], rcx
0x145850f04: mov qword ptr [rbp - 0x38], rax
0x145850f08: lea rax, [rip + 0x17bbb49]
0x145850f0f: mov qword ptr [rbp - 0x30], rax
0x145850f13: call 0x140002200
0x145850f18: mov ecx, 0x18
0x145850f1d: mov edx, 8
0x145850f22: call 0x1400021c0
0x145850f27: test rax, rax
0x145850f2a: je 0x145850ffc
0x145850f30: mov rcx, qword ptr [rbp - 0x30]
0x145850f34: mov qword ptr [rax + 0x10], rcx
0x145850f38: movups xmm0, xmmword ptr [rbp - 0x40]
0x145850f3c: movups xmmword ptr [rax], xmm0
0x145850f3f: mov byte ptr [rbp + 0xd4], 0
0x145850f46: mov rcx, rdi
0x145850f49: mov rdx, rax
0x145850f4c: call 0x145cbec70
0x145850f51: nop
0x145850f52: cmp rax, 1
0x145850f56: jne 0x145850fae
0x145850f58: mov qword ptr [rsi + 8], rdx
0x145850f5c: mov qword ptr [rsi], 0
0x145850f63: mov rax, qword ptr [rbp + 0xb8]
0x145850f6a: lock dec qword ptr [rax]
0x145850f6e: jne 0x145850f7d
0x145850f70: lea rcx, [rbp + 0xb8]
0x145850f77: call 0x145ccc910
0x145850f7c: nop
0x145850f7d: mov rax, qword ptr [rbp + 0xc8]
0x145850f84: lock dec qword ptr [rax]
0x145850f88: jne 0x145850fc7
0x145850f8a: mov byte ptr [rbp + 0xd7], 0
0x145850f91: mov byte ptr [rbp + 0xd6], 0
0x145850f98: mov byte ptr [rbp + 0xd5], 0
0x145850f9f: lea rcx, [rbp + 0xc8]
0x145850fa6: call 0x145ccca50
0x145850fab: nop
0x145850fac: jmp 0x145850fc7
0x145850fae: mov rax, qword ptr [rbp + 0xc8]
0x145850fb5: mov rcx, qword ptr [rbp + 0xb8]
0x145850fbc: mov qword ptr [rsi], rax
0x145850fbf: mov qword ptr [rsi + 8], rcx
0x145850fc3: mov qword ptr [rsi + 0x10], rdx
0x145850fc7: mov rax, rsi
0x145850fca: add rsp, 0x160
0x145850fd1: pop rbx
0x145850fd2: pop rdi
0x145850fd3: pop rsi
0x145850fd4: pop r14
0x145850fd6: pop rbp
0x145850fd7: ret
0x145850fd8: mov ecx, 8
0x145850fdd: mov edx, 0x30
0x145850fe2: call 0x145eb6fb1
0x145850fe7: nop
0x145850fe8: jmp 0x14585100c
0x145850fea: mov ecx, 8
0x145850fef: mov edx, 0x70
0x145850ff4: call 0x145eb6fb1
0x145850ff9: nop
0x145850ffa: jmp 0x14585100c
0x145850ffc: mov ecx, 8
0x145851001: mov edx, 0x18
0x145851006: call 0x145eb6fb1
0x14585100b: nop
0x14585100c: ud2
