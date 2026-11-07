; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1459d19a0..0x1459d1d6c SHA256 8aaca9a1d6490188ca5b261f4c5af60d6a4015536326501c8b2fe087718277bf
0x1459d19a0: push rbp
0x1459d19a1: push r15
0x1459d19a3: push r14
0x1459d19a5: push r13
0x1459d19a7: push r12
0x1459d19a9: push rsi
0x1459d19aa: push rdi
0x1459d19ab: push rbx
0x1459d19ac: sub rsp, 0x108
0x1459d19b3: lea rbp, [rsp + 0x80]
0x1459d19bb: mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
0x1459d19c6: mov rbx, rcx
0x1459d19c9: mov rax, qword ptr [r8]
0x1459d19cc: mov qword ptr [rbp + 0x18], rax
0x1459d19d0: mov rcx, qword ptr [r8 + 8]
0x1459d19d4: cmp rbx, rdx
0x1459d19d7: je 0x1459d1d39
0x1459d19dd: mov rax, qword ptr [r8 + 0x10]
0x1459d19e1: mov qword ptr [rbp - 0x20], rax
0x1459d19e5: sub rdx, rbx
0x1459d19e8: shr rdx, 3
0x1459d19ec: movabs rax, 0x6db6db6db6db6db7
0x1459d19f6: imul rax, rdx
0x1459d19fa: mov qword ptr [rbp - 0x18], rax
0x1459d19fe: xor r12d, r12d
0x1459d1a01: lea r13, [rbp + 0x20]
0x1459d1a05: lea r15, [rip - 0x59cf94c]
0x1459d1a0c: lea rsi, [rbp + 0x50]
0x1459d1a10: lea r14, [rbp - 0x60]
0x1459d1a14: mov qword ptr [rbp - 0x28], rbx
0x1459d1a18: jmp 0x1459d1a81
0x1459d1a1a: nop word ptr [rax + rax]
0x1459d1a20: movups xmm0, xmmword ptr [rbp - 0x60]
0x1459d1a24: movups xmm1, xmmword ptr [rbp - 0x50]
0x1459d1a28: movups xmm2, xmmword ptr [rbp - 0x40]
0x1459d1a2c: movaps xmmword ptr [rbp + 0x20], xmm0
0x1459d1a30: movaps xmmword ptr [rbp + 0x30], xmm1
0x1459d1a34: movaps xmmword ptr [rbp + 0x40], xmm2
0x1459d1a38: mov rcx, qword ptr [rbp + 0x10]
0x1459d1a3c: lea rax, [rcx + rcx*2]
0x1459d1a40: shl rax, 4
0x1459d1a44: mov rdx, qword ptr [rbp - 0x20]
0x1459d1a48: movups xmmword ptr [rdx + rax + 0x20], xmm2
0x1459d1a4d: movups xmmword ptr [rdx + rax + 0x10], xmm1
0x1459d1a52: movups xmmword ptr [rdx + rax], xmm0
0x1459d1a56: inc rcx
0x1459d1a59: mov r12, qword ptr [rbp + 0x70]
0x1459d1a5d: inc r12
0x1459d1a60: cmp r12, qword ptr [rbp - 0x18]
0x1459d1a64: mov rbx, qword ptr [rbp - 0x28]
0x1459d1a68: lea r13, [rbp + 0x20]
0x1459d1a6c: lea r15, [rip - 0x59cf9b3]
0x1459d1a73: lea rsi, [rbp + 0x50]
0x1459d1a77: lea r14, [rbp - 0x60]
0x1459d1a7b: je 0x1459d1d39
0x1459d1a81: mov qword ptr [rbp + 0x10], rcx
0x1459d1a85: imul rdi, r12, 0x38
0x1459d1a89: mov rdx, qword ptr [rbx + rdi + 0x20]
0x1459d1a8e: mov r8, qword ptr [rbx + rdi + 0x28]
0x1459d1a93: mov rcx, r13
0x1459d1a96: call 0x1458ed780
0x1459d1a9b: nop
0x1459d1a9c: add rdi, rbx
0x1459d1a9f: cmp dword ptr [rbp + 0x20], 1
0x1459d1aa3: jne 0x1459d1b60
0x1459d1aa9: lea rcx, [rbp + 0x28]
0x1459d1aad: mov rax, qword ptr [rcx + 0x10]
0x1459d1ab1: mov qword ptr [rbp], rax
0x1459d1ab5: movups xmm0, xmmword ptr [rcx]
0x1459d1ab8: movaps xmmword ptr [rbp - 0x10], xmm0
0x1459d1abc: mov qword ptr [rbp - 0x60], rdi
0x1459d1ac0: mov qword ptr [rbp - 0x58], r15
0x1459d1ac4: lea rax, [rbp - 0x10]
0x1459d1ac8: mov qword ptr [rbp - 0x50], rax
0x1459d1acc: lea rax, [rip - 0x59cf9f3]
0x1459d1ad3: mov qword ptr [rbp - 0x48], rax
0x1459d1ad7: mov rcx, rsi
0x1459d1ada: lea rdx, [rip + 0x1865343]
0x1459d1ae1: mov r8, r14
0x1459d1ae4: call 0x145bcce30
0x1459d1ae9: nop
0x1459d1aea: mov rax, qword ptr [rbp + 0x50]
0x1459d1aee: mov qword ptr [rbp + 0x70], rax
0x1459d1af2: mov rcx, qword ptr [rbp + 0x58]
0x1459d1af6: mov rax, qword ptr [rbp + 0x60]
0x1459d1afa: mov qword ptr [rbp + 0x68], rcx
0x1459d1afe: mov qword ptr [rbp + 0x50], rcx
0x1459d1b02: mov qword ptr [rbp + 0x58], rax
0x1459d1b06: mov qword ptr [rbp - 0x60], rsi
0x1459d1b0a: mov qword ptr [rbp - 0x58], r15
0x1459d1b0e: lea rcx, [rip + 0x121ffa3]
0x1459d1b15: mov rdx, r14
0x1459d1b18: call 0x145bb6590
0x1459d1b1d: nop
0x1459d1b1e: mov rdx, qword ptr [rbp + 0x70]
0x1459d1b22: test rdx, rdx
0x1459d1b25: je 0x1459d1b36
0x1459d1b27: mov r8d, 1
0x1459d1b2d: mov rcx, qword ptr [rbp + 0x68]
0x1459d1b31: call 0x1400021d0
0x1459d1b36: mov rdx, qword ptr [rbp - 0x10]
0x1459d1b3a: test rdx, rdx
0x1459d1b3d: je 0x1459d1b4e
0x1459d1b3f: mov rcx, qword ptr [rbp - 8]
0x1459d1b43: mov r8d, 1
0x1459d1b49: call 0x1400021d0
0x1459d1b4e: mov eax, 8
0x1459d1b53: xor edx, edx
0x1459d1b55: xor ecx, ecx
0x1459d1b57: jmp 0x1459d1b6c
0x1459d1b59: nop dword ptr [rax]
0x1459d1b60: mov rcx, qword ptr [rbp + 0x28]
0x1459d1b64: mov rax, qword ptr [rbp + 0x30]
0x1459d1b68: mov rdx, qword ptr [rbp + 0x38]
0x1459d1b6c: lea rdx, [rdx + rdx*2]
0x1459d1b70: shl rdx, 4
0x1459d1b74: add rdx, rax
0x1459d1b77: mov qword ptr [rbp + 0x20], rax
0x1459d1b7b: mov qword ptr [rbp + 0x28], rax
0x1459d1b7f: mov qword ptr [rbp + 0x30], rcx
0x1459d1b83: mov qword ptr [rbp + 0x38], rdx
0x1459d1b87: mov rcx, r14
0x1459d1b8a: mov rdx, r13
0x1459d1b8d: call 0x14599ff20
0x1459d1b92: nop
0x1459d1b93: mov qword ptr [rbp + 0x70], r12
0x1459d1b97: mov rdx, qword ptr [rdi]
0x1459d1b9a: mov r8, qword ptr [rdi + 8]
0x1459d1b9e: mov rcx, r13
0x1459d1ba1: call 0x1458eb8a0
0x1459d1ba6: nop
0x1459d1ba7: mov rax, qword ptr [rbp + 0x20]
0x1459d1bab: mov r13, qword ptr [rbp + 0x28]
0x1459d1baf: mov rcx, qword ptr [rbp + 0x30]
0x1459d1bb3: lea r15, [rcx + rcx*2]
0x1459d1bb7: shl r15, 4
0x1459d1bbb: add r15, r13
0x1459d1bbe: mov qword ptr [rbp + 0x20], r13
0x1459d1bc2: mov qword ptr [rbp + 0x28], r13
0x1459d1bc6: mov qword ptr [rbp + 0x68], rax
0x1459d1bca: mov qword ptr [rbp + 0x30], rax
0x1459d1bce: mov qword ptr [rbp + 0x38], r15
0x1459d1bd2: mov rax, r13
0x1459d1bd5: mov qword ptr [rbp - 0x30], r13
0x1459d1bd9: test rcx, rcx
0x1459d1bdc: je 0x1459d1ca0
0x1459d1be2: nop word ptr cs:[rax + rax]
0x1459d1bf0: lea r13, [rax + 0x30]
0x1459d1bf4: mov qword ptr [rbp + 0x28], r13
0x1459d1bf8: mov r8, qword ptr [rax]
0x1459d1bfb: cmp r8, -1
0x1459d1bff: je 0x1459d1ca0
0x1459d1c05: movups xmm0, xmmword ptr [rax + 8]
0x1459d1c09: lea rdx, [rbp + 0x58]
0x1459d1c0d: movups xmmword ptr [rdx], xmm0
0x1459d1c10: mov rdi, qword ptr [rax + 0x18]
0x1459d1c14: mov rcx, qword ptr [rax + 0x20]
0x1459d1c18: mov rbx, qword ptr [rax + 0x28]
0x1459d1c1c: mov qword ptr [rbp + 0x50], r8
0x1459d1c20: cmp rdi, rbx
0x1459d1c23: jbe 0x1459d1c50
0x1459d1c25: test rbx, rbx
0x1459d1c28: je 0x1459d1c55
0x1459d1c2a: mov r8d, 1
0x1459d1c30: mov rdx, rdi
0x1459d1c33: mov rsi, rcx
0x1459d1c36: mov r9, rbx
0x1459d1c39: call 0x1400021e0
0x1459d1c3e: mov r12, rax
0x1459d1c41: test rax, rax
0x1459d1c44: jne 0x1459d1c70
0x1459d1c46: jmp 0x1459d1d54
0x1459d1c4b: nop dword ptr [rax + rax]
0x1459d1c50: mov r12, rcx
0x1459d1c53: jmp 0x1459d1c70
0x1459d1c55: mov r12d, 1
0x1459d1c5b: mov r8d, 1
0x1459d1c61: mov rdx, rdi
0x1459d1c64: call 0x1400021d0
0x1459d1c69: nop dword ptr [rax]
0x1459d1c70: mov byte ptr [rbp + 0x7f], 0
0x1459d1c74: mov rcx, r14
0x1459d1c77: lea rdx, [rbp + 0x50]
0x1459d1c7b: mov r8, r12
0x1459d1c7e: mov r9, rbx
0x1459d1c81: call 0x1459a13c0
0x1459d1c86: nop
0x1459d1c87: mov rax, r13
0x1459d1c8a: cmp r13, r15
0x1459d1c8d: jne 0x1459d1bf0
0x1459d1c93: jmp 0x1459d1d10
0x1459d1c95: nop word ptr cs:[rax + rax]
0x1459d1ca0: mov rax, r15
0x1459d1ca3: sub rax, r13
0x1459d1ca6: movabs rcx, 0xaaaaaaaaaaaaaaab
0x1459d1cb0: mul rcx
0x1459d1cb3: cmp r15, r13
0x1459d1cb6: je 0x1459d1d10
0x1459d1cb8: mov rbx, rdx
0x1459d1cbb: shr rbx, 5
0x1459d1cbf: add r13, 0x20
0x1459d1cc3: jmp 0x1459d1cd9
0x1459d1cc5: nop word ptr cs:[rax + rax]
0x1459d1cd0: add r13, 0x30
0x1459d1cd4: dec rbx
0x1459d1cd7: je 0x1459d1d10
0x1459d1cd9: mov rdx, qword ptr [r13 - 0x20]
0x1459d1cdd: test rdx, rdx
0x1459d1ce0: je 0x1459d1cf1
0x1459d1ce2: mov rcx, qword ptr [r13 - 0x18]
0x1459d1ce6: mov r8d, 1
0x1459d1cec: call 0x1400021d0
0x1459d1cf1: mov rdx, qword ptr [r13 - 8]
0x1459d1cf5: test rdx, rdx
0x1459d1cf8: je 0x1459d1cd0
0x1459d1cfa: mov rcx, qword ptr [r13]
0x1459d1cfe: mov r8d, 1
0x1459d1d04: call 0x1400021d0
0x1459d1d09: jmp 0x1459d1cd0
0x1459d1d0b: nop dword ptr [rax + rax]
0x1459d1d10: mov rax, qword ptr [rbp + 0x68]
0x1459d1d14: test rax, rax
0x1459d1d17: je 0x1459d1a20
0x1459d1d1d: shl rax, 4
0x1459d1d21: lea rdx, [rax + rax*2]
0x1459d1d25: mov r8d, 8
0x1459d1d2b: mov rcx, qword ptr [rbp - 0x30]
0x1459d1d2f: call 0x1400021d0
0x1459d1d34: jmp 0x1459d1a20
0x1459d1d39: mov rax, qword ptr [rbp + 0x18]
0x1459d1d3d: mov qword ptr [rax], rcx
0x1459d1d40: add rsp, 0x108
0x1459d1d47: pop rbx
0x1459d1d48: pop rdi
0x1459d1d49: pop rsi
0x1459d1d4a: pop r12
0x1459d1d4c: pop r13
0x1459d1d4e: pop r14
0x1459d1d50: pop r15
0x1459d1d52: pop rbp
0x1459d1d53: ret
0x1459d1d54: mov qword ptr [rbp + 0x68], rsi
0x1459d1d58: mov qword ptr [rbp + 0x70], rdi
0x1459d1d5c: mov ecx, 1
0x1459d1d61: mov rdx, rbx
0x1459d1d64: call 0x145d992bb
0x1459d1d69: nop
0x1459d1d6a: ud2
