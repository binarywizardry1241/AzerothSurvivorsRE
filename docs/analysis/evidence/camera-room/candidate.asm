; candidate 0x1409311b0..0x1409313e4
1409311b0: 4157 push r15
1409311b2: 4156 push r14
1409311b4: 56 push rsi
1409311b5: 57 push rdi
1409311b6: 53 push rbx
1409311b7: 4881ecd0000000 sub rsp, 0xd0
1409311be: 440f29a424c0000000 movaps xmmword ptr [rsp + 0xc0], xmm12
1409311c7: 440f299c24b0000000 movaps xmmword ptr [rsp + 0xb0], xmm11
1409311d0: 440f299424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm10
1409311d9: 440f298c2490000000 movaps xmmword ptr [rsp + 0x90], xmm9
1409311e2: 440f29842480000000 movaps xmmword ptr [rsp + 0x80], xmm8
1409311eb: 0f297c2470 movaps xmmword ptr [rsp + 0x70], xmm7
1409311f0: 0f29742460 movaps xmmword ptr [rsp + 0x60], xmm6
1409311f5: 488b4110 mov rax, qword ptr [rcx + 0x10]
1409311f9: 488b00 mov rax, qword ptr [rax]
1409311fc: f30f10052cf65905 movss xmm0, dword ptr [rip + 0x559f62c]
140931204: f30f5c00 subss xmm0, dword ptr [rax]
140931208: 0f57f6 xorps xmm6, xmm6
14093120b: f30f2af2 cvtsi2ss xmm6, edx
14093120f: f30f59f0 mulss xmm6, xmm0
140931213: f30f5e35f5c04605 divss xmm6, dword ptr [rip + 0x546c0f5]
14093121b: 4c8b39 mov r15, qword ptr [rcx]
14093121e: 488b4108 mov rax, qword ptr [rcx + 8]
140931222: f30f1038 movss xmm7, dword ptr [rax]
140931226: f30f58fe addss xmm7, xmm6
14093122a: 4d8b37 mov r14, qword ptr [r15]
14093122d: 498b4708 mov rax, qword ptr [r15 + 8]
140931231: 488b30 mov rsi, qword ptr [rax]
140931234: f3440f104608 movss xmm8, dword ptr [rsi + 8]
14093123a: 450f28d8 movaps xmm11, xmm8
14093123e: f3450f59d8 mulss xmm11, xmm8
140931243: 0f28c7 movaps xmm0, xmm7
140931246: e8d28e2c05 call 0x145bfa11d
14093124b: 498b5f10 mov rbx, qword ptr [r15 + 0x10]
14093124f: f3440f1013 movss xmm10, dword ptr [rbx]
140931254: f2450f100e movsd xmm9, qword ptr [r14]
140931259: f20f100e movsd xmm1, qword ptr [rsi]
14093125d: 0f28d1 movaps xmm2, xmm1
140931260: 0f59d1 mulps xmm2, xmm1
140931263: f30f16da movshdup xmm3, xmm2
140931267: f30f58da addss xmm3, xmm2
14093126b: f3410f58db addss xmm3, xmm11
140931270: 0f57d2 xorps xmm2, xmm2
140931273: f30f51d3 sqrtss xmm2, xmm3
140931277: f3440f101d20c04605 movss xmm11, dword ptr [rip + 0x546c020]
140931280: f3440f5eda divss xmm11, xmm2
140931285: f3410f12d3 movsldup xmm2, xmm11
14093128a: 0f59d1 mulps xmm2, xmm1
14093128d: f3450f59d8 mulss xmm11, xmm8
140931292: f3440f12e0 movsldup xmm12, xmm0
140931297: 440f59e2 mulps xmm12, xmm2
14093129b: f3440f59d8 mulss xmm11, xmm0
1409312a0: 0f28c7 movaps xmm0, xmm7
1409312a3: e86f8e2c05 call 0x145bfa117
1409312a8: f30f12f8 movsldup xmm7, xmm0
1409312ac: 0f593d8dc14605 mulps xmm7, xmmword ptr [rip + 0x546c18d]
1409312b3: 440f58e7 addps xmm12, xmm7
1409312b7: f3410f58fb addss xmm7, xmm11
1409312bc: f3450f12c2 movsldup xmm8, xmm10
1409312c1: 450f59c4 mulps xmm8, xmm12
1409312c5: f3410f59fa mulss xmm7, xmm10
1409312ca: f3410f587e08 addss xmm7, dword ptr [r14 + 8]
1409312d0: 450f58c1 addps xmm8, xmm9
1409312d4: 440f13442440 movlps qword ptr [rsp + 0x40], xmm8
1409312da: f30f117c2448 movss dword ptr [rsp + 0x48], xmm7
1409312e0: 498b4718 mov rax, qword ptr [r15 + 0x18]
1409312e4: 488b08 mov rcx, qword ptr [rax]
1409312e7: 488b7008 mov rsi, qword ptr [rax + 8]
1409312eb: 488b39 mov rdi, qword ptr [rcx]
1409312ee: 488b4010 mov rax, qword ptr [rax + 0x10]
1409312f2: 488b08 mov rcx, qword ptr [rax]
1409312f5: 488b4008 mov rax, qword ptr [rax + 8]
1409312f9: 488b09 mov rcx, qword ptr [rcx]
1409312fc: 488b10 mov rdx, qword ptr [rax]
1409312ff: 8b442448 mov eax, dword ptr [rsp + 0x48]
140931303: 89442438 mov dword ptr [rsp + 0x38], eax
140931307: 488b442440 mov rax, qword ptr [rsp + 0x40]
14093130c: 4889442430 mov qword ptr [rsp + 0x30], rax
140931311: 4c8d442430 lea r8, [rsp + 0x30]
140931316: e8956ddd00 call 0x1417080b0
14093131b: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
140931321: 488d4c2440 lea rcx, [rsp + 0x40]
140931326: 4889fa mov rdx, rdi
140931329: 4989f0 mov r8, rsi
14093132c: 4189c1 mov r9d, eax
14093132f: e84c590100 call 0x140946c80
140931334: 84c0 test al, al
140931336: 745f je 0x140931397
140931338: 498b4f20 mov rcx, qword ptr [r15 + 0x20]
14093133c: 418b4608 mov eax, dword ptr [r14 + 8]
140931340: 89442458 mov dword ptr [rsp + 0x58], eax
140931344: 498b06 mov rax, qword ptr [r14]
140931347: 4889442450 mov qword ptr [rsp + 0x50], rax
14093134c: f3410f5c7e08 subss xmm7, dword ptr [r14 + 8]
140931352: f2410f1006 movsd xmm0, qword ptr [r14]
140931357: 440f5cc0 subps xmm8, xmm0
14093135b: 440f13442430 movlps qword ptr [rsp + 0x30], xmm8
140931361: f30f117c2438 movss dword ptr [rsp + 0x38], xmm7
140931367: 31f6 xor esi, esi
140931369: 488d542450 lea rdx, [rsp + 0x50]
14093136e: 4c8d442430 lea r8, [rsp + 0x30]
140931373: 4531c9 xor r9d, r9d
140931376: e8755dc900 call 0x1415c70f0
14093137b: a801 test al, 1
14093137d: 7411 je 0x140931390
14093137f: f30f100b movss xmm1, dword ptr [rbx]
140931383: f30f590d95114b05 mulss xmm1, dword ptr [rip + 0x54b1195]
14093138b: 0f2ec1 ucomiss xmm0, xmm1
14093138e: 7209 jb 0x140931399
140931390: be01000000 mov esi, 1
140931395: eb02 jmp 0x140931399
140931397: 31f6 xor esi, esi
140931399: 89f0 mov eax, esi
14093139b: 0f28c6 movaps xmm0, xmm6
14093139e: 0f28742460 movaps xmm6, xmmword ptr [rsp + 0x60]
1409313a3: 0f287c2470 movaps xmm7, xmmword ptr [rsp + 0x70]
1409313a8: 440f28842480000000 movaps xmm8, xmmword ptr [rsp + 0x80]
1409313b1: 440f288c2490000000 movaps xmm9, xmmword ptr [rsp + 0x90]
1409313ba: 440f289424a0000000 movaps xmm10, xmmword ptr [rsp + 0xa0]
1409313c3: 440f289c24b0000000 movaps xmm11, xmmword ptr [rsp + 0xb0]
1409313cc: 440f28a424c0000000 movaps xmm12, xmmword ptr [rsp + 0xc0]
1409313d5: 4881c4d0000000 add rsp, 0xd0
1409313dc: 5b pop rbx
1409313dd: 5f pop rdi
1409313de: 5e pop rsi
1409313df: 415e pop r14
1409313e1: 415f pop r15
1409313e3: c3 ret 
