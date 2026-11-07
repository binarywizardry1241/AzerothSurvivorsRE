; shake-apply 0x140964a70..0x1409654cd
140964a70: 4157 push r15
140964a72: 4156 push r14
140964a74: 4155 push r13
140964a76: 4154 push r12
140964a78: 56 push rsi
140964a79: 57 push rdi
140964a7a: 55 push rbp
140964a7b: 53 push rbx
140964a7c: 4881ec28010000 sub rsp, 0x128
140964a83: 440f29bc2410010000 movaps xmmword ptr [rsp + 0x110], xmm15
140964a8c: 440f29b42400010000 movaps xmmword ptr [rsp + 0x100], xmm14
140964a95: 440f29ac24f0000000 movaps xmmword ptr [rsp + 0xf0], xmm13
140964a9e: 440f29a424e0000000 movaps xmmword ptr [rsp + 0xe0], xmm12
140964aa7: 440f299c24d0000000 movaps xmmword ptr [rsp + 0xd0], xmm11
140964ab0: 440f299424c0000000 movaps xmmword ptr [rsp + 0xc0], xmm10
140964ab9: 440f298c24b0000000 movaps xmmword ptr [rsp + 0xb0], xmm9
140964ac2: 440f298424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm8
140964acb: 0f29bc2490000000 movaps xmmword ptr [rsp + 0x90], xmm7
140964ad3: 0f29b42480000000 movaps xmmword ptr [rsp + 0x80], xmm6
140964adb: 4c8b9c24a0010000 mov r11, qword ptr [rsp + 0x1a0]
140964ae3: 488b8c2498010000 mov rcx, qword ptr [rsp + 0x198]
140964aeb: 498b39 mov rdi, qword ptr [r9]
140964aee: 4d8b5108 mov r10, qword ptr [r9 + 8]
140964af2: 418b4114 mov eax, dword ptr [r9 + 0x14]
140964af6: 8944243c mov dword ptr [rsp + 0x3c], eax
140964afa: 488bb7f8000000 mov rsi, qword ptr [rdi + 0xf8]
140964b01: 4c8bb700010000 mov r14, qword ptr [rdi + 0x100]
140964b08: 440fb6bf08010000 movzx r15d, byte ptr [rdi + 0x108]
140964b10: 4a8d1cb500000000 lea rbx, [r14*4]
140964b18: 4989f1 mov r9, rsi
140964b1b: 4584ff test r15b, r15b
140964b1e: 7460 je 0x140964b80
140964b20: 4885db test rbx, rbx
140964b23: 0f84e1000000 je 0x140964c0a
140964b29: 418b01 mov eax, dword ptr [r9]
140964b2c: 4983c104 add r9, 4
140964b30: 4d8ba2a8010000 mov r12, qword ptr [r10 + 0x1a8]
140964b37: 488d2cc0 lea rbp, [rax + rax*8]
140964b3b: 4d8b6cec10 mov r13, qword ptr [r12 + rbp*8 + 0x10]
140964b40: 4883c3fc add rbx, -4
140964b44: 4d85ed test r13, r13
140964b47: 74d7 je 0x140964b20
140964b49: 498d04ec lea rax, [r12 + rbp*8]
140964b4d: 488bbf10010000 mov rdi, qword ptr [rdi + 0x110]
140964b54: 4c8b6018 mov r12, qword ptr [rax + 0x18]
140964b58: 488b4038 mov rax, qword ptr [rax + 0x38]
140964b5c: 488b04f8 mov rax, qword ptr [rax + rdi*8]
140964b60: 48f7d0 not rax
140964b63: 488d0440 lea rax, [rax + rax*2]
140964b67: 48c1e004 shl rax, 4
140964b6b: 498b5c0410 mov rbx, qword ptr [r12 + rax + 0x10]
140964b70: 498b7c0428 mov rdi, qword ptr [r12 + rax + 0x28]
140964b75: e989000000 jmp 0x140964c03
140964b7a: 660f1f440000 nop word ptr [rax + rax]
140964b80: 4885db test rbx, rbx
140964b83: 0f8481000000 je 0x140964c0a
140964b89: 418b01 mov eax, dword ptr [r9]
140964b8c: 4983c104 add r9, 4
140964b90: 4d8ba208010000 mov r12, qword ptr [r10 + 0x108]
140964b97: 488d2c80 lea rbp, [rax + rax*4]
140964b9b: 48c1e505 shl rbp, 5
140964b9f: 4d8b6c2c58 mov r13, qword ptr [r12 + rbp + 0x58]
140964ba4: 4883c3fc add rbx, -4
140964ba8: 4d85ed test r13, r13
140964bab: 74d3 je 0x140964b80
140964bad: 4901ec add r12, rbp
140964bb0: 418b9c2494000000 mov ebx, dword ptr [r12 + 0x94]
140964bb8: 498baaa8010000 mov rbp, qword ptr [r10 + 0x1a8]
140964bbf: 488d1cdb lea rbx, [rbx + rbx*8]
140964bc3: 488bbf10010000 mov rdi, qword ptr [rdi + 0x110]
140964bca: 488b44dd18 mov rax, qword ptr [rbp + rbx*8 + 0x18]
140964bcf: 488b5cdd38 mov rbx, qword ptr [rbp + rbx*8 + 0x38]
140964bd4: 488b1cfb mov rbx, qword ptr [rbx + rdi*8]
140964bd8: 48f7d3 not rbx
140964bdb: 498b7c2450 mov rdi, qword ptr [r12 + 0x50]
140964be0: 8b7f08 mov edi, dword ptr [rdi + 8]
140964be3: 4c8d245b lea r12, [rbx + rbx*2]
140964be7: 49c1e404 shl r12, 4
140964beb: f7d7 not edi
140964bed: 488d1c7f lea rbx, [rdi + rdi*2]
140964bf1: 48c1e304 shl rbx, 4
140964bf5: 4a035c2010 add rbx, qword ptr [rax + r12 + 0x10]
140964bfa: 48c1e702 shl rdi, 2
140964bfe: 4a037c2028 add rdi, qword ptr [rax + r12 + 0x28]
140964c03: bd01000000 mov ebp, 1
140964c08: eb07 jmp 0x140964c11
140964c0a: 4531ed xor r13d, r13d
140964c0d: 31ed xor ebp, ebp
140964c0f: 31db xor ebx, ebx
140964c11: 488b02 mov rax, qword ptr [rdx]
140964c14: 4889442430 mov qword ptr [rsp + 0x30], rax
140964c19: 488b4210 mov rax, qword ptr [rdx + 0x10]
140964c1d: 4889442428 mov qword ptr [rsp + 0x28], rax
140964c22: 8b421c mov eax, dword ptr [rdx + 0x1c]
140964c25: 89442424 mov dword ptr [rsp + 0x24], eax
140964c29: 498b00 mov rax, qword ptr [r8]
140964c2c: 4889442468 mov qword ptr [rsp + 0x68], rax
140964c31: 488b842490010000 mov rax, qword ptr [rsp + 0x190]
140964c39: 4c8b00 mov r8, qword ptr [rax]
140964c3c: 488b01 mov rax, qword ptr [rcx]
140964c3f: 488b4908 mov rcx, qword ptr [rcx + 8]
140964c43: 4d8b23 mov r12, qword ptr [r11]
140964c46: 498b5308 mov rdx, qword ptr [r11 + 8]
140964c4a: 4e8d1cb6 lea r11, [rsi + r14*4]
140964c4e: 4584ff test r15b, r15b
140964c51: 7431 je 0x140964c84
140964c53: 4439ed cmp ebp, r13d
140964c56: 0f85d6050000 jne 0x140965232
140964c5c: 0f1f4000 nop dword ptr [rax]
140964c60: 4d39d9 cmp r9, r11
140964c63: 7453 je 0x140964cb8
140964c65: 418b31 mov esi, dword ptr [r9]
140964c68: 4983c104 add r9, 4
140964c6c: 4d8bb2a8010000 mov r14, qword ptr [r10 + 0x1a8]
140964c73: 488d34f6 lea rsi, [rsi + rsi*8]
140964c77: 49837cf61000 cmp qword ptr [r14 + rsi*8 + 0x10], 0
140964c7d: 74e1 je 0x140964c60
140964c7f: e9ae050000 jmp 0x140965232
140964c84: 4439ed cmp ebp, r13d
140964c87: 0f85a5050000 jne 0x140965232
140964c8d: 0f1f00 nop dword ptr [rax]
140964c90: 4d39d9 cmp r9, r11
140964c93: 7423 je 0x140964cb8
140964c95: 418b31 mov esi, dword ptr [r9]
140964c98: 4983c104 add r9, 4
140964c9c: 4d8bb208010000 mov r14, qword ptr [r10 + 0x108]
140964ca3: 488d34b6 lea rsi, [rsi + rsi*4]
140964ca7: 48c1e605 shl rsi, 5
140964cab: 49837c365800 cmp qword ptr [r14 + rsi + 0x58], 0
140964cb1: 74dd je 0x140964c90
140964cb3: e97a050000 jmp 0x140965232
140964cb8: 4885db test rbx, rbx
140964cbb: 0f8471050000 je 0x140965232
140964cc1: 458b08 mov r9d, dword ptr [r8]
140964cc4: 4d85c9 test r9, r9
140964cc7: 7410 je 0x140964cd9
140964cc9: 418b5004 mov edx, dword ptr [r8 + 4]
140964ccd: 48c1e220 shl rdx, 0x20
140964cd1: 4c09ca or rdx, r9
140964cd4: e9d3010000 jmp 0x140964eac
140964cd9: 4d8b8c24f8000000 mov r9, qword ptr [r12 + 0xf8]
140964ce1: 4d8b842400010000 mov r8, qword ptr [r12 + 0x100]
140964ce9: 4f8d0481 lea r8, [r9 + r8*4]
140964ced: 410fb6ac2408010000 movzx ebp, byte ptr [r12 + 0x108]
140964cf6: 4084ed test bpl, bpl
140964cf9: 7411 je 0x140964d0c
140964cfb: 41bf08000000 mov r15d, 8
140964d01: 4531db xor r11d, r11d
140964d04: 4531ed xor r13d, r13d
140964d07: 4531d2 xor r10d, r10d
140964d0a: eb3b jmp 0x140964d47
140964d0c: 41be08000000 mov r14d, 8
140964d12: 4531db xor r11d, r11d
140964d15: 4531ed xor r13d, r13d
140964d18: 4531d2 xor r10d, r10d
140964d1b: e985000000 jmp 0x140964da5
140964d20: 4f8d14e6 lea r10, [r14 + r12*8]
140964d24: 4d8b7a08 mov r15, qword ptr [r10 + 8]
140964d28: 4531ed xor r13d, r13d
140964d2b: 4189f3 mov r11d, esi
140964d2e: 4589ea mov r10d, r13d
140964d31: 41ffc5 inc r13d
140964d34: 4b8b34d7 mov rsi, qword ptr [r15 + r10*8]
140964d38: 4989f2 mov r10, rsi
140964d3b: 49c1ea20 shr r10, 0x20
140964d3f: 85f6 test esi, esi
140964d41: 0f85f5050000 jne 0x14096533c
140964d47: 4539dd cmp r13d, r11d
140964d4a: 75e2 jne 0x140964d2e
140964d4c: 0f1f4000 nop dword ptr [rax]
140964d50: 4d39c1 cmp r9, r8
140964d53: 741e je 0x140964d73
140964d55: 418b31 mov esi, dword ptr [r9]
140964d58: 4983c104 add r9, 4
140964d5c: 4c8bb2a8010000 mov r14, qword ptr [rdx + 0x1a8]
140964d63: 4c8d24f6 lea r12, [rsi + rsi*8]
140964d67: 4b8b74e610 mov rsi, qword ptr [r14 + r12*8 + 0x10]
140964d6c: 4885f6 test rsi, rsi
140964d6f: 74df je 0x140964d50
140964d71: ebad jmp 0x140964d20
140964d73: 41be08000000 mov r14d, 8
140964d79: eb62 jmp 0x140964ddd
140964d7b: 4d01e7 add r15, r12
140964d7e: 4d8b7750 mov r14, qword ptr [r15 + 0x50]
140964d82: 4531ed xor r13d, r13d
140964d85: 4189f3 mov r11d, esi
140964d88: 4589ea mov r10d, r13d
140964d8b: 49c1e204 shl r10, 4
140964d8f: 41ffc5 inc r13d
140964d92: 4b8b3416 mov rsi, qword ptr [r14 + r10]
140964d96: 4989f2 mov r10, rsi
140964d99: 49c1ea20 shr r10, 0x20
140964d9d: 85f6 test esi, esi
140964d9f: 0f85a2050000 jne 0x140965347
140964da5: 4539dd cmp r13d, r11d
140964da8: 75de jne 0x140964d88
140964daa: 660f1f440000 nop word ptr [rax + rax]
140964db0: 4d39c1 cmp r9, r8
140964db3: 7422 je 0x140964dd7
140964db5: 418b31 mov esi, dword ptr [r9]
140964db8: 4983c104 add r9, 4
140964dbc: 4c8bba08010000 mov r15, qword ptr [rdx + 0x108]
140964dc3: 4c8d24b6 lea r12, [rsi + rsi*4]
140964dc7: 49c1e405 shl r12, 5
140964dcb: 4b8b742758 mov rsi, qword ptr [r15 + r12 + 0x58]
140964dd0: 4885f6 test rsi, rsi
140964dd3: 74db je 0x140964db0
140964dd5: eba4 jmp 0x140964d7b
140964dd7: 41bf08000000 mov r15d, 8
140964ddd: 4d89c1 mov r9, r8
140964de0: 4589dd mov r13d, r11d
140964de3: 31f6 xor esi, esi
140964de5: 4084ed test bpl, bpl
140964de8: 7466 je 0x140964e50
140964dea: eb1e jmp 0x140964e0a
140964dec: 4f8d34fe lea r14, [r14 + r15*8]
140964df0: 4d8b7e08 mov r15, qword ptr [r14 + 8]
140964df4: 4531ed xor r13d, r13d
140964df7: 4589ee mov r14d, r13d
140964dfa: 41ffc5 inc r13d
140964dfd: 478b24f7 mov r12d, dword ptr [r15 + r14*8]
140964e01: 4d85e4 test r12, r12
140964e04: 0f8580000000 jne 0x140964e8a
140964e0a: 4539dd cmp r13d, r11d
140964e0d: 75e8 jne 0x140964df7
140964e0f: 90 nop 
140964e10: 4d39c1 cmp r9, r8
140964e13: 7472 je 0x140964e87
140964e15: 458b19 mov r11d, dword ptr [r9]
140964e18: 4983c104 add r9, 4
140964e1c: 4c8bb2a8010000 mov r14, qword ptr [rdx + 0x1a8]
140964e23: 4f8d3cdb lea r15, [r11 + r11*8]
140964e27: 4f8b5cfe10 mov r11, qword ptr [r14 + r15*8 + 0x10]
140964e2c: 4d85db test r11, r11
140964e2f: 74df je 0x140964e10
140964e31: ebb9 jmp 0x140964dec
140964e33: 4d01fe add r14, r15
140964e36: 4d8b7650 mov r14, qword ptr [r14 + 0x50]
140964e3a: 4531ed xor r13d, r13d
140964e3d: 4589ef mov r15d, r13d
140964e40: 49c1e704 shl r15, 4
140964e44: 41ffc5 inc r13d
140964e47: 478b243e mov r12d, dword ptr [r14 + r15]
140964e4b: 4d85e4 test r12, r12
140964e4e: 753a jne 0x140964e8a
140964e50: 4539dd cmp r13d, r11d
140964e53: 75e8 jne 0x140964e3d
140964e55: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
140964e60: 4d39c1 cmp r9, r8
140964e63: 7422 je 0x140964e87
140964e65: 458b19 mov r11d, dword ptr [r9]
140964e68: 4983c104 add r9, 4
140964e6c: 4c8bb208010000 mov r14, qword ptr [rdx + 0x108]
140964e73: 4f8d3c9b lea r15, [r11 + r11*4]
140964e77: 49c1e705 shl r15, 5
140964e7b: 4f8b5c3e58 mov r11, qword ptr [r14 + r15 + 0x58]
140964e80: 4d85db test r11, r11
140964e83: 74db je 0x140964e60
140964e85: ebac jmp 0x140964e33
140964e87: 4531e4 xor r12d, r12d
140964e8a: 4189f0 mov r8d, esi
140964e8d: 49c1e220 shl r10, 0x20
140964e91: 4d09c2 or r10, r8
140964e94: 4d85e4 test r12, r12
140964e97: 48ba0000000001000000 movabs rdx, 0x100000000
140964ea1: 490f44d2 cmove rdx, r10
140964ea5: 4d85c0 test r8, r8
140964ea8: 490f44d0 cmove rdx, r8
140964eac: 4c8b5c2430 mov r11, qword ptr [rsp + 0x30]
140964eb1: 41b9ffffffff mov r9d, 0xffffffff
140964eb7: 4989d0 mov r8, rdx
140964eba: 450f57c0 xorps xmm8, xmm8
140964ebe: 4d21c8 and r8, r9
140964ec1: 7479 je 0x140964f3c
140964ec3: 4d31c8 xor r8, r9
140964ec6: 4f8d0c40 lea r9, [r8 + r8*2]
140964eca: 49c1e103 shl r9, 3
140964ece: 4c034908 add r9, qword ptr [rcx + 8]
140964ed2: 48c1ea20 shr rdx, 0x20
140964ed6: 4c3b4110 cmp r8, qword ptr [rcx + 0x10]
140964eda: 4c8d05271c5705 lea r8, [rip + 0x5571c27]
140964ee1: 4d0f42c1 cmovb r8, r9
140964ee5: 41395010 cmp dword ptr [r8 + 0x10], edx
140964ee9: 7551 jne 0x140964f3c
140964eeb: 41833800 cmp dword ptr [r8], 0
140964eef: 744b je 0x140964f3c
140964ef1: 4d8b6804 mov r13, qword ptr [r8 + 4]
140964ef5: 4c89ea mov rdx, r13
140964ef8: 48c1ea20 shr rdx, 0x20
140964efc: 48395038 cmp qword ptr [rax + 0x38], rdx
140964f00: 763a jbe 0x140964f3c
140964f02: 4d89e9 mov r9, r13
140964f05: 49c1e926 shr r9, 0x26
140964f09: 4c8b5028 mov r10, qword ptr [rax + 0x28]
140964f0d: 4f8b0cca mov r9, qword ptr [r10 + r9*8]
140964f11: 490fa3d1 bt r9, rdx
140964f15: 7325 jae 0x140964f3c
140964f17: 458b400c mov r8d, dword ptr [r8 + 0xc]
140964f1b: 48399110010000 cmp qword ptr [rcx + 0x110], rdx
140964f22: 0f8676030000 jbe 0x14096529e
140964f28: 488d1492 lea rdx, [rdx + rdx*4]
140964f2c: 48c1e205 shl rdx, 5
140964f30: 48039108010000 add rdx, qword ptr [rcx + 0x108]
140964f37: e964030000 jmp 0x1409652a0
140964f3c: 31c0 xor eax, eax
140964f3e: 450f57ed xorps xmm13, xmm13
140964f42: 488b542428 mov rdx, qword ptr [rsp + 0x28]
140964f47: 448b442424 mov r8d, dword ptr [rsp + 0x24]
140964f4c: 448902 mov dword ptr [rdx], r8d
140964f4f: 0f57f6 xorps xmm6, xmm6
140964f52: 0f57c9 xorps xmm1, xmm1
140964f55: 84c0 test al, al
140964f57: 0f8596020000 jne 0x1409651f3
140964f5d: 4d8b4b10 mov r9, qword ptr [r11 + 0x10]
140964f61: 4d85c9 test r9, r9
140964f64: 0f84f3010000 je 0x14096515d
140964f6a: f3440f105310 movss xmm10, dword ptr [rbx + 0x10]
140964f70: f3440f105b14 movss xmm11, dword ptr [rbx + 0x14]
140964f76: f30f104318 movss xmm0, dword ptr [rbx + 0x18]
140964f7b: 488b442468 mov rax, qword ptr [rsp + 0x68]
140964f80: f3440f10605c movss xmm12, dword ptr [rax + 0x5c]
140964f86: 498b4b08 mov rcx, qword ptr [r11 + 8]
140964f8a: 498d51ff lea rdx, [r9 - 1]
140964f8e: 4c8d415c lea r8, [rcx + 0x5c]
140964f92: 31c0 xor eax, eax
140964f94: f3440f116c2430 movss dword ptr [rsp + 0x30], xmm13
140964f9b: 0f1f440000 nop dword ptr [rax + rax]
140964fa0: 410f28cc movaps xmm1, xmm12
140964fa4: f3410f5c48d0 subss xmm1, dword ptr [r8 - 0x30]
140964faa: f3410f5848bc addss xmm1, dword ptr [r8 - 0x44]
140964fb0: f3410f1050b8 movss xmm2, dword ptr [r8 - 0x48]
140964fb6: 0f2ed1 ucomiss xmm2, xmm1
140964fb9: 0f866f040000 jbe 0x14096542e
140964fbf: 48ffc0 inc rax
140964fc2: 4983c030 add r8, 0x30
140964fc6: 4939c1 cmp r9, rax
140964fc9: 75d5 jne 0x140964fa0
140964fcb: c744244000000000 mov dword ptr [rsp + 0x40], 0
140964fd3: c744244c00000000 mov dword ptr [rsp + 0x4c], 0
140964fdb: c744245800000000 mov dword ptr [rsp + 0x58], 0
140964fe3: 498b7308 mov rsi, qword ptr [r11 + 8]
140964fe7: 4f8d3449 lea r14, [r9 + r9*2]
140964feb: 49c1e604 shl r14, 4
140964fef: 4901f6 add r14, rsi
140964ff2: 440f14d0 unpcklps xmm10, xmm0
140964ff6: f3440f102d81ba5605 movss xmm13, dword ptr [rip + 0x556ba81]
140964fff: f3440f10357cba5605 movss xmm14, dword ptr [rip + 0x556ba7c]
140965008: f3440f103d77ba5605 movss xmm15, dword ptr [rip + 0x556ba77]
140965011: f30f103527814605 movss xmm6, dword ptr [rip + 0x5468127]
140965019: eb32 jmp 0x14096504d
14096501b: 488d0484 lea rax, [rsp + rax*4]
14096501f: 4883c040 add rax, 0x40
140965023: c70001000000 mov dword ptr [rax], 1
140965029: f30f117804 movss dword ptr [rax + 4], xmm7
14096502e: f3440f114008 movss dword ptr [rax + 8], xmm8
140965034: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140965040: 4883c630 add rsi, 0x30
140965044: 4c39f6 cmp rsi, r14
140965047: 0f84eb000000 je 0x140965138
14096504d: 410f28cb movaps xmm1, xmm11
140965051: f30f5c4e24 subss xmm1, dword ptr [rsi + 0x24]
140965056: f30f59c9 mulss xmm1, xmm1
14096505a: f30f104620 movss xmm0, dword ptr [rsi + 0x20]
14096505f: f30f105628 movss xmm2, dword ptr [rsi + 0x28]
140965064: 0f14c2 unpcklps xmm0, xmm2
140965067: 410f28d2 movaps xmm2, xmm10
14096506b: 0f5cd0 subps xmm2, xmm0
14096506e: 0f59d2 mulps xmm2, xmm2
140965071: f30f58ca addss xmm1, xmm2
140965075: f30f16c2 movshdup xmm0, xmm2
140965079: f30f58c1 addss xmm0, xmm1
14096507d: 410f2ec5 ucomiss xmm0, xmm13
140965081: 77bd ja 0x140965040
140965083: f30f107e0c movss xmm7, dword ptr [rsi + 0xc]
140965088: f3410f59fe mulss xmm7, xmm14
14096508d: 410f2ec7 ucomiss xmm0, xmm15
140965091: 7628 jbe 0x1409650bb
140965093: 0f57c9 xorps xmm1, xmm1
140965096: f30f51c8 sqrtss xmm1, xmm0
14096509a: f30f580deab95605 addss xmm1, dword ptr [rip + 0x556b9ea]
1409650a2: f30f5e0d46294805 divss xmm1, dword ptr [rip + 0x5482946]
1409650aa: f30f10057e294805 movss xmm0, dword ptr [rip + 0x548297e]
1409650b2: e8ae502905 call 0x145bfa165
1409650b7: f30f59f8 mulss xmm7, xmm0
1409650bb: 450f28cc movaps xmm9, xmm12
1409650bf: f3440f5c4e2c subss xmm9, dword ptr [rsi + 0x2c]
1409650c5: f3440f584e18 addss xmm9, dword ptr [rsi + 0x18]
1409650cb: f30f104610 movss xmm0, dword ptr [rsi + 0x10]
1409650d0: f30f59c6 mulss xmm0, xmm6
1409650d4: f3410f59c1 mulss xmm0, xmm9
1409650d9: e839502905 call 0x145bfa117
1409650de: 440f28c0 movaps xmm8, xmm0
1409650e2: f3440f59c7 mulss xmm8, xmm7
1409650e7: 837e0401 cmp dword ptr [rsi + 4], 1
1409650eb: 751f jne 0x14096510c
1409650ed: f30f10461c movss xmm0, dword ptr [rsi + 0x1c]
1409650f2: 0f5705a77f4605 xorps xmm0, xmmword ptr [rip + 0x5467fa7]
1409650f9: f3440f59c8 mulss xmm9, xmm0
1409650fe: 410f28c1 movaps xmm0, xmm9
140965102: e82e502905 call 0x145bfa135
140965107: f3440f59c0 mulss xmm8, xmm0
14096510c: 8b4608 mov eax, dword ptr [rsi + 8]
14096510f: 4883f802 cmp rax, 2
140965113: 0f8727ffffff ja 0x140965040
140965119: 488d0440 lea rax, [rax + rax*2]
14096511d: f644844001 test byte ptr [rsp + rax*4 + 0x40], 1
140965122: 0f84f3feffff je 0x14096501b
140965128: 0f2e7c8444 ucomiss xmm7, dword ptr [rsp + rax*4 + 0x44]
14096512d: 0f860dffffff jbe 0x140965040
140965133: e9e3feffff jmp 0x14096501b
140965138: f644244001 test byte ptr [rsp + 0x40], 1
14096513d: 450f57c9 xorps xmm9, xmm9
140965141: 7524 jne 0x140965167
140965143: 450f57d2 xorps xmm10, xmm10
140965147: f3440f106c2430 movss xmm13, dword ptr [rsp + 0x30]
14096514e: f644244c01 test byte ptr [rsp + 0x4c], 1
140965153: 7427 je 0x14096517c
140965155: f30f10742454 movss xmm6, dword ptr [rsp + 0x54]
14096515b: eb22 jmp 0x14096517f
14096515d: 450f57c9 xorps xmm9, xmm9
140965161: 450f57d2 xorps xmm10, xmm10
140965165: eb26 jmp 0x14096518d
140965167: f3440f10542448 movss xmm10, dword ptr [rsp + 0x48]
14096516e: f3440f106c2430 movss xmm13, dword ptr [rsp + 0x30]
140965175: f644244c01 test byte ptr [rsp + 0x4c], 1
14096517a: 75d9 jne 0x140965155
14096517c: 0f57f6 xorps xmm6, xmm6
14096517f: f644245801 test byte ptr [rsp + 0x58], 1
140965184: 7407 je 0x14096518d
140965186: f3440f104c2460 movss xmm9, dword ptr [rsp + 0x60]
14096518d: 410f28c5 movaps xmm0, xmm13
140965191: e8814f2905 call 0x145bfa117
140965196: 0f28f8 movaps xmm7, xmm0
140965199: 410f28c5 movaps xmm0, xmm13
14096519d: e87b4f2905 call 0x145bfa11d
1409651a2: 440f2805f67e4605 movaps xmm8, xmmword ptr [rip + 0x5467ef6]
1409651aa: 440f57c0 xorps xmm8, xmm0
1409651ae: 0f57c9 xorps xmm1, xmm1
1409651b1: 410f28d2 movaps xmm2, xmm10
1409651b5: f30f59d1 mulss xmm2, xmm1
1409651b9: f3440f59c6 mulss xmm8, xmm6
1409651be: 0f28df movaps xmm3, xmm7
1409651c1: f30f59de mulss xmm3, xmm6
1409651c5: f30f59f1 mulss xmm6, xmm1
1409651c9: f30f58f2 addss xmm6, xmm2
1409651cd: f3410f59fa mulss xmm7, xmm10
1409651d2: f3440f5cc7 subss xmm8, xmm7
1409651d7: f3410f59c2 mulss xmm0, xmm10
1409651dc: f30f5cd8 subss xmm3, xmm0
1409651e0: f3410f59c9 mulss xmm1, xmm9
1409651e5: f3440f58c1 addss xmm8, xmm1
1409651ea: f3410f58f1 addss xmm6, xmm9
1409651ef: f30f58cb addss xmm1, xmm3
1409651f3: 0f57c0 xorps xmm0, xmm0
1409651f6: 440f2ec0 ucomiss xmm8, xmm0
1409651fa: 7510 jne 0x14096520c
1409651fc: 7a0e jp 0x14096520c
1409651fe: 0f2ef0 ucomiss xmm6, xmm0
140965201: 7509 jne 0x14096520c
140965203: 7a07 jp 0x14096520c
140965205: 0f2ec8 ucomiss xmm1, xmm0
140965208: 7502 jne 0x14096520c
14096520a: 7b26 jnp 0x140965232
14096520c: 8b44243c mov eax, dword ptr [rsp + 0x3c]
140965210: 8907 mov dword ptr [rdi], eax
140965212: f3440f584310 addss xmm8, dword ptr [rbx + 0x10]
140965218: f3440f114310 movss dword ptr [rbx + 0x10], xmm8
14096521e: f30f587314 addss xmm6, dword ptr [rbx + 0x14]
140965223: f30f117314 movss dword ptr [rbx + 0x14], xmm6
140965228: f30f584b18 addss xmm1, dword ptr [rbx + 0x18]
14096522d: f30f114b18 movss dword ptr [rbx + 0x18], xmm1
140965232: 0f28b42480000000 movaps xmm6, xmmword ptr [rsp + 0x80]
14096523a: 0f28bc2490000000 movaps xmm7, xmmword ptr [rsp + 0x90]
140965242: 440f288424a0000000 movaps xmm8, xmmword ptr [rsp + 0xa0]
14096524b: 440f288c24b0000000 movaps xmm9, xmmword ptr [rsp + 0xb0]
140965254: 440f289424c0000000 movaps xmm10, xmmword ptr [rsp + 0xc0]
14096525d: 440f289c24d0000000 movaps xmm11, xmmword ptr [rsp + 0xd0]
140965266: 440f28a424e0000000 movaps xmm12, xmmword ptr [rsp + 0xe0]
14096526f: 440f28ac24f0000000 movaps xmm13, xmmword ptr [rsp + 0xf0]
140965278: 440f28b42400010000 movaps xmm14, xmmword ptr [rsp + 0x100]
140965281: 440f28bc2410010000 movaps xmm15, xmmword ptr [rsp + 0x110]
14096528a: 4881c428010000 add rsp, 0x128
140965291: 5b pop rbx
140965292: 5d pop rbp
140965293: 5f pop rdi
140965294: 5e pop rsi
140965295: 415c pop r12
140965297: 415d pop r13
140965299: 415e pop r14
14096529b: 415f pop r15
14096529d: c3 ret 
14096529e: 31d2 xor edx, edx
1409652a0: 4c8b89a8010000 mov r9, qword ptr [rcx + 0x1a8]
1409652a7: 4f8d14c0 lea r10, [r8 + r8*8]
1409652ab: 4f8d04d1 lea r8, [r9 + r10*8]
1409652af: 488b8810010000 mov rcx, qword ptr [rax + 0x110]
1409652b6: 4f8b4cd140 mov r9, qword ptr [r9 + r10*8 + 0x40]
1409652bb: 4c39c9 cmp rcx, r9
1409652be: 7323 jae 0x1409652e3
1409652c0: 4d8b5038 mov r10, qword ptr [r8 + 0x38]
1409652c4: 498b0cca mov rcx, qword ptr [r10 + rcx*8]
1409652c8: 4885c9 test rcx, rcx
1409652cb: 7416 je 0x1409652e3
1409652cd: 4d8b5018 mov r10, qword ptr [r8 + 0x18]
1409652d1: 48f7d1 not rcx
1409652d4: 488d0c49 lea rcx, [rcx + rcx*2]
1409652d8: 48c1e104 shl rcx, 4
1409652dc: 498b4c0a10 mov rcx, qword ptr [r10 + rcx + 0x10]
1409652e1: eb02 jmp 0x1409652e5
1409652e3: 31c9 xor ecx, ecx
1409652e5: 4c8b9818010000 mov r11, qword ptr [rax + 0x118]
1409652ec: 4c8b9288000000 mov r10, qword ptr [rdx + 0x88]
1409652f3: 40b601 mov sil, 1
1409652f6: 4d39d3 cmp r11, r10
1409652f9: 7339 jae 0x140965334
1409652fb: 4c8bb280000000 mov r14, qword ptr [rdx + 0x80]
140965302: 4b833cde00 cmp qword ptr [r14 + r11*8], 0
140965307: 742b je 0x140965334
140965309: 4d39cb cmp r11, r9
14096530c: 7344 jae 0x140965352
14096530e: 4d8b7038 mov r14, qword ptr [r8 + 0x38]
140965312: 4f8b1cde mov r11, qword ptr [r14 + r11*8]
140965316: 4d85db test r11, r11
140965319: 7437 je 0x140965352
14096531b: 4d8b7018 mov r14, qword ptr [r8 + 0x18]
14096531f: 49f7d3 not r11
140965322: 4f8d1c5b lea r11, [r11 + r11*2]
140965326: 49c1e304 shl r11, 4
14096532a: 4f8b741e10 mov r14, qword ptr [r14 + r11 + 0x10]
14096532f: 4531ff xor r15d, r15d
140965332: eb24 jmp 0x140965358
140965334: 4531f6 xor r14d, r14d
140965337: 41b701 mov r15b, 1
14096533a: eb1c jmp 0x140965358
14096533c: 41be08000000 mov r14d, 8
140965342: e99efaffff jmp 0x140964de5
140965347: 41bf08000000 mov r15d, 8
14096534d: e993faffff jmp 0x140964de5
140965352: 4531ff xor r15d, r15d
140965355: 4531f6 xor r14d, r14d
140965358: 488b8020010000 mov rax, qword ptr [rax + 0x120]
14096535f: 4c39d0 cmp rax, r10
140965362: 733a jae 0x14096539e
140965364: 488b9280000000 mov rdx, qword ptr [rdx + 0x80]
14096536b: 48833cc200 cmp qword ptr [rdx + rax*8], 0
140965370: 742c je 0x14096539e
140965372: 4c39c8 cmp rax, r9
140965375: 7325 jae 0x14096539c
140965377: 498b5038 mov rdx, qword ptr [r8 + 0x38]
14096537b: 488b04c2 mov rax, qword ptr [rdx + rax*8]
14096537f: 4885c0 test rax, rax
140965382: 7418 je 0x14096539c
140965384: 498b5018 mov rdx, qword ptr [r8 + 0x18]
140965388: 48f7d0 not rax
14096538b: 488d0440 lea rax, [rax + rax*2]
14096538f: 48c1e004 shl rax, 4
140965393: 4c8b640210 mov r12, qword ptr [rdx + rax + 0x10]
140965398: 31f6 xor esi, esi
14096539a: eb05 jmp 0x1409653a1
14096539c: 31f6 xor esi, esi
14096539e: 4531e4 xor r12d, r12d
1409653a1: 41f7d5 not r13d
1409653a4: 4a8d046d00000000 lea rax, [r13*2]
1409653ac: 4c01e8 add rax, r13
1409653af: 48c1e004 shl rax, 4
1409653b3: 0f280401 movaps xmm0, xmmword ptr [rcx + rax]
1409653b7: 0f29442440 movaps xmmword ptr [rsp + 0x40], xmm0
1409653bc: 488d4c2474 lea rcx, [rsp + 0x74]
1409653c1: 488d542440 lea rdx, [rsp + 0x40]
1409653c6: 41b002 mov r8b, 2
1409653c9: e8624e6904 call 0x144ffa230
1409653ce: 4d85f6 test r14, r14
1409653d1: 0f94c0 sete al
1409653d4: 4108c7 or r15b, al
1409653d7: 4c8b5c2430 mov r11, qword ptr [rsp + 0x30]
1409653dc: 488b542428 mov rdx, qword ptr [rsp + 0x28]
1409653e1: 448b442424 mov r8d, dword ptr [rsp + 0x24]
1409653e6: 7511 jne 0x1409653f9
1409653e8: 4c89e9 mov rcx, r13
1409653eb: 48c1e104 shl rcx, 4
1409653ef: b001 mov al, 1
1409653f1: 41f6440e0a20 test byte ptr [r14 + rcx + 0xa], 0x20
1409653f7: 7529 jne 0x140965422
1409653f9: 4d85e4 test r12, r12
1409653fc: 0f94c0 sete al
1409653ff: 4008c6 or sil, al
140965402: 7404 je 0x140965408
140965404: 31c0 xor eax, eax
140965406: eb1a jmp 0x140965422
140965408: 4a8d04ad00000000 lea rax, [r13*4]
140965410: 4c01e8 add rax, r13
140965413: 48c1e004 shl rax, 4
140965417: 4901c4 add r12, rax
14096541a: 410fb644244c movzx eax, byte ptr [r12 + 0x4c]
140965420: 3401 xor al, 1
140965422: f3440f106c2474 movss xmm13, dword ptr [rsp + 0x74]
140965429: e91efbffff jmp 0x140964f4c
14096542e: 4c8d5001 lea r10, [rax + 1]
140965432: 4d39ca cmp r10, r9
140965435: 7358 jae 0x14096548f
140965437: 4829c2 sub rdx, rax
14096543a: eb09 jmp 0x140965445
14096543c: 4983c030 add r8, 0x30
140965440: 48ffca dec rdx
140965443: 744a je 0x14096548f
140965445: 410f28cc movaps xmm1, xmm12
140965449: f3410f5c08 subss xmm1, dword ptr [r8]
14096544e: f3410f5848ec addss xmm1, dword ptr [r8 - 0x14]
140965454: f3410f1050e8 movss xmm2, dword ptr [r8 - 0x18]
14096545a: 0f2ed1 ucomiss xmm2, xmm1
14096545d: 76dd jbe 0x14096543c
14096545f: 4d8d48d4 lea r9, [r8 - 0x2c]
140965463: 4c8d1440 lea r10, [rax + rax*2]
140965467: 49c1e204 shl r10, 4
14096546b: 410f1009 movups xmm1, xmmword ptr [r9]
14096546f: 410f105110 movups xmm2, xmmword ptr [r9 + 0x10]
140965474: 410f105920 movups xmm3, xmmword ptr [r9 + 0x20]
140965479: 420f115c1120 movups xmmword ptr [rcx + r10 + 0x20], xmm3
14096547f: 420f11541110 movups xmmword ptr [rcx + r10 + 0x10], xmm2
140965485: 420f110c11 movups xmmword ptr [rcx + r10], xmm1
14096548a: 48ffc0 inc rax
14096548d: ebad jmp 0x14096543c
14096548f: 49894310 mov qword ptr [r11 + 0x10], rax
140965493: c744244000000000 mov dword ptr [rsp + 0x40], 0
14096549b: c744244c00000000 mov dword ptr [rsp + 0x4c], 0
1409654a3: c744245800000000 mov dword ptr [rsp + 0x58], 0
1409654ab: 4885c0 test rax, rax
1409654ae: 740d je 0x1409654bd
1409654b0: 498b7308 mov rsi, qword ptr [r11 + 8]
1409654b4: 4c8d3440 lea r14, [rax + rax*2]
1409654b8: e92efbffff jmp 0x140964feb
1409654bd: 450f57c9 xorps xmm9, xmm9
1409654c1: 0f57f6 xorps xmm6, xmm6
1409654c4: 450f57d2 xorps xmm10, xmm10
1409654c8: e9c0fcffff jmp 0x14096518d
