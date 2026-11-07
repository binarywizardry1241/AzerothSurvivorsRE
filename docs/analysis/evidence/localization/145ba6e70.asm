; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x145ba6e70..0x145ba6f9c SHA256 e6688d1b0218824873d3c4ceb1a55a0104fbd011a54aeb055f1a680a26431331
0x145ba6e70: push rbp
0x145ba6e71: push rsi
0x145ba6e72: push rdi
0x145ba6e73: sub rsp, 0xa0
0x145ba6e7a: lea rbp, [rsp + 0x80]
0x145ba6e82: mov rsi, rdx
0x145ba6e85: mov rdi, rcx
0x145ba6e88: lea rcx, [rbp - 0x18]
0x145ba6e8c: mov rdx, rdi
0x145ba6e8f: mov r8, rsi
0x145ba6e92: call 0x145bba4c0
0x145ba6e97: movzx edx, byte ptr [rbp - 0x18]
0x145ba6e9b: mov rax, rsi
0x145ba6e9e: mov rcx, rdi
0x145ba6ea1: cmp rdx, 5
0x145ba6ea5: ja 0x145ba6f08
0x145ba6ea7: mov rcx, qword ptr [rbp - 8]
0x145ba6eab: mov rax, qword ptr [rbp + 8]
0x145ba6eaf: lea r8, [rip + 0x16c3296]
0x145ba6eb6: movsxd rdx, dword ptr [r8 + rdx*4]
0x145ba6eba: add rdx, r8
0x145ba6ebd: jmp rdx
0x145ba6ebf: add rcx, 4
0x145ba6ec3: jmp 0x145ba6ef9
0x145ba6ec5: lea rdx, [rax + 1]
0x145ba6ec9: test rax, rax
0x145ba6ecc: cmove rdx, rax
0x145ba6ed0: add rcx, rdx
0x145ba6ed3: add rcx, 2
0x145ba6ed7: jmp 0x145ba6ef9
0x145ba6ed9: mov ecx, 6
0x145ba6ede: jmp 0x145ba6ef9
0x145ba6ee0: lea rdx, [rax + 1]
0x145ba6ee4: test rax, rax
0x145ba6ee7: cmove rdx, rax
0x145ba6eeb: add rcx, rdx
0x145ba6eee: add rcx, 8
0x145ba6ef2: jmp 0x145ba6ef9
0x145ba6ef4: mov ecx, 2
0x145ba6ef9: mov rax, rsi
0x145ba6efc: sub rax, rcx
0x145ba6eff: jb 0x145ba6f88
0x145ba6f05: add rcx, rdi
0x145ba6f08: test rax, rax
0x145ba6f0b: je 0x145ba6f1e
0x145ba6f0d: movzx eax, byte ptr [rcx]
0x145ba6f10: cmp al, 0x5c
0x145ba6f12: sete cl
0x145ba6f15: cmp al, 0x2f
0x145ba6f17: sete al
0x145ba6f1a: or al, cl
0x145ba6f1c: jmp 0x145ba6f20
0x145ba6f1e: xor eax, eax
0x145ba6f20: mov qword ptr [rbp - 0x58], rdi
0x145ba6f24: mov qword ptr [rbp - 0x50], rsi
0x145ba6f28: movups xmm0, xmmword ptr [rbp - 0x18]
0x145ba6f2c: movups xmm1, xmmword ptr [rbp - 8]
0x145ba6f30: movups xmmword ptr [rbp - 0x48], xmm0
0x145ba6f34: movups xmmword ptr [rbp - 0x38], xmm1
0x145ba6f38: mov rcx, qword ptr [rbp + 8]
0x145ba6f3c: mov qword ptr [rbp - 0x28], rcx
0x145ba6f40: mov byte ptr [rbp - 0x1e], al
0x145ba6f43: mov word ptr [rbp - 0x20], 0x200
0x145ba6f49: lea rcx, [rbp - 0x18]
0x145ba6f4d: lea rdx, [rbp - 0x58]
0x145ba6f51: call 0x145bc2730
0x145ba6f56: movzx ecx, byte ptr [rbp - 0x18]
0x145ba6f5a: xor eax, eax
0x145ba6f5c: cmp cl, 0xff
0x145ba6f5f: je 0x145ba6f7d
0x145ba6f61: sub cl, 5
0x145ba6f64: movzx ecx, cl
0x145ba6f67: cmovb ecx, eax
0x145ba6f6a: add cl, 0xfe
0x145ba6f6d: cmp cl, 3
0x145ba6f70: jae 0x145ba6f7d
0x145ba6f72: lea rcx, [rbp - 0x58]
0x145ba6f76: call 0x145ba87a0
0x145ba6f7b: jmp 0x145ba6f7d
0x145ba6f7d: add rsp, 0xa0
0x145ba6f84: pop rdi
0x145ba6f85: pop rsi
0x145ba6f86: pop rbp
0x145ba6f87: ret
0x145ba6f88: lea r9, [rip + 0x16c1411]
0x145ba6f8f: mov rdx, rsi
0x145ba6f92: mov r8, rsi
0x145ba6f95: call 0x145d99860
0x145ba6f9a: ud2
