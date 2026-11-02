0x145844b50: push rbp
0x145844b51: push r14
0x145844b53: push rsi
0x145844b54: push rdi
0x145844b55: push rbx
0x145844b56: sub rsp, 0xd0
0x145844b5d: lea rbp, [rsp + 0x80]
0x145844b65: movaps xmmword ptr [rbp + 0x40], xmm9
0x145844b6a: movaps xmmword ptr [rbp + 0x30], xmm8
0x145844b6f: movaps xmmword ptr [rbp + 0x20], xmm7
0x145844b73: movaps xmmword ptr [rbp + 0x10], xmm6
0x145844b77: mov qword ptr [rbp + 8], 0xfffffffffffffffe
0x145844b7f: mov ebx, edx
0x145844b81: movaps xmm6, xmm2
0x145844b84: mov rsi, rcx
0x145844b87: movss xmm7, dword ptr [rip + 0x69b831]
0x145844b8f: mulss xmm7, xmm2
0x145844b93: movss xmm9, dword ptr [rip + 0x69b7f0]
0x145844b9c: movaps xmm0, xmm7
0x145844b9f: mulss xmm0, xmm9
0x145844ba4: call 0x145d1463d
0x145844ba9: divss xmm0, xmm9
0x145844bae: movss dword ptr [rbp - 0x1c], xmm0
0x145844bb3: movaps xmm1, xmmword ptr [rip + 0x6a0bc6]
0x145844bba: andps xmm1, xmm7
0x145844bbd: ucomiss xmm1, xmm9
0x145844bc1: movzx edi, bl
0x145844bc4: jae 0x145844be7
0x145844bc6: movaps xmm8, xmm0
0x145844bca: call 0x145d14661
0x145844bcf: subss xmm8, xmm0
0x145844bd4: xorps xmm0, xmm0
0x145844bd7: ucomiss xmm8, xmm0
0x145844bdb: jne 0x145844c97
0x145844be1: jp 0x145844c97
0x145844be7: movaps xmm0, xmm7
0x145844bea: call 0x145d1463d
0x145844bef: movss dword ptr [rbp - 0x50], xmm0
0x145844bf4: lea rax, [rbp - 0x50]
0x145844bf8: mov qword ptr [rbp - 0x18], rax
0x145844bfc: lea rax, [rip + 0x4b34fd]
0x145844c03: mov qword ptr [rbp - 0x10], rax
0x145844c07: lea rdx, [rip + 0x1af50ca]
0x145844c0e: lea rcx, [rbp - 0x38]
0x145844c12: lea r8, [rbp - 0x18]
0x145844c16: call 0x145ce7350
0x145844c1b: lea rax, [rip + 0x17c73aa]
0x145844c22: movsxd rcx, dword ptr [rax + rdi*4]
0x145844c26: add rcx, rax
0x145844c29: jmp rcx
0x145844c2b: lea rdi, [rip + 0x17bfc16]
0x145844c32: mov ebx, 0x25
0x145844c37: mov edx, 0x25
0x145844c3c: mov rcx, rdi
0x145844c3f: call 0x1458dff90
0x145844c44: nop
0x145844c45: mov r8, rdx
0x145844c48: test rax, rax
0x145844c4b: cmovne rdi, rax
0x145844c4f: cmove r8, rbx
0x145844c53: lea rax, [rip + 0x17bfc36]
0x145844c5a: mov qword ptr [rbp - 0x18], rax
0x145844c5e: mov qword ptr [rbp - 0x10], 1
0x145844c66: lea rax, [rbp - 0x38]
0x145844c6a: mov qword ptr [rbp - 8], rax
0x145844c6e: lea rax, [rip + 0x17bfbfb]
0x145844c75: mov qword ptr [rbp], rax
0x145844c79: mov qword ptr [rsp + 0x20], 1
0x145844c82: lea r9, [rbp - 0x18]
0x145844c86: mov rcx, rsi
0x145844c89: mov rdx, rdi
0x145844c8c: call 0x1458e0370
0x145844c91: nop
0x145844c92: jmp 0x145845c9a
0x145844c97: lea rax, [rbp - 0x1c]
0x145844c9b: mov qword ptr [rbp - 0x18], rax
0x145844c9f: lea rax, [rip + 0x4b345a]
0x145844ca6: mov qword ptr [rbp - 0x10], rax
0x145844caa: lea rdx, [rip + 0x1af501d]
0x145844cb1: lea rcx, [rbp - 0x38]
0x145844cb5: lea r8, [rbp - 0x18]
0x145844cb9: call 0x145ce7350
0x145844cbe: lea rax, [rip + 0x17c7307]
0x145844cc5: movsxd rcx, dword ptr [rax + rdi*4]
0x145844cc9: add rcx, rax
0x145844ccc: jmp rcx
0x145844cce: lea rdi, [rip + 0x17bfbbc]
0x145844cd5: mov ebx, 0x2b
0x145844cda: mov edx, 0x2b
0x145844cdf: mov rcx, rdi
0x145844ce2: call 0x1458dff90
0x145844ce7: nop
0x145844ce8: mov r8, rdx
0x145844ceb: test rax, rax
0x145844cee: cmovne rdi, rax
0x145844cf2: cmove r8, rbx
0x145844cf6: lea rax, [rip + 0x17bfb93]
0x145844cfd: mov qword ptr [rbp - 0x18], rax
0x145844d01: mov qword ptr [rbp - 0x10], 1
0x145844d09: lea rax, [rbp - 0x38]
0x145844d0d: mov qword ptr [rbp - 8], rax
0x145844d11: lea rax, [rip + 0x17bfb58]
0x145844d18: mov qword ptr [rbp], rax
0x145844d1c: mov qword ptr [rsp + 0x20], 1
0x145844d25: lea r9, [rbp - 0x18]
0x145844d29: mov rcx, rsi
0x145844d2c: mov rdx, rdi
0x145844d2f: call 0x1458e0370
0x145844d34: nop
0x145844d35: jmp 0x145845c9a
0x145844d3a: lea rdi, [rip + 0x17c000a]
0x145844d41: mov ebx, 0x28
0x145844d46: mov edx, 0x28
0x145844d4b: mov rcx, rdi
0x145844d4e: call 0x1458dff90
0x145844d53: nop
0x145844d54: mov r8, rdx
0x145844d57: test rax, rax
0x145844d5a: cmovne rdi, rax
0x145844d5e: cmove r8, rbx
0x145844d62: lea rax, [rip + 0x17bfb27]
0x145844d69: mov qword ptr [rbp - 0x18], rax
0x145844d6d: mov qword ptr [rbp - 0x10], 1
0x145844d75: lea rax, [rbp - 0x38]
0x145844d79: mov qword ptr [rbp - 8], rax
0x145844d7d: lea rax, [rip + 0x17bfaec]
0x145844d84: mov qword ptr [rbp], rax
0x145844d88: mov qword ptr [rsp + 0x20], 1
0x145844d91: lea r9, [rbp - 0x18]
0x145844d95: mov rcx, rsi
0x145844d98: mov rdx, rdi
0x145844d9b: call 0x1458e0370
0x145844da0: nop
0x145844da1: jmp 0x145845c9a
0x145844da6: lea rdi, [rip + 0x17bfd3f]
0x145844dad: mov ebx, 0x24
0x145844db2: mov edx, 0x24
0x145844db7: mov rcx, rdi
0x145844dba: call 0x1458dff90
0x145844dbf: nop
0x145844dc0: mov r8, rdx
0x145844dc3: test rax, rax
0x145844dc6: cmovne rdi, rax
0x145844dca: cmove r8, rbx
0x145844dce: lea rax, [rip + 0x17bfabb]
0x145844dd5: mov qword ptr [rbp - 0x18], rax
0x145844dd9: mov qword ptr [rbp - 0x10], 1
0x145844de1: lea rax, [rbp - 0x38]
0x145844de5: mov qword ptr [rbp - 8], rax
0x145844de9: lea rax, [rip + 0x17bfa80]
0x145844df0: mov qword ptr [rbp], rax
0x145844df4: mov qword ptr [rsp + 0x20], 1
0x145844dfd: lea r9, [rbp - 0x18]
0x145844e01: mov rcx, rsi
0x145844e04: mov rdx, rdi
0x145844e07: call 0x1458e0370
0x145844e0c: nop
0x145844e0d: jmp 0x145845c9a
0x145844e12: lea rdi, [rip + 0x17bfc82]
0x145844e19: mov ebx, 0x29
0x145844e1e: mov edx, 0x29
0x145844e23: mov rcx, rdi
0x145844e26: call 0x1458dff90
0x145844e2b: nop
0x145844e2c: mov r8, rdx
0x145844e2f: test rax, rax
0x145844e32: cmovne rdi, rax
0x145844e36: cmove r8, rbx
0x145844e3a: lea rax, [rip + 0x17bfa4f]
0x145844e41: mov qword ptr [rbp - 0x18], rax
0x145844e45: mov qword ptr [rbp - 0x10], 1
0x145844e4d: lea rax, [rbp - 0x38]
0x145844e51: mov qword ptr [rbp - 8], rax
0x145844e55: lea rax, [rip + 0x17bfa14]
0x145844e5c: mov qword ptr [rbp], rax
0x145844e60: mov qword ptr [rsp + 0x20], 1
0x145844e69: lea r9, [rbp - 0x18]
0x145844e6d: mov rcx, rsi
0x145844e70: mov rdx, rdi
0x145844e73: call 0x1458e0370
0x145844e78: nop
0x145844e79: jmp 0x145845c9a
0x145844e7e: lea rdi, [rip + 0x17bfbb2]
0x145844e85: mov ebx, 0x1c
0x145844e8a: mov edx, 0x1c
0x145844e8f: mov rcx, rdi
0x145844e92: call 0x1458dff90
0x145844e97: nop
0x145844e98: mov r8, rdx
0x145844e9b: test rax, rax
0x145844e9e: cmovne rdi, rax
0x145844ea2: cmove r8, rbx
0x145844ea6: lea rax, [rip + 0x17bf9e3]
0x145844ead: mov qword ptr [rbp - 0x18], rax
0x145844eb1: mov qword ptr [rbp - 0x10], 1
0x145844eb9: lea rax, [rbp - 0x38]
0x145844ebd: mov qword ptr [rbp - 8], rax
0x145844ec1: lea rax, [rip + 0x17bf9a8]
0x145844ec8: mov qword ptr [rbp], rax
0x145844ecc: mov qword ptr [rsp + 0x20], 1
0x145844ed5: lea r9, [rbp - 0x18]
0x145844ed9: mov rcx, rsi
0x145844edc: mov rdx, rdi
0x145844edf: call 0x1458e0370
0x145844ee4: nop
0x145844ee5: jmp 0x145845c9a
0x145844eea: lea rdi, [rip + 0x17bfa25]
0x145844ef1: mov ebx, 0x35
0x145844ef6: mov edx, 0x35
0x145844efb: mov rcx, rdi
0x145844efe: call 0x1458dff90
0x145844f03: nop
0x145844f04: mov r8, rdx
0x145844f07: test rax, rax
0x145844f0a: cmovne rdi, rax
0x145844f0e: cmove r8, rbx
0x145844f12: lea rax, [rip + 0x17bf977]
0x145844f19: mov qword ptr [rbp - 0x18], rax
0x145844f1d: mov qword ptr [rbp - 0x10], 1
0x145844f25: lea rax, [rbp - 0x38]
0x145844f29: mov qword ptr [rbp - 8], rax
0x145844f2d: lea rax, [rip + 0x17bf93c]
0x145844f34: mov qword ptr [rbp], rax
0x145844f38: mov qword ptr [rsp + 0x20], 1
0x145844f41: lea r9, [rbp - 0x18]
0x145844f45: mov rcx, rsi
0x145844f48: mov rdx, rdi
0x145844f4b: call 0x1458e0370
0x145844f50: nop
0x145844f51: jmp 0x145845c9a
0x145844f56: lea rdi, [rip + 0x17bfaf6]
0x145844f5d: mov ebx, 0x1b
0x145844f62: mov edx, 0x1b
0x145844f67: mov rcx, rdi
0x145844f6a: call 0x1458dff90
0x145844f6f: nop
0x145844f70: mov r8, rdx
0x145844f73: test rax, rax
0x145844f76: cmovne rdi, rax
0x145844f7a: cmove r8, rbx
0x145844f7e: lea rax, [rip + 0x17bf90b]
0x145844f85: mov qword ptr [rbp - 0x18], rax
0x145844f89: mov qword ptr [rbp - 0x10], 1
0x145844f91: lea rax, [rbp - 0x38]
0x145844f95: mov qword ptr [rbp - 8], rax
0x145844f99: lea rax, [rip + 0x17bf8d0]
0x145844fa0: mov qword ptr [rbp], rax
0x145844fa4: mov qword ptr [rsp + 0x20], 1
0x145844fad: lea r9, [rbp - 0x18]
0x145844fb1: mov rcx, rsi
0x145844fb4: mov rdx, rdi
0x145844fb7: call 0x1458e0370
0x145844fbc: nop
0x145844fbd: jmp 0x145845c9a
0x145844fc2: lea rdi, [rip + 0x17bfa1a]
0x145844fc9: mov ebx, 0x31
0x145844fce: mov edx, 0x31
0x145844fd3: mov rcx, rdi
0x145844fd6: call 0x1458dff90
0x145844fdb: nop
0x145844fdc: mov r8, rdx
0x145844fdf: test rax, rax
0x145844fe2: cmovne rdi, rax
0x145844fe6: cmove r8, rbx
0x145844fea: lea rax, [rip + 0x17bf89f]
0x145844ff1: mov qword ptr [rbp - 0x18], rax
0x145844ff5: mov qword ptr [rbp - 0x10], 1
0x145844ffd: lea rax, [rbp - 0x38]
0x145845001: mov qword ptr [rbp - 8], rax
0x145845005: lea rax, [rip + 0x17bf864]
0x14584500c: mov qword ptr [rbp], rax
0x145845010: mov qword ptr [rsp + 0x20], 1
0x145845019: lea r9, [rbp - 0x18]
0x14584501d: mov rcx, rsi
0x145845020: mov rdx, rdi
0x145845023: call 0x1458e0370
0x145845028: nop
0x145845029: jmp 0x145845c9a
0x14584502e: lea rdi, [rip + 0x17bfc81]
0x145845035: mov edx, 0x4e
0x14584503a: mov rcx, rdi
0x14584503d: call 0x1458dff90
0x145845042: nop
0x145845043: mov r14, rax
0x145845046: mov rbx, rdx
0x145845049: mulss xmm6, xmm9
0x14584504e: movaps xmm0, xmm6
0x145845051: call 0x145d1463d
0x145845056: movaps xmm6, xmm0
0x145845059: divss xmm6, xmm9
0x14584505e: movss dword ptr [rbp - 0x1c], xmm6
0x145845063: movaps xmm0, xmm6
0x145845066: call 0x145d14661
0x14584506b: subss xmm6, xmm0
0x14584506f: xorps xmm0, xmm0
0x145845072: lea rax, [rbp - 0x1c]
0x145845076: ucomiss xmm6, xmm0
0x145845079: jne 0x145845a9e
0x14584507f: jp 0x145845a9e
0x145845085: mov qword ptr [rbp - 0x18], rax
0x145845089: lea rax, [rip + 0x4b3070]
0x145845090: mov qword ptr [rbp - 0x10], rax
0x145845094: lea rdx, [rip + 0x1af4c2d]
0x14584509b: lea rcx, [rbp - 0x50]
0x14584509f: lea r8, [rbp - 0x18]
0x1458450a3: call 0x145ce7350
0x1458450a8: nop
0x1458450a9: jmp 0x145845ac2
0x1458450ae: lea rdi, [rip + 0x17bfbd2]
0x1458450b5: mov ebx, 0x2f
0x1458450ba: mov edx, 0x2f
0x1458450bf: mov rcx, rdi
0x1458450c2: call 0x1458dff90
0x1458450c7: nop
0x1458450c8: mov r8, rdx
0x1458450cb: test rax, rax
0x1458450ce: cmovne rdi, rax
0x1458450d2: cmove r8, rbx
0x1458450d6: lea rax, [rip + 0x17bf7b3]
0x1458450dd: mov qword ptr [rbp - 0x18], rax
0x1458450e1: mov qword ptr [rbp - 0x10], 1
0x1458450e9: lea rax, [rbp - 0x38]
0x1458450ed: mov qword ptr [rbp - 8], rax
0x1458450f1: lea rax, [rip + 0x17bf778]
0x1458450f8: mov qword ptr [rbp], rax
0x1458450fc: mov qword ptr [rsp + 0x20], 1
0x145845105: lea r9, [rbp - 0x18]
0x145845109: mov rcx, rsi
0x14584510c: mov rdx, rdi
0x14584510f: call 0x1458e0370
0x145845114: nop
0x145845115: jmp 0x145845c9a
0x14584511a: lea rdi, [rip + 0x17bf79b]
0x145845121: mov ebx, 0x25
0x145845126: mov edx, 0x25
0x14584512b: mov rcx, rdi
0x14584512e: call 0x1458dff90
0x145845133: nop
0x145845134: mov r8, rdx
0x145845137: test rax, rax
0x14584513a: cmovne rdi, rax
0x14584513e: cmove r8, rbx
0x145845142: lea rax, [rip + 0x17bf747]
0x145845149: mov qword ptr [rbp - 0x18], rax
0x14584514d: mov qword ptr [rbp - 0x10], 1
0x145845155: lea rax, [rbp - 0x38]
0x145845159: mov qword ptr [rbp - 8], rax
0x14584515d: lea rax, [rip + 0x17bf70c]
0x145845164: mov qword ptr [rbp], rax
0x145845168: mov qword ptr [rsp + 0x20], 1
0x145845171: lea r9, [rbp - 0x18]
0x145845175: mov rcx, rsi
0x145845178: mov rdx, rdi
0x14584517b: call 0x1458e0370
0x145845180: nop
0x145845181: jmp 0x145845c9a
0x145845186: lea rdi, [rip + 0x17bf937]
0x14584518d: mov edx, 0x28
0x145845192: mov rcx, rdi
0x145845195: call 0x1458dff90
0x14584519a: nop
0x14584519b: mov r14, rax
0x14584519e: mov rbx, rdx
0x1458451a1: mulss xmm6, xmm9
0x1458451a6: movaps xmm0, xmm6
0x1458451a9: call 0x145d1463d
0x1458451ae: movaps xmm6, xmm0
0x1458451b1: divss xmm6, xmm9
0x1458451b6: movss dword ptr [rbp - 0x1c], xmm6
0x1458451bb: movaps xmm0, xmm6
0x1458451be: call 0x145d14661
0x1458451c3: subss xmm6, xmm0
0x1458451c7: xorps xmm0, xmm0
0x1458451ca: lea rax, [rbp - 0x1c]
0x1458451ce: ucomiss xmm6, xmm0
0x1458451d1: jne 0x145845b19
0x1458451d7: jp 0x145845b19
0x1458451dd: mov qword ptr [rbp - 0x18], rax
0x1458451e1: lea rax, [rip + 0x4b2f18]
0x1458451e8: mov qword ptr [rbp - 0x10], rax
0x1458451ec: lea rdx, [rip + 0x1af4ad5]
0x1458451f3: lea rcx, [rbp - 0x50]
0x1458451f7: lea r8, [rbp - 0x18]
0x1458451fb: call 0x145ce7350
0x145845200: nop
0x145845201: jmp 0x145845b3d
0x145845206: lea rdi, [rip + 0x17bf6d4]
0x14584520d: mov ebx, 0x35
0x145845212: mov edx, 0x35
0x145845217: mov rcx, rdi
0x14584521a: call 0x1458dff90
0x14584521f: nop
0x145845220: mov r8, rdx
0x145845223: test rax, rax
0x145845226: cmovne rdi, rax
0x14584522a: cmove r8, rbx
0x14584522e: lea rax, [rip + 0x17bf65b]
0x145845235: mov qword ptr [rbp - 0x18], rax
0x145845239: mov qword ptr [rbp - 0x10], 1
0x145845241: lea rax, [rbp - 0x38]
0x145845245: mov qword ptr [rbp - 8], rax
0x145845249: lea rax, [rip + 0x17bf620]
0x145845250: mov qword ptr [rbp], rax
0x145845254: mov qword ptr [rsp + 0x20], 1
0x14584525d: lea r9, [rbp - 0x18]
0x145845261: mov rcx, rsi
0x145845264: mov rdx, rdi
0x145845267: call 0x1458e0370
0x14584526c: nop
0x14584526d: jmp 0x145845c9a
0x145845272: lea rdi, [rip + 0x17bf712]
0x145845279: mov ebx, 0x25
0x14584527e: mov edx, 0x25
0x145845283: mov rcx, rdi
0x145845286: call 0x1458dff90
0x14584528b: nop
0x14584528c: mov r8, rdx
0x14584528f: test rax, rax
0x145845292: cmovne rdi, rax
0x145845296: cmove r8, rbx
0x14584529a: lea rax, [rip + 0x17bf5ef]
0x1458452a1: mov qword ptr [rbp - 0x18], rax
0x1458452a5: mov qword ptr [rbp - 0x10], 1
0x1458452ad: lea rax, [rbp - 0x38]
0x1458452b1: mov qword ptr [rbp - 8], rax
0x1458452b5: lea rax, [rip + 0x17bf5b4]
0x1458452bc: mov qword ptr [rbp], rax
0x1458452c0: mov qword ptr [rsp + 0x20], 1
0x1458452c9: lea r9, [rbp - 0x18]
0x1458452cd: mov rcx, rsi
0x1458452d0: mov rdx, rdi
0x1458452d3: call 0x1458e0370
0x1458452d8: nop
0x1458452d9: jmp 0x145845c9a
0x1458452de: lea rdi, [rip + 0x17bfb39]
0x1458452e5: mov ebx, 0x38
0x1458452ea: mov edx, 0x38
0x1458452ef: mov rcx, rdi
0x1458452f2: call 0x1458dff90
0x1458452f7: nop
0x1458452f8: mov r8, rdx
0x1458452fb: test rax, rax
0x1458452fe: cmovne rdi, rax
0x145845302: cmove r8, rbx
0x145845306: lea rax, [rip + 0x17bf583]
0x14584530d: mov qword ptr [rbp - 0x18], rax
0x145845311: mov qword ptr [rbp - 0x10], 1
0x145845319: lea rax, [rbp - 0x38]
0x14584531d: mov qword ptr [rbp - 8], rax
0x145845321: lea rax, [rip + 0x17bf548]
0x145845328: mov qword ptr [rbp], rax
0x14584532c: mov qword ptr [rsp + 0x20], 1
0x145845335: lea r9, [rbp - 0x18]
0x145845339: mov rcx, rsi
0x14584533c: mov rdx, rdi
0x14584533f: call 0x1458e0370
0x145845344: nop
0x145845345: jmp 0x145845c9a
0x14584534a: lea rdi, [rip + 0x17bf7bf]
0x145845351: mov ebx, 0x2b
0x145845356: mov edx, 0x2b
0x14584535b: mov rcx, rdi
0x14584535e: call 0x1458dff90
0x145845363: nop
0x145845364: mov r8, rdx
0x145845367: test rax, rax
0x14584536a: cmovne rdi, rax
0x14584536e: cmove r8, rbx
0x145845372: lea rax, [rip + 0x17bf517]
0x145845379: mov qword ptr [rbp - 0x18], rax
0x14584537d: mov qword ptr [rbp - 0x10], 1
0x145845385: lea rax, [rbp - 0x38]
0x145845389: mov qword ptr [rbp - 8], rax
0x14584538d: lea rax, [rip + 0x17bf4dc]
0x145845394: mov qword ptr [rbp], rax
0x145845398: mov qword ptr [rsp + 0x20], 1
0x1458453a1: lea r9, [rbp - 0x18]
0x1458453a5: mov rcx, rsi
0x1458453a8: mov rdx, rdi
0x1458453ab: call 0x1458e0370
0x1458453b0: nop
0x1458453b1: jmp 0x145845c9a
0x1458453b6: lea rdi, [rip + 0x17bf7eb]
0x1458453bd: mov ebx, 0x3a
0x1458453c2: mov edx, 0x3a
0x1458453c7: mov rcx, rdi
0x1458453ca: call 0x1458dff90
0x1458453cf: nop
0x1458453d0: mov r8, rdx
0x1458453d3: test rax, rax
0x1458453d6: cmovne rdi, rax
0x1458453da: cmove r8, rbx
0x1458453de: lea rax, [rip + 0x17bf4ab]
0x1458453e5: mov qword ptr [rbp - 0x18], rax
0x1458453e9: mov qword ptr [rbp - 0x10], 1
0x1458453f1: lea rax, [rbp - 0x38]
0x1458453f5: mov qword ptr [rbp - 8], rax
0x1458453f9: lea rax, [rip + 0x17bf470]
0x145845400: mov qword ptr [rbp], rax
0x145845404: mov qword ptr [rsp + 0x20], 1
0x14584540d: lea r9, [rbp - 0x18]
0x145845411: mov rcx, rsi
0x145845414: mov rdx, rdi
0x145845417: call 0x1458e0370
0x14584541c: nop
0x14584541d: jmp 0x145845c9a
0x145845422: lea rdi, [rip + 0x17bf522]
0x145845429: mov ebx, 0x20
0x14584542e: mov edx, 0x20
0x145845433: mov rcx, rdi
0x145845436: call 0x1458dff90
0x14584543b: nop
0x14584543c: mov r8, rdx
0x14584543f: test rax, rax
0x145845442: cmovne rdi, rax
0x145845446: cmove r8, rbx
0x14584544a: lea rax, [rip + 0x17bf43f]
0x145845451: mov qword ptr [rbp - 0x18], rax
0x145845455: mov qword ptr [rbp - 0x10], 1
0x14584545d: lea rax, [rbp - 0x38]
0x145845461: mov qword ptr [rbp - 8], rax
0x145845465: lea rax, [rip + 0x17bf404]
0x14584546c: mov qword ptr [rbp], rax
0x145845470: mov qword ptr [rsp + 0x20], 1
0x145845479: lea r9, [rbp - 0x18]
0x14584547d: mov rcx, rsi
0x145845480: mov rdx, rdi
0x145845483: call 0x1458e0370
0x145845488: nop
0x145845489: jmp 0x145845c9a
0x14584548e: lea rdi, [rip + 0x17bf74d]
0x145845495: mov ebx, 0x33
0x14584549a: mov edx, 0x33
0x14584549f: mov rcx, rdi
0x1458454a2: call 0x1458dff90
0x1458454a7: nop
0x1458454a8: mov r8, rdx
0x1458454ab: test rax, rax
0x1458454ae: cmovne rdi, rax
0x1458454b2: cmove r8, rbx
0x1458454b6: lea rax, [rip + 0x17bf3d3]
0x1458454bd: mov qword ptr [rbp - 0x18], rax
0x1458454c1: mov qword ptr [rbp - 0x10], 1
0x1458454c9: lea rax, [rbp - 0x38]
0x1458454cd: mov qword ptr [rbp - 8], rax
0x1458454d1: lea rax, [rip + 0x17bf398]
0x1458454d8: mov qword ptr [rbp], rax
0x1458454dc: mov qword ptr [rsp + 0x20], 1
0x1458454e5: lea r9, [rbp - 0x18]
0x1458454e9: mov rcx, rsi
0x1458454ec: mov rdx, rdi
0x1458454ef: call 0x1458e0370
0x1458454f4: nop
0x1458454f5: jmp 0x145845c9a
0x1458454fa: lea rdi, [rip + 0x17bf56d]
0x145845501: mov ebx, 0x2d
0x145845506: mov edx, 0x2d
0x14584550b: mov rcx, rdi
0x14584550e: call 0x1458dff90
0x145845513: nop
0x145845514: mov r8, rdx
0x145845517: test rax, rax
0x14584551a: cmovne rdi, rax
0x14584551e: cmove r8, rbx
0x145845522: lea rax, [rip + 0x17bf367]
0x145845529: mov qword ptr [rbp - 0x18], rax
0x14584552d: mov qword ptr [rbp - 0x10], 1
0x145845535: lea rax, [rbp - 0x38]
0x145845539: mov qword ptr [rbp - 8], rax
0x14584553d: lea rax, [rip + 0x17bf32c]
0x145845544: mov qword ptr [rbp], rax
0x145845548: mov qword ptr [rsp + 0x20], 1
0x145845551: lea r9, [rbp - 0x18]
0x145845555: mov rcx, rsi
0x145845558: mov rdx, rdi
0x14584555b: call 0x1458e0370
0x145845560: nop
0x145845561: jmp 0x145845c9a
0x145845566: lea rdi, [rip + 0x17bf3fe]
0x14584556d: mov edx, 0x1f
0x145845572: mov rcx, rdi
0x145845575: call 0x1458dff90
0x14584557a: nop
0x14584557b: mov r14, rax
0x14584557e: mov rbx, rdx
0x145845581: mulss xmm6, xmm9
0x145845586: movaps xmm0, xmm6
0x145845589: call 0x145d1463d
0x14584558e: movaps xmm6, xmm0
0x145845591: divss xmm6, xmm9
0x145845596: movss dword ptr [rbp - 0x1c], xmm6
0x14584559b: movaps xmm0, xmm6
0x14584559e: call 0x145d14661
0x1458455a3: subss xmm6, xmm0
0x1458455a7: xorps xmm0, xmm0
0x1458455aa: lea rax, [rbp - 0x1c]
0x1458455ae: ucomiss xmm6, xmm0
0x1458455b1: jne 0x145845b94
0x1458455b7: jp 0x145845b94
0x1458455bd: mov qword ptr [rbp - 0x18], rax
0x1458455c1: lea rax, [rip + 0x4b2b38]
0x1458455c8: mov qword ptr [rbp - 0x10], rax
0x1458455cc: lea rdx, [rip + 0x1af46f5]
0x1458455d3: lea rcx, [rbp - 0x50]
0x1458455d7: lea r8, [rbp - 0x18]
0x1458455db: call 0x145ce7350
0x1458455e0: nop
0x1458455e1: jmp 0x145845bb8
0x1458455e6: lea rdi, [rip + 0x17bf54e]
0x1458455ed: mov ebx, 0x3a
0x1458455f2: mov edx, 0x3a
0x1458455f7: mov rcx, rdi
0x1458455fa: call 0x1458dff90
0x1458455ff: nop
0x145845600: mov r8, rdx
0x145845603: test rax, rax
0x145845606: cmovne rdi, rax
0x14584560a: cmove r8, rbx
0x14584560e: lea rax, [rip + 0x17bf27b]
0x145845615: mov qword ptr [rbp - 0x18], rax
0x145845619: mov qword ptr [rbp - 0x10], 1
0x145845621: lea rax, [rbp - 0x38]
0x145845625: mov qword ptr [rbp - 8], rax
0x145845629: lea rax, [rip + 0x17bf240]
0x145845630: mov qword ptr [rbp], rax
0x145845634: mov qword ptr [rsp + 0x20], 1
0x14584563d: lea r9, [rbp - 0x18]
0x145845641: mov rcx, rsi
0x145845644: mov rdx, rdi
0x145845647: call 0x1458e0370
0x14584564c: nop
0x14584564d: jmp 0x145845c9a
0x145845652: lea rdi, [rip + 0x17bf3bb]
0x145845659: mov ebx, 0x23
0x14584565e: mov edx, 0x23
0x145845663: mov rcx, rdi
0x145845666: call 0x1458dff90
0x14584566b: nop
0x14584566c: mov r8, rdx
0x14584566f: test rax, rax
0x145845672: cmovne rdi, rax
0x145845676: cmove r8, rbx
0x14584567a: lea rax, [rip + 0x17bf20f]
0x145845681: mov qword ptr [rbp - 0x18], rax
0x145845685: mov qword ptr [rbp - 0x10], 1
0x14584568d: lea rax, [rbp - 0x38]
0x145845691: mov qword ptr [rbp - 8], rax
0x145845695: lea rax, [rip + 0x17bf1d4]
0x14584569c: mov qword ptr [rbp], rax
0x1458456a0: mov qword ptr [rsp + 0x20], 1
0x1458456a9: lea r9, [rbp - 0x18]
0x1458456ad: mov rcx, rsi
0x1458456b0: mov rdx, rdi
0x1458456b3: call 0x1458e0370
0x1458456b8: nop
0x1458456b9: jmp 0x145845c9a
0x1458456be: lea rdi, [rip + 0x17bf2eb]
0x1458456c5: mov ebx, 0x33
0x1458456ca: mov edx, 0x33
0x1458456cf: mov rcx, rdi
0x1458456d2: call 0x1458dff90
0x1458456d7: nop
0x1458456d8: mov r8, rdx
0x1458456db: test rax, rax
0x1458456de: cmovne rdi, rax
0x1458456e2: cmove r8, rbx
0x1458456e6: lea rax, [rip + 0x17bf1a3]
0x1458456ed: mov qword ptr [rbp - 0x18], rax
0x1458456f1: mov qword ptr [rbp - 0x10], 1
0x1458456f9: lea rax, [rbp - 0x38]
0x1458456fd: mov qword ptr [rbp - 8], rax
0x145845701: lea rax, [rip + 0x17bf168]
0x145845708: mov qword ptr [rbp], rax
0x14584570c: mov qword ptr [rsp + 0x20], 1
0x145845715: lea r9, [rbp - 0x18]
0x145845719: mov rcx, rsi
0x14584571c: mov rdx, rdi
0x14584571f: call 0x1458e0370
0x145845724: nop
0x145845725: jmp 0x145845c9a
0x14584572a: lea rdi, [rip + 0x17bf6b9]
0x145845731: mov ebx, 0x34
0x145845736: mov edx, 0x34
0x14584573b: mov rcx, rdi
0x14584573e: call 0x1458dff90
0x145845743: nop
0x145845744: mov r8, rdx
0x145845747: test rax, rax
0x14584574a: cmovne rdi, rax
0x14584574e: cmove r8, rbx
0x145845752: lea rax, [rip + 0x17bf137]
0x145845759: mov qword ptr [rbp - 0x18], rax
0x14584575d: mov qword ptr [rbp - 0x10], 1
0x145845765: lea rax, [rbp - 0x38]
0x145845769: mov qword ptr [rbp - 8], rax
0x14584576d: lea rax, [rip + 0x17bf0fc]
0x145845774: mov qword ptr [rbp], rax
0x145845778: mov qword ptr [rsp + 0x20], 1
0x145845781: lea r9, [rbp - 0x18]
0x145845785: mov rcx, rsi
0x145845788: mov rdx, rdi
0x14584578b: call 0x1458e0370
0x145845790: nop
0x145845791: jmp 0x145845c9a
0x145845796: lea rdi, [rip + 0x17bf6b9]
0x14584579d: mov ebx, 0x3b
0x1458457a2: mov edx, 0x3b
0x1458457a7: mov rcx, rdi
0x1458457aa: call 0x1458dff90
0x1458457af: nop
0x1458457b0: mov r8, rdx
0x1458457b3: test rax, rax
0x1458457b6: cmovne rdi, rax
0x1458457ba: cmove r8, rbx
0x1458457be: lea rax, [rip + 0x17bf0cb]
0x1458457c5: mov qword ptr [rbp - 0x18], rax
0x1458457c9: mov qword ptr [rbp - 0x10], 1
0x1458457d1: lea rax, [rbp - 0x38]
0x1458457d5: mov qword ptr [rbp - 8], rax
0x1458457d9: lea rax, [rip + 0x17bf090]
0x1458457e0: mov qword ptr [rbp], rax
0x1458457e4: mov qword ptr [rsp + 0x20], 1
0x1458457ed: lea r9, [rbp - 0x18]
0x1458457f1: mov rcx, rsi
0x1458457f4: mov rdx, rdi
0x1458457f7: call 0x1458e0370
0x1458457fc: nop
0x1458457fd: jmp 0x145845c9a
0x145845802: lea rdi, [rip + 0x17bf40c]
0x145845809: mov ebx, 0x35
0x14584580e: mov edx, 0x35
0x145845813: mov rcx, rdi
0x145845816: call 0x1458dff90
0x14584581b: nop
0x14584581c: mov r8, rdx
0x14584581f: test rax, rax
0x145845822: cmovne rdi, rax
0x145845826: cmove r8, rbx
0x14584582a: lea rax, [rip + 0x17bf05f]
0x145845831: mov qword ptr [rbp - 0x18], rax
0x145845835: mov qword ptr [rbp - 0x10], 1
0x14584583d: lea rax, [rbp - 0x38]
0x145845841: mov qword ptr [rbp - 8], rax
0x145845845: lea rax, [rip + 0x17bf024]
0x14584584c: mov qword ptr [rbp], rax
0x145845850: mov qword ptr [rsp + 0x20], 1
0x145845859: lea r9, [rbp - 0x18]
0x14584585d: mov rcx, rsi
0x145845860: mov rdx, rdi
0x145845863: call 0x1458e0370
0x145845868: nop
0x145845869: jmp 0x145845c9a
0x14584586e: lea rdi, [rip + 0x17bf300]
0x145845875: mov ebx, 0x33
0x14584587a: mov edx, 0x33
0x14584587f: mov rcx, rdi
0x145845882: call 0x1458dff90
0x145845887: nop
0x145845888: mov r8, rdx
0x14584588b: test rax, rax
0x14584588e: cmovne rdi, rax
0x145845892: cmove r8, rbx
0x145845896: lea rax, [rip + 0x17beff3]
0x14584589d: mov qword ptr [rbp - 0x18], rax
0x1458458a1: mov qword ptr [rbp - 0x10], 1
0x1458458a9: lea rax, [rbp - 0x38]
0x1458458ad: mov qword ptr [rbp - 8], rax
0x1458458b1: lea rax, [rip + 0x17befb8]
0x1458458b8: mov qword ptr [rbp], rax
0x1458458bc: mov qword ptr [rsp + 0x20], 1
0x1458458c5: lea r9, [rbp - 0x18]
0x1458458c9: mov rcx, rsi
0x1458458cc: mov rdx, rdi
0x1458458cf: call 0x1458e0370
0x1458458d4: nop
0x1458458d5: jmp 0x145845c9a
0x1458458da: lea rdi, [rip + 0x17bf369]
0x1458458e1: mov ebx, 0x3d
0x1458458e6: mov edx, 0x3d
0x1458458eb: mov rcx, rdi
0x1458458ee: call 0x1458dff90
0x1458458f3: nop
0x1458458f4: mov r8, rdx
0x1458458f7: test rax, rax
0x1458458fa: cmovne rdi, rax
0x1458458fe: cmove r8, rbx
0x145845902: lea rax, [rip + 0x17bef87]
0x145845909: mov qword ptr [rbp - 0x18], rax
0x14584590d: mov qword ptr [rbp - 0x10], 1
0x145845915: lea rax, [rbp - 0x38]
0x145845919: mov qword ptr [rbp - 8], rax
0x14584591d: lea rax, [rip + 0x17bef4c]
0x145845924: mov qword ptr [rbp], rax
0x145845928: mov qword ptr [rsp + 0x20], 1
0x145845931: lea r9, [rbp - 0x18]
0x145845935: mov rcx, rsi
0x145845938: mov rdx, rdi
0x14584593b: call 0x1458e0370
0x145845940: nop
0x145845941: jmp 0x145845c9a
0x145845946: lea rdi, [rip + 0x17bf426]
0x14584594d: mov ebx, 0x3a
0x145845952: mov edx, 0x3a
0x145845957: mov rcx, rdi
0x14584595a: call 0x1458dff90
0x14584595f: nop
0x145845960: mov r8, rdx
0x145845963: test rax, rax
0x145845966: cmovne rdi, rax
0x14584596a: cmove r8, rbx
0x14584596e: lea rax, [rip + 0x17bef1b]
0x145845975: mov qword ptr [rbp - 0x18], rax
0x145845979: mov qword ptr [rbp - 0x10], 1
0x145845981: lea rax, [rbp - 0x38]
0x145845985: mov qword ptr [rbp - 8], rax
0x145845989: lea rax, [rip + 0x17beee0]
0x145845990: mov qword ptr [rbp], rax
0x145845994: mov qword ptr [rsp + 0x20], 1
0x14584599d: lea r9, [rbp - 0x18]
0x1458459a1: mov rcx, rsi
0x1458459a4: mov rdx, rdi
0x1458459a7: call 0x1458e0370
0x1458459ac: nop
0x1458459ad: jmp 0x145845c9a
0x1458459b2: lea rdi, [rip + 0x17bf3f4]
0x1458459b9: mov ebx, 0x3d
0x1458459be: mov edx, 0x3d
0x1458459c3: mov rcx, rdi
0x1458459c6: call 0x1458dff90
0x1458459cb: nop
0x1458459cc: mov r8, rdx
0x1458459cf: test rax, rax
0x1458459d2: cmovne rdi, rax
0x1458459d6: cmove r8, rbx
0x1458459da: lea rax, [rip + 0x17beeaf]
0x1458459e1: mov qword ptr [rbp - 0x18], rax
0x1458459e5: mov qword ptr [rbp - 0x10], 1
0x1458459ed: lea rax, [rbp - 0x38]
0x1458459f1: mov qword ptr [rbp - 8], rax
0x1458459f5: lea rax, [rip + 0x17bee74]
0x1458459fc: mov qword ptr [rbp], rax
0x145845a00: mov qword ptr [rsp + 0x20], 1
0x145845a09: lea r9, [rbp - 0x18]
0x145845a0d: mov rcx, rsi
0x145845a10: mov rdx, rdi
0x145845a13: call 0x1458e0370
0x145845a18: nop
0x145845a19: jmp 0x145845c9a
0x145845a1e: lea rdi, [rip + 0x17bf2df]
0x145845a25: mov edx, 0x47
0x145845a2a: mov rcx, rdi
0x145845a2d: call 0x1458dff90
0x145845a32: nop
0x145845a33: mov r14, rax
0x145845a36: mov rbx, rdx
0x145845a39: mulss xmm6, xmm9
0x145845a3e: movaps xmm0, xmm6
0x145845a41: call 0x145d1463d
0x145845a46: movaps xmm6, xmm0
0x145845a49: divss xmm6, xmm9
0x145845a4e: movss dword ptr [rbp - 0x1c], xmm6
0x145845a53: movaps xmm0, xmm6
0x145845a56: call 0x145d14661
0x145845a5b: subss xmm6, xmm0
0x145845a5f: xorps xmm0, xmm0
0x145845a62: lea rax, [rbp - 0x1c]
0x145845a66: ucomiss xmm6, xmm0
0x145845a69: jne 0x145845c0c
0x145845a6f: jp 0x145845c0c
0x145845a75: mov qword ptr [rbp - 0x18], rax
0x145845a79: lea rax, [rip + 0x4b2680]
0x145845a80: mov qword ptr [rbp - 0x10], rax
0x145845a84: lea rdx, [rip + 0x1af423d]
0x145845a8b: lea rcx, [rbp - 0x50]
0x145845a8f: lea r8, [rbp - 0x18]
0x145845a93: call 0x145ce7350
0x145845a98: nop
0x145845a99: jmp 0x145845c30
0x145845a9e: mov qword ptr [rbp - 0x18], rax
0x145845aa2: lea rax, [rip + 0x4b2657]
0x145845aa9: mov qword ptr [rbp - 0x10], rax
0x145845aad: lea rdx, [rip + 0x1af420c]
0x145845ab4: lea rcx, [rbp - 0x50]
0x145845ab8: lea r8, [rbp - 0x18]
0x145845abc: call 0x145ce7350
0x145845ac1: nop
0x145845ac2: test r14, r14
0x145845ac5: mov eax, 0x4e
0x145845aca: cmove rbx, rax
0x145845ace: cmovne rdi, r14
0x145845ad2: lea rax, [rip + 0x17beeb1]
0x145845ad9: mov qword ptr [rbp - 0x18], rax
0x145845add: mov qword ptr [rbp - 0x10], 1
0x145845ae5: lea rax, [rbp - 0x50]
0x145845ae9: mov qword ptr [rbp - 8], rax
0x145845aed: lea rax, [rip + 0x17bed7c]
0x145845af4: mov qword ptr [rbp], rax
0x145845af8: mov qword ptr [rsp + 0x20], 1
0x145845b01: lea r9, [rbp - 0x18]
0x145845b05: mov rcx, rsi
0x145845b08: mov rdx, rdi
0x145845b0b: mov r8, rbx
0x145845b0e: call 0x1458e0370
0x145845b13: nop
0x145845b14: jmp 0x145845c82
0x145845b19: mov qword ptr [rbp - 0x18], rax
0x145845b1d: lea rax, [rip + 0x4b25dc]
0x145845b24: mov qword ptr [rbp - 0x10], rax
0x145845b28: lea rdx, [rip + 0x1af4191]
0x145845b2f: lea rcx, [rbp - 0x50]
0x145845b33: lea r8, [rbp - 0x18]
0x145845b37: call 0x145ce7350
0x145845b3c: nop
0x145845b3d: test r14, r14
0x145845b40: mov eax, 0x28
0x145845b45: cmove rbx, rax
0x145845b49: cmovne rdi, r14
0x145845b4d: lea rax, [rip + 0x17bee36]
0x145845b54: mov qword ptr [rbp - 0x18], rax
0x145845b58: mov qword ptr [rbp - 0x10], 1
0x145845b60: lea rax, [rbp - 0x50]
0x145845b64: mov qword ptr [rbp - 8], rax
0x145845b68: lea rax, [rip + 0x17bed01]
0x145845b6f: mov qword ptr [rbp], rax
0x145845b73: mov qword ptr [rsp + 0x20], 1
0x145845b7c: lea r9, [rbp - 0x18]
0x145845b80: mov rcx, rsi
0x145845b83: mov rdx, rdi
0x145845b86: mov r8, rbx
0x145845b89: call 0x1458e0370
0x145845b8e: nop
0x145845b8f: jmp 0x145845c82
0x145845b94: mov qword ptr [rbp - 0x18], rax
0x145845b98: lea rax, [rip + 0x4b2561]
0x145845b9f: mov qword ptr [rbp - 0x10], rax
0x145845ba3: lea rdx, [rip + 0x1af4116]
0x145845baa: lea rcx, [rbp - 0x50]
0x145845bae: lea r8, [rbp - 0x18]
0x145845bb2: call 0x145ce7350
0x145845bb7: nop
0x145845bb8: test r14, r14
0x145845bbb: mov eax, 0x1f
0x145845bc0: cmove rbx, rax
0x145845bc4: cmovne rdi, r14
0x145845bc8: lea rax, [rip + 0x17bedbb]
0x145845bcf: mov qword ptr [rbp - 0x18], rax
0x145845bd3: mov qword ptr [rbp - 0x10], 1
0x145845bdb: lea rax, [rbp - 0x50]
0x145845bdf: mov qword ptr [rbp - 8], rax
0x145845be3: lea rax, [rip + 0x17bec86]
0x145845bea: mov qword ptr [rbp], rax
0x145845bee: mov qword ptr [rsp + 0x20], 1
0x145845bf7: lea r9, [rbp - 0x18]
0x145845bfb: mov rcx, rsi
0x145845bfe: mov rdx, rdi
0x145845c01: mov r8, rbx
0x145845c04: call 0x1458e0370
0x145845c09: nop
0x145845c0a: jmp 0x145845c82
0x145845c0c: mov qword ptr [rbp - 0x18], rax
0x145845c10: lea rax, [rip + 0x4b24e9]
0x145845c17: mov qword ptr [rbp - 0x10], rax
0x145845c1b: lea rdx, [rip + 0x1af409e]
0x145845c22: lea rcx, [rbp - 0x50]
0x145845c26: lea r8, [rbp - 0x18]
0x145845c2a: call 0x145ce7350
0x145845c2f: nop
0x145845c30: test r14, r14
0x145845c33: mov eax, 0x47
0x145845c38: cmove rbx, rax
0x145845c3c: cmovne rdi, r14
0x145845c40: lea rax, [rip + 0x17bed43]
0x145845c47: mov qword ptr [rbp - 0x18], rax
0x145845c4b: mov qword ptr [rbp - 0x10], 1
0x145845c53: lea rax, [rbp - 0x50]
0x145845c57: mov qword ptr [rbp - 8], rax
0x145845c5b: lea rax, [rip + 0x17bec0e]
0x145845c62: mov qword ptr [rbp], rax
0x145845c66: mov qword ptr [rsp + 0x20], 1
0x145845c6f: lea r9, [rbp - 0x18]
0x145845c73: mov rcx, rsi
0x145845c76: mov rdx, rdi
0x145845c79: mov r8, rbx
0x145845c7c: call 0x1458e0370
0x145845c81: nop
0x145845c82: mov rdx, qword ptr [rbp - 0x50]
0x145845c86: test rdx, rdx
0x145845c89: je 0x145845c9a
0x145845c8b: mov rcx, qword ptr [rbp - 0x48]
0x145845c8f: mov r8d, 1
0x145845c95: call 0x1400021d0
0x145845c9a: mov rdx, qword ptr [rbp - 0x38]
0x145845c9e: test rdx, rdx
0x145845ca1: je 0x145845cb2
0x145845ca3: mov rcx, qword ptr [rbp - 0x30]
0x145845ca7: mov r8d, 1
0x145845cad: call 0x1400021d0
0x145845cb2: mov rax, rsi
0x145845cb5: movaps xmm6, xmmword ptr [rbp + 0x10]
0x145845cb9: movaps xmm7, xmmword ptr [rbp + 0x20]
0x145845cbd: movaps xmm8, xmmword ptr [rbp + 0x30]
0x145845cc2: movaps xmm9, xmmword ptr [rbp + 0x40]
0x145845cc7: add rsp, 0xd0
0x145845cce: pop rbx
0x145845ccf: pop rdi
0x145845cd0: pop rsi
0x145845cd1: pop r14
0x145845cd3: pop rbp
0x145845cd4: ret
