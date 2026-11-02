0x145820d40: push rbp
0x145820d41: push r15
0x145820d43: push r14
0x145820d45: push r13
0x145820d47: push r12
0x145820d49: push rsi
0x145820d4a: push rdi
0x145820d4b: push rbx
0x145820d4c: sub rsp, 0x108
0x145820d53: lea rbp, [rsp + 0x80]
0x145820d5b: mov qword ptr [rbp + 0x80], 0xfffffffffffffffe
0x145820d66: mov rsi, r8
0x145820d69: mov rdi, rdx
0x145820d6c: mov qword ptr [rbp - 0x58], rcx
0x145820d70: mov qword ptr [rbp + 0x50], 0
0x145820d78: mov qword ptr [rbp + 0x58], 1
0x145820d80: mov qword ptr [rbp + 0x60], 0
0x145820d88: mov byte ptr [rbp + 0x7f], 1
0x145820d8c: lea rcx, [rbp + 0x50]
0x145820d90: mov edx, esi
0x145820d92: call 0x145b79ed0
0x145820d97: nop
0x145820d98: lea rax, [rsi + rsi*2]
0x145820d9c: lea rbx, [rdi + rax*8]
0x145820da0: lea rsi, [rbp + 0x50]
0x145820da4: cmp rdi, rbx
0x145820da7: je 0x145820dce
0x145820da9: nop dword ptr [rax]
0x145820db0: mov rdx, qword ptr [rdi + 8]
0x145820db4: mov r8, qword ptr [rdi + 0x10]
0x145820db8: mov byte ptr [rbp + 0x7f], 1
0x145820dbc: mov rcx, rsi
0x145820dbf: call 0x145b79dd0
0x145820dc4: nop
0x145820dc5: add rdi, 0x18
0x145820dc9: cmp rdi, rbx
0x145820dcc: jne 0x145820db0
0x145820dce: mov byte ptr [rbp + 0x7f], 1
0x145820dd2: lea rcx, [rbp - 0x50]
0x145820dd6: mov edx, 1
0x145820ddb: xor r8d, r8d
0x145820dde: call 0x145ca87a0
0x145820de3: nop
0x145820de4: mov rsi, qword ptr [rbp - 0x50]
0x145820de8: call 0x140002200
0x145820ded: mov ecx, 0x8000
0x145820df2: mov edx, 1
0x145820df7: call 0x1400021c0
0x145820dfc: test rax, rax
0x145820dff: je 0x14582117e
0x145820e05: mov qword ptr [rbp + 0x28], 1
0x145820e0d: mov qword ptr [rbp + 0x30], 0
0x145820e15: movups xmm0, xmmword ptr [rbp - 0x48]
0x145820e19: movups xmmword ptr [rbp + 0x40], xmm0
0x145820e1d: xorps xmm0, xmm0
0x145820e20: movups xmmword ptr [rbp + 0x18], xmm0
0x145820e24: mov qword ptr [rbp + 8], 0x8000
0x145820e2c: mov qword ptr [rbp + 0x10], rax
0x145820e30: lea rbx, [rbp + 0x38]
0x145820e34: mov qword ptr [rbp + 0x38], rsi
0x145820e38: mov rax, qword ptr [rbp + 0x50]
0x145820e3c: mov qword ptr [rbp - 8], rax
0x145820e40: mov r15, qword ptr [rbp + 0x58]
0x145820e44: mov r14, qword ptr [rbp + 0x60]
0x145820e48: lea r12, [rbp + 8]
0x145820e4c: mov qword ptr [rbp], r15
0x145820e50: test r14, r14
0x145820e53: je 0x145821064
0x145820e59: nop dword ptr [rax]
0x145820e60: mov rdi, qword ptr [rbp + 0x18]
0x145820e64: test rdi, rdi
0x145820e67: je 0x145820f10
0x145820e6d: nop dword ptr [rax]
0x145820e70: mov rax, qword ptr [rbp + 0x20]
0x145820e74: cmp rax, -1
0x145820e78: je 0x14582100d
0x145820e7e: mov rsi, qword ptr [rbp + 0x10]
0x145820e82: mov rdx, qword ptr [rbp + 0x30]
0x145820e86: sub rax, rdx
0x145820e89: cmp rdi, rax
0x145820e8c: ja 0x145820ee6
0x145820e8e: add rdx, qword ptr [rbp + 0x28]
0x145820e92: mov rcx, rdx
0x145820e95: mov rdx, rsi
0x145820e98: mov r8, rdi
0x145820e9b: call 0x145d145fb
0x145820ea0: add qword ptr [rbp + 0x30], rdi
0x145820ea4: mov r8, qword ptr [rbp + 0x18]
0x145820ea8: mov rsi, r8
0x145820eab: sub rsi, rdi
0x145820eae: jb 0x14582101f
0x145820eb4: mov qword ptr [rbp + 0x18], 0
0x145820ebc: je 0x145820f10
0x145820ebe: mov rcx, qword ptr [rbp + 0x10]
0x145820ec2: add rdi, rcx
0x145820ec5: mov rdx, rdi
0x145820ec8: mov r8, rsi
0x145820ecb: call 0x145d14607
0x145820ed0: mov qword ptr [rbp + 0x18], rsi
0x145820ed4: mov rdi, rsi
0x145820ed7: mov rax, qword ptr [rbp + 0x20]
0x145820edb: cmp rax, -1
0x145820edf: jne 0x145820e7e
0x145820ee1: jmp 0x14582100d
0x145820ee6: mov qword ptr [rsp + 0x20], 1
0x145820eef: mov r9d, 1
0x145820ef5: lea rcx, [rbp + 0x20]
0x145820ef9: mov r8, rdi
0x145820efc: call 0x145d14a10
0x145820f01: nop
0x145820f02: mov rdx, qword ptr [rbp + 0x30]
0x145820f06: jmp 0x145820e8e
0x145820f08: nop dword ptr [rax + rax]
0x145820f10: mov rsi, qword ptr [rbp + 0x40]
0x145820f14: mov byte ptr [rsp + 0x20], 0
0x145820f19: mov rcx, rbx
0x145820f1c: mov rdx, r15
0x145820f1f: mov r8, r14
0x145820f22: mov r9, r12
0x145820f25: call 0x145ca87f0
0x145820f2a: nop
0x145820f2b: mov r13d, eax
0x145820f2e: cmp al, 0xff
0x145820f30: mov byte ptr [rbp + 0x70], al
0x145820f33: je 0x145820f70
0x145820f35: mov rcx, qword ptr [rbp + 0x40]
0x145820f39: cmp r13b, 2
0x145820f3d: je 0x145820f48
0x145820f3f: cmp rcx, rsi
0x145820f42: je 0x145820e60
0x145820f48: sub rcx, rsi
0x145820f4b: je 0x145821036
0x145820f51: mov rax, r14
0x145820f54: sub rax, rcx
0x145820f57: jb 0x145821156
0x145820f5d: add r15, rcx
0x145820f60: mov r14, rax
0x145820f63: jmp 0x145820e50
0x145820f68: nop dword ptr [rax + rax]
0x145820f70: mov r8d, 0x16
0x145820f76: mov cl, 0x14
0x145820f78: lea rdx, [rip + 0x14a9a01]
0x145820f7f: call 0x145cb8110
0x145820f84: nop
0x145820f85: mov rdi, rax
0x145820f88: and eax, 3
0x145820f8b: lea rcx, [rip + 0x14aa22e]
0x145820f92: movsxd rax, dword ptr [rcx + rax*4]
0x145820f96: add rax, rcx
0x145820f99: jmp rax
0x145820f9b: cmp byte ptr [rdi + 0x10], 0x23
0x145820f9f: je 0x145820e50
0x145820fa5: jmp 0x14582103d
0x145820faa: mov qword ptr [rbp + 0x68], rdi
0x145820fae: call 0x145ceffa0
0x145820fb3: nop
0x145820fb4: mov rcx, rdi
0x145820fb7: shr rcx, 0x20
0x145820fbb: mov rax, qword ptr [rax + 0x10]
0x145820fbf: mov qword ptr [rbp + 0x68], rdi
0x145820fc3: call rax
0x145820fc5: nop
0x145820fc6: test al, al
0x145820fc8: jne 0x145820e50
0x145820fce: jmp 0x14582103d
0x145820fd0: mov rax, rdi
0x145820fd3: shr rax, 0x20
0x145820fd7: cmp rax, 0x2b
0x145820fdb: mov ecx, 0xff
0x145820fe0: cmovae eax, ecx
0x145820fe3: cmp al, 0x23
0x145820fe5: je 0x145820e50
0x145820feb: jmp 0x14582103d
0x145820fed: cmp byte ptr [rdi + 0x1f], 0x23
0x145820ff1: jne 0x14582103d
0x145820ff3: dec rdi
0x145820ff6: mov qword ptr [rbp - 0x48], rdi
0x145820ffa: mov byte ptr [rbp - 0x50], 3
0x145820ffe: lea rcx, [rbp - 0x48]
0x145821002: call 0x145cf9ce0
0x145821007: nop
0x145821008: jmp 0x145820e50
0x14582100d: lea rcx, [rip + 0x14a9b2c]
0x145821014: call 0x145eb72c0
0x145821019: nop
0x14582101a: jmp 0x145821192
0x14582101f: lea r9, [rip + 0x1b18d1a]
0x145821026: xor ecx, ecx
0x145821028: mov rdx, rdi
0x14582102b: call 0x145eb7570
0x145821030: nop
0x145821031: jmp 0x145821192
0x145821036: lea rdi, [rip + 0x14a9d3b]
0x14582103d: mov eax, edi
0x14582103f: and eax, 3
0x145821042: lea ecx, [rax - 2]
0x145821045: cmp ecx, 2
0x145821048: jb 0x145821064
0x14582104a: test rax, rax
0x14582104d: je 0x145821064
0x14582104f: dec rdi
0x145821052: lea rcx, [rbp - 0x48]
0x145821056: mov qword ptr [rbp - 0x48], rdi
0x14582105a: mov byte ptr [rbp - 0x50], 3
0x14582105e: call 0x145cf9ce0
0x145821063: nop
0x145821064: mov rdx, qword ptr [rbp - 8]
0x145821068: test rdx, rdx
0x14582106b: je 0x14582107c
0x14582106d: mov r8d, 1
0x145821073: mov rcx, qword ptr [rbp]
0x145821077: call 0x1400021d0
0x14582107c: mov rax, qword ptr [rbp + 0x48]
0x145821080: mov qword ptr [rbp - 0x10], rax
0x145821084: movups xmm0, xmmword ptr [rbp + 8]
0x145821088: movups xmm1, xmmword ptr [rbp + 0x18]
0x14582108c: movups xmm2, xmmword ptr [rbp + 0x28]
0x145821090: movups xmm3, xmmword ptr [rbp + 0x38]
0x145821094: movaps xmmword ptr [rbp - 0x20], xmm3
0x145821098: movaps xmmword ptr [rbp - 0x30], xmm2
0x14582109c: movaps xmmword ptr [rbp - 0x40], xmm1
0x1458210a0: movaps xmmword ptr [rbp - 0x50], xmm0
0x1458210a4: lea rcx, [rbp - 0x50]
0x1458210a8: call 0x14581d670
0x1458210ad: nop
0x1458210ae: mov rdi, rax
0x1458210b1: test rax, rax
0x1458210b4: je 0x1458210bf
0x1458210b6: mov rsi, 0xffffffffffffffff
0x1458210bd: jmp 0x1458210dd
0x1458210bf: mov rsi, qword ptr [rbp - 0x38]
0x1458210c3: mov qword ptr [rbp - 0x38], 0xffffffffffffffff
0x1458210cb: cmp rsi, -1
0x1458210cf: je 0x14582116f
0x1458210d5: mov rdi, qword ptr [rbp - 0x30]
0x1458210d9: mov rbx, qword ptr [rbp - 0x28]
0x1458210dd: mov byte ptr [rbp + 0x7e], 0
0x1458210e1: lea rcx, [rbp - 0x50]
0x1458210e5: call 0x145811420
0x1458210ea: nop
0x1458210eb: cmp rsi, -1
0x1458210ef: jne 0x145821125
0x1458210f1: mov eax, edi
0x1458210f3: and eax, 3
0x1458210f6: lea ecx, [rax - 2]
0x1458210f9: cmp ecx, 2
0x1458210fc: jb 0x14582111c
0x1458210fe: test rax, rax
0x145821101: je 0x14582111c
0x145821103: dec rdi
0x145821106: lea rcx, [rbp - 0x48]
0x14582110a: mov qword ptr [rbp - 0x48], rdi
0x14582110e: mov byte ptr [rbp - 0x50], 3
0x145821112: mov byte ptr [rbp + 0x7e], 0
0x145821116: call 0x145cf9ce0
0x14582111b: nop
0x14582111c: mov edi, 1
0x145821121: xor esi, esi
0x145821123: xor ebx, ebx
0x145821125: mov rax, qword ptr [rbp - 0x58]
0x145821129: mov qword ptr [rax + 8], rsi
0x14582112d: mov qword ptr [rax + 0x10], rdi
0x145821131: mov qword ptr [rax + 0x18], rbx
0x145821135: movabs rcx, 0x8000000000000012
0x14582113f: mov qword ptr [rax], rcx
0x145821142: add rsp, 0x108
0x145821149: pop rbx
0x14582114a: pop rdi
0x14582114b: pop rsi
0x14582114c: pop r12
0x14582114e: pop r13
0x145821150: pop r14
0x145821152: pop r15
0x145821154: pop rbp
0x145821155: ret
0x145821156: mov qword ptr [rbp + 0x68], rcx
0x14582115a: lea r9, [rip + 0x14a9c7f]
0x145821161: mov rdx, r14
0x145821164: mov r8, r14
0x145821167: call 0x145eb7570
0x14582116c: nop
0x14582116d: jmp 0x145821192
0x14582116f: lea rcx, [rip + 0x14a9982]
0x145821176: call 0x145eb72c0
0x14582117b: nop
0x14582117c: jmp 0x145821192
0x14582117e: mov qword ptr [rbp + 0x70], rsi
0x145821182: mov ecx, 1
0x145821187: mov edx, 0x8000
0x14582118c: call 0x145eb6fcb
0x145821191: nop
0x145821192: ud2
