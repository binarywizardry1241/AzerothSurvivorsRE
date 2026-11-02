14595b8f7: 448b01 mov r8d, dword ptr [rcx]
14595b8fa: 448b6104 mov r12d, dword ptr [rcx + 4]
14595b8fe: f3440f106908 movss xmm13, dword ptr [rcx + 8]
14595b904: f30f10590c movss xmm3, dword ptr [rcx + 0xc]
14595b909: f30f107110 movss xmm6, dword ptr [rcx + 0x10]
14595b90e: 8b7914 mov edi, dword ptr [rcx + 0x14]
14595b911: f3440f597118 mulss xmm14, dword ptr [rcx + 0x18]
14595b917: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
14595b920: 4889f1 mov rcx, rsi
14595b923: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595b92a: 448985b8000000 mov dword ptr [rbp + 0xb8], r8d
14595b931: f30f119d0c010000 movss dword ptr [rbp + 0x10c], xmm3
14595b939: e8b2beffff call 0x1459577f0
14595b93e: 488d8ea0090000 lea rcx, [rsi + 0x9a0]
14595b945: f30f1015f3174700 movss xmm2, dword ptr [rip + 0x4717f3]
14595b94d: 0f57c9 xorps xmm1, xmm1
14595b950: e82b57f9ff call 0x1458f1080
14595b955: 0f28f8 movaps xmm7, xmm0
14595b958: e8c0e72900 call 0x145bfa11d
14595b95d: 440f28c8 movaps xmm9, xmm0
14595b961: f30f11bde0000000 movss dword ptr [rbp + 0xe0], xmm7
14595b969: 0f28c7 movaps xmm0, xmm7
14595b96c: e8a6e72900 call 0x145bfa117
14595b971: f34d0f2afc cvtsi2ss xmm15, r12
14595b976: f3440f583d45174700 addss xmm15, dword ptr [rip + 0x471745]
14595b97f: f3440f593d1c194400 mulss xmm15, dword ptr [rip + 0x44191c]
14595b988: 440f294d40 movaps xmmword ptr [rbp + 0x40], xmm9
14595b98d: 0f294550 movaps xmmword ptr [rbp + 0x50], xmm0
14595b991: 440f14c8 unpcklps xmm9, xmm0
14595b995: 0f283dd4df8c01 movaps xmm7, xmmword ptr [rip + 0x18cdfd4]
14595b99c: 410f59f9 mulps xmm7, xmm9
14595b9a0: 0f593db9684800 mulps xmm7, xmmword ptr [rip + 0x4868b9]
14595b9a7: 0f58bdd0000000 addps xmm7, xmmword ptr [rbp + 0xd0]
14595b9ae: f30f16c7 movshdup xmm0, xmm7
14595b9b2: 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
14595b9b6: f30f10051e174700 movss xmm0, dword ptr [rip + 0x47171e]
14595b9be: f30f11b5cc000000 movss dword ptr [rbp + 0xcc], xmm6
14595b9c6: f30f59c6 mulss xmm0, xmm6
14595b9ca: f30f5d05ae144700 minss xmm0, dword ptr [rip + 0x4714ae]
14595b9d2: f30f1185d0000000 movss dword ptr [rbp + 0xd0], xmm0
14595b9da: 83ff01 cmp edi, 1
14595b9dd: 83d700 adc edi, 0
14595b9e0: 89bdf0000000 mov dword ptr [rbp + 0xf0], edi
14595b9e6: 4183fc01 cmp r12d, 1
14595b9ea: 4489e0 mov eax, r12d
14595b9ed: 83d000 adc eax, 0
14595b9f0: 898550010000 mov dword ptr [rbp + 0x150], eax
14595b9f6: 450fc6c9e1 shufps xmm9, xmm9, 0xe1
14595b9fb: 31db xor ebx, ebx
14595b9fd: eb0e jmp 0x14595ba0d
14595b9ff: ffc3 inc ebx
14595ba01: 3b9df0000000 cmp ebx, dword ptr [rbp + 0xf0]
14595ba07: 0f846bbfffff je 0x145957978
14595ba0d: 89df mov edi, ebx
14595ba0f: 83e701 and edi, 1
14595ba12: 39bd50010000 cmp dword ptr [rbp + 0x150], edi
14595ba18: 76e5 jbe 0x14595b9ff
14595ba1a: 0f57f6 xorps xmm6, xmm6
14595ba1d: f30f2af7 cvtsi2ss xmm6, edi
14595ba21: f3410f5cf7 subss xmm6, xmm15
14595ba26: f3410f59f5 mulss xmm6, xmm13
14595ba2b: 0f284550 movaps xmm0, xmmword ptr [rbp + 0x50]
14595ba2f: f30f59c6 mulss xmm0, xmm6
14595ba33: 440f28df movaps xmm11, xmm7
14595ba37: f3440f5cd8 subss xmm11, xmm0
14595ba3c: f30f597540 mulss xmm6, dword ptr [rbp + 0x40]
14595ba41: f30f587560 addss xmm6, dword ptr [rbp + 0x60]
14595ba46: 448bb6380a0000 mov r14d, dword ptr [rsi + 0xa38]
14595ba4d: 41ffc6 inc r14d
14595ba50: 4489b6380a0000 mov dword ptr [rsi + 0xa38], r14d
14595ba57: f3440f1086340a0000 movss xmm8, dword ptr [rsi + 0xa34]
14595ba60: 4c8bbe98090000 mov r15, qword ptr [rsi + 0x998]
14595ba67: 498d4f10 lea rcx, [r15 + 0x10]
14595ba6b: 410f28cb movaps xmm1, xmm11
14595ba6f: 0f28d6 movaps xmm2, xmm6
14595ba72: e819b5f7ff call 0x1458d6f90
14595ba77: a801 test al, 1
14595ba79: 740f je 0x14595ba8a
14595ba7b: 440f28e0 movaps xmm12, xmm0
14595ba7f: f3440f10b578010000 movss xmm14, dword ptr [rbp + 0x178]
14595ba88: eb44 jmp 0x14595bace
14595ba8a: 49837f68ff cmp qword ptr [r15 + 0x68], -1
14595ba8f: f3440f10b578010000 movss xmm14, dword ptr [rbp + 0x178]
14595ba98: 742b je 0x14595bac5
14595ba9a: 498d5768 lea rdx, [r15 + 0x68]
14595ba9e: 488d8d10010000 lea rcx, [rbp + 0x110]
14595baa5: 410f28d3 movaps xmm2, xmm11
14595baa9: 0f28de movaps xmm3, xmm6
14595baac: e8cf06f8ff call 0x1458dc180
14595bab1: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
14595bab8: 750b jne 0x14595bac5
14595baba: f3440f10a51c010000 movss xmm12, dword ptr [rbp + 0x11c]
14595bac3: eb09 jmp 0x14595bace
14595bac5: f3450f10a7b8000000 movss xmm12, dword ptr [r15 + 0xb8]
14595bace: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
14595bad5: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
14595badc: 750c jne 0x14595baea
14595bade: 488d8e88050000 lea rcx, [rsi + 0x588]
14595bae5: e846f22900 call 0x145bfad30
14595baea: 89d8 mov eax, ebx
14595baec: f34c0f2ad0 cvtsi2ss xmm10, rax
14595baf1: f3440f5995cc000000 mulss xmm10, dword ptr [rbp + 0xcc]
14595bafa: f3440f58950c010000 addss xmm10, dword ptr [rbp + 0x10c]
14595bb03: 4c89f8 mov rax, r15
14595bb06: 48c1e007 shl rax, 7
14595bb0a: 498d4f01 lea rcx, [r15 + 1]
14595bb0e: 410f28c2 movaps xmm0, xmm10
14595bb12: f3410f58c0 addss xmm0, xmm8
14595bb17: 488b9690050000 mov rdx, qword ptr [rsi + 0x590]
14595bb1e: 48c7040200000000 mov qword ptr [rdx + rax], 0
14595bb26: c744021000000000 mov dword ptr [rdx + rax + 0x10], 0
14595bb2e: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
14595bb35: 4c89440220 mov qword ptr [rdx + rax + 0x20], r8
14595bb3a: 48c744022800000000 mov qword ptr [rdx + rax + 0x28], 0
14595bb43: 49b80200000000007042 movabs r8, 0x4270000000000002
14595bb4d: 4c89440230 mov qword ptr [rdx + rax + 0x30], r8
14595bb52: f3440f116c0238 movss dword ptr [rdx + rax + 0x38], xmm13
14595bb59: 448974023c mov dword ptr [rdx + rax + 0x3c], r14d
14595bb5e: f3440f115c0240 movss dword ptr [rdx + rax + 0x40], xmm11
14595bb65: f30f11740244 movss dword ptr [rdx + rax + 0x44], xmm6
14595bb6b: f3440f11640248 movss dword ptr [rdx + rax + 0x48], xmm12
14595bb72: f30f108de0000000 movss xmm1, dword ptr [rbp + 0xe0]
14595bb7a: f30f114c024c movss dword ptr [rdx + rax + 0x4c], xmm1
14595bb80: f3440f11440250 movss dword ptr [rdx + rax + 0x50], xmm8
14595bb87: f30f11440254 movss dword ptr [rdx + rax + 0x54], xmm0
14595bb8d: c744025800000000 mov dword ptr [rdx + rax + 0x58], 0
14595bb95: 448b85b8000000 mov r8d, dword ptr [rbp + 0xb8]
14595bb9c: 448944025c mov dword ptr [rdx + rax + 0x5c], r8d
14595bba1: f3440f11740260 movss dword ptr [rdx + rax + 0x60], xmm14
14595bba8: c74402640000807f mov dword ptr [rdx + rax + 0x64], 0x7f800000
14595bbb0: 0f57c0 xorps xmm0, xmm0
14595bbb3: 0f11440268 movups xmmword ptr [rdx + rax + 0x68], xmm0
14595bbb8: 48c744027700000000 mov qword ptr [rdx + rax + 0x77], 0
14595bbc1: 48898e98050000 mov qword ptr [rsi + 0x598], rcx
14595bbc8: 85db test ebx, ebx
14595bbca: 741f je 0x14595bbeb
14595bbcc: 4983ffff cmp r15, -1
14595bbd0: 0f843f0f0000 je 0x14595cb15
14595bbd6: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595bbdd: f30f1085d0000000 movss xmm0, dword ptr [rbp + 0xd0]
14595bbe5: f30f11440164 movss dword ptr [rcx + rax + 0x64], xmm0
14595bbeb: ffc7 inc edi
14595bbed: 4489e0 mov eax, r12d
14595bbf0: 29f8 sub eax, edi
14595bbf2: b900000000 mov ecx, 0
14595bbf7: 0f42c1 cmovb eax, ecx
14595bbfa: eb2f jmp 0x14595bc2b
14595bbfc: 0f1f4000 nop dword ptr [rax]
14595bc00: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595bc07: f30f1085d0000000 movss xmm0, dword ptr [rbp + 0xd0]
14595bc0f: f30f11440164 movss dword ptr [rcx + rax + 0x64], xmm0
14595bc15: 4401ff add edi, r15d
14595bc18: ffc7 inc edi
14595bc1a: 4439e7 cmp edi, r12d
14595bc1d: 4489e0 mov eax, r12d
14595bc20: 0f47c7 cmova eax, edi
14595bc23: 83f801 cmp eax, 1
14595bc26: 83d000 adc eax, 0
14595bc29: 29f8 sub eax, edi
14595bc2b: 4189ff mov r15d, edi
14595bc2e: 4131df xor r15d, ebx
14595bc31: 4183e701 and r15d, 1
14595bc35: 4439f8 cmp eax, r15d
14595bc38: 0f86c1fdffff jbe 0x14595b9ff
14595bc3e: 418d043f lea eax, [r15 + rdi]
14595bc42: 0f57c0 xorps xmm0, xmm0
14595bc45: f3480f2ac0 cvtsi2ss xmm0, rax
14595bc4a: f3410f5cc7 subss xmm0, xmm15
14595bc4f: f3410f59c5 mulss xmm0, xmm13
14595bc54: f3440f12f0 movsldup xmm14, xmm0
14595bc59: 450f59f1 mulps xmm14, xmm9
14595bc5d: 0f28f7 movaps xmm6, xmm7
14595bc60: 410f5cf6 subps xmm6, xmm14
14595bc64: 440f58f7 addps xmm14, xmm7
14595bc68: 448bb6380a0000 mov r14d, dword ptr [rsi + 0xa38]
14595bc6f: 41ffc6 inc r14d
14595bc72: 4489b6380a0000 mov dword ptr [rsi + 0xa38], r14d
14595bc79: f3440f1086340a0000 movss xmm8, dword ptr [rsi + 0xa34]
14595bc82: 4c8bae98090000 mov r13, qword ptr [rsi + 0x998]
14595bc89: 498d4d10 lea rcx, [r13 + 0x10]
14595bc8d: f3450f16e6 movshdup xmm12, xmm14
14595bc92: 0f28ce movaps xmm1, xmm6
14595bc95: 410f28d4 movaps xmm2, xmm12
14595bc99: e8f2b2f7ff call 0x1458d6f90
14595bc9e: a801 test al, 1
14595bca0: 0f840a010000 je 0x14595bdb0
14595bca6: 440f28d8 movaps xmm11, xmm0
14595bcaa: 4c8bae98050000 mov r13, qword ptr [rsi + 0x598]
14595bcb1: 4c3bae88050000 cmp r13, qword ptr [rsi + 0x588]
14595bcb8: 750c jne 0x14595bcc6
14595bcba: 488d8e88050000 lea rcx, [rsi + 0x588]
14595bcc1: e86af02900 call 0x145bfad30
14595bcc6: 440fc6f601 shufps xmm14, xmm6, 1
14595bccb: 440fc6f6e2 shufps xmm14, xmm6, 0xe2
14595bcd0: 4c89e8 mov rax, r13
14595bcd3: 48c1e007 shl rax, 7
14595bcd7: 498d4d01 lea rcx, [r13 + 1]
14595bcdb: 410f28c2 movaps xmm0, xmm10
14595bcdf: f3410f58c0 addss xmm0, xmm8
14595bce4: 488b9690050000 mov rdx, qword ptr [rsi + 0x590]
14595bceb: 48c7040200000000 mov qword ptr [rdx + rax], 0
14595bcf3: c744021000000000 mov dword ptr [rdx + rax + 0x10], 0
14595bcfb: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
14595bd02: 4c89440220 mov qword ptr [rdx + rax + 0x20], r8
14595bd07: 48c744022800000000 mov qword ptr [rdx + rax + 0x28], 0
14595bd10: 49b80200000000007042 movabs r8, 0x4270000000000002
14595bd1a: 4c89440230 mov qword ptr [rdx + rax + 0x30], r8
14595bd1f: f3440f116c0238 movss dword ptr [rdx + rax + 0x38], xmm13
14595bd26: 448974023c mov dword ptr [rdx + rax + 0x3c], r14d
14595bd2b: 440f13740240 movlps qword ptr [rdx + rax + 0x40], xmm14
14595bd31: f3440f115c0248 movss dword ptr [rdx + rax + 0x48], xmm11
14595bd38: f30f108de0000000 movss xmm1, dword ptr [rbp + 0xe0]
14595bd40: f30f114c024c movss dword ptr [rdx + rax + 0x4c], xmm1
14595bd46: f3440f11440250 movss dword ptr [rdx + rax + 0x50], xmm8
14595bd4d: f30f11440254 movss dword ptr [rdx + rax + 0x54], xmm0
14595bd53: 48c744025800000000 mov qword ptr [rdx + rax + 0x58], 0
14595bd5c: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14595bd64: f30f11440260 movss dword ptr [rdx + rax + 0x60], xmm0
14595bd6a: c74402640000807f mov dword ptr [rdx + rax + 0x64], 0x7f800000
14595bd72: 0f57c0 xorps xmm0, xmm0
14595bd75: 0f11440268 movups xmmword ptr [rdx + rax + 0x68], xmm0
14595bd7a: 48c744027700000000 mov qword ptr [rdx + rax + 0x77], 0
14595bd83: 48898e98050000 mov qword ptr [rsi + 0x598], rcx
14595bd8a: 85db test ebx, ebx
14595bd8c: 0f8483feffff je 0x14595bc15
14595bd92: 4983fdff cmp r13, -1
14595bd96: 0f8564feffff jne 0x14595bc00
14595bd9c: e9740d0000 jmp 0x14595cb15
14595bda1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14595bdb0: 49837d68ff cmp qword ptr [r13 + 0x68], -1
14595bdb5: 7449 je 0x14595be00
14595bdb7: 498d5568 lea rdx, [r13 + 0x68]
14595bdbb: 488d8d10010000 lea rcx, [rbp + 0x110]
14595bdc2: 0f28d6 movaps xmm2, xmm6
14595bdc5: 410f28dc movaps xmm3, xmm12
14595bdc9: e8b203f8ff call 0x1458dc180
14595bdce: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
14595bdd5: 7529 jne 0x14595be00
14595bdd7: f3440f109d1c010000 movss xmm11, dword ptr [rbp + 0x11c]
14595bde0: 4c8bae98050000 mov r13, qword ptr [rsi + 0x598]
14595bde7: 4c3bae88050000 cmp r13, qword ptr [rsi + 0x588]
14595bdee: 0f84c6feffff je 0x14595bcba
14595bdf4: e9cdfeffff jmp 0x14595bcc6
14595bdf9: 0f1f8000000000 nop dword ptr [rax]
14595be00: f3450f109db8000000 movss xmm11, dword ptr [r13 + 0xb8]
14595be09: 4c8bae98050000 mov r13, qword ptr [rsi + 0x598]
14595be10: 4c3bae88050000 cmp r13, qword ptr [rsi + 0x588]
14595be17: 0f85a9feffff jne 0x14595bcc6
14595be1d: e998feffff jmp 0x14595bcba
14595be22: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
14595be29: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14595be30: 4839d1 cmp rcx, rdx
14595be33: 0f83df0e0000 jae 0x14595cd18
14595be39: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
14595be40: 48038e60050000 add rcx, qword ptr [rsi + 0x560]
14595be47: e8541bfbff call 0x14590d9a0
14595be4c: 4889c7 mov rdi, rax
14595be4f: 4889d3 mov rbx, rdx
14595be52: 4585ed test r13d, r13d
14595be55: 0f84ba040000 je 0x14595c315
14595be5b: 4183fd01 cmp r13d, 1
14595be5f: 0f85c4040000 jne 0x14595c329
14595be65: 4c8d356bee8c01 lea r14, [rip + 0x18cee6b]
14595be6c: 41bf28000000 mov r15d, 0x28
14595be72: ba28000000 mov edx, 0x28
14595be77: e9bf040000 jmp 0x14595c33b
