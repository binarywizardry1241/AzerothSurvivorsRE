0x145936cf0: push rbp
0x145936cf1: push r15
0x145936cf3: push r14
0x145936cf5: push r13
0x145936cf7: push r12
0x145936cf9: push rsi
0x145936cfa: push rdi
0x145936cfb: push rbx
0x145936cfc: sub rsp, 0x188
0x145936d03: lea rbp, [rsp + 0x80]
0x145936d0b: movaps xmmword ptr [rbp + 0xf0], xmm11
0x145936d13: movaps xmmword ptr [rbp + 0xe0], xmm10
0x145936d1b: movaps xmmword ptr [rbp + 0xd0], xmm9
0x145936d23: movaps xmmword ptr [rbp + 0xc0], xmm8
0x145936d2b: movaps xmmword ptr [rbp + 0xb0], xmm7
0x145936d32: movaps xmmword ptr [rbp + 0xa0], xmm6
0x145936d39: mov qword ptr [rbp + 0x98], 0xfffffffffffffffe
0x145936d44: mov qword ptr [rbp + 0x58], rcx
0x145936d48: mov rcx, qword ptr [rdx + 0xb8]
0x145936d4f: mov rax, qword ptr [rdx + 0xc0]
0x145936d56: mov qword ptr [rbp + 0x80], 0
0x145936d61: mov qword ptr [rbp + 0x88], 4
0x145936d6c: mov qword ptr [rbp + 0x90], 0
0x145936d77: mov r8, qword ptr [rdx + 0x340]
0x145936d7e: mov r9, qword ptr [rdx + 0x348]
0x145936d85: mov qword ptr [rbp + 0x60], r9
0x145936d89: imul r9, r9, 0x58
0x145936d8d: mov qword ptr [rbp + 0x50], r9
0x145936d91: add r9, r8
0x145936d94: mov qword ptr [rbp + 0x30], r9
0x145936d98: lea r9, [rdx + 0x420]
0x145936d9f: mov qword ptr [rbp + 0x38], r9
0x145936da3: lea rax, [rax + rax*2]
0x145936da7: shl rax, 5
0x145936dab: add rax, rcx
0x145936dae: mov qword ptr [rbp + 0x28], rax
0x145936db2: mov qword ptr [rbp + 0x40], rdx
0x145936db6: movss xmm6, dword ptr [rdx + 0x4b8]
0x145936dbe: mov eax, 1
0x145936dc3: mov qword ptr [rbp + 0x78], rax
0x145936dc7: mov qword ptr [rbp + 0x68], 0
0x145936dcf: mov rdi, qword ptr [rbp + 0x88]
0x145936dd6: movss xmm10, dword ptr [rip + 0x85df59]
0x145936ddf: movss xmm11, dword ptr [rip + 0x16d5b0c]
0x145936de8: movss xmm9, dword ptr [rip + 0x5a959b]
0x145936df1: xor r12d, r12d
0x145936df4: mov qword ptr [rbp + 0x70], 0
0x145936dfc: mov qword ptr [rbp + 0x48], r8
0x145936e00: mov rdx, r8
0x145936e03: jmp 0x145936e4e
0x145936e05: nop word ptr cs:[rax + rax]
0x145936e10: divss xmm8, xmm7
0x145936e15: lea rax, [r13*2]
0x145936e1d: add rax, r13
0x145936e20: mov dword ptr [rdi + rax*4], r14d
0x145936e24: movss dword ptr [rdi + rax*4 + 4], xmm8
0x145936e2b: mov byte ptr [rdi + rax*4 + 8], bl
0x145936e2f: inc r13
0x145936e32: mov qword ptr [rbp + 0x68], r13
0x145936e36: mov qword ptr [rbp + 0x90], r13
0x145936e3d: add r12, 0xc
0x145936e41: mov rdi, qword ptr [rbp + 0x88]
0x145936e48: mov rdx, r15
0x145936e4b: mov rcx, rsi
0x145936e4e: cmp qword ptr [rbp + 0x78], 2
0x145936e53: jne 0x145936e80
0x145936e55: mov r15, rdx
0x145936e58: cmp rcx, qword ptr [rbp + 0x28]
0x145936e5c: je 0x145936fb8
0x145936e62: lea rsi, [rcx + 0x60]
0x145936e66: mov eax, 2
0x145936e6b: mov qword ptr [rbp + 0x78], rax
0x145936e6f: mov r13, rcx
0x145936e72: jmp 0x145936ed0
0x145936e74: nop word ptr cs:[rax + rax]
0x145936e80: test rdx, rdx
0x145936e83: je 0x145936ea0
0x145936e85: cmp rdx, qword ptr [rbp + 0x30]
0x145936e89: je 0x145936ea0
0x145936e8b: lea r15, [rdx + 0x58]
0x145936e8f: mov eax, 1
0x145936e94: mov qword ptr [rbp + 0x78], rax
0x145936e98: mov rsi, rcx
0x145936e9b: mov r13, rdx
0x145936e9e: jmp 0x145936ed0
0x145936ea0: mov r15d, 0
0x145936ea6: cmp qword ptr [rbp + 0x70], 1
0x145936eab: je 0x145936e58
0x145936ead: mov eax, 1
0x145936eb2: mov qword ptr [rbp + 0x78], rax
0x145936eb6: xor r15d, r15d
0x145936eb9: mov qword ptr [rbp + 0x70], rax
0x145936ebd: mov rsi, rcx
0x145936ec0: mov r13, qword ptr [rbp + 0x38]
0x145936ec4: nop word ptr cs:[rax + rax]
0x145936ed0: mov rbx, qword ptr [r13]
0x145936ed4: mov r14d, dword ptr [rbx + 0x40]
0x145936ed8: mov ecx, r14d
0x145936edb: call 0x145985c80
0x145936ee0: mov rdx, r15
0x145936ee3: mov rcx, rsi
0x145936ee6: cmp eax, 1
0x145936ee9: jne 0x145936e4e
0x145936eef: movaps xmm7, xmm0
0x145936ef2: xor eax, eax
0x145936ef4: nop word ptr cs:[rax + rax]
0x145936f00: cmp r12, rax
0x145936f03: je 0x145936f20
0x145936f05: cmp dword ptr [rdi + rax], r14d
0x145936f09: lea rax, [rax + 0xc]
0x145936f0d: jne 0x145936f00
0x145936f0f: jmp 0x145936e48
0x145936f14: nop word ptr cs:[rax + rax]
0x145936f20: cmp byte ptr [rbx + 0x75], 8
0x145936f24: jne 0x145936f45
0x145936f26: movss xmm8, dword ptr [r13 + 0x1c]
0x145936f2c: mulss xmm8, dword ptr [r13 + 0x44]
0x145936f32: mulss xmm8, dword ptr [rbx + 0x4c]
0x145936f38: mulss xmm8, xmm6
0x145936f3d: ucomiss xmm10, xmm8
0x145936f41: jb 0x145936f62
0x145936f43: jmp 0x145936f83
0x145936f45: movss xmm8, dword ptr [r13 + 0x1c]
0x145936f4b: mulss xmm8, dword ptr [r13 + 0x44]
0x145936f51: mulss xmm8, dword ptr [rbx + 0x50]
0x145936f57: mulss xmm8, xmm6
0x145936f5c: ucomiss xmm10, xmm8
0x145936f60: jae 0x145936f83
0x145936f62: addss xmm8, xmm11
0x145936f67: divss xmm8, xmm9
0x145936f6c: movaps xmm0, xmm8
0x145936f70: call 0x145d1475d
0x145936f75: movaps xmm8, xmm0
0x145936f79: mulss xmm8, xmm9
0x145936f7e: addss xmm8, xmm10
0x145936f83: cmp byte ptr [rbx + 0x75], 8
0x145936f87: mov r14d, dword ptr [rbx + 0x40]
0x145936f8b: sete bl
0x145936f8e: mov r13, qword ptr [rbp + 0x68]
0x145936f92: cmp r13, qword ptr [rbp + 0x80]
0x145936f99: jne 0x145936e10
0x145936f9f: lea rcx, [rbp + 0x80]
0x145936fa6: call 0x145d40470
0x145936fab: nop
0x145936fac: mov rdi, qword ptr [rbp + 0x88]
0x145936fb3: jmp 0x145936e10
0x145936fb8: mov rdx, qword ptr [rbp + 0x40]
0x145936fbc: mov rax, qword ptr [rdx + 0xd0]
0x145936fc3: mov rcx, qword ptr [rdx + 0xd8]
0x145936fca: shl rcx, 7
0x145936fce: mov r10, qword ptr [rbp + 0x48]
0x145936fd2: mov r11, qword ptr [rbp + 0x50]
0x145936fd6: nop word ptr cs:[rax + rax]
0x145936fe0: test rcx, rcx
0x145936fe3: je 0x145937148
0x145936fe9: mov r8, qword ptr [rax + 0x18]
0x145936fed: sub rax, -0x80
0x145936ff1: add rcx, -0x80
0x145936ff5: cmp byte ptr [r8 + 0x39], 6
0x145936ffa: jne 0x145936fe0
0x145936ffc: lea rax, [rip + 0x19f9064]
0x145937003: mov qword ptr [rbp + 8], rax
0x145937007: mov qword ptr [rbp + 0x10], 8
0x14593700f: xor r9d, r9d
0x145937012: lea rax, [rip + 0x138d567]
0x145937019: movabs rcx, 0x657269666c6c6568
0x145937023: jmp 0x145937041
0x145937025: nop word ptr cs:[rax + rax]
0x145937030: add r9, 0x78
0x145937034: cmp r9, 0x34f8
0x14593703b: je 0x1459371a3
0x145937041: cmp qword ptr [r9 + rax + 8], 8
0x145937047: jne 0x145937030
0x145937049: mov r8, qword ptr [r9 + rax]
0x14593704d: cmp qword ptr [r8], rcx
0x145937050: jne 0x145937030
0x145937052: add rax, r9
0x145937055: movss xmm7, dword ptr [rip + 0x5a8e53]
0x14593705d: cmp qword ptr [rbp + 0x60], 0
0x145937062: je 0x145937095
0x145937064: xor r9d, r9d
0x145937067: jmp 0x145937079
0x145937069: nop dword ptr [rax]
0x145937070: add r9, 0x58
0x145937074: cmp r11, r9
0x145937077: je 0x145937095
0x145937079: mov rbx, qword ptr [r10 + r9]
0x14593707d: cmp qword ptr [rbx + 8], 8
0x145937082: jne 0x145937070
0x145937084: mov r8, qword ptr [rbx]
0x145937087: cmp qword ptr [r8], rcx
0x14593708a: jne 0x145937070
0x14593708c: movss xmm7, dword ptr [r10 + r9 + 0x1c]
0x145937093: jmp 0x145937098
0x145937095: mov rbx, rax
0x145937098: add rdx, 0x1c8
0x14593709f: lea rcx, [rbp - 0x58]
0x1459370a3: call 0x1458dde70
0x1459370a8: nop
0x1459370a9: lea rcx, [rbp + 8]
0x1459370ad: lea rdx, [rbp - 0x58]
0x1459370b1: mov r8, rbx
0x1459370b4: call 0x1458de0a0
0x1459370b9: nop
0x1459370ba: mulss xmm7, dword ptr [rbp + 0x14]
0x1459370bf: lea rcx, [rbp - 0x58]
0x1459370c3: call 0x145813660
0x1459370c8: mulss xmm7, dword ptr [rbx + 0x50]
0x1459370cd: mulss xmm6, xmm7
0x1459370d1: ucomiss xmm10, xmm6
0x1459370d5: jae 0x1459370fc
0x1459370d7: addss xmm6, dword ptr [rip + 0x16d5815]
0x1459370df: divss xmm6, xmm9
0x1459370e4: movaps xmm0, xmm6
0x1459370e7: call 0x145d1475d
0x1459370ec: movaps xmm6, xmm0
0x1459370ef: mulss xmm6, xmm9
0x1459370f4: addss xmm6, dword ptr [rip + 0x85dc3c]
0x1459370fc: mov rsi, qword ptr [rbp + 0x90]
0x145937103: cmp rsi, qword ptr [rbp + 0x80]
0x14593710a: jne 0x145937119
0x14593710c: lea rcx, [rbp + 0x80]
0x145937113: call 0x145d40470
0x145937118: nop
0x145937119: divss xmm6, dword ptr [rip + 0x5a926b]
0x145937121: mov rax, qword ptr [rbp + 0x88]
0x145937128: lea rcx, [rsi + rsi*2]
0x14593712c: mov dword ptr [rax + rcx*4], 0x2da3
0x145937133: movss dword ptr [rax + rcx*4 + 4], xmm6
0x145937139: mov byte ptr [rax + rcx*4 + 8], 0
0x14593713e: inc rsi
0x145937141: mov qword ptr [rbp + 0x90], rsi
0x145937148: mov rcx, qword ptr [rbp + 0x90]
0x14593714f: mov rax, qword ptr [rbp + 0x58]
0x145937153: mov qword ptr [rax + 0x10], rcx
0x145937157: movups xmm0, xmmword ptr [rbp + 0x80]
0x14593715e: movups xmmword ptr [rax], xmm0
0x145937161: movaps xmm6, xmmword ptr [rbp + 0xa0]
0x145937168: movaps xmm7, xmmword ptr [rbp + 0xb0]
0x14593716f: movaps xmm8, xmmword ptr [rbp + 0xc0]
0x145937177: movaps xmm9, xmmword ptr [rbp + 0xd0]
0x14593717f: movaps xmm10, xmmword ptr [rbp + 0xe0]
0x145937187: movaps xmm11, xmmword ptr [rbp + 0xf0]
0x14593718f: add rsp, 0x188
0x145937196: pop rbx
0x145937197: pop rdi
0x145937198: pop rsi
0x145937199: pop r12
0x14593719b: pop r13
0x14593719d: pop r14
0x14593719f: pop r15
0x1459371a1: pop rbp
0x1459371a2: ret
0x1459371a3: lea rax, [rbp + 8]
0x1459371a7: mov qword ptr [rbp - 0x58], rax
0x1459371ab: lea rax, [rip - 0x59350f2]
0x1459371b2: mov qword ptr [rbp - 0x50], rax
0x1459371b6: lea rcx, [rip + 0x138c5ab]
0x1459371bd: lea r8, [rip + 0x138c5b4]
0x1459371c4: lea rdx, [rbp - 0x58]
0x1459371c8: call 0x145eb7540
0x1459371cd: nop
0x1459371ce: ud2
