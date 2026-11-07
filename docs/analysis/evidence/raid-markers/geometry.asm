140166bf0: 55 push rbp
140166bf1: 4157 push r15
140166bf3: 4156 push r14
140166bf5: 4155 push r13
140166bf7: 4154 push r12
140166bf9: 56 push rsi
140166bfa: 57 push rdi
140166bfb: 53 push rbx
140166bfc: 4881eca8040000 sub rsp, 0x4a8
140166c03: 488dac2480000000 lea rbp, [rsp + 0x80]
140166c0b: 440f29bd10040000 movaps xmmword ptr [rbp + 0x410], xmm15
140166c13: 440f29b500040000 movaps xmmword ptr [rbp + 0x400], xmm14
140166c1b: 440f29adf0030000 movaps xmmword ptr [rbp + 0x3f0], xmm13
140166c23: 440f29a5e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm12
140166c2b: 440f299dd0030000 movaps xmmword ptr [rbp + 0x3d0], xmm11
140166c33: 440f2995c0030000 movaps xmmword ptr [rbp + 0x3c0], xmm10
140166c3b: 440f298db0030000 movaps xmmword ptr [rbp + 0x3b0], xmm9
140166c43: 440f2985a0030000 movaps xmmword ptr [rbp + 0x3a0], xmm8
140166c4b: 0f29bd90030000 movaps xmmword ptr [rbp + 0x390], xmm7
140166c52: 0f29b580030000 movaps xmmword ptr [rbp + 0x380], xmm6
140166c59: 48c78578030000feffffff mov qword ptr [rbp + 0x378], 0xfffffffffffffffe
140166c64: 488b8598040000 mov rax, qword ptr [rbp + 0x498]
140166c6b: 488b8d90040000 mov rcx, qword ptr [rbp + 0x490]
140166c72: 0f1002 movups xmm0, xmmword ptr [rdx]
140166c75: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
140166c79: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
140166c7d: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
140166c81: 410f1000 movups xmm0, xmmword ptr [r8]
140166c85: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
140166c8a: 0f294d00 movaps xmmword ptr [rbp], xmm1
140166c8e: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
140166c92: 410f1001 movups xmm0, xmmword ptr [r9]
140166c96: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
140166c9b: 0f294d20 movaps xmmword ptr [rbp + 0x20], xmm1
140166c9f: 0f294510 movaps xmmword ptr [rbp + 0x10], xmm0
140166ca3: 488b5110 mov rdx, qword ptr [rcx + 0x10]
140166ca7: 48895540 mov qword ptr [rbp + 0x40], rdx
140166cab: 0f1001 movups xmm0, xmmword ptr [rcx]
140166cae: 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
140166cb2: 0f1000 movups xmm0, xmmword ptr [rax]
140166cb5: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140166cb9: 0f114d58 movups xmmword ptr [rbp + 0x58], xmm1
140166cbd: 0f114548 movups xmmword ptr [rbp + 0x48], xmm0
140166cc1: 488b75f0 mov rsi, qword ptr [rbp - 0x10]
140166cc5: 488b4d48 mov rcx, qword ptr [rbp + 0x48]
140166cc9: 48837e1800 cmp qword ptr [rsi + 0x18], 0
140166cce: 0f8582050000 jne 0x140167256
140166cd4: 48898db8000000 mov qword ptr [rbp + 0xb8], rcx
140166cdb: 48c7457008000000 mov qword ptr [rbp + 0x70], 8
140166ce3: 48b80001020304050607 movabs rax, 0x706050403020100
140166ced: 48894578 mov qword ptr [rbp + 0x78], rax
140166cf1: 8b450c mov eax, dword ptr [rbp + 0xc]
140166cf4: 898510030000 mov dword ptr [rbp + 0x310], eax
140166cfa: 488b4500 mov rax, qword ptr [rbp]
140166cfe: 48898520030000 mov qword ptr [rbp + 0x320], rax
140166d05: 8b452c mov eax, dword ptr [rbp + 0x2c]
140166d08: 8985b0020000 mov dword ptr [rbp + 0x2b0], eax
140166d0e: 488b4520 mov rax, qword ptr [rbp + 0x20]
140166d12: 488985d0000000 mov qword ptr [rbp + 0xd0], rax
140166d19: 488b5d10 mov rbx, qword ptr [rbp + 0x10]
140166d1d: f30f103de3dfc605 movss xmm7, dword ptr [rip + 0x5c6dfe3]
140166d25: f2440f100502b8c705 movsd xmm8, qword ptr [rip + 0x5c7b802]
140166d2e: f3440f100d85e1c605 movss xmm9, dword ptr [rip + 0x5c6e185]
140166d37: 4c8dbde0000000 lea r15, [rbp + 0xe0]
140166d3e: 4c8dadc8020000 lea r13, [rbp + 0x2c8]
140166d45: 31c0 xor eax, eax
140166d47: 4889b590000000 mov qword ptr [rbp + 0x90], rsi
140166d4e: 48899dc0000000 mov qword ptr [rbp + 0xc0], rbx
140166d55: eb10 jmp 0x140166d67
140166d57: 660f1f840000000000 nop word ptr [rax + rax]
140166d60: 488b85f0020000 mov rax, qword ptr [rbp + 0x2f0]
140166d67: 4883f808 cmp rax, 8
140166d6b: 0f84de040000 je 0x14016724f
140166d71: 488d4801 lea rcx, [rax + 1]
140166d75: 48898df0020000 mov qword ptr [rbp + 0x2f0], rcx
140166d7c: 48894d68 mov qword ptr [rbp + 0x68], rcx
140166d80: 440fb6440578 movzx r8d, byte ptr [rbp + rax + 0x78]
140166d86: 8b8510030000 mov eax, dword ptr [rbp + 0x310]
140166d8c: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
140166d93: 8901 mov dword ptr [rcx], eax
140166d95: 8b85b0020000 mov eax, dword ptr [rbp + 0x2b0]
140166d9b: 488b8dd0000000 mov rcx, qword ptr [rbp + 0xd0]
140166da2: 8901 mov dword ptr [rcx], eax
140166da4: 4489c0 mov eax, r8d
140166da7: c1e002 shl eax, 2
140166daa: 488d0d8bddc705 lea rcx, [rip + 0x5c7dd8b]
140166db1: 8b0c08 mov ecx, dword ptr [rax + rcx]
140166db4: 488d15a1ddc705 lea rdx, [rip + 0x5c7dda1]
140166dbb: 8b0410 mov eax, dword ptr [rax + rdx]
140166dbe: 898dac020000 mov dword ptr [rbp + 0x2ac], ecx
140166dc4: 39c8 cmp eax, ecx
140166dc6: 0f42c8 cmovb ecx, eax
140166dc9: 0f57c0 xorps xmm0, xmm0
140166dcc: f30f2ac1 cvtsi2ss xmm0, ecx
140166dd0: 8985a8020000 mov dword ptr [rbp + 0x2a8], eax
140166dd6: 488d8dac020000 lea rcx, [rbp + 0x2ac]
140166ddd: 48898de0000000 mov qword ptr [rbp + 0xe0], rcx
140166de4: 488d8da8020000 lea rcx, [rbp + 0x2a8]
140166deb: 48898de8000000 mov qword ptr [rbp + 0xe8], rcx
140166df2: 488d8d4e030000 lea rcx, [rbp + 0x34e]
140166df9: 48898df0000000 mov qword ptr [rbp + 0xf0], rcx
140166e00: 488d8da8000000 lea rcx, [rbp + 0xa8]
140166e07: 48898df8000000 mov qword ptr [rbp + 0xf8], rcx
140166e0e: c7850001000000000000 mov dword ptr [rbp + 0x100], 0
140166e18: 898504010000 mov dword ptr [rbp + 0x104], eax
140166e1e: 448985b0000000 mov dword ptr [rbp + 0xb0], r8d
140166e25: 4488854e030000 mov byte ptr [rbp + 0x34e], r8b
140166e2c: 0f28cf movaps xmm1, xmm7
140166e2f: f30f5ec8 divss xmm1, xmm0
140166e33: f30f118da8000000 movss dword ptr [rbp + 0xa8], xmm1
140166e3b: c68520010000ff mov byte ptr [rbp + 0x120], 0xff
140166e42: c6853c010000ff mov byte ptr [rbp + 0x13c], 0xff
140166e49: 488d8d50030000 lea rcx, [rbp + 0x350]
140166e50: 4c89fa mov rdx, r15
140166e53: e808e4f3ff call 0x1400a5260
140166e58: 8b85ac020000 mov eax, dword ptr [rbp + 0x2ac]
140166e5e: 8985a4020000 mov dword ptr [rbp + 0x2a4], eax
140166e64: 8b85a8020000 mov eax, dword ptr [rbp + 0x2a8]
140166e6a: 8985a0020000 mov dword ptr [rbp + 0x2a0], eax
140166e70: 48c785f802000000000000 mov qword ptr [rbp + 0x2f8], 0
140166e7b: 48c7850003000001000000 mov qword ptr [rbp + 0x300], 1
140166e86: 48c7850803000000000000 mov qword ptr [rbp + 0x308], 0
140166e91: 31f6 xor esi, esi
140166e93: 41be01000000 mov r14d, 1
140166e99: 31ff xor edi, edi
140166e9b: eb2c jmp 0x140166ec9
140166e9d: 0f1f00 nop dword ptr [rax]
140166ea0: 488b85d0010000 mov rax, qword ptr [rbp + 0x1d0]
140166ea7: 48898560030000 mov qword ptr [rbp + 0x360], rax
140166eae: 0f1085c0010000 movups xmm0, xmmword ptr [rbp + 0x1c0]
140166eb5: 0f298550030000 movaps xmmword ptr [rbp + 0x350], xmm0
140166ebc: 899da4020000 mov dword ptr [rbp + 0x2a4], ebx
140166ec2: 4489a5a0020000 mov dword ptr [rbp + 0x2a0], r12d
140166ec9: 488b9d58030000 mov rbx, qword ptr [rbp + 0x358]
140166ed0: 488b8560030000 mov rax, qword ptr [rbp + 0x360]
140166ed7: 4c8d2483 lea r12, [rbx + rax*4]
140166edb: 4c39e3 cmp rbx, r12
140166ede: 0f849c000000 je 0x140166f80
140166ee4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140166ef0: f30f1033 movss xmm6, dword ptr [rbx]
140166ef4: 488b85f8020000 mov rax, qword ptr [rbp + 0x2f8]
140166efb: 4829f0 sub rax, rsi
140166efe: 4883f803 cmp rax, 3
140166f02: 7642 jbe 0x140166f46
140166f04: f3410f59f1 mulss xmm6, xmm9
140166f09: 0f28c6 movaps xmm0, xmm6
140166f0c: e8fa31a905 call 0x145bfa10b
140166f11: 0f57c9 xorps xmm1, xmm1
140166f14: f30f5fc8 maxss xmm1, xmm0
140166f18: 410f28c1 movaps xmm0, xmm9
140166f1c: f30f5dc1 minss xmm0, xmm1
140166f20: f30f2cc0 cvttss2si eax, xmm0
140166f24: c1e018 shl eax, 0x18
140166f27: 0dffffff00 or eax, 0xffffff
140166f2c: 41890436 mov dword ptr [r14 + rsi], eax
140166f30: 4883c604 add rsi, 4
140166f34: 4889b508030000 mov qword ptr [rbp + 0x308], rsi
140166f3b: 4883c304 add rbx, 4
140166f3f: 4c39e3 cmp rbx, r12
140166f42: 75ac jne 0x140166ef0
140166f44: eb3a jmp 0x140166f80
140166f46: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140166f4f: 41b804000000 mov r8d, 4
140166f55: 41b901000000 mov r9d, 1
140166f5b: 488d8df8020000 lea rcx, [rbp + 0x2f8]
140166f62: 4889f2 mov rdx, rsi
140166f65: e8063aa905 call 0x145bfa970
140166f6a: 90 nop
140166f6b: 4c8bb500030000 mov r14, qword ptr [rbp + 0x300]
140166f72: 488bb508030000 mov rsi, qword ptr [rbp + 0x308]
140166f79: eb89 jmp 0x140166f04
140166f7b: 0f1f440000 nop dword ptr [rax + rax]
140166f80: ffc7 inc edi
140166f82: 8b9da4020000 mov ebx, dword ptr [rbp + 0x2a4]
140166f88: 89d8 mov eax, ebx
140166f8a: 83f001 xor eax, 1
140166f8d: 448ba5a0020000 mov r12d, dword ptr [rbp + 0x2a0]
140166f94: 4489e1 mov ecx, r12d
140166f97: 83f101 xor ecx, 1
140166f9a: 09c1 or ecx, eax
140166f9c: 0f84be000000 je 0x140167060
140166fa2: d1eb shr ebx, 1
140166fa4: 83fb01 cmp ebx, 1
140166fa7: 83d300 adc ebx, 0
140166faa: 41d1ec shr r12d, 1
140166fad: 4183fc01 cmp r12d, 1
140166fb1: 4183d400 adc r12d, 0
140166fb5: 899da4000000 mov dword ptr [rbp + 0xa4], ebx
140166fbb: 488d8550030000 lea rax, [rbp + 0x350]
140166fc2: 488985c8020000 mov qword ptr [rbp + 0x2c8], rax
140166fc9: 488d85a0020000 lea rax, [rbp + 0x2a0]
140166fd0: 488985d0020000 mov qword ptr [rbp + 0x2d0], rax
140166fd7: 488d85a4020000 lea rax, [rbp + 0x2a4]
140166fde: 488985d8020000 mov qword ptr [rbp + 0x2d8], rax
140166fe5: c785e000000000000000 mov dword ptr [rbp + 0xe0], 0
140166fef: c785f000000000000000 mov dword ptr [rbp + 0xf0], 0
140166ff9: 488d85a4000000 lea rax, [rbp + 0xa4]
140167000: 48898500010000 mov qword ptr [rbp + 0x100], rax
140167007: c7850801000000000000 mov dword ptr [rbp + 0x108], 0
140167011: 4489a50c010000 mov dword ptr [rbp + 0x10c], r12d
140167018: 4c89ad10010000 mov qword ptr [rbp + 0x110], r13
14016701f: 488d8dc0010000 lea rcx, [rbp + 0x1c0]
140167026: 4c89fa mov rdx, r15
140167029: e8a2dff3ff call 0x1400a4fd0
14016702e: 90 nop
14016702f: 488b9550030000 mov rdx, qword ptr [rbp + 0x350]
140167036: 4885d2 test rdx, rdx
140167039: 0f8461feffff je 0x140166ea0
14016703f: 488b8d58030000 mov rcx, qword ptr [rbp + 0x358]
140167046: 48c1e202 shl rdx, 2
14016704a: 41b804000000 mov r8d, 4
140167050: e87bb1e9ff call 0x1400021d0
140167055: e946feffff jmp 0x140166ea0
14016705a: 660f1f440000 nop word ptr [rax + rax]
140167060: 8b85ac020000 mov eax, dword ptr [rbp + 0x2ac]
140167066: 8b8da8020000 mov ecx, dword ptr [rbp + 0x2a8]
14016706c: 0f1085f8020000 movups xmm0, xmmword ptr [rbp + 0x2f8]
140167073: 0f2985c0010000 movaps xmmword ptr [rbp + 0x1c0], xmm0
14016707a: 488b9508030000 mov rdx, qword ptr [rbp + 0x308]
140167081: 488995d0010000 mov qword ptr [rbp + 0x1d0], rdx
140167088: 48c785d8010000ffffffff mov qword ptr [rbp + 0x1d8], 0xffffffffffffffff
140167093: f2440f1185f0010000 movsd qword ptr [rbp + 0x1f0], xmm8
14016709c: 66c785f80100001000 mov word ptr [rbp + 0x1f8], 0x10
1401670a5: 48ba010101000000ffff movabs rdx, 0xffff000000010101
1401670af: 488995fa010000 mov qword ptr [rbp + 0x1fa], rdx
1401670b6: c7850802000002000000 mov dword ptr [rbp + 0x208], 2
1401670c0: 48c7855002000000000000 mov qword ptr [rbp + 0x250], 0
1401670cb: 898560020000 mov dword ptr [rbp + 0x260], eax
1401670d1: 898d64020000 mov dword ptr [rbp + 0x264], ecx
1401670d7: c7856802000001000000 mov dword ptr [rbp + 0x268], 1
1401670e1: 89bd6c020000 mov dword ptr [rbp + 0x26c], edi
1401670e7: c7857002000001000000 mov dword ptr [rbp + 0x270], 1
1401670f1: c7857402000001000000 mov dword ptr [rbp + 0x274], 1
1401670fb: c7857802000016000000 mov dword ptr [rbp + 0x278], 0x16
140167105: c7858402000007000000 mov dword ptr [rbp + 0x284], 7
14016710f: 48c7858802000004000000 mov qword ptr [rbp + 0x288], 4
14016711a: 48c7859002000000000000 mov qword ptr [rbp + 0x290], 0
140167125: 66c785980200000000 mov word ptr [rbp + 0x298], 0
14016712e: c6859a02000002 mov byte ptr [rbp + 0x29a], 2
140167135: 488b9550030000 mov rdx, qword ptr [rbp + 0x350]
14016713c: 4885d2 test rdx, rdx
14016713f: 7416 je 0x140167157
140167141: 488b8d58030000 mov rcx, qword ptr [rbp + 0x358]
140167148: 48c1e202 shl rdx, 2
14016714c: 41b804000000 mov r8d, 4
140167152: e879b0e9ff call 0x1400021d0
140167157: 488b9dc0000000 mov rbx, qword ptr [rbp + 0xc0]
14016715e: 488b4b50 mov rcx, qword ptr [rbx + 0x50]
140167162: 4883c110 add rcx, 0x10
140167166: c6857503000001 mov byte ptr [rbp + 0x375], 1
14016716d: e84ebb7f04 call 0x144962cc0
140167172: 90 nop
140167173: 89c6 mov esi, eax
140167175: 89d7 mov edi, edx
140167177: 41b8e0000000 mov r8d, 0xe0
14016717d: 4c89f9 mov rcx, r15
140167180: 488d95c0010000 lea rdx, [rbp + 0x1c0]
140167187: e85b2fa905 call 0x145bfa0e7
14016718c: c6857503000000 mov byte ptr [rbp + 0x375], 0
140167193: 4c897c2420 mov qword ptr [rsp + 0x20], r15
140167198: 4c89e9 mov rcx, r13
14016719b: 4889da mov rdx, rbx
14016719e: 4189f0 mov r8d, esi
1401671a1: 4189f9 mov r9d, edi
1401671a4: e887f5f8ff call 0x1400f6730
1401671a9: 90 nop
1401671aa: 83bdc802000002 cmp dword ptr [rbp + 0x2c8], 2
1401671b1: 0f856a210000 jne 0x140169321
1401671b7: 48c785e0000000ffffffff mov qword ptr [rbp + 0xe0], 0xffffffffffffffff
1401671c2: c6857503000000 mov byte ptr [rbp + 0x375], 0
1401671c9: 4c897c2420 mov qword ptr [rsp + 0x20], r15
1401671ce: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
1401671d7: 4889d9 mov rcx, rbx
1401671da: 89f2 mov edx, esi
1401671dc: 4189f8 mov r8d, edi
1401671df: 4531c9 xor r9d, r9d
1401671e2: e859e68004 call 0x144975840
1401671e7: 90 nop
1401671e8: 488985e8000000 mov qword ptr [rbp + 0xe8], rax
1401671ef: c685e000000000 mov byte ptr [rbp + 0xe0], 0
1401671f6: 488d8d30030000 lea rcx, [rbp + 0x330]
1401671fd: 488bb590000000 mov rsi, qword ptr [rbp + 0x90]
140167204: 4889f2 mov rdx, rsi
140167207: 448b85b0000000 mov r8d, dword ptr [rbp + 0xb0]
14016720e: 4d89f9 mov r9, r15
140167211: e83a81f5ff call 0x1400bf350
140167216: 0fb68530030000 movzx eax, byte ptr [rbp + 0x330]
14016721d: 3c02 cmp al, 2
14016721f: 0f843bfbffff je 0x140166d60
140167225: 84c0 test al, al
140167227: 0f8533fbffff jne 0x140166d60
14016722d: 488b8538030000 mov rax, qword ptr [rbp + 0x338]
140167234: f048ff08 lock dec qword ptr [rax]
140167238: 0f8522fbffff jne 0x140166d60
14016723e: 488d8d38030000 lea rcx, [rbp + 0x338]
140167245: e826df8104 call 0x144985170
14016724a: e911fbffff jmp 0x140166d60
14016724f: 488b8db8000000 mov rcx, qword ptr [rbp + 0xb8]
140167256: 488d4530 lea rax, [rbp + 0x30]
14016725a: f30f10415c movss xmm0, dword ptr [rcx + 0x5c]
14016725f: 488b4dd0 mov rcx, qword ptr [rbp - 0x30]
140167263: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
140167267: f30f5c411c subss xmm0, dword ptr [rcx + 0x1c]
14016726c: 0f57c9 xorps xmm1, xmm1
14016726f: f30f5fc8 maxss xmm1, xmm0
140167273: f30f1005555ec605 movss xmm0, dword ptr [rip + 0x5c65e55]
14016727b: f30f5dc1 minss xmm0, xmm1
14016727f: f30f584118 addss xmm0, dword ptr [rcx + 0x18]
140167284: f30f1185b8000000 movss dword ptr [rbp + 0xb8], xmm0
14016728c: 488985e0020000 mov qword ptr [rbp + 0x2e0], rax
140167293: 4889b5e8020000 mov qword ptr [rbp + 0x2e8], rsi
14016729a: 48c785c802000000000000 mov qword ptr [rbp + 0x2c8], 0
1401672a5: 48c785d002000004000000 mov qword ptr [rbp + 0x2d0], 4
1401672b0: 48c785d802000000000000 mov qword ptr [rbp + 0x2d8], 0
1401672bb: 8b45ec mov eax, dword ptr [rbp - 0x14]
1401672be: 8902 mov dword ptr [rdx], eax
1401672c0: 4c8b7108 mov r14, qword ptr [rcx + 8]
1401672c4: 488b4110 mov rax, qword ptr [rcx + 0x10]
1401672c8: 48c1e007 shl rax, 7
1401672cc: 4c01f0 add rax, r14
1401672cf: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
1401672d6: 4c8dbdc0010000 lea r15, [rbp + 0x1c0]
1401672dd: 4c8da5e0000000 lea r12, [rbp + 0xe0]
1401672e4: 4c8dadc8020000 lea r13, [rbp + 0x2c8]
1401672eb: eb1c jmp 0x140167309
1401672ed: 0f1f00 nop dword ptr [rax]
1401672f0: 4983ee80 sub r14, -0x80
1401672f4: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
1401672fb: 48894610 mov qword ptr [rsi + 0x10], rax
1401672ff: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
140167306: 0f1106 movups xmmword ptr [rsi], xmm0
140167309: 4c3bb5b0000000 cmp r14, qword ptr [rbp + 0xb0]
140167310: 0f84831f0000 je 0x140169299
140167316: 410fb6767d movzx esi, byte ptr [r14 + 0x7d]
14016731b: 4080fe01 cmp sil, 1
14016731f: 770b ja 0x14016732c
140167321: 41837e3000 cmp dword ptr [r14 + 0x30], 0
140167326: 0f84a50b0000 je 0x140167ed1
14016732c: c785f002000000000000 mov dword ptr [rbp + 0x2f0], 0
140167336: f3440f101d615fc305 movss xmm11, dword ptr [rip + 0x5c35f61]
14016733f: f3450f115e78 movss dword ptr [r14 + 0x78], xmm11
140167345: 498d7e60 lea rdi, [r14 + 0x60]
140167349: f3450f10766c movss xmm14, dword ptr [r14 + 0x6c]
14016734f: 41807e4000 cmp byte ptr [r14 + 0x40], 0
140167354: 744a je 0x1401673a0
140167356: f3410f104644 movss xmm0, dword ptr [r14 + 0x44]
14016735c: 410f2e4660 ucomiss xmm0, dword ptr [r14 + 0x60]
140167361: 753d jne 0x1401673a0
140167363: 7a3b jp 0x1401673a0
140167365: f3410f104648 movss xmm0, dword ptr [r14 + 0x48]
14016736b: 410f2e4664 ucomiss xmm0, dword ptr [r14 + 0x64]
140167370: 752e jne 0x1401673a0
140167372: 7a2c jp 0x1401673a0
140167374: f3410f10464c movss xmm0, dword ptr [r14 + 0x4c]
14016737a: 410f2e4668 ucomiss xmm0, dword ptr [r14 + 0x68]
14016737f: 751f jne 0x1401673a0
140167381: 7a1d jp 0x1401673a0
140167383: f3410f104650 movss xmm0, dword ptr [r14 + 0x50]
140167389: 410f2ec6 ucomiss xmm0, xmm14
14016738d: 7511 jne 0x1401673a0
14016738f: 0f8b92040000 jnp 0x140167827
140167395: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401673a0: 418b4654 mov eax, dword ptr [r14 + 0x54]
1401673a4: f3450f106658 movss xmm12, dword ptr [r14 + 0x58]
1401673aa: f3410f105e5c movss xmm3, dword ptr [r14 + 0x5c]
1401673b0: 8b4f08 mov ecx, dword ptr [rdi + 8]
1401673b3: 898d38030000 mov dword ptr [rbp + 0x338], ecx
1401673b9: 488b0f mov rcx, qword ptr [rdi]
1401673bc: 48898d30030000 mov qword ptr [rbp + 0x330], rcx
1401673c3: 48c7855003000000000000 mov qword ptr [rbp + 0x350], 0
1401673ce: 48c7855803000008000000 mov qword ptr [rbp + 0x358], 8
1401673d9: 48c7856003000000000000 mov qword ptr [rbp + 0x360], 0
1401673e4: 83f803 cmp eax, 3
1401673e7: 0f8543070000 jne 0x140167b30
1401673ed: 0f2e1d4cb1c705 ucomiss xmm3, dword ptr [rip + 0x5c7b14c]
1401673f4: 0f8236070000 jb 0x140167b30
1401673fa: 410f28f4 movaps xmm6, xmm12
1401673fe: f30f5935eaadc705 mulss xmm6, dword ptr [rip + 0x5c7adea]
140167406: f30f5d35ce5cc605 minss xmm6, dword ptr [rip + 0x5c65cce]
14016740e: 410f28c4 movaps xmm0, xmm12
140167412: 440f280d865cc605 movaps xmm9, xmmword ptr [rip + 0x5c65c86]
14016741a: 410f57c1 xorps xmm0, xmm9
14016741e: 410f28cc movaps xmm1, xmm12
140167422: f30f590d5a5ac605 mulss xmm1, dword ptr [rip + 0x5c65a5a]
14016742a: f30f580d9660c305 addss xmm1, dword ptr [rip + 0x5c36096]
140167432: f30f109530030000 movss xmm2, dword ptr [rbp + 0x330]
14016743a: f30f109d34030000 movss xmm3, dword ptr [rbp + 0x334]
140167442: 0f28e3 movaps xmm4, xmm3
140167445: 410f57e1 xorps xmm4, xmm9
140167449: f30f10ad38030000 movss xmm5, dword ptr [rbp + 0x338]
140167451: 0f28fa movaps xmm7, xmm2
140167454: 410f57f9 xorps xmm7, xmm9
140167458: 440f28c1 movaps xmm8, xmm1
14016745c: 450f57c1 xorps xmm8, xmm9
140167460: f30f11a5c0010000 movss dword ptr [rbp + 0x1c0], xmm4
140167468: f30f11adc4010000 movss dword ptr [rbp + 0x1c4], xmm5
140167470: f30f11bdc8010000 movss dword ptr [rbp + 0x1c8], xmm7
140167478: f20f102540aec705 movsd xmm4, qword ptr [rip + 0x5c7ae40]
140167480: f20f11a5cc010000 movsd qword ptr [rbp + 0x1cc], xmm4
140167488: f30f1185d4010000 movss dword ptr [rbp + 0x1d4], xmm0
140167490: f3440f11a5d8010000 movss dword ptr [rbp + 0x1d8], xmm12
140167499: f30f1185dc010000 movss dword ptr [rbp + 0x1dc], xmm0
1401674a1: f3440f11a5e0010000 movss dword ptr [rbp + 0x1e0], xmm12
1401674aa: f3440f1185e4010000 movss dword ptr [rbp + 0x1e4], xmm8
1401674b3: f30f118de8010000 movss dword ptr [rbp + 0x1e8], xmm1
1401674bb: f30f115c2430 movss dword ptr [rsp + 0x30], xmm3
1401674c1: f30f11542428 movss dword ptr [rsp + 0x28], xmm2
1401674c7: 4c897c2420 mov qword ptr [rsp + 0x20], r15
1401674cc: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
1401674d5: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
1401674de: 4c89e1 mov rcx, r12
1401674e1: 4c89ea mov rdx, r13
1401674e4: 4531c0 xor r8d, r8d
1401674e7: 4531c9 xor r9d, r9d
1401674ea: e8716afdff call 0x14013df60
1401674ef: 90 nop
1401674f0: 488b9d60030000 mov rbx, qword ptr [rbp + 0x360]
1401674f7: 483b9d50030000 cmp rbx, qword ptr [rbp + 0x350]
1401674fe: 750d jne 0x14016750d
140167500: 488d8d50030000 lea rcx, [rbp + 0x350]
140167507: e8b437a905 call 0x145bfacc0
14016750c: 90 nop
14016750d: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140167514: 488d0c5b lea rcx, [rbx + rbx*2]
140167518: 48c1e104 shl rcx, 4
14016751c: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
140167523: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
14016752a: 0f109500010000 movups xmm2, xmmword ptr [rbp + 0x100]
140167531: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
140167536: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14016753b: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14016753f: 48ffc3 inc rbx
140167542: 48899d60030000 mov qword ptr [rbp + 0x360], rbx
140167549: f30f11742440 movss dword ptr [rsp + 0x40], xmm6
14016754f: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
140167556: 488d8530030000 lea rax, [rbp + 0x330]
14016755d: 4889442420 mov qword ptr [rsp + 0x20], rax
140167562: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
14016756a: c744243000000000 mov dword ptr [rsp + 0x30], 0
140167572: 4c89e1 mov rcx, r12
140167575: 4c89ea mov rdx, r13
140167578: 41b001 mov r8b, 1
14016757b: 41b104 mov r9b, 4
14016757e: e80d63fdff call 0x14013d890
140167583: 90 nop
140167584: 488b9d60030000 mov rbx, qword ptr [rbp + 0x360]
14016758b: 483b9d50030000 cmp rbx, qword ptr [rbp + 0x350]
140167592: 750d jne 0x1401675a1
140167594: 488d8d50030000 lea rcx, [rbp + 0x350]
14016759b: e82037a905 call 0x145bfacc0
1401675a0: 90 nop
1401675a1: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401675a8: 488d0c5b lea rcx, [rbx + rbx*2]
1401675ac: 48c1e104 shl rcx, 4
1401675b0: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
1401675b7: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
1401675be: f30f6f9500010000 movdqu xmm2, xmmword ptr [rbp + 0x100]
1401675c6: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
1401675cc: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1401675d1: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1401675d5: 48ffc3 inc rbx
1401675d8: 48899d60030000 mov qword ptr [rbp + 0x360], rbx
1401675df: 4080fe01 cmp sil, 1
1401675e3: 0f8586010000 jne 0x14016776f
1401675e9: 488d8530030000 lea rax, [rbp + 0x330]
1401675f0: 4889442420 mov qword ptr [rsp + 0x20], rax
1401675f5: c74424409a99993e mov dword ptr [rsp + 0x40], 0x3e99999a
1401675fd: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
140167605: c744243000000000 mov dword ptr [rsp + 0x30], 0
14016760d: c7442428cccc2c3f mov dword ptr [rsp + 0x28], 0x3f2ccccc
140167615: 4c89e1 mov rcx, r12
140167618: 4c89ea mov rdx, r13
14016761b: 41b004 mov r8b, 4
14016761e: 41b104 mov r9b, 4
140167621: e86a62fdff call 0x14013d890
140167626: 90 nop
140167627: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
14016762e: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
140167635: 750d jne 0x140167644
140167637: 488d8d50030000 lea rcx, [rbp + 0x350]
14016763e: e87d36a905 call 0x145bfacc0
140167643: 90 nop
140167644: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
14016764b: 488d0c76 lea rcx, [rsi + rsi*2]
14016764f: 48c1e104 shl rcx, 4
140167653: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
14016765a: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
140167661: 0f109500010000 movups xmm2, xmmword ptr [rbp + 0x100]
140167668: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
14016766d: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140167672: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140167676: 48ffc6 inc rsi
140167679: 4889b560030000 mov qword ptr [rbp + 0x360], rsi
140167680: f30f108530030000 movss xmm0, dword ptr [rbp + 0x330]
140167688: f30f108d34030000 movss xmm1, dword ptr [rbp + 0x334]
140167690: 0f28d1 movaps xmm2, xmm1
140167693: 0f282d065ac605 movaps xmm5, xmmword ptr [rip + 0x5c65a06]
14016769a: 0f57d5 xorps xmm2, xmm5
14016769d: f30f109d38030000 movss xmm3, dword ptr [rbp + 0x338]
1401676a5: 0f28e0 movaps xmm4, xmm0
1401676a8: 0f57e5 xorps xmm4, xmm5
1401676ab: f30f1195c0010000 movss dword ptr [rbp + 0x1c0], xmm2
1401676b3: f30f119dc4010000 movss dword ptr [rbp + 0x1c4], xmm3
1401676bb: f30f11a5c8010000 movss dword ptr [rbp + 0x1c8], xmm4
1401676c3: 0f281596aec705 movaps xmm2, xmmword ptr [rip + 0x5c7ae96]
1401676ca: 0f1195cc010000 movups xmmword ptr [rbp + 0x1cc], xmm2
1401676d1: 0f281598aec705 movaps xmm2, xmmword ptr [rip + 0x5c7ae98]
1401676d8: 0f1195dc010000 movups xmmword ptr [rbp + 0x1dc], xmm2
1401676df: f30f114c2430 movss dword ptr [rsp + 0x30], xmm1
1401676e5: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
1401676eb: 4c897c2420 mov qword ptr [rsp + 0x20], r15
1401676f0: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
1401676f9: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
140167702: 4c89e1 mov rcx, r12
140167705: 4c89ea mov rdx, r13
140167708: 41b005 mov r8b, 5
14016770b: 41b101 mov r9b, 1
14016770e: e84d68fdff call 0x14013df60
140167713: 90 nop
140167714: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
14016771b: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
140167722: 750d jne 0x140167731
140167724: 488d8d50030000 lea rcx, [rbp + 0x350]
14016772b: e89035a905 call 0x145bfacc0
140167730: 90 nop
140167731: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140167738: 488d0c76 lea rcx, [rsi + rsi*2]
14016773c: 48c1e104 shl rcx, 4
140167740: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
140167747: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
14016774e: f30f6f9500010000 movdqu xmm2, xmmword ptr [rbp + 0x100]
140167756: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
14016775c: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140167761: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140167765: 48ffc6 inc rsi
140167768: 4889b560030000 mov qword ptr [rbp + 0x360], rsi
14016776f: 488b8560030000 mov rax, qword ptr [rbp + 0x360]
140167776: 488985f0000000 mov qword ptr [rbp + 0xf0], rax
14016777d: 0f108550030000 movups xmm0, xmmword ptr [rbp + 0x350]
140167784: 0f2985e0000000 movaps xmmword ptr [rbp + 0xe0], xmm0
14016778b: 498b7610 mov rsi, qword ptr [r14 + 0x10]
14016778f: 4885f6 test rsi, rsi
140167792: 743c je 0x1401677d0
140167794: 498b5e08 mov rbx, qword ptr [r14 + 8]
140167798: 4883c308 add rbx, 8
14016779c: eb0b jmp 0x1401677a9
14016779e: 6690 nop
1401677a0: 4883c330 add rbx, 0x30
1401677a4: 48ffce dec rsi
1401677a7: 7427 je 0x1401677d0
1401677a9: 488b43f8 mov rax, qword ptr [rbx - 8]
1401677ad: 4885c0 test rax, rax
1401677b0: 74ee je 0x1401677a0
1401677b2: 488b0b mov rcx, qword ptr [rbx]
1401677b5: 48c1e002 shl rax, 2
1401677b9: 488d14c0 lea rdx, [rax + rax*8]
1401677bd: 41b804000000 mov r8d, 4
1401677c3: e808aae9ff call 0x1400021d0
1401677c8: ebd6 jmp 0x1401677a0
1401677ca: 660f1f440000 nop word ptr [rax + rax]
1401677d0: 498b06 mov rax, qword ptr [r14]
1401677d3: 4885c0 test rax, rax
1401677d6: 7417 je 0x1401677ef
1401677d8: 498b4e08 mov rcx, qword ptr [r14 + 8]
1401677dc: 48c1e004 shl rax, 4
1401677e0: 488d1440 lea rdx, [rax + rax*2]
1401677e4: 41b808000000 mov r8d, 8
1401677ea: e8e1a9e9ff call 0x1400021d0
1401677ef: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
1401677f6: 49894610 mov qword ptr [r14 + 0x10], rax
1401677fa: 0f2885e0000000 movaps xmm0, xmmword ptr [rbp + 0xe0]
140167801: 410f1106 movups xmmword ptr [r14], xmm0
140167805: f3450f10766c movss xmm14, dword ptr [r14 + 0x6c]
14016780b: 41c7464001000000 mov dword ptr [r14 + 0x40], 1
140167813: 488b07 mov rax, qword ptr [rdi]
140167816: 49894644 mov qword ptr [r14 + 0x44], rax
14016781a: 8b4708 mov eax, dword ptr [rdi + 8]
14016781d: 4189464c mov dword ptr [r14 + 0x4c], eax
140167821: f3450f117650 movss dword ptr [r14 + 0x50], xmm14
140167827: 418b4654 mov eax, dword ptr [r14 + 0x54]
14016782b: f2450f104e58 movsd xmm9, qword ptr [r14 + 0x58]
140167831: 8b4f08 mov ecx, dword ptr [rdi + 8]
140167834: 898d38030000 mov dword ptr [rbp + 0x338], ecx
14016783a: 488b0f mov rcx, qword ptr [rdi]
14016783d: 48898d30030000 mov qword ptr [rbp + 0x330], rcx
140167844: 48c7855003000000000000 mov qword ptr [rbp + 0x350], 0
14016784f: 48c7855803000008000000 mov qword ptr [rbp + 0x358], 8
14016785a: 48c7856003000000000000 mov qword ptr [rbp + 0x360], 0
140167865: f30f1005afacc705 movss xmm0, dword ptr [rip + 0x5c7acaf]
14016786d: 410f2ec3 ucomiss xmm0, xmm11
140167871: 0f8316020000 jae 0x140167a8d
140167877: f3450f16c1 movshdup xmm8, xmm9
14016787c: 410f28f0 movaps xmm6, xmm8
140167880: 83f803 cmp eax, 3
140167883: 0f8507050000 jne 0x140167d90
140167889: 0f2e35b0acc705 ucomiss xmm6, dword ptr [rip + 0x5c7acb0]
140167890: 0f82fa040000 jb 0x140167d90
140167896: f3450f59d9 mulss xmm11, xmm9
14016789b: 410f28c3 movaps xmm0, xmm11
14016789f: 440f2805f957c605 movaps xmm8, xmmword ptr [rip + 0x5c657f9]
1401678a7: 410f57c0 xorps xmm0, xmm8
1401678ab: 410f28c9 movaps xmm1, xmm9
1401678af: f30f590dcd55c605 mulss xmm1, dword ptr [rip + 0x5c655cd]
1401678b7: f30f580d095cc305 addss xmm1, dword ptr [rip + 0x5c35c09]
1401678bf: f30f109530030000 movss xmm2, dword ptr [rbp + 0x330]
1401678c7: f30f109d34030000 movss xmm3, dword ptr [rbp + 0x334]
1401678cf: 0f28e3 movaps xmm4, xmm3
1401678d2: 410f57e0 xorps xmm4, xmm8
1401678d6: f30f10ad38030000 movss xmm5, dword ptr [rbp + 0x338]
1401678de: 0f28f2 movaps xmm6, xmm2
1401678e1: 410f57f0 xorps xmm6, xmm8
1401678e5: 0f28f9 movaps xmm7, xmm1
1401678e8: 410f57f8 xorps xmm7, xmm8
1401678ec: f30f11a5c0010000 movss dword ptr [rbp + 0x1c0], xmm4
1401678f4: f30f11adc4010000 movss dword ptr [rbp + 0x1c4], xmm5
1401678fc: f30f11b5c8010000 movss dword ptr [rbp + 0x1c8], xmm6
140167904: f20f1025b4a9c705 movsd xmm4, qword ptr [rip + 0x5c7a9b4]
14016790c: f20f11a5cc010000 movsd qword ptr [rbp + 0x1cc], xmm4
140167914: f30f1185d4010000 movss dword ptr [rbp + 0x1d4], xmm0
14016791c: f3440f119dd8010000 movss dword ptr [rbp + 0x1d8], xmm11
140167925: f30f1185dc010000 movss dword ptr [rbp + 0x1dc], xmm0
14016792d: 410f28f3 movaps xmm6, xmm11
140167931: f3440f119de0010000 movss dword ptr [rbp + 0x1e0], xmm11
14016793a: f30f11bde4010000 movss dword ptr [rbp + 0x1e4], xmm7
140167942: f30f118de8010000 movss dword ptr [rbp + 0x1e8], xmm1
14016794a: f30f115c2430 movss dword ptr [rsp + 0x30], xmm3
140167950: f30f11542428 movss dword ptr [rsp + 0x28], xmm2
140167956: 4c897c2420 mov qword ptr [rsp + 0x20], r15
14016795b: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
140167964: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
14016796d: 4c89e1 mov rcx, r12
140167970: 4c89ea mov rdx, r13
140167973: 41b002 mov r8b, 2
140167976: 41b101 mov r9b, 1
140167979: e8e265fdff call 0x14013df60
14016797e: 90 nop
14016797f: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
140167986: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
14016798d: 750d jne 0x14016799c
14016798f: 488d8d50030000 lea rcx, [rbp + 0x350]
140167996: e82533a905 call 0x145bfacc0
14016799b: 90 nop
14016799c: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401679a3: 488d0c76 lea rcx, [rsi + rsi*2]
1401679a7: 48c1e104 shl rcx, 4
1401679ab: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
1401679b2: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
1401679b9: 0f109500010000 movups xmm2, xmmword ptr [rbp + 0x100]
1401679c0: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
1401679c5: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1401679ca: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1401679ce: 48ffc6 inc rsi
1401679d1: 4889b560030000 mov qword ptr [rbp + 0x360], rsi
1401679d8: 80bdf002000000 cmp byte ptr [rbp + 0x2f0], 0
1401679df: 0f84a8000000 je 0x140167a8d
1401679e5: f3440f590d02a8c705 mulss xmm9, dword ptr [rip + 0x5c7a802]
1401679ee: f3440f5d0d61d4c605 minss xmm9, dword ptr [rip + 0x5c6d461]
1401679f7: f3440f114c2440 movss dword ptr [rsp + 0x40], xmm9
1401679fe: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
140167a04: 488d8530030000 lea rax, [rbp + 0x330]
140167a0b: 4889442420 mov qword ptr [rsp + 0x20], rax
140167a10: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
140167a18: c744243000000000 mov dword ptr [rsp + 0x30], 0
140167a20: 4c89e1 mov rcx, r12
140167a23: 4c89ea mov rdx, r13
140167a26: 41b003 mov r8b, 3
140167a29: 41b105 mov r9b, 5
140167a2c: e85f5efdff call 0x14013d890
140167a31: 90 nop
140167a32: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
140167a39: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
140167a40: 750d jne 0x140167a4f
140167a42: 488d8d50030000 lea rcx, [rbp + 0x350]
140167a49: e87232a905 call 0x145bfacc0
140167a4e: 90 nop
140167a4f: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140167a56: 488d0c76 lea rcx, [rsi + rsi*2]
140167a5a: 48c1e104 shl rcx, 4
140167a5e: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
140167a65: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
140167a6c: f30f6f9500010000 movdqu xmm2, xmmword ptr [rbp + 0x100]
140167a74: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
140167a7a: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140167a7f: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140167a83: 48ffc6 inc rsi
140167a86: 4889b560030000 mov qword ptr [rbp + 0x360], rsi
140167a8d: 488b8560030000 mov rax, qword ptr [rbp + 0x360]
140167a94: 488985f0000000 mov qword ptr [rbp + 0xf0], rax
140167a9b: 488b8550030000 mov rax, qword ptr [rbp + 0x350]
140167aa2: 488985e0000000 mov qword ptr [rbp + 0xe0], rax
140167aa9: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140167ab0: 488985e8000000 mov qword ptr [rbp + 0xe8], rax
140167ab7: 498b7628 mov rsi, qword ptr [r14 + 0x28]
140167abb: 4885f6 test rsi, rsi
140167abe: 7440 je 0x140167b00
140167ac0: 498b7e20 mov rdi, qword ptr [r14 + 0x20]
140167ac4: 4883c708 add rdi, 8
140167ac8: eb0f jmp 0x140167ad9
140167aca: 660f1f440000 nop word ptr [rax + rax]
140167ad0: 4883c730 add rdi, 0x30
140167ad4: 48ffce dec rsi
140167ad7: 7427 je 0x140167b00
140167ad9: 488b47f8 mov rax, qword ptr [rdi - 8]
140167add: 4885c0 test rax, rax
140167ae0: 74ee je 0x140167ad0
140167ae2: 488b0f mov rcx, qword ptr [rdi]
140167ae5: 48c1e002 shl rax, 2
140167ae9: 488d14c0 lea rdx, [rax + rax*8]
140167aed: 41b804000000 mov r8d, 4
140167af3: e8d8a6e9ff call 0x1400021d0
140167af8: ebd6 jmp 0x140167ad0
140167afa: 660f1f440000 nop word ptr [rax + rax]
140167b00: 498d7618 lea rsi, [r14 + 0x18]
140167b04: 488b06 mov rax, qword ptr [rsi]
140167b07: 4885c0 test rax, rax
140167b0a: 0f84e0f7ffff je 0x1401672f0
140167b10: 498b4e20 mov rcx, qword ptr [r14 + 0x20]
140167b14: 48c1e004 shl rax, 4
140167b18: 488d1440 lea rdx, [rax + rax*2]
140167b1c: 41b808000000 mov r8d, 8
140167b22: e8a9a6e9ff call 0x1400021d0
140167b27: e9c4f7ffff jmp 0x1401672f0
140167b2c: 0f1f4000 nop dword ptr [rax]
140167b30: 89c0 mov eax, eax
140167b32: 488d0dfbd0c705 lea rcx, [rip + 0x5c7d0fb]
140167b39: 48630481 movsxd rax, dword ptr [rcx + rax*4]
140167b3d: 4801c8 add rax, rcx
140167b40: ffe0 jmp rax
140167b42: 0f28fb movaps xmm7, xmm3
140167b45: f3410f5cfc subss xmm7, xmm12
140167b4a: f30f593d9ea6c705 mulss xmm7, dword ptr [rip + 0x5c7a69e]
140167b52: f30f5d3d8255c605 minss xmm7, dword ptr [rip + 0x5c65582]
140167b5a: f3440f11642430 movss dword ptr [rsp + 0x30], xmm12
140167b61: 0f28f3 movaps xmm6, xmm3
140167b64: f30f115c2428 movss dword ptr [rsp + 0x28], xmm3
140167b6a: 488d8530030000 lea rax, [rbp + 0x330]
140167b71: 4889442420 mov qword ptr [rsp + 0x20], rax
140167b76: 4c89e1 mov rcx, r12
140167b79: 4c89ea mov rdx, r13
140167b7c: 4531c0 xor r8d, r8d
140167b7f: 4531c9 xor r9d, r9d
140167b82: e81967fdff call 0x14013e2a0
140167b87: 90 nop
140167b88: 488b9d60030000 mov rbx, qword ptr [rbp + 0x360]
140167b8f: 483b9d50030000 cmp rbx, qword ptr [rbp + 0x350]
140167b96: 750d jne 0x140167ba5
140167b98: 488d8d50030000 lea rcx, [rbp + 0x350]
140167b9f: e81c31a905 call 0x145bfacc0
140167ba4: 90 nop
140167ba5: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140167bac: 488d0c5b lea rcx, [rbx + rbx*2]
140167bb0: 48c1e104 shl rcx, 4
140167bb4: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
140167bbb: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
140167bc2: f30f6f9500010000 movdqu xmm2, xmmword ptr [rbp + 0x100]
140167bca: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
140167bd0: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140167bd5: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140167bd9: 48ffc3 inc rbx
140167bdc: 48899d60030000 mov qword ptr [rbp + 0x360], rbx
140167be3: f30f117c2440 movss dword ptr [rsp + 0x40], xmm7
140167be9: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
140167bef: 488d8530030000 lea rax, [rbp + 0x330]
140167bf6: 4889442420 mov qword ptr [rsp + 0x20], rax
140167bfb: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
140167c03: c744243000000000 mov dword ptr [rsp + 0x30], 0
140167c0b: 4c89f9 mov rcx, r15
140167c0e: 4c89ea mov rdx, r13
140167c11: 41b001 mov r8b, 1
140167c14: 41b104 mov r9b, 4
140167c17: e8745cfdff call 0x14013d890
140167c1c: 90 nop
140167c1d: 4088f7 mov dil, sil
140167c20: c6854f03000001 mov byte ptr [rbp + 0x34f], 1
140167c27: f30f117c2440 movss dword ptr [rsp + 0x40], xmm7
140167c2d: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
140167c34: 488d8530030000 lea rax, [rbp + 0x330]
140167c3b: 4889442420 mov qword ptr [rsp + 0x20], rax
140167c40: c7442438db0fc940 mov dword ptr [rsp + 0x38], 0x40c90fdb
140167c48: c744243000000000 mov dword ptr [rsp + 0x30], 0
140167c50: 4c89ea mov rdx, r13
140167c53: 4d89e5 mov r13, r12
140167c56: 4c89e1 mov rcx, r12
140167c59: 4889d6 mov rsi, rdx
140167c5c: 41b001 mov r8b, 1
140167c5f: 41b104 mov r9b, 4
140167c62: e8295cfdff call 0x14013d890
140167c67: 90 nop
140167c68: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
140167c6f: 48898510030000 mov qword ptr [rbp + 0x310], rax
140167c76: 488b9de8000000 mov rbx, qword ptr [rbp + 0xe8]
140167c7d: 4c8bbdf0000000 mov r15, qword ptr [rbp + 0xf0]
140167c84: 488b85c0010000 mov rax, qword ptr [rbp + 0x1c0]
140167c8b: 4c8ba5d0010000 mov r12, qword ptr [rbp + 0x1d0]
140167c92: 4c29e0 sub rax, r12
140167c95: 4939c7 cmp r15, rax
140167c98: 0f877c140000 ja 0x14016911a
140167c9e: 4d85ff test r15, r15
140167ca1: 7423 je 0x140167cc6
140167ca3: 4a8d04bd00000000 lea rax, [r15*4]
140167cab: 4c8d04c0 lea r8, [rax + rax*8]
140167caf: 4b8d0ce4 lea rcx, [r12 + r12*8]
140167cb3: 48c1e102 shl rcx, 2
140167cb7: 48038dc8010000 add rcx, qword ptr [rbp + 0x1c8]
140167cbe: 4889da mov rdx, rbx
140167cc1: e82124a905 call 0x145bfa0e7
140167cc6: 4d01fc add r12, r15
140167cc9: 4c89a5d0010000 mov qword ptr [rbp + 0x1d0], r12
140167cd0: 488b8510030000 mov rax, qword ptr [rbp + 0x310]
140167cd7: 4885c0 test rax, rax
140167cda: 7416 je 0x140167cf2
140167cdc: 48c1e002 shl rax, 2
140167ce0: 488d14c0 lea rdx, [rax + rax*8]
140167ce4: 41b804000000 mov r8d, 4
140167cea: 4889d9 mov rcx, rbx
140167ced: e8dea4e9ff call 0x1400021d0
140167cf2: 488b85c0010000 mov rax, qword ptr [rbp + 0x1c0]
140167cf9: 48898510030000 mov qword ptr [rbp + 0x310], rax
140167d00: 488b85c8010000 mov rax, qword ptr [rbp + 0x1c8]
140167d07: 48898520030000 mov qword ptr [rbp + 0x320], rax
140167d0e: 488b9d60030000 mov rbx, qword ptr [rbp + 0x360]
140167d15: 483b9d50030000 cmp rbx, qword ptr [rbp + 0x350]
140167d1c: 4c8dbdc0010000 lea r15, [rbp + 0x1c0]
140167d23: 4d89ec mov r12, r13
140167d26: 750d jne 0x140167d35
140167d28: 488d8d50030000 lea rcx, [rbp + 0x350]
140167d2f: e88c2fa905 call 0x145bfacc0
140167d34: 90 nop
140167d35: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140167d3c: 488d0c5b lea rcx, [rbx + rbx*2]
140167d40: 48c1e104 shl rcx, 4
140167d44: 488b9510030000 mov rdx, qword ptr [rbp + 0x310]
140167d4b: 48891408 mov qword ptr [rax + rcx], rdx
140167d4f: 488b9520030000 mov rdx, qword ptr [rbp + 0x320]
140167d56: 4889540808 mov qword ptr [rax + rcx + 8], rdx
140167d5b: 488d95d0010000 lea rdx, [rbp + 0x1d0]
140167d62: 0f1002 movups xmm0, xmmword ptr [rdx]
140167d65: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
140167d69: 0f11440810 movups xmmword ptr [rax + rcx + 0x10], xmm0
140167d6e: 0f114c0820 movups xmmword ptr [rax + rcx + 0x20], xmm1
140167d73: 48ffc3 inc rbx
140167d76: 48899d60030000 mov qword ptr [rbp + 0x360], rbx
140167d7d: 4989f5 mov r13, rsi
140167d80: 89fe mov esi, edi
140167d82: 498d7e60 lea rdi, [r14 + 0x60]
140167d86: e954f8ffff jmp 0x1401675df
140167d8b: 0f1f440000 nop dword ptr [rax + rax]
140167d90: 89c0 mov eax, eax
140167d92: 488d0dabcec705 lea rcx, [rip + 0x5c7ceab]
140167d99: 48630481 movsxd rax, dword ptr [rcx + rax*4]
140167d9d: 4801c8 add rax, rcx
140167da0: ffe0 jmp rax
140167da2: 410f28f8 movaps xmm7, xmm8
140167da6: f3410f5cf9 subss xmm7, xmm9
140167dab: 450f28cb movaps xmm9, xmm11
140167daf: 410f28c3 movaps xmm0, xmm11
140167db3: f30f59c7 mulss xmm0, xmm7
140167db7: f3440f5cc0 subss xmm8, xmm0
140167dbc: f3440f11442430 movss dword ptr [rsp + 0x30], xmm8
140167dc3: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
140167dc9: 488d8530030000 lea rax, [rbp + 0x330]
140167dd0: 4889442420 mov qword ptr [rsp + 0x20], rax
140167dd5: 4c89e1 mov rcx, r12
140167dd8: 4c89ea mov rdx, r13
140167ddb: 41b002 mov r8b, 2
140167dde: 41b101 mov r9b, 1
140167de1: e8ba64fdff call 0x14013e2a0
140167de6: 90 nop
140167de7: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
140167dee: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
140167df5: 750d jne 0x140167e04
140167df7: 488d8d50030000 lea rcx, [rbp + 0x350]
140167dfe: e8bd2ea905 call 0x145bfacc0
140167e03: 90 nop
140167e04: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140167e0b: 488d0c76 lea rcx, [rsi + rsi*2]
140167e0f: 48c1e104 shl rcx, 4
140167e13: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
140167e1a: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
140167e21: 0f109500010000 movups xmm2, xmmword ptr [rbp + 0x100]
140167e28: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
140167e2d: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140167e32: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140167e36: 48ffc6 inc rsi
140167e39: 4889b560030000 mov qword ptr [rbp + 0x360], rsi
140167e40: f30f10054ca7c705 movss xmm0, dword ptr [rip + 0x5c7a74c]
140167e48: 410f2ec1 ucomiss xmm0, xmm9
140167e4c: 0f96c0 setbe al
140167e4f: 8b8df0020000 mov ecx, dword ptr [rbp + 0x2f0]
140167e55: 80f101 xor cl, 1
140167e58: 08c1 or cl, al
140167e5a: 0f852dfcffff jne 0x140167a8d
140167e60: f30f593d88a3c705 mulss xmm7, dword ptr [rip + 0x5c7a388]
140167e68: f30f5d3de8cfc605 minss xmm7, dword ptr [rip + 0x5c6cfe8]
140167e70: f30f117c2440 movss dword ptr [rsp + 0x40], xmm7
140167e76: f3440f11442428 movss dword ptr [rsp + 0x28], xmm8
140167e7d: 488d8530030000 lea rax, [rbp + 0x330]
140167e84: 4889442420 mov qword ptr [rsp + 0x20], rax
140167e89: c744243800000000 mov dword ptr [rsp + 0x38], 0
140167e91: c7442430db0fc940 mov dword ptr [rsp + 0x30], 0x40c90fdb
140167e99: 4c89e1 mov rcx, r12
140167e9c: 4c89ea mov rdx, r13
140167e9f: 41b003 mov r8b, 3
140167ea2: 41b105 mov r9b, 5
140167ea5: e8e659fdff call 0x14013d890
140167eaa: 90 nop
140167eab: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
140167eb2: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
140167eb9: 0f8590fbffff jne 0x140167a4f
140167ebf: 488d8d50030000 lea rcx, [rbp + 0x350]
140167ec6: e8f52da905 call 0x145bfacc0
140167ecb: 90 nop
140167ecc: e97efbffff jmp 0x140167a4f
140167ed1: f3410f104670 movss xmm0, dword ptr [r14 + 0x70]
140167ed7: f3410f104e74 movss xmm1, dword ptr [r14 + 0x74]
140167edd: f30f1095b8000000 movss xmm2, dword ptr [rbp + 0xb8]
140167ee5: f30f5cd0 subss xmm2, xmm0
140167ee9: f30f5cc8 subss xmm1, xmm0
140167eed: f30f5f0d934fc605 maxss xmm1, dword ptr [rip + 0x5c64f93]
140167ef5: f30f5ed1 divss xmm2, xmm1
140167ef9: 0f57c0 xorps xmm0, xmm0
140167efc: f30f5fc2 maxss xmm0, xmm2
140167f00: f3440f101d9753c305 movss xmm11, dword ptr [rip + 0x5c35397]
140167f09: f3440f5dd8 minss xmm11, xmm0
140167f0e: b001 mov al, 1
140167f10: 8985f0020000 mov dword ptr [rbp + 0x2f0], eax
140167f16: e924f4ffff jmp 0x14016733f
140167f1b: 0f28c3 movaps xmm0, xmm3
140167f1e: f30f5905caa2c705 mulss xmm0, dword ptr [rip + 0x5c7a2ca]
140167f26: f30f5d05ae51c605 minss xmm0, dword ptr [rip + 0x5c651ae]
140167f2e: 0f298520030000 movaps xmmword ptr [rbp + 0x320], xmm0
140167f35: 0f299d90000000 movaps xmmword ptr [rbp + 0x90], xmm3
140167f3c: f3440f12eb movsldup xmm13, xmm3
140167f41: 440f592d07a6c705 mulps xmm13, xmmword ptr [rip + 0x5c7a607]
140167f49: 410f28fe movaps xmm7, xmm14
140167f4d: f30f583d63a3c705 addss xmm7, dword ptr [rip + 0x5c7a363]
140167f55: 450f28c4 movaps xmm8, xmm12
140167f59: f3440f5925224fc605 mulss xmm12, dword ptr [rip + 0x5c64f22]
140167f62: f3440f58255d55c305 addss xmm12, dword ptr [rip + 0x5c3555d]
140167f6b: f3440f10bd30030000 movss xmm15, dword ptr [rbp + 0x330]
140167f74: 440f29bd80000000 movaps xmmword ptr [rbp + 0x80], xmm15
140167f7c: f30f10b534030000 movss xmm6, dword ptr [rbp + 0x334]
140167f84: 440f299d10030000 movaps xmmword ptr [rbp + 0x310], xmm11
140167f8c: 440f28de movaps xmm11, xmm6
140167f90: 0f28050951c605 movaps xmm0, xmmword ptr [rip + 0x5c65109]
140167f97: 440f57d8 xorps xmm11, xmm0
140167f9b: f3440f108d38030000 movss xmm9, dword ptr [rbp + 0x338]
140167fa4: 440f57f8 xorps xmm15, xmm0
140167fa8: 0f28c7 movaps xmm0, xmm7
140167fab: e86721a905 call 0x145bfa117
140167fb0: 440f28d0 movaps xmm10, xmm0
140167fb4: f30f11bdac000000 movss dword ptr [rbp + 0xac], xmm7
140167fbc: 0f28c7 movaps xmm0, xmm7
140167fbf: e85921a905 call 0x145bfa11d
140167fc4: 410f28cc movaps xmm1, xmm12
140167fc8: 0f570dd150c605 xorps xmm1, xmmword ptr [rip + 0x5c650d1]
140167fcf: f3440f119dc0010000 movss dword ptr [rbp + 0x1c0], xmm11
140167fd8: 450f28d9 movaps xmm11, xmm9
140167fdc: f3440f118dc4010000 movss dword ptr [rbp + 0x1c4], xmm9
140167fe5: f3440f11bdc8010000 movss dword ptr [rbp + 0x1c8], xmm15
140167fee: f3440f1195c0000000 movss dword ptr [rbp + 0xc0], xmm10
140167ff7: f3440f1195cc010000 movss dword ptr [rbp + 0x1cc], xmm10
140168000: 440f28d0 movaps xmm10, xmm0
140168004: f30f1185d0010000 movss dword ptr [rbp + 0x1d0], xmm0
14016800c: c785d401000000000000 mov dword ptr [rbp + 0x1d4], 0
140168016: f3440f1185d8010000 movss dword ptr [rbp + 0x1d8], xmm8
14016801f: 440f13addc010000 movlps qword ptr [rbp + 0x1dc], xmm13
140168027: 440f28c9 movaps xmm9, xmm1
14016802b: f30f118de4010000 movss dword ptr [rbp + 0x1e4], xmm1
140168033: 440f29a5b0020000 movaps xmmword ptr [rbp + 0x2b0], xmm12
14016803b: f3440f11a5e8010000 movss dword ptr [rbp + 0x1e8], xmm12
140168044: 450f28e0 movaps xmm12, xmm8
140168048: 0f28fe movaps xmm7, xmm6
14016804b: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
140168051: 0f288580000000 movaps xmm0, xmmword ptr [rbp + 0x80]
140168058: 440f28c0 movaps xmm8, xmm0
14016805c: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
140168062: 4c897c2420 mov qword ptr [rsp + 0x20], r15
140168067: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
140168070: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
140168079: 4c89e1 mov rcx, r12
14016807c: 4c89ea mov rdx, r13
14016807f: 4531c0 xor r8d, r8d
140168082: 41b102 mov r9b, 2
140168085: e8d65efdff call 0x14013df60
14016808a: 90 nop
14016808b: 488b9d60030000 mov rbx, qword ptr [rbp + 0x360]
140168092: 483b9d50030000 cmp rbx, qword ptr [rbp + 0x350]
140168099: 750d jne 0x1401680a8
14016809b: 488d8d50030000 lea rcx, [rbp + 0x350]
1401680a2: e8192ca905 call 0x145bfacc0
1401680a7: 90 nop
1401680a8: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401680af: 488d0c5b lea rcx, [rbx + rbx*2]
1401680b3: 48c1e104 shl rcx, 4
1401680b7: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
1401680be: f30f6f8df0000000 movdqu xmm1, xmmword ptr [rbp + 0xf0]
1401680c6: f30f6f9500010000 movdqu xmm2, xmmword ptr [rbp + 0x100]
1401680ce: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
1401680d4: f30f7f4c0810 movdqu xmmword ptr [rax + rcx + 0x10], xmm1
1401680da: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1401680de: 48ffc3 inc rbx
1401680e1: 48899d60030000 mov qword ptr [rbp + 0x360], rbx
1401680e8: 410f28c6 movaps xmm0, xmm14
1401680ec: e82c20a905 call 0x145bfa11d
1401680f1: 440f28f8 movaps xmm15, xmm0
1401680f5: 410f28c6 movaps xmm0, xmm14
1401680f9: e81920a905 call 0x145bfa117
1401680fe: 488b9de8020000 mov rbx, qword ptr [rbp + 0x2e8]
140168105: c685f802000004 mov byte ptr [rbp + 0x2f8], 4
14016810c: 48837b1800 cmp qword ptr [rbx + 0x18], 0
140168111: f3440f119dd0000000 movss dword ptr [rbp + 0xd0], xmm11
14016811a: 0f845b110000 je 0x14016927b
140168120: 440f28f7 movaps xmm14, xmm7
140168124: f3410f16cd movshdup xmm1, xmm13
140168129: 0f28f8 movaps xmm7, xmm0
14016812c: f30f59f9 mulss xmm7, xmm1
140168130: f3410f58f8 addss xmm7, xmm8
140168135: f3410f59cf mulss xmm1, xmm15
14016813a: 410f28f6 movaps xmm6, xmm14
14016813e: f30f5cf1 subss xmm6, xmm1
140168142: 440f28d8 movaps xmm11, xmm0
140168146: f3450f59dd mulss xmm11, xmm13
14016814b: f3450f58d8 addss xmm11, xmm8
140168150: f3450f59ef mulss xmm13, xmm15
140168155: f3450f5cf5 subss xmm14, xmm13
14016815a: f3450f59fc mulss xmm15, xmm12
14016815f: f3440f58ff addss xmm15, xmm7
140168164: f3410f59c4 mulss xmm0, xmm12
140168169: f30f58c6 addss xmm0, xmm6
14016816d: 0f298580000000 movaps xmmword ptr [rbp + 0x80], xmm0
140168174: 488d4b20 lea rcx, [rbx + 0x20]
140168178: 488d95f8020000 lea rdx, [rbp + 0x2f8]
14016817f: e8ec52eaff call 0x14000d470
140168184: 4989c0 mov r8, rax
140168187: 49c1e839 shr r8, 0x39
14016818b: 488b0b mov rcx, qword ptr [rbx]
14016818e: 488b5308 mov rdx, qword ptr [rbx + 8]
140168192: 66410f6ec0 movd xmm0, r8d
140168197: 660f60c0 punpcklbw xmm0, xmm0
14016819b: f20f70c000 pshuflw xmm0, xmm0, 0
1401681a0: 660f70c044 pshufd xmm0, xmm0, 0x44
1401681a5: 4531c0 xor r8d, r8d
1401681a8: 4821d0 and rax, rdx
1401681ab: f30f6f0c01 movdqu xmm1, xmmword ptr [rcx + rax]
1401681b0: 660f6fd1 movdqa xmm2, xmm1
1401681b4: 660f74d0 pcmpeqb xmm2, xmm0
1401681b8: 66440fd7ca pmovmskb r9d, xmm2
1401681bd: 4585c9 test r9d, r9d
1401681c0: 743e je 0x140168200
1401681c2: 450f28c1 movaps xmm8, xmm9
1401681c6: f3450fbcd9 tzcnt r11d, r9d
1401681cb: 4901c3 add r11, rax
1401681ce: 4921d3 and r11, rdx
1401681d1: 49c1e305 shl r11, 5
1401681d5: 4989ca mov r10, rcx
1401681d8: 4d29da sub r10, r11
1401681db: 41807ae004 cmp byte ptr [r10 - 0x20], 4
1401681e0: 0f8451050000 je 0x140168737
1401681e6: 458d51ff lea r10d, [r9 - 1]
1401681ea: 664521ca and r10w, r9w
1401681ee: 4589d1 mov r9d, r10d
1401681f1: 75d3 jne 0x1401681c6
1401681f3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140168200: 660f76d2 pcmpeqd xmm2, xmm2
140168204: 660f74ca pcmpeqb xmm1, xmm2
140168208: 66440fd7c9 pmovmskb r9d, xmm1
14016820d: 4585c9 test r9d, r9d
140168210: 0f8565100000 jne 0x14016927b
140168216: 4c01c0 add rax, r8
140168219: 4883c010 add rax, 0x10
14016821d: 4983c010 add r8, 0x10
140168221: eb85 jmp 0x1401681a8
140168223: 450f28c4 movaps xmm8, xmm12
140168227: f3440f5905c09fc705 mulss xmm8, dword ptr [rip + 0x5c79fc0]
140168230: f3440f5d05a34ec605 minss xmm8, dword ptr [rip + 0x5c64ea3]
140168239: 440f28cb movaps xmm9, xmm3
14016823d: f3440f590d5e50c305 mulss xmm9, dword ptr [rip + 0x5c3505e]
140168246: 410f28c4 movaps xmm0, xmm12
14016824a: 0f280d4f4ec605 movaps xmm1, xmmword ptr [rip + 0x5c64e4f]
140168251: 0f57c1 xorps xmm0, xmm1
140168254: 450f28ec movaps xmm13, xmm12
140168258: f3440f592d234cc605 mulss xmm13, dword ptr [rip + 0x5c64c23]
140168261: f3440f582d5e52c305 addss xmm13, dword ptr [rip + 0x5c3525e]
14016826a: f30f10bd30030000 movss xmm7, dword ptr [rbp + 0x330]
140168272: f3440f109534030000 movss xmm10, dword ptr [rbp + 0x334]
14016827b: 410f28d2 movaps xmm2, xmm10
14016827f: 0f57d1 xorps xmm2, xmm1
140168282: f30f10a538030000 movss xmm4, dword ptr [rbp + 0x338]
14016828a: 0f28ef movaps xmm5, xmm7
14016828d: 0f57e9 xorps xmm5, xmm1
140168290: 0f299590000000 movaps xmmword ptr [rbp + 0x90], xmm2
140168297: f30f1195c0010000 movss dword ptr [rbp + 0x1c0], xmm2
14016829f: f30f11a520030000 movss dword ptr [rbp + 0x320], xmm4
1401682a7: f30f11a5c4010000 movss dword ptr [rbp + 0x1c4], xmm4
1401682af: 0f29adb0020000 movaps xmmword ptr [rbp + 0x2b0], xmm5
1401682b6: f30f11adc8010000 movss dword ptr [rbp + 0x1c8], xmm5
1401682be: f20f1015fa9fc705 movsd xmm2, qword ptr [rip + 0x5c79ffa]
1401682c6: f20f1195cc010000 movsd qword ptr [rbp + 0x1cc], xmm2
1401682ce: f30f1185d4010000 movss dword ptr [rbp + 0x1d4], xmm0
1401682d6: f3440f11a5d8010000 movss dword ptr [rbp + 0x1d8], xmm12
1401682df: f30f1185dc010000 movss dword ptr [rbp + 0x1dc], xmm0
1401682e7: 450f28fd movaps xmm15, xmm13
1401682eb: 440f57f9 xorps xmm15, xmm1
1401682ef: f3440f11a5e0010000 movss dword ptr [rbp + 0x1e0], xmm12
1401682f8: f3440f11bde4010000 movss dword ptr [rbp + 0x1e4], xmm15
140168301: f3440f11ade8010000 movss dword ptr [rbp + 0x1e8], xmm13
14016830a: 488d8df8020000 lea rcx, [rbp + 0x2f8]
140168311: 410f28ce movaps xmm1, xmm14
140168315: 0f28d3 movaps xmm2, xmm3
140168318: e8d3f4fdff call 0x1401477f0
14016831d: 90 nop
14016831e: 488b8d00030000 mov rcx, qword ptr [rbp + 0x300]
140168325: 488b8508030000 mov rax, qword ptr [rbp + 0x308]
14016832c: 4889442440 mov qword ptr [rsp + 0x40], rax
140168331: 48898d10030000 mov qword ptr [rbp + 0x310], rcx
140168338: 48894c2438 mov qword ptr [rsp + 0x38], rcx
14016833d: f3440f11542430 movss dword ptr [rsp + 0x30], xmm10
140168344: f30f117c2428 movss dword ptr [rsp + 0x28], xmm7
14016834a: 4c897c2420 mov qword ptr [rsp + 0x20], r15
14016834f: 4c89e1 mov rcx, r12
140168352: 4c89ea mov rdx, r13
140168355: 4531c0 xor r8d, r8d
140168358: 4531c9 xor r9d, r9d
14016835b: e8005cfdff call 0x14013df60
140168360: 90 nop
140168361: 488b9d60030000 mov rbx, qword ptr [rbp + 0x360]
140168368: 483b9d50030000 cmp rbx, qword ptr [rbp + 0x350]
14016836f: 750d jne 0x14016837e
140168371: 488d8d50030000 lea rcx, [rbp + 0x350]
140168378: e84329a905 call 0x145bfacc0
14016837d: 90 nop
14016837e: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140168385: 488d0c5b lea rcx, [rbx + rbx*2]
140168389: 48c1e104 shl rcx, 4
14016838d: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
140168394: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
14016839b: f30f6f9500010000 movdqu xmm2, xmmword ptr [rbp + 0x100]
1401683a3: f30f7f540820 movdqu xmmword ptr [rax + rcx + 0x20], xmm2
1401683a9: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1401683ae: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1401683b2: 48ffc3 inc rbx
1401683b5: 48899d60030000 mov qword ptr [rbp + 0x360], rbx
1401683bc: 488b85f8020000 mov rax, qword ptr [rbp + 0x2f8]
1401683c3: 4885c0 test rax, rax
1401683c6: 741a je 0x1401683e2
1401683c8: 48c1e003 shl rax, 3
1401683cc: 488d1440 lea rdx, [rax + rax*2]
1401683d0: 41b804000000 mov r8d, 4
1401683d6: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
1401683dd: e8ee9de9ff call 0x1400021d0
1401683e2: 410f28f6 movaps xmm6, xmm14
1401683e6: f3410f5cf1 subss xmm6, xmm9
1401683eb: f3450f58ce addss xmm9, xmm14
1401683f0: f3440f11442440 movss dword ptr [rsp + 0x40], xmm8
1401683f7: f3440f114c2438 movss dword ptr [rsp + 0x38], xmm9
1401683fe: f30f11742430 movss dword ptr [rsp + 0x30], xmm6
140168404: f3440f11642428 movss dword ptr [rsp + 0x28], xmm12
14016840b: 488d8530030000 lea rax, [rbp + 0x330]
140168412: 4889442420 mov qword ptr [rsp + 0x20], rax
140168417: 4c89e1 mov rcx, r12
14016841a: 4c89ea mov rdx, r13
14016841d: 41b001 mov r8b, 1
140168420: 41b104 mov r9b, 4
140168423: e86854fdff call 0x14013d890
140168428: 90 nop
140168429: 440f2995c0000000 movaps xmmword ptr [rbp + 0xc0], xmm10
140168431: 0f29bdd0000000 movaps xmmword ptr [rbp + 0xd0], xmm7
140168438: 440f299d10030000 movaps xmmword ptr [rbp + 0x310], xmm11
140168440: 410f28c6 movaps xmm0, xmm14
140168444: e8d41ca905 call 0x145bfa11d
140168449: 440f28d0 movaps xmm10, xmm0
14016844d: 410f28c6 movaps xmm0, xmm14
140168451: e8c11ca905 call 0x145bfa117
140168456: 0f28f8 movaps xmm7, xmm0
140168459: 0f280d404cc605 movaps xmm1, xmmword ptr [rip + 0x5c64c40]
140168460: 0f57c1 xorps xmm0, xmm1
140168463: f30f1185f8020000 movss dword ptr [rbp + 0x2f8], xmm0
14016846b: f3440f1195fc020000 movss dword ptr [rbp + 0x2fc], xmm10
140168474: c7850003000000000000 mov dword ptr [rbp + 0x300], 0
14016847e: 450f28f0 movaps xmm14, xmm8
140168482: 440f57f1 xorps xmm14, xmm1
140168486: f3440f580d299ec705 addss xmm9, dword ptr [rip + 0x5c79e29]
14016848f: 410f28c1 movaps xmm0, xmm9
140168493: e87f1ca905 call 0x145bfa117
140168498: 440f28d8 movaps xmm11, xmm0
14016849c: 410f28c1 movaps xmm0, xmm9
1401684a0: e8781ca905 call 0x145bfa11d
1401684a5: 440f288d90000000 movaps xmm9, xmmword ptr [rbp + 0x90]
1401684ad: f3440f118dc0010000 movss dword ptr [rbp + 0x1c0], xmm9
1401684b6: f30f108d20030000 movss xmm1, dword ptr [rbp + 0x320]
1401684be: f30f118dc4010000 movss dword ptr [rbp + 0x1c4], xmm1
1401684c6: 0f288db0020000 movaps xmm1, xmmword ptr [rbp + 0x2b0]
1401684cd: f30f118dc8010000 movss dword ptr [rbp + 0x1c8], xmm1
1401684d5: f3440f119dcc010000 movss dword ptr [rbp + 0x1cc], xmm11
1401684de: f30f1185d0010000 movss dword ptr [rbp + 0x1d0], xmm0
1401684e6: c785d401000000000000 mov dword ptr [rbp + 0x1d4], 0
1401684f0: f3440f11a5d8010000 movss dword ptr [rbp + 0x1d8], xmm12
1401684f9: f3440f11b5dc010000 movss dword ptr [rbp + 0x1dc], xmm14
140168502: f3440f1185e0010000 movss dword ptr [rbp + 0x1e0], xmm8
14016850b: f3440f11bde4010000 movss dword ptr [rbp + 0x1e4], xmm15
140168514: f3440f11ade8010000 movss dword ptr [rbp + 0x1e8], xmm13
14016851d: 48c785d802000000000000 mov qword ptr [rbp + 0x2d8], 0
140168528: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
14016852f: c6857603000001 mov byte ptr [rbp + 0x376], 1
140168536: 4c89e9 mov rcx, r13
140168539: 4d89f8 mov r8, r15
14016853c: 4d89f9 mov r9, r15
14016853f: e8dc4af2ff call 0x14008d020
140168544: 90 nop
140168545: 488b8dd0020000 mov rcx, qword ptr [rbp + 0x2d0]
14016854c: 488b95d8020000 mov rdx, qword ptr [rbp + 0x2d8]
140168553: c6857603000001 mov byte ptr [rbp + 0x376], 1
14016855a: 488d85f8020000 lea rax, [rbp + 0x2f8]
140168561: 4889442428 mov qword ptr [rsp + 0x28], rax
140168566: 0f2885c0000000 movaps xmm0, xmmword ptr [rbp + 0xc0]
14016856d: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140168573: 48c744243001000000 mov qword ptr [rsp + 0x30], 1
14016857c: 4d89e0 mov r8, r12
14016857f: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
140168586: e845f8fdff call 0x140147dd0
14016858b: 90 nop
14016858c: 440f57150c4bc605 xorps xmm10, xmmword ptr [rip + 0x5c64b0c]
140168594: f30f11bdf8020000 movss dword ptr [rbp + 0x2f8], xmm7
14016859c: f3440f1195fc020000 movss dword ptr [rbp + 0x2fc], xmm10
1401685a5: c7850003000000000000 mov dword ptr [rbp + 0x300], 0
1401685af: f30f5835019dc705 addss xmm6, dword ptr [rip + 0x5c79d01]
1401685b7: 0f28c6 movaps xmm0, xmm6
1401685ba: e8581ba905 call 0x145bfa117
1401685bf: 0f28f8 movaps xmm7, xmm0
1401685c2: 0f28c6 movaps xmm0, xmm6
1401685c5: e8531ba905 call 0x145bfa11d
1401685ca: f3440f118dc0010000 movss dword ptr [rbp + 0x1c0], xmm9
1401685d3: f30f108d20030000 movss xmm1, dword ptr [rbp + 0x320]
1401685db: f30f118dc4010000 movss dword ptr [rbp + 0x1c4], xmm1
1401685e3: 0f288db0020000 movaps xmm1, xmmword ptr [rbp + 0x2b0]
1401685ea: f30f118dc8010000 movss dword ptr [rbp + 0x1c8], xmm1
1401685f2: f30f11bdcc010000 movss dword ptr [rbp + 0x1cc], xmm7
1401685fa: f30f1185d0010000 movss dword ptr [rbp + 0x1d0], xmm0
140168602: c785d401000000000000 mov dword ptr [rbp + 0x1d4], 0
14016860c: f3440f11a5d8010000 movss dword ptr [rbp + 0x1d8], xmm12
140168615: f3440f11b5dc010000 movss dword ptr [rbp + 0x1dc], xmm14
14016861e: f3440f1185e0010000 movss dword ptr [rbp + 0x1e0], xmm8
140168627: f3440f11bde4010000 movss dword ptr [rbp + 0x1e4], xmm15
140168630: f3440f11ade8010000 movss dword ptr [rbp + 0x1e8], xmm13
140168639: 48c785d802000000000000 mov qword ptr [rbp + 0x2d8], 0
140168644: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
14016864b: c6857603000001 mov byte ptr [rbp + 0x376], 1
140168652: 4c89e9 mov rcx, r13
140168655: 4d89f8 mov r8, r15
140168658: 4d89f9 mov r9, r15
14016865b: e8c049f2ff call 0x14008d020
140168660: 90 nop
140168661: 488b8dd0020000 mov rcx, qword ptr [rbp + 0x2d0]
140168668: 488b95d8020000 mov rdx, qword ptr [rbp + 0x2d8]
14016866f: c6857603000001 mov byte ptr [rbp + 0x376], 1
140168676: 488d85f8020000 lea rax, [rbp + 0x2f8]
14016867d: 4889442428 mov qword ptr [rsp + 0x28], rax
140168682: 0f2885c0000000 movaps xmm0, xmmword ptr [rbp + 0xc0]
140168689: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14016868f: 48c744243001000000 mov qword ptr [rsp + 0x30], 1
140168698: 4d89e0 mov r8, r12
14016869b: 0f289dd0000000 movaps xmm3, xmmword ptr [rbp + 0xd0]
1401686a2: e829f7fdff call 0x140147dd0
1401686a7: 90 nop
1401686a8: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
1401686af: 48898520030000 mov qword ptr [rbp + 0x320], rax
1401686b6: 488b85e8000000 mov rax, qword ptr [rbp + 0xe8]
1401686bd: 488985b0020000 mov qword ptr [rbp + 0x2b0], rax
1401686c4: 488b9d60030000 mov rbx, qword ptr [rbp + 0x360]
1401686cb: 483b9d50030000 cmp rbx, qword ptr [rbp + 0x350]
1401686d2: 750d jne 0x1401686e1
1401686d4: 488d8d50030000 lea rcx, [rbp + 0x350]
1401686db: e8e025a905 call 0x145bfacc0
1401686e0: 90 nop
1401686e1: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401686e8: 488d0c5b lea rcx, [rbx + rbx*2]
1401686ec: 48c1e104 shl rcx, 4
1401686f0: 488b9520030000 mov rdx, qword ptr [rbp + 0x320]
1401686f7: 48891408 mov qword ptr [rax + rcx], rdx
1401686fb: 488b95b0020000 mov rdx, qword ptr [rbp + 0x2b0]
140168702: 4889540808 mov qword ptr [rax + rcx + 8], rdx
140168707: 488d95f9000000 lea rdx, [rbp + 0xf9]
14016870e: 0f1042f7 movups xmm0, xmmword ptr [rdx - 9]
140168712: 0f104a07 movups xmm1, xmmword ptr [rdx + 7]
140168716: 0f11440810 movups xmmword ptr [rax + rcx + 0x10], xmm0
14016871b: 0f114c0820 movups xmmword ptr [rax + rcx + 0x20], xmm1
140168720: 48ffc3 inc rbx
140168723: 48899d60030000 mov qword ptr [rbp + 0x360], rbx
14016872a: 440f289d10030000 movaps xmm11, xmmword ptr [rbp + 0x310]
140168732: e9a8eeffff jmp 0x1401675df
140168737: 41807ae800 cmp byte ptr [r10 - 0x18], 0
14016873c: 0f84af040000 je 0x140168bf1
140168742: 410fb642eb movzx eax, byte ptr [r10 - 0x15]
140168747: 8885c2010000 mov byte ptr [rbp + 0x1c2], al
14016874d: 410fb742e9 movzx eax, word ptr [r10 - 0x17]
140168752: 668985c0010000 mov word ptr [rbp + 0x1c0], ax
140168759: 498d42ec lea rax, [r10 - 0x14]
14016875d: 498d4af0 lea rcx, [r10 - 0x10]
140168761: 458b42f4 mov r8d, dword ptr [r10 - 0xc]
140168765: 410fb652f8 movzx edx, byte ptr [r10 - 8]
14016876a: 48c1e220 shl rdx, 0x20
14016876e: 4c09c2 or rdx, r8
140168771: 41b001 mov r8b, 1
140168774: e987040000 jmp 0x140168c00
140168779: 440f2815ff9dc705 movaps xmm10, xmmword ptr [rip + 0x5c79dff]
140168781: f3450f10d3 movss xmm10, xmm11
140168786: 450f59d1 mulps xmm10, xmm9
14016878a: f30f5935124bc305 mulss xmm6, dword ptr [rip + 0x5c34b12]
140168792: f3440f58351d9bc705 addss xmm14, dword ptr [rip + 0x5c79b1d]
14016879b: f3440f590de046c605 mulss xmm9, dword ptr [rip + 0x5c646e0]
1401687a4: f3440f580d1b4dc305 addss xmm9, dword ptr [rip + 0x5c34d1b]
1401687ad: f3440f108530030000 movss xmm8, dword ptr [rbp + 0x330]
1401687b6: f30f10bd34030000 movss xmm7, dword ptr [rbp + 0x334]
1401687be: 440f28ef movaps xmm13, xmm7
1401687c2: 0f2805d748c605 movaps xmm0, xmmword ptr [rip + 0x5c648d7]
1401687c9: 440f57e8 xorps xmm13, xmm0
1401687cd: f3440f109d38030000 movss xmm11, dword ptr [rbp + 0x338]
1401687d6: 450f28f8 movaps xmm15, xmm8
1401687da: 440f57f8 xorps xmm15, xmm0
1401687de: 410f28c6 movaps xmm0, xmm14
1401687e2: e83019a905 call 0x145bfa117
1401687e7: 440f28e0 movaps xmm12, xmm0
1401687eb: 410f28c6 movaps xmm0, xmm14
1401687ef: e82919a905 call 0x145bfa11d
1401687f4: 450f28f1 movaps xmm14, xmm9
1401687f8: 440f5735a048c605 xorps xmm14, xmmword ptr [rip + 0x5c648a0]
140168800: f3440f11adc0010000 movss dword ptr [rbp + 0x1c0], xmm13
140168809: f3440f119dc4010000 movss dword ptr [rbp + 0x1c4], xmm11
140168812: f3440f11bdc8010000 movss dword ptr [rbp + 0x1c8], xmm15
14016881b: f3440f11a5cc010000 movss dword ptr [rbp + 0x1cc], xmm12
140168824: f30f118510030000 movss dword ptr [rbp + 0x310], xmm0
14016882c: f30f1185d0010000 movss dword ptr [rbp + 0x1d0], xmm0
140168834: c785d401000000000000 mov dword ptr [rbp + 0x1d4], 0
14016883e: 440f1395d8010000 movlps qword ptr [rbp + 0x1d8], xmm10
140168846: f30f11b5e0010000 movss dword ptr [rbp + 0x1e0], xmm6
14016884e: f3440f11b5e4010000 movss dword ptr [rbp + 0x1e4], xmm14
140168857: f3440f118de8010000 movss dword ptr [rbp + 0x1e8], xmm9
140168860: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
140168866: f3440f11442428 movss dword ptr [rsp + 0x28], xmm8
14016886d: 4c897c2420 mov qword ptr [rsp + 0x20], r15
140168872: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
14016887b: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
140168884: 4c89e1 mov rcx, r12
140168887: 4c89ea mov rdx, r13
14016888a: 41b002 mov r8b, 2
14016888d: 41b103 mov r9b, 3
140168890: e8cb56fdff call 0x14013df60
140168895: 90 nop
140168896: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
14016889d: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
1401688a4: 750d jne 0x1401688b3
1401688a6: 488d8d50030000 lea rcx, [rbp + 0x350]
1401688ad: e80e24a905 call 0x145bfacc0
1401688b2: 90 nop
1401688b3: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401688ba: 488d0c76 lea rcx, [rsi + rsi*2]
1401688be: 48c1e104 shl rcx, 4
1401688c2: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
1401688c9: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
1401688d0: 0f109500010000 movups xmm2, xmmword ptr [rbp + 0x100]
1401688d7: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
1401688dc: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1401688e1: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1401688e5: 48ffc6 inc rsi
1401688e8: 4889b560030000 mov qword ptr [rbp + 0x360], rsi
1401688ef: 80bdf002000000 cmp byte ptr [rbp + 0x2f0], 0
1401688f6: 0f8491f1ffff je 0x140167a8d
1401688fc: 410f28c2 movaps xmm0, xmm10
140168900: f30f5805889cc705 addss xmm0, dword ptr [rip + 0x5c79c88]
140168908: 0f57c9 xorps xmm1, xmm1
14016890b: f30f5fc1 maxss xmm0, xmm1
14016890f: f3440f11adc0010000 movss dword ptr [rbp + 0x1c0], xmm13
140168918: f3440f119dc4010000 movss dword ptr [rbp + 0x1c4], xmm11
140168921: f3440f11bdc8010000 movss dword ptr [rbp + 0x1c8], xmm15
14016892a: f3440f11a5cc010000 movss dword ptr [rbp + 0x1cc], xmm12
140168933: f30f108d10030000 movss xmm1, dword ptr [rbp + 0x310]
14016893b: f30f118dd0010000 movss dword ptr [rbp + 0x1d0], xmm1
140168943: f30f1185d4010000 movss dword ptr [rbp + 0x1d4], xmm0
14016894b: 440f1395d8010000 movlps qword ptr [rbp + 0x1d8], xmm10
140168953: f30f11b5e0010000 movss dword ptr [rbp + 0x1e0], xmm6
14016895b: f3440f11b5e4010000 movss dword ptr [rbp + 0x1e4], xmm14
140168964: f3440f118de8010000 movss dword ptr [rbp + 0x1e8], xmm9
14016896d: f30f117c2430 movss dword ptr [rsp + 0x30], xmm7
140168973: f3440f11442428 movss dword ptr [rsp + 0x28], xmm8
14016897a: 4c897c2420 mov qword ptr [rsp + 0x20], r15
14016897f: 48c744244000000000 mov qword ptr [rsp + 0x40], 0
140168988: 48c744243804000000 mov qword ptr [rsp + 0x38], 4
140168991: 4c89e1 mov rcx, r12
140168994: 4c89ea mov rdx, r13
140168997: 41b003 mov r8b, 3
14016899a: 41b106 mov r9b, 6
14016899d: e8be55fdff call 0x14013df60
1401689a2: 90 nop
1401689a3: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
1401689aa: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
1401689b1: 0f8598f0ffff jne 0x140167a4f
1401689b7: 488d8d50030000 lea rcx, [rbp + 0x350]
1401689be: e8fd22a905 call 0x145bfacc0
1401689c3: 90 nop
1401689c4: e986f0ffff jmp 0x140167a4f
1401689c9: f3450f59d9 mulss xmm11, xmm9
1401689ce: 410f28c3 movaps xmm0, xmm11
1401689d2: 0f2815c746c605 movaps xmm2, xmmword ptr [rip + 0x5c646c7]
1401689d9: 0f57c2 xorps xmm0, xmm2
1401689dc: f3440f109530030000 movss xmm10, dword ptr [rbp + 0x330]
1401689e5: 410f28e3 movaps xmm4, xmm11
1401689e9: f3440f109d34030000 movss xmm11, dword ptr [rbp + 0x334]
1401689f2: 410f28cb movaps xmm1, xmm11
1401689f6: 0f57ca xorps xmm1, xmm2
1401689f9: f30f118dc0010000 movss dword ptr [rbp + 0x1c0], xmm1
140168a01: f30f108d38030000 movss xmm1, dword ptr [rbp + 0x338]
140168a09: f30f118dc4010000 movss dword ptr [rbp + 0x1c4], xmm1
140168a11: 410f28ca movaps xmm1, xmm10
140168a15: 0f57ca xorps xmm1, xmm2
140168a18: f30f118dc8010000 movss dword ptr [rbp + 0x1c8], xmm1
140168a20: 410f28c9 movaps xmm1, xmm9
140168a24: f30f590d5844c605 mulss xmm1, dword ptr [rip + 0x5c64458]
140168a2c: f30f580d944ac305 addss xmm1, dword ptr [rip + 0x5c34a94]
140168a34: f20f101d8498c705 movsd xmm3, qword ptr [rip + 0x5c79884]
140168a3c: f20f119dcc010000 movsd qword ptr [rbp + 0x1cc], xmm3
140168a44: f30f1185d4010000 movss dword ptr [rbp + 0x1d4], xmm0
140168a4c: f30f11a5d8010000 movss dword ptr [rbp + 0x1d8], xmm4
140168a54: f30f1185dc010000 movss dword ptr [rbp + 0x1dc], xmm0
140168a5c: 0f28c1 movaps xmm0, xmm1
140168a5f: 0f57c2 xorps xmm0, xmm2
140168a62: 440f28e4 movaps xmm12, xmm4
140168a66: f30f11a5e0010000 movss dword ptr [rbp + 0x1e0], xmm4
140168a6e: f30f1185e4010000 movss dword ptr [rbp + 0x1e4], xmm0
140168a76: f30f118de8010000 movss dword ptr [rbp + 0x1e8], xmm1
140168a7e: 440f28c6 movaps xmm8, xmm6
140168a82: f3440f59051948c305 mulss xmm8, dword ptr [rip + 0x5c34819]
140168a8b: 488d8df8020000 lea rcx, [rbp + 0x2f8]
140168a92: 410f28ce movaps xmm1, xmm14
140168a96: 0f28d6 movaps xmm2, xmm6
140168a99: e852edfdff call 0x1401477f0
140168a9e: 90 nop
140168a9f: 488b8d00030000 mov rcx, qword ptr [rbp + 0x300]
140168aa6: 488b8508030000 mov rax, qword ptr [rbp + 0x308]
140168aad: 4889442440 mov qword ptr [rsp + 0x40], rax
140168ab2: 48898d10030000 mov qword ptr [rbp + 0x310], rcx
140168ab9: 48894c2438 mov qword ptr [rsp + 0x38], rcx
140168abe: f3440f115c2430 movss dword ptr [rsp + 0x30], xmm11
140168ac5: f3440f11542428 movss dword ptr [rsp + 0x28], xmm10
140168acc: 4c897c2420 mov qword ptr [rsp + 0x20], r15
140168ad1: 4c89e1 mov rcx, r12
140168ad4: 4c89ea mov rdx, r13
140168ad7: 41b002 mov r8b, 2
140168ada: 41b101 mov r9b, 1
140168add: e87e54fdff call 0x14013df60
140168ae2: 90 nop
140168ae3: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
140168aea: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
140168af1: 410f28f4 movaps xmm6, xmm12
140168af5: 750d jne 0x140168b04
140168af7: 488d8d50030000 lea rcx, [rbp + 0x350]
140168afe: e8bd21a905 call 0x145bfacc0
140168b03: 90 nop
140168b04: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
140168b0b: 488d0c76 lea rcx, [rsi + rsi*2]
140168b0f: 48c1e104 shl rcx, 4
140168b13: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
140168b1a: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
140168b21: 0f109500010000 movups xmm2, xmmword ptr [rbp + 0x100]
140168b28: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
140168b2d: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
140168b32: 0f110408 movups xmmword ptr [rax + rcx], xmm0
140168b36: 48ffc6 inc rsi
140168b39: 4889b560030000 mov qword ptr [rbp + 0x360], rsi
140168b40: 488b85f8020000 mov rax, qword ptr [rbp + 0x2f8]
140168b47: 4885c0 test rax, rax
140168b4a: 741a je 0x140168b66
140168b4c: 48c1e003 shl rax, 3
140168b50: 488d1440 lea rdx, [rax + rax*2]
140168b54: 41b804000000 mov r8d, 4
140168b5a: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
140168b61: e86a96e9ff call 0x1400021d0
140168b66: 80bdf002000000 cmp byte ptr [rbp + 0x2f0], 0
140168b6d: 0f841aefffff je 0x140167a8d
140168b73: 410f28c6 movaps xmm0, xmm14
140168b77: f3410f5cc0 subss xmm0, xmm8
140168b7c: f3450f58f0 addss xmm14, xmm8
140168b81: f3440f590d6696c705 mulss xmm9, dword ptr [rip + 0x5c79666]
140168b8a: f3440f5d0dc5c2c605 minss xmm9, dword ptr [rip + 0x5c6c2c5]
140168b93: f3440f114c2440 movss dword ptr [rsp + 0x40], xmm9
140168b9a: f3440f11742438 movss dword ptr [rsp + 0x38], xmm14
140168ba1: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
140168ba7: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
140168bad: 488d8530030000 lea rax, [rbp + 0x330]
140168bb4: 4889442420 mov qword ptr [rsp + 0x20], rax
140168bb9: 4c89e1 mov rcx, r12
140168bbc: 4c89ea mov rdx, r13
140168bbf: 41b003 mov r8b, 3
140168bc2: 41b105 mov r9b, 5
140168bc5: e8c64cfdff call 0x14013d890
140168bca: 90 nop
140168bcb: 488bb560030000 mov rsi, qword ptr [rbp + 0x360]
140168bd2: 483bb550030000 cmp rsi, qword ptr [rbp + 0x350]
140168bd9: 0f8570eeffff jne 0x140167a4f
140168bdf: 488d8d50030000 lea rcx, [rbp + 0x350]
140168be6: e8d520a905 call 0x145bfacc0
140168beb: 90 nop
140168bec: e95eeeffff jmp 0x140167a4f
140168bf1: 498b4af0 mov rcx, qword ptr [r10 - 0x10]
140168bf5: 488d4168 lea rax, [rcx + 0x68]
140168bf9: 4883c16c add rcx, 0x6c
140168bfd: 4531c0 xor r8d, r8d
140168c00: 8b09 mov ecx, dword ptr [rcx]
140168c02: 8b00 mov eax, dword ptr [rax]
140168c04: c6850c01000001 mov byte ptr [rbp + 0x10c], 1
140168c0b: 448885f8000000 mov byte ptr [rbp + 0xf8], r8b
140168c12: 440fb685c2010000 movzx r8d, byte ptr [rbp + 0x1c2]
140168c1a: 4c8d8df9000000 lea r9, [rbp + 0xf9]
140168c21: 45884102 mov byte ptr [r9 + 2], r8b
140168c25: 440fb785c0010000 movzx r8d, word ptr [rbp + 0x1c0]
140168c2d: 66458901 mov word ptr [r9], r8w
140168c31: 8985fc000000 mov dword ptr [rbp + 0xfc], eax
140168c37: 898d00010000 mov dword ptr [rbp + 0x100], ecx
140168c3d: 48899504010000 mov qword ptr [rbp + 0x104], rdx
140168c44: 48c785e000000000000000 mov qword ptr [rbp + 0xe0], 0
140168c4f: 48c785e800000004000000 mov qword ptr [rbp + 0xe8], 4
140168c5a: 48c785f000000000000000 mov qword ptr [rbp + 0xf0], 0
140168c65: 0f288d20030000 movaps xmm1, xmmword ptr [rbp + 0x320]
140168c6c: 440f28e9 movaps xmm13, xmm1
140168c70: 0f28052944c605 movaps xmm0, xmmword ptr [rip + 0x5c64429]
140168c77: 440f57e8 xorps xmm13, xmm0
140168c7b: 0f57f0 xorps xmm6, xmm0
140168c7e: 0f57f8 xorps xmm7, xmm0
140168c81: f30f11b5c0010000 movss dword ptr [rbp + 0x1c0], xmm6
140168c89: f30f1085d0000000 movss xmm0, dword ptr [rbp + 0xd0]
140168c91: f30f1185c4010000 movss dword ptr [rbp + 0x1c4], xmm0
140168c99: f30f11bdc8010000 movss dword ptr [rbp + 0x1c8], xmm7
140168ca1: f30f1085c0000000 movss xmm0, dword ptr [rbp + 0xc0]
140168ca9: f30f1185cc010000 movss dword ptr [rbp + 0x1cc], xmm0
140168cb1: f3440f1195d0010000 movss dword ptr [rbp + 0x1d0], xmm10
140168cba: c785d401000000000000 mov dword ptr [rbp + 0x1d4], 0
140168cc4: f3440f11a5d8010000 movss dword ptr [rbp + 0x1d8], xmm12
140168ccd: f3440f11addc010000 movss dword ptr [rbp + 0x1dc], xmm13
140168cd6: f30f118de0010000 movss dword ptr [rbp + 0x1e0], xmm1
140168cde: f3440f1185e4010000 movss dword ptr [rbp + 0x1e4], xmm8
140168ce7: 0f2885b0020000 movaps xmm0, xmmword ptr [rbp + 0x2b0]
140168cee: f30f1185e8010000 movss dword ptr [rbp + 0x1e8], xmm0
140168cf6: 48c785d802000000000000 mov qword ptr [rbp + 0x2d8], 0
140168d01: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
140168d08: c6857703000001 mov byte ptr [rbp + 0x377], 1
140168d0f: 4c89e9 mov rcx, r13
140168d12: 4d89f8 mov r8, r15
140168d15: 4d89f9 mov r9, r15
140168d18: e80343f2ff call 0x14008d020
140168d1d: 90 nop
140168d1e: 4c8bbdd8020000 mov r15, qword ptr [rbp + 0x2d8]
140168d25: 4d85ff test r15, r15
140168d28: 0f8528040000 jne 0x140169156
140168d2e: bb04000000 mov ebx, 4
140168d33: 4531e4 xor r12d, r12d
140168d36: 4d01fc add r12, r15
140168d39: 4c89a5f0000000 mov qword ptr [rbp + 0xf0], r12
140168d40: 0f28055943c605 movaps xmm0, xmmword ptr [rip + 0x5c64359]
140168d47: 440f57f0 xorps xmm14, xmm0
140168d4b: 440f57d8 xorps xmm11, xmm0
140168d4f: f3440f11b5c0010000 movss dword ptr [rbp + 0x1c0], xmm14
140168d58: f30f1085d0000000 movss xmm0, dword ptr [rbp + 0xd0]
140168d60: f30f1185c4010000 movss dword ptr [rbp + 0x1c4], xmm0
140168d68: f3440f119dc8010000 movss dword ptr [rbp + 0x1c8], xmm11
140168d71: f30f1085c0000000 movss xmm0, dword ptr [rbp + 0xc0]
140168d79: f30f1185cc010000 movss dword ptr [rbp + 0x1cc], xmm0
140168d81: f3440f1195d0010000 movss dword ptr [rbp + 0x1d0], xmm10
140168d8a: c785d401000000000000 mov dword ptr [rbp + 0x1d4], 0
140168d94: f3440f11a5d8010000 movss dword ptr [rbp + 0x1d8], xmm12
140168d9d: f3440f11addc010000 movss dword ptr [rbp + 0x1dc], xmm13
140168da6: 0f288520030000 movaps xmm0, xmmword ptr [rbp + 0x320]
140168dad: f30f1185e0010000 movss dword ptr [rbp + 0x1e0], xmm0
140168db5: f3440f1185e4010000 movss dword ptr [rbp + 0x1e4], xmm8
140168dbe: 0f2885b0020000 movaps xmm0, xmmword ptr [rbp + 0x2b0]
140168dc5: f30f1185e8010000 movss dword ptr [rbp + 0x1e8], xmm0
140168dcd: 48c785d802000000000000 mov qword ptr [rbp + 0x2d8], 0
140168dd8: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
140168ddf: c6857703000001 mov byte ptr [rbp + 0x377], 1
140168de6: 488d8dc8020000 lea rcx, [rbp + 0x2c8]
140168ded: 4c8d85c0010000 lea r8, [rbp + 0x1c0]
140168df4: 4d89c1 mov r9, r8
140168df7: e82442f2ff call 0x14008d020
140168dfc: 90 nop
140168dfd: 488b95d0020000 mov rdx, qword ptr [rbp + 0x2d0]
140168e04: 4c8badd8020000 mov r13, qword ptr [rbp + 0x2d8]
140168e0b: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
140168e12: 4c29e0 sub rax, r12
140168e15: 4939c5 cmp r13, rax
140168e18: 0f8796030000 ja 0x1401691b4
140168e1e: 4d85ed test r13, r13
140168e21: 7419 je 0x140168e3c
140168e23: 4b8d04e4 lea rax, [r12 + r12*8]
140168e27: 488d0c83 lea rcx, [rbx + rax*4]
140168e2b: 4a8d04ad00000000 lea rax, [r13*4]
140168e33: 4c8d04c0 lea r8, [rax + rax*8]
140168e37: e8ab12a905 call 0x145bfa0e7
140168e3c: 4d01ec add r12, r13
140168e3f: 4c89a5f0000000 mov qword ptr [rbp + 0xf0], r12
140168e46: f3440f108dac000000 movss xmm9, dword ptr [rbp + 0xac]
140168e4f: f3440f580d6094c705 addss xmm9, dword ptr [rip + 0x5c79460]
140168e58: 410f28c1 movaps xmm0, xmm9
140168e5c: e8b612a905 call 0x145bfa117
140168e61: 440f28d0 movaps xmm10, xmm0
140168e65: 410f28c1 movaps xmm0, xmm9
140168e69: e8af12a905 call 0x145bfa11d
140168e6e: 440f28c8 movaps xmm9, xmm0
140168e72: f30f11b5c0010000 movss dword ptr [rbp + 0x1c0], xmm6
140168e7a: f30f1085d0000000 movss xmm0, dword ptr [rbp + 0xd0]
140168e82: f30f1185c4010000 movss dword ptr [rbp + 0x1c4], xmm0
140168e8a: f30f11bdc8010000 movss dword ptr [rbp + 0x1c8], xmm7
140168e92: f3440f1195cc010000 movss dword ptr [rbp + 0x1cc], xmm10
140168e9b: f3440f118dd0010000 movss dword ptr [rbp + 0x1d0], xmm9
140168ea4: c785d401000000000000 mov dword ptr [rbp + 0x1d4], 0
140168eae: 0f288590000000 movaps xmm0, xmmword ptr [rbp + 0x90]
140168eb5: f30f1185d8010000 movss dword ptr [rbp + 0x1d8], xmm0
140168ebd: f3440f11addc010000 movss dword ptr [rbp + 0x1dc], xmm13
140168ec6: 0f288520030000 movaps xmm0, xmmword ptr [rbp + 0x320]
140168ecd: f30f1185e0010000 movss dword ptr [rbp + 0x1e0], xmm0
140168ed5: f3440f1185e4010000 movss dword ptr [rbp + 0x1e4], xmm8
140168ede: 0f2885b0020000 movaps xmm0, xmmword ptr [rbp + 0x2b0]
140168ee5: f30f1185e8010000 movss dword ptr [rbp + 0x1e8], xmm0
140168eed: 48c785d802000000000000 mov qword ptr [rbp + 0x2d8], 0
140168ef8: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
140168eff: c6857703000001 mov byte ptr [rbp + 0x377], 1
140168f06: 488d8dc8020000 lea rcx, [rbp + 0x2c8]
140168f0d: 4c8d85c0010000 lea r8, [rbp + 0x1c0]
140168f14: 4d89c1 mov r9, r8
140168f17: e80441f2ff call 0x14008d020
140168f1c: 90 nop
140168f1d: 488b95d0020000 mov rdx, qword ptr [rbp + 0x2d0]
140168f24: 4c8badd8020000 mov r13, qword ptr [rbp + 0x2d8]
140168f2b: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
140168f32: 4c29e0 sub rax, r12
140168f35: 4939c5 cmp r13, rax
140168f38: 0f87b8020000 ja 0x1401691f6
140168f3e: 4d85ed test r13, r13
140168f41: 7420 je 0x140168f63
140168f43: 4b8d0ce4 lea rcx, [r12 + r12*8]
140168f47: 48c1e102 shl rcx, 2
140168f4b: 48038de8000000 add rcx, qword ptr [rbp + 0xe8]
140168f52: 4a8d04ad00000000 lea rax, [r13*4]
140168f5a: 4c8d04c0 lea r8, [rax + rax*8]
140168f5e: e88411a905 call 0x145bfa0e7
140168f63: 4d01ec add r12, r13
140168f66: 4c89a5f0000000 mov qword ptr [rbp + 0xf0], r12
140168f6d: 0f28052c41c605 movaps xmm0, xmmword ptr [rip + 0x5c6412c]
140168f74: 0f288d80000000 movaps xmm1, xmmword ptr [rbp + 0x80]
140168f7b: 0f57c8 xorps xmm1, xmm0
140168f7e: 440f57f8 xorps xmm15, xmm0
140168f82: f30f118dc0010000 movss dword ptr [rbp + 0x1c0], xmm1
140168f8a: f30f1085d0000000 movss xmm0, dword ptr [rbp + 0xd0]
140168f92: f30f1185c4010000 movss dword ptr [rbp + 0x1c4], xmm0
140168f9a: f3440f11bdc8010000 movss dword ptr [rbp + 0x1c8], xmm15
140168fa3: f3440f1195cc010000 movss dword ptr [rbp + 0x1cc], xmm10
140168fac: f3440f118dd0010000 movss dword ptr [rbp + 0x1d0], xmm9
140168fb5: c785d401000000000000 mov dword ptr [rbp + 0x1d4], 0
140168fbf: 0f288590000000 movaps xmm0, xmmword ptr [rbp + 0x90]
140168fc6: f30f1185d8010000 movss dword ptr [rbp + 0x1d8], xmm0
140168fce: f3440f11addc010000 movss dword ptr [rbp + 0x1dc], xmm13
140168fd7: 0f288520030000 movaps xmm0, xmmword ptr [rbp + 0x320]
140168fde: f30f1185e0010000 movss dword ptr [rbp + 0x1e0], xmm0
140168fe6: f3440f1185e4010000 movss dword ptr [rbp + 0x1e4], xmm8
140168fef: 0f2885b0020000 movaps xmm0, xmmword ptr [rbp + 0x2b0]
140168ff6: f30f1185e8010000 movss dword ptr [rbp + 0x1e8], xmm0
140168ffe: 48c785d802000000000000 mov qword ptr [rbp + 0x2d8], 0
140169009: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
140169010: c6857703000001 mov byte ptr [rbp + 0x377], 1
140169017: 488d8dc8020000 lea rcx, [rbp + 0x2c8]
14016901e: 4c8d85c0010000 lea r8, [rbp + 0x1c0]
140169025: 4d89c1 mov r9, r8
140169028: e8f33ff2ff call 0x14008d020
14016902d: 90 nop
14016902e: 4c8bbdd0020000 mov r15, qword ptr [rbp + 0x2d0]
140169035: 4c8badd8020000 mov r13, qword ptr [rbp + 0x2d8]
14016903c: 488b8de0000000 mov rcx, qword ptr [rbp + 0xe0]
140169043: 4889c8 mov rax, rcx
140169046: 4c29e0 sub rax, r12
140169049: 4939c5 cmp r13, rax
14016904c: 0f87df010000 ja 0x140169231
140169052: 48898d20030000 mov qword ptr [rbp + 0x320], rcx
140169059: 488b9de8000000 mov rbx, qword ptr [rbp + 0xe8]
140169060: 4d85ed test r13, r13
140169063: 741c je 0x140169081
140169065: 4b8d04e4 lea rax, [r12 + r12*8]
140169069: 488d0c83 lea rcx, [rbx + rax*4]
14016906d: 4a8d04ad00000000 lea rax, [r13*4]
140169075: 4c8d04c0 lea r8, [rax + rax*8]
140169079: 4c89fa mov rdx, r15
14016907c: e86610a905 call 0x145bfa0e7
140169081: 48899db0020000 mov qword ptr [rbp + 0x2b0], rbx
140169088: 4d01ec add r12, r13
14016908b: 4c89a5f0000000 mov qword ptr [rbp + 0xf0], r12
140169092: 488b9d60030000 mov rbx, qword ptr [rbp + 0x360]
140169099: 483b9d50030000 cmp rbx, qword ptr [rbp + 0x350]
1401690a0: 440f289d10030000 movaps xmm11, xmmword ptr [rbp + 0x310]
1401690a8: 750d jne 0x1401690b7
1401690aa: 488d8d50030000 lea rcx, [rbp + 0x350]
1401690b1: e80a1ca905 call 0x145bfacc0
1401690b6: 90 nop
1401690b7: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401690be: 488d0c5b lea rcx, [rbx + rbx*2]
1401690c2: 48c1e104 shl rcx, 4
1401690c6: 488b9520030000 mov rdx, qword ptr [rbp + 0x320]
1401690cd: 48891408 mov qword ptr [rax + rcx], rdx
1401690d1: 488b95b0020000 mov rdx, qword ptr [rbp + 0x2b0]
1401690d8: 4889540808 mov qword ptr [rax + rcx + 8], rdx
1401690dd: 488d95f9000000 lea rdx, [rbp + 0xf9]
1401690e4: 0f1042f7 movups xmm0, xmmword ptr [rdx - 9]
1401690e8: 0f104a07 movups xmm1, xmmword ptr [rdx + 7]
1401690ec: 0f11440810 movups xmmword ptr [rax + rcx + 0x10], xmm0
1401690f1: 0f114c0820 movups xmmword ptr [rax + rcx + 0x20], xmm1
1401690f6: 48ffc3 inc rbx
1401690f9: 48899d60030000 mov qword ptr [rbp + 0x360], rbx
140169100: 4c8dbdc0010000 lea r15, [rbp + 0x1c0]
140169107: 4c8da5e0000000 lea r12, [rbp + 0xe0]
14016910e: 4c8dadc8020000 lea r13, [rbp + 0x2c8]
140169115: e9c5e4ffff jmp 0x1401675df
14016911a: 48899d20030000 mov qword ptr [rbp + 0x320], rbx
140169121: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
14016912a: 41b904000000 mov r9d, 4
140169130: 488d8dc0010000 lea rcx, [rbp + 0x1c0]
140169137: 4c89e2 mov rdx, r12
14016913a: 4d89f8 mov r8, r15
14016913d: e82e18a905 call 0x145bfa970
140169142: 90 nop
140169143: 4c8ba5d0010000 mov r12, qword ptr [rbp + 0x1d0]
14016914a: 488b9d20030000 mov rbx, qword ptr [rbp + 0x320]
140169151: e94debffff jmp 0x140167ca3
140169156: 4c8badd0020000 mov r13, qword ptr [rbp + 0x2d0]
14016915d: c6857703000001 mov byte ptr [rbp + 0x377], 1
140169164: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
14016916d: 41b904000000 mov r9d, 4
140169173: 488d8de0000000 lea rcx, [rbp + 0xe0]
14016917a: 31d2 xor edx, edx
14016917c: 4d89f8 mov r8, r15
14016917f: e8ec17a905 call 0x145bfa970
140169184: 90 nop
140169185: 488b9de8000000 mov rbx, qword ptr [rbp + 0xe8]
14016918c: 4c8ba5f0000000 mov r12, qword ptr [rbp + 0xf0]
140169193: 4b8d04e4 lea rax, [r12 + r12*8]
140169197: 488d0c83 lea rcx, [rbx + rax*4]
14016919b: 4a8d04bd00000000 lea rax, [r15*4]
1401691a3: 4c8d04c0 lea r8, [rax + rax*8]
1401691a7: 4c89ea mov rdx, r13
1401691aa: e8380fa905 call 0x145bfa0e7
1401691af: e982fbffff jmp 0x140168d36
1401691b4: 4989d7 mov r15, rdx
1401691b7: c6857703000001 mov byte ptr [rbp + 0x377], 1
1401691be: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
1401691c7: 41b904000000 mov r9d, 4
1401691cd: 488d8de0000000 lea rcx, [rbp + 0xe0]
1401691d4: 4c89e2 mov rdx, r12
1401691d7: 4d89e8 mov r8, r13
1401691da: e89117a905 call 0x145bfa970
1401691df: 90 nop
1401691e0: 488b9de8000000 mov rbx, qword ptr [rbp + 0xe8]
1401691e7: 4c8ba5f0000000 mov r12, qword ptr [rbp + 0xf0]
1401691ee: 4c89fa mov rdx, r15
1401691f1: e92dfcffff jmp 0x140168e23
1401691f6: 4889d3 mov rbx, rdx
1401691f9: c6857703000001 mov byte ptr [rbp + 0x377], 1
140169200: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140169209: 41b904000000 mov r9d, 4
14016920f: 488d8de0000000 lea rcx, [rbp + 0xe0]
140169216: 4c89e2 mov rdx, r12
140169219: 4d89e8 mov r8, r13
14016921c: e84f17a905 call 0x145bfa970
140169221: 90 nop
140169222: 4c8ba5f0000000 mov r12, qword ptr [rbp + 0xf0]
140169229: 4889da mov rdx, rbx
14016922c: e912fdffff jmp 0x140168f43
140169231: c6857703000001 mov byte ptr [rbp + 0x377], 1
140169238: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140169241: 41b904000000 mov r9d, 4
140169247: 488d8de0000000 lea rcx, [rbp + 0xe0]
14016924e: 4c89e2 mov rdx, r12
140169251: 4d89e8 mov r8, r13
140169254: e81717a905 call 0x145bfa970
140169259: 90 nop
14016925a: 4c8ba5f0000000 mov r12, qword ptr [rbp + 0xf0]
140169261: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
140169268: 48898520030000 mov qword ptr [rbp + 0x320], rax
14016926f: 488b9de8000000 mov rbx, qword ptr [rbp + 0xe8]
140169276: e9eafdffff jmp 0x140169065
14016927b: 488d0d799cc705 lea rcx, [rip + 0x5c79c79]
140169282: 4c8d058f9cc705 lea r8, [rip + 0x5c79c8f]
140169289: ba16000000 mov edx, 0x16
14016928e: e8dd02c305 call 0x145d99570
140169293: 90 nop
140169294: e9c9000000 jmp 0x140169362
140169299: 488b85c8020000 mov rax, qword ptr [rbp + 0x2c8]
1401692a0: 4885c0 test rax, rax
1401692a3: 741a je 0x1401692bf
1401692a5: 488b8dd0020000 mov rcx, qword ptr [rbp + 0x2d0]
1401692ac: 48c1e002 shl rax, 2
1401692b0: 488d14c0 lea rdx, [rax + rax*8]
1401692b4: 41b804000000 mov r8d, 4
1401692ba: e8118fe9ff call 0x1400021d0
1401692bf: 0f28b580030000 movaps xmm6, xmmword ptr [rbp + 0x380]
1401692c6: 0f28bd90030000 movaps xmm7, xmmword ptr [rbp + 0x390]
1401692cd: 440f2885a0030000 movaps xmm8, xmmword ptr [rbp + 0x3a0]
1401692d5: 440f288db0030000 movaps xmm9, xmmword ptr [rbp + 0x3b0]
1401692dd: 440f2895c0030000 movaps xmm10, xmmword ptr [rbp + 0x3c0]
1401692e5: 440f289dd0030000 movaps xmm11, xmmword ptr [rbp + 0x3d0]
1401692ed: 440f28a5e0030000 movaps xmm12, xmmword ptr [rbp + 0x3e0]
1401692f5: 440f28adf0030000 movaps xmm13, xmmword ptr [rbp + 0x3f0]
1401692fd: 440f28b500040000 movaps xmm14, xmmword ptr [rbp + 0x400]
140169305: 440f28bd10040000 movaps xmm15, xmmword ptr [rbp + 0x410]
14016930d: 4881c4a8040000 add rsp, 0x4a8
140169314: 5b pop rbx
140169315: 5f pop rdi
140169316: 5e pop rsi
140169317: 415c pop r12
140169319: 415d pop r13
14016931b: 415e pop r14
14016931d: 415f pop r15
14016931f: 5d pop rbp
140169320: c3 ret
140169321: 0f1085c8020000 movups xmm0, xmmword ptr [rbp + 0x2c8]
140169328: 0f2985e0000000 movaps xmmword ptr [rbp + 0xe0], xmm0
14016932f: c6857503000000 mov byte ptr [rbp + 0x375], 0
140169336: 488d05db95c705 lea rax, [rip + 0x5c795db]
14016933d: 4889442420 mov qword ptr [rsp + 0x20], rax
140169342: 488d0da799c705 lea rcx, [rip + 0x5c799a7]
140169349: 4c8d0d8099c705 lea r9, [rip + 0x5c79980]
140169350: 4c8d85e0000000 lea r8, [rbp + 0xe0]
140169357: ba2b000000 mov edx, 0x2b
14016935c: e86f02c305 call 0x145d995d0
140169361: 90 nop
140169362: 0f0b ud2
