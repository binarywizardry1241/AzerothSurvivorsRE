14593dd90: 55 push rbp
14593dd91: 4157 push r15
14593dd93: 4156 push r14
14593dd95: 4155 push r13
14593dd97: 4154 push r12
14593dd99: 56 push rsi
14593dd9a: 57 push rdi
14593dd9b: 53 push rbx
14593dd9c: 4881ece8020000 sub rsp, 0x2e8
14593dda3: 488dac2480000000 lea rbp, [rsp + 0x80]
14593ddab: 440f29bd50020000 movaps xmmword ptr [rbp + 0x250], xmm15
14593ddb3: 440f29b540020000 movaps xmmword ptr [rbp + 0x240], xmm14
14593ddbb: 440f29ad30020000 movaps xmmword ptr [rbp + 0x230], xmm13
14593ddc3: 440f29a520020000 movaps xmmword ptr [rbp + 0x220], xmm12
14593ddcb: 440f299d10020000 movaps xmmword ptr [rbp + 0x210], xmm11
14593ddd3: 440f299500020000 movaps xmmword ptr [rbp + 0x200], xmm10
14593dddb: 440f298df0010000 movaps xmmword ptr [rbp + 0x1f0], xmm9
14593dde3: 440f2985e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm8
14593ddeb: 0f29bdd0010000 movaps xmmword ptr [rbp + 0x1d0], xmm7
14593ddf2: 0f29b5c0010000 movaps xmmword ptr [rbp + 0x1c0], xmm6
14593ddf9: 48c785b8010000feffffff mov qword ptr [rbp + 0x1b8], 0xfffffffffffffffe
14593de04: 4c89c7 mov rdi, r8
14593de07: 4989d6 mov r14, rdx
14593de0a: 4889ce mov rsi, rcx
14593de0d: 4c8b8170050000 mov r8, qword ptr [rcx + 0x570]
14593de14: 4d85c0 test r8, r8
14593de17: 741a je 0x14593de33
14593de19: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
14593de20: 4489c2 mov edx, r8d
14593de23: 83e203 and edx, 3
14593de26: 4983f804 cmp r8, 4
14593de2a: 730e jae 0x14593de3a
14593de2c: 4531c9 xor r9d, r9d
14593de2f: 31c9 xor ecx, ecx
14593de31: eb66 jmp 0x14593de99
14593de33: 31c9 xor ecx, ecx
14593de35: e99d000000 jmp 0x14593ded7
14593de3a: 4983e0fc and r8, 0xfffffffffffffffc
14593de3e: 4c8d9038060000 lea r10, [rax + 0x638]
14593de45: 4531c9 xor r9d, r9d
14593de48: 31c9 xor ecx, ecx
14593de4a: 660f1f440000 nop word ptr [rax + rax]
14593de50: 458b9a78faffff mov r11d, dword ptr [r10 - 0x588]
14593de57: 418b9a50fcffff mov ebx, dword ptr [r10 - 0x3b0]
14593de5e: 4983f301 xor r11, 1
14593de62: 4901cb add r11, rcx
14593de65: 4883f301 xor rbx, 1
14593de69: 458bba28feffff mov r15d, dword ptr [r10 - 0x1d8]
14593de70: 4983f701 xor r15, 1
14593de74: 4901df add r15, rbx
14593de77: 4d01df add r15, r11
14593de7a: 418b0a mov ecx, dword ptr [r10]
14593de7d: 4883f101 xor rcx, 1
14593de81: 4c01f9 add rcx, r15
14593de84: 4983c104 add r9, 4
14593de88: 4981c260070000 add r10, 0x760
14593de8f: 4d39c8 cmp r8, r9
14593de92: 75bc jne 0x14593de50
14593de94: 4885d2 test rdx, rdx
14593de97: 743e je 0x14593ded7
14593de99: 4d69c1d8010000 imul r8, r9, 0x1d8
14593dea0: 4c01c0 add rax, r8
14593dea3: 4805b0000000 add rax, 0xb0
14593dea9: 4869d2d8010000 imul rdx, rdx, 0x1d8
14593deb0: 4531c0 xor r8d, r8d
14593deb3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593dec0: 468b0c00 mov r9d, dword ptr [rax + r8]
14593dec4: 4983f101 xor r9, 1
14593dec8: 4c01c9 add rcx, r9
14593decb: 4981c0d8010000 add r8, 0x1d8
14593ded2: 4c39c2 cmp rdx, r8
14593ded5: 75e9 jne 0x14593dec0
14593ded7: 0fb786c8020000 movzx eax, word ptr [rsi + 0x2c8]
14593dede: f30f2ac0 cvtsi2ss xmm0, eax
14593dee2: f30f5e059ef54600 divss xmm0, dword ptr [rip + 0x46f59e]
14593deea: f30f5905ce105500 mulss xmm0, dword ptr [rip + 0x5510ce]
14593def2: f3480f2cc0 cvttss2si rax, xmm0
14593def7: 4889c2 mov rdx, rax
14593defa: 48c1fa3f sar rdx, 0x3f
14593defe: 0f28c8 movaps xmm1, xmm0
14593df01: f30f5c0d378a4700 subss xmm1, dword ptr [rip + 0x478a37]
14593df09: f34c0f2cc1 cvttss2si r8, xmm1
14593df0e: 4921d0 and r8, rdx
14593df11: 4909c0 or r8, rax
14593df14: 31c0 xor eax, eax
14593df16: 0f57c9 xorps xmm1, xmm1
14593df19: 0f2ec1 ucomiss xmm0, xmm1
14593df1c: 4c0f42c0 cmovb r8, rax
14593df20: 0f2e051d8a4700 ucomiss xmm0, dword ptr [rip + 0x478a1d]
14593df27: 48c7c2ffffffff mov rdx, 0xffffffffffffffff
14593df2e: 490f46d0 cmovbe rdx, r8
14593df32: 4883fa33 cmp rdx, 0x33
14593df36: 41b832000000 mov r8d, 0x32
14593df3c: 4c0f43c2 cmovae r8, rdx
14593df40: 4983f878 cmp r8, 0x78
14593df44: ba78000000 mov edx, 0x78
14593df49: 490f42d0 cmovb rdx, r8
14593df4d: 4839d1 cmp rcx, rdx
14593df50: 0f834f070000 jae 0x14593e6a5
14593df56: 488b8ea8020000 mov rcx, qword ptr [rsi + 0x2a8]
14593df5d: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
14593df64: e857aef5ff call 0x145898dc0
14593df69: 4869c0f0000000 imul rax, rax, 0xf0
14593df70: 488d1db9462b01 lea rbx, [rip + 0x12b46b9]
14593df77: 488b941880000000 mov rdx, qword ptr [rax + rbx + 0x80]
14593df7f: 488d4aff lea rcx, [rdx - 1]
14593df83: 4c39f1 cmp rcx, r14
14593df86: 4c0f42f1 cmovb r14, rcx
14593df8a: 4939d6 cmp r14, rdx
14593df8d: 0f8377070000 jae 0x14593e70a
14593df93: 4801c3 add rbx, rax
14593df96: 4f8d3cb6 lea r15, [r14 + r14*4]
14593df9a: 49c1e704 shl r15, 4
14593df9e: 4c037b78 add r15, qword ptr [rbx + 0x78]
14593dfa2: 803f00 cmp byte ptr [rdi], 0
14593dfa5: 7416 je 0x14593dfbd
14593dfa7: 8b470c mov eax, dword ptr [rdi + 0xc]
14593dfaa: 8985b0010000 mov dword ptr [rbp + 0x1b0], eax
14593dfb0: 488b4704 mov rax, qword ptr [rdi + 4]
14593dfb4: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
14593dfbb: eb27 jmp 0x14593dfe4
14593dfbd: c74424200000003f mov dword ptr [rsp + 0x20], 0x3f000000
14593dfc5: 488d8da8010000 lea rcx, [rbp + 0x1a8]
14593dfcc: f30f10154c834c00 movss xmm2, dword ptr [rip + 0x4c834c]
14593dfd4: f30f101dfccf4700 movss xmm3, dword ptr [rip + 0x47cffc]
14593dfdc: 4889f2 mov rdx, rsi
14593dfdf: e81cf5ffff call 0x14593d500
14593dfe4: f30f10864c0a0000 movss xmm0, dword ptr [rsi + 0xa4c]
14593dfec: 0f28f0 movaps xmm6, xmm0
14593dfef: f30f5e35e9a74700 divss xmm6, dword ptr [rip + 0x47a7e9]
14593dff7: 450f57c9 xorps xmm9, xmm9
14593dffb: 83be8809000001 cmp dword ptr [rsi + 0x988], 1
14593e002: 7524 jne 0x14593e028
14593e004: 80bed00a000000 cmp byte ptr [rsi + 0xad0], 0
14593e00b: 741b je 0x14593e028
14593e00d: f30f5c868c090000 subss xmm0, dword ptr [rsi + 0x98c]
14593e015: f30f5e05c3a74700 divss xmm0, dword ptr [rip + 0x47a7c3]
14593e01d: 0f57c9 xorps xmm1, xmm1
14593e020: f30f5fc1 maxss xmm0, xmm1
14593e024: 440f28c8 movaps xmm9, xmm0
14593e028: 410fb6574c movzx edx, byte ptr [r15 + 0x4c]
14593e02d: 488d058ceb0200 lea rax, [rip + 0x2eb8c]
14593e034: 488d0dd5eb0200 lea rcx, [rip + 0x2ebd5]
14593e03b: 8895b7010000 mov byte ptr [rbp + 0x1b7], dl
14593e041: 84d2 test dl, dl
14593e043: 480f45c8 cmovne rcx, rax
14593e047: 66440f6eaeca020000 movd xmm13, dword ptr [rsi + 0x2ca]
14593e050: 0fb786ce020000 movzx eax, word ptr [rsi + 0x2ce]
14593e057: 668985b4010000 mov word ptr [rbp + 0x1b4], ax
14593e05e: f3450f105730 movss xmm10, dword ptr [r15 + 0x30]
14593e064: f30f108be0000000 movss xmm1, dword ptr [rbx + 0xe0]
14593e06c: f3440f10b3e4000000 movss xmm14, dword ptr [rbx + 0xe4]
14593e075: f30f598ec00a0000 mulss xmm1, dword ptr [rsi + 0xac0]
14593e07d: 0f28c6 movaps xmm0, xmm6
14593e080: f30f118da0010000 movss dword ptr [rbp + 0x1a0], xmm1
14593e088: ffd1 call rcx
14593e08a: 440f28c0 movaps xmm8, xmm0
14593e08e: f3410f104734 movss xmm0, dword ptr [r15 + 0x34]
14593e094: f30f1185a4010000 movss dword ptr [rbp + 0x1a4], xmm0
14593e09c: 418b4720 mov eax, dword ptr [r15 + 0x20]
14593e0a0: 48898598010000 mov qword ptr [rbp + 0x198], rax
14593e0a7: 448bae780a0000 mov r13d, dword ptr [rsi + 0xa78]
14593e0ae: 41ffc5 inc r13d
14593e0b1: 4489ae780a0000 mov dword ptr [rsi + 0xa78], r13d
14593e0b8: 4c8bb6b8090000 mov r14, qword ptr [rsi + 0x9b8]
14593e0bf: 488bbec0090000 mov rdi, qword ptr [rsi + 0x9c0]
14593e0c6: 488b9ed0090000 mov rbx, qword ptr [rsi + 0x9d0]
14593e0cd: 4c8ba6c8090000 mov r12, qword ptr [rsi + 0x9c8]
14593e0d4: f3440f10258b324700 movss xmm12, dword ptr [rip + 0x47328b]
14593e0dd: f30f1005bb364700 movss xmm0, dword ptr [rip + 0x4736bb]
14593e0e5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593e0f0: 498d041e lea rax, [r14 + rbx]
14593e0f4: 48c1c017 rol rax, 0x17
14593e0f8: 4c01f0 add rax, r14
14593e0fb: 4889f9 mov rcx, rdi
14593e0fe: 48c1e111 shl rcx, 0x11
14593e102: 4d31f4 xor r12, r14
14593e105: 4831fb xor rbx, rdi
14593e108: 4c31e7 xor rdi, r12
14593e10b: 4931de xor r14, rbx
14593e10e: 48c1c32d rol rbx, 0x2d
14593e112: 4931cc xor r12, rcx
14593e115: 48c1e829 shr rax, 0x29
14593e119: 0d0000803f or eax, 0x3f800000
14593e11e: 66440f6ed8 movd xmm11, eax
14593e123: f3450f58dc addss xmm11, xmm12
14593e128: f3440f59d8 mulss xmm11, xmm0
14593e12d: 410f2ec3 ucomiss xmm0, xmm11
14593e131: 76bd jbe 0x14593e0f0
14593e133: 80bdb701000000 cmp byte ptr [rbp + 0x1b7], 0
14593e13a: 7518 jne 0x14593e154
14593e13c: f3440f103defac2c01 movss xmm15, dword ptr [rip + 0x12cacef]
14593e145: f30f101513f14600 movss xmm2, dword ptr [rip + 0x46f113]
14593e14d: 0f28fa movaps xmm7, xmm2
14593e150: 7418 je 0x14593e16a
14593e152: eb1e jmp 0x14593e172
14593e154: f3440f103dd3ac2c01 movss xmm15, dword ptr [rip + 0x12cacd3]
14593e15d: f30f1015fbf04600 movss xmm2, dword ptr [rip + 0x46f0fb]
14593e165: 0f28fa movaps xmm7, xmm2
14593e168: 7508 jne 0x14593e172
14593e16a: f30f103dae626700 movss xmm7, dword ptr [rip + 0x6762ae]
14593e172: 0f28c6 movaps xmm0, xmm6
14593e175: f30f5e05b7354700 divss xmm0, dword ptr [rip + 0x4735b7]
14593e17d: f3450f59fa mulss xmm15, xmm10
14593e182: 0f57c9 xorps xmm1, xmm1
14593e185: f30f5fc8 maxss xmm1, xmm0
14593e189: 0f28c2 movaps xmm0, xmm2
14593e18c: f30f5dc1 minss xmm0, xmm1
14593e190: f3440f59f0 mulss xmm14, xmm0
14593e195: f3440f59f0 mulss xmm14, xmm0
14593e19a: f3440f58f2 addss xmm14, xmm2
14593e19f: 660f6e055dac2c01 movd xmm0, dword ptr [rip + 0x12cac5d]
14593e1a7: 410f28c9 movaps xmm1, xmm9
14593e1ab: e8b5c22c00 call 0x145c0a465
14593e1b0: 66440f6fd0 movdqa xmm10, xmm0
14593e1b5: 660fefc0 pxor xmm0, xmm0
14593e1b9: 66440f61e8 punpcklwd xmm13, xmm0
14593e1be: 450f5bed cvtdq2ps xmm13, xmm13
14593e1c2: f30f59bda4010000 mulss xmm7, dword ptr [rbp + 0x1a4]
14593e1ca: 440f14f7 unpcklps xmm14, xmm7
14593e1ce: f30f1005baba4800 movss xmm0, dword ptr [rip + 0x48baba]
14593e1d6: f30f59c6 mulss xmm0, xmm6
14593e1da: f30f58057ef04600 addss xmm0, dword ptr [rip + 0x46f07e]
14593e1e2: f30f100d26bd7300 movss xmm1, dword ptr [rip + 0x73bd26]
14593e1ea: f30f59ce mulss xmm1, xmm6
14593e1ee: f30f59ce mulss xmm1, xmm6
14593e1f2: f30f58c8 addss xmm1, xmm0
14593e1f6: f30f1005f2ae8200 movss xmm0, dword ptr [rip + 0x82aef2]
14593e1fe: f30f59c6 mulss xmm0, xmm6
14593e202: f30f59c6 mulss xmm0, xmm6
14593e206: f30f59c6 mulss xmm0, xmm6
14593e20a: f30f58c1 addss xmm0, xmm1
14593e20e: 440f14f8 unpcklps xmm15, xmm0
14593e212: f30f1085a0010000 movss xmm0, dword ptr [rbp + 0x1a0]
14593e21a: f30f51f0 sqrtss xmm6, xmm0
14593e21e: 660f6e05daab2c01 movd xmm0, dword ptr [rip + 0x12cabda]
14593e226: 410f28c9 movaps xmm1, xmm9
14593e22a: e836c22c00 call 0x145c0a465
14593e22f: 440f14c6 unpcklps xmm8, xmm6
14593e233: 450f59c7 mulps xmm8, xmm15
14593e237: 450f59c6 mulps xmm8, xmm14
14593e23b: 66440f62d0 punpckldq xmm10, xmm0
14593e240: 440f5e2d78a41b01 divps xmm13, xmmword ptr [rip + 0x11ba478]
14593e248: 450f59d0 mulps xmm10, xmm8
14593e24c: 450f59ea mulps xmm13, xmm10
14593e250: 4c8b8598010000 mov r8, qword ptr [rbp + 0x198]
14593e257: 4489c0 mov eax, r8d
14593e25a: 25ffffff00 and eax, 0xffffff
14593e25f: 48c1e018 shl rax, 0x18
14593e263: 4181e5ffffff00 and r13d, 0xffffff
14593e26a: 4909c5 or r13, rax
14593e26d: 48b800000000000030f1 movabs rax, 0xf130000000000000
14593e277: 4c09e8 or rax, r13
14593e27a: 4c89b6b8090000 mov qword ptr [rsi + 0x9b8], r14
14593e281: 48899ed0090000 mov qword ptr [rsi + 0x9d0], rbx
14593e288: 4889bec0090000 mov qword ptr [rsi + 0x9c0], rdi
14593e28f: 4c89a6c8090000 mov qword ptr [rsi + 0x9c8], r12
14593e296: 4989c4 mov r12, rax
14593e299: f3410f104728 movss xmm0, dword ptr [r15 + 0x28]
14593e29f: 458b4f24 mov r9d, dword ptr [r15 + 0x24]
14593e2a3: 410fb6474c movzx eax, byte ptr [r15 + 0x4c]
14593e2a8: 488d8da8010000 lea rcx, [rbp + 0x1a8]
14593e2af: 48894c2438 mov qword ptr [rsp + 0x38], rcx
14593e2b4: 88442430 mov byte ptr [rsp + 0x30], al
14593e2b8: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14593e2be: f3440f116c2428 movss dword ptr [rsp + 0x28], xmm13
14593e2c5: 4889f1 mov rcx, rsi
14593e2c8: 4c89e2 mov rdx, r12
14593e2cb: e8a0e2ffff call 0x14593c570
14593e2d0: f30f10b64c0a0000 movss xmm6, dword ptr [rsi + 0xa4c]
14593e2d8: f3450f104728 movss xmm8, dword ptr [r15 + 0x28]
14593e2de: f3450f104f38 movss xmm9, dword ptr [r15 + 0x38]
14593e2e4: f3440f101513ce4700 movss xmm10, dword ptr [rip + 0x47ce13]
14593e2ed: f3450f59d0 mulss xmm10, xmm8
14593e2f2: f3440f581551a82c01 addss xmm10, dword ptr [rip + 0x12ca851]
14593e2fb: f30f103d61ef4600 movss xmm7, dword ptr [rip + 0x46ef61]
14593e303: f3410f59f9 mulss xmm7, xmm9
14593e308: 0fb785b4010000 movzx eax, word ptr [rbp + 0x1b4]
14593e30f: 450f57f6 xorps xmm14, xmm14
14593e313: f3440f2af0 cvtsi2ss xmm14, eax
14593e318: f3440f5e3567f14600 divss xmm14, dword ptr [rip + 0x46f167]
14593e321: f3440f593526015800 mulss xmm14, dword ptr [rip + 0x580126]
14593e32a: 410fb65f4c movzx ebx, byte ptr [r15 + 0x4c]
14593e32f: f3450f59773c mulss xmm14, dword ptr [r15 + 0x3c]
14593e335: 488b96b8090000 mov rdx, qword ptr [rsi + 0x9b8]
14593e33c: 488b86c0090000 mov rax, qword ptr [rsi + 0x9c0]
14593e343: 4c8b86d0090000 mov r8, qword ptr [rsi + 0x9d0]
14593e34a: 488b8ec8090000 mov rcx, qword ptr [rsi + 0x9c8]
14593e351: f30f1005b7a44700 movss xmm0, dword ptr [rip + 0x47a4b7]
14593e359: 0f1f8000000000 nop dword ptr [rax]
14593e360: 4e8d0c02 lea r9, [rdx + r8]
14593e364: 49c1c117 rol r9, 0x17
14593e368: 4901d1 add r9, rdx
14593e36b: 4989c2 mov r10, rax
14593e36e: 49c1e211 shl r10, 0x11
14593e372: 4831d1 xor rcx, rdx
14593e375: 4931c0 xor r8, rax
14593e378: 4831c8 xor rax, rcx
14593e37b: 4c31c2 xor rdx, r8
14593e37e: 49c1c02d rol r8, 0x2d
14593e382: 4c31d1 xor rcx, r10
14593e385: 49c1e929 shr r9, 0x29
14593e389: 4181c90000803f or r9d, 0x3f800000
14593e390: 66450f6ef9 movd xmm15, r9d
14593e395: f3450f58fc addss xmm15, xmm12
14593e39a: f3440f59f8 mulss xmm15, xmm0
14593e39f: 410f2ec7 ucomiss xmm0, xmm15
14593e3a3: 76bb jbe 0x14593e360
14593e3a5: 0f57c0 xorps xmm0, xmm0
14593e3a8: f3440f58d8 addss xmm11, xmm0
14593e3ad: f3440f58f8 addss xmm15, xmm0
14593e3b2: 488996b8090000 mov qword ptr [rsi + 0x9b8], rdx
14593e3b9: 4c8986d0090000 mov qword ptr [rsi + 0x9d0], r8
14593e3c0: 488986c0090000 mov qword ptr [rsi + 0x9c0], rax
14593e3c7: 48898ec8090000 mov qword ptr [rsi + 0x9c8], rcx
14593e3ce: f3440f58fe addss xmm15, xmm6
14593e3d3: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
14593e3db: 48c745c808000000 mov qword ptr [rbp - 0x38], 8
14593e3e3: 48c745d000000000 mov qword ptr [rbp - 0x30], 0
14593e3eb: 48c745d8ffffffff mov qword ptr [rbp - 0x28], 0xffffffffffffffff
14593e3f3: 48c74518ffffffff mov qword ptr [rbp + 0x18], 0xffffffffffffffff
14593e3fb: c7457000000000 mov dword ptr [rbp + 0x70], 0
14593e402: c7457800000000 mov dword ptr [rbp + 0x78], 0
14593e409: c7858000000000000000 mov dword ptr [rbp + 0x80], 0
14593e413: c78590000000ffffffff mov dword ptr [rbp + 0x90], 0xffffffff
14593e41d: 4c89a5b0000000 mov qword ptr [rbp + 0xb0], r12
14593e424: 4c89bdb8000000 mov qword ptr [rbp + 0xb8], r15
14593e42b: 450f57e4 xorps xmm12, xmm12
14593e42f: 440f11a5c0000000 movups xmmword ptr [rbp + 0xc0], xmm12
14593e437: 440f11a5d0000000 movups xmmword ptr [rbp + 0xd0], xmm12
14593e43f: 440f11a5e0000000 movups xmmword ptr [rbp + 0xe0], xmm12
14593e447: 440f11a5f0000000 movups xmmword ptr [rbp + 0xf0], xmm12
14593e44f: 440f11a500010000 movups xmmword ptr [rbp + 0x100], xmm12
14593e457: 48c7851001000000000000 mov qword ptr [rbp + 0x110], 0
14593e462: f3440f11ad18010000 movss dword ptr [rbp + 0x118], xmm13
14593e46b: 440f13ad1c010000 movlps qword ptr [rbp + 0x11c], xmm13
14593e473: f3440f11b524010000 movss dword ptr [rbp + 0x124], xmm14
14593e47c: f3440f118d28010000 movss dword ptr [rbp + 0x128], xmm9
14593e485: f3440f11952c010000 movss dword ptr [rbp + 0x12c], xmm10
14593e48e: f3440f118530010000 movss dword ptr [rbp + 0x130], xmm8
14593e497: 8b85b0010000 mov eax, dword ptr [rbp + 0x1b0]
14593e49d: 89853c010000 mov dword ptr [rbp + 0x13c], eax
14593e4a3: 488b8da8010000 mov rcx, qword ptr [rbp + 0x1a8]
14593e4aa: 48898d34010000 mov qword ptr [rbp + 0x134], rcx
14593e4b1: 898548010000 mov dword ptr [rbp + 0x148], eax
14593e4b7: 48898d40010000 mov qword ptr [rbp + 0x140], rcx
14593e4be: 0f57c0 xorps xmm0, xmm0
14593e4c1: f30f10c6 movss xmm0, xmm6
14593e4c5: 0f13854c010000 movlps qword ptr [rbp + 0x14c], xmm0
14593e4cc: f3440f11bd54010000 movss dword ptr [rbp + 0x154], xmm15
14593e4d5: f30f11bd58010000 movss dword ptr [rbp + 0x158], xmm7
14593e4dd: 440f11a55c010000 movups xmmword ptr [rbp + 0x15c], xmm12
14593e4e5: 440f11a56c010000 movups xmmword ptr [rbp + 0x16c], xmm12
14593e4ed: f3440f119d7c010000 movss dword ptr [rbp + 0x17c], xmm11
14593e4f6: 440f11a580010000 movups xmmword ptr [rbp + 0x180], xmm12
14593e4fe: 889d90010000 mov byte ptr [rbp + 0x190], bl
14593e504: 488bbe70050000 mov rdi, qword ptr [rsi + 0x570]
14593e50b: 483bbe60050000 cmp rdi, qword ptr [rsi + 0x560]
14593e512: 750d jne 0x14593e521
14593e514: 488d8e60050000 lea rcx, [rsi + 0x560]
14593e51b: e840ec4400 call 0x145d8d160
14593e520: 90 nop
14593e521: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
14593e528: 4869cfd8010000 imul rcx, rdi, 0x1d8
14593e52f: 48c7040800000000 mov qword ptr [rax + rcx], 0
14593e537: 48c744080808000000 mov qword ptr [rax + rcx + 8], 8
14593e540: 48c744081000000000 mov qword ptr [rax + rcx + 0x10], 0
14593e549: 48c7440818ffffffff mov qword ptr [rax + rcx + 0x18], 0xffffffffffffffff
14593e552: 48c7440858ffffffff mov qword ptr [rax + rcx + 0x58], 0xffffffffffffffff
14593e55b: c78408b000000000000000 mov dword ptr [rax + rcx + 0xb0], 0
14593e566: c78408b800000000000000 mov dword ptr [rax + rcx + 0xb8], 0
14593e571: c78408c000000000000000 mov dword ptr [rax + rcx + 0xc0], 0
14593e57c: c78408d0000000ffffffff mov dword ptr [rax + rcx + 0xd0], 0xffffffff
14593e587: 4c89a408f0000000 mov qword ptr [rax + rcx + 0xf0], r12
14593e58f: 4c89bc08f8000000 mov qword ptr [rax + rcx + 0xf8], r15
14593e597: 440f11a40800010000 movups xmmword ptr [rax + rcx + 0x100], xmm12
14593e5a0: 440f11a40810010000 movups xmmword ptr [rax + rcx + 0x110], xmm12
14593e5a9: 440f11a40820010000 movups xmmword ptr [rax + rcx + 0x120], xmm12
14593e5b2: 440f11a40830010000 movups xmmword ptr [rax + rcx + 0x130], xmm12
14593e5bb: 440f11a40840010000 movups xmmword ptr [rax + rcx + 0x140], xmm12
14593e5c4: 48c784085001000000000000 mov qword ptr [rax + rcx + 0x150], 0
14593e5d0: f3440f11ac0858010000 movss dword ptr [rax + rcx + 0x158], xmm13
14593e5da: 440f13ac085c010000 movlps qword ptr [rax + rcx + 0x15c], xmm13
14593e5e3: f3440f11b40864010000 movss dword ptr [rax + rcx + 0x164], xmm14
14593e5ed: f3440f118c0868010000 movss dword ptr [rax + rcx + 0x168], xmm9
14593e5f7: f3440f1194086c010000 movss dword ptr [rax + rcx + 0x16c], xmm10
14593e601: f3440f11840870010000 movss dword ptr [rax + rcx + 0x170], xmm8
14593e60b: 8b95b0010000 mov edx, dword ptr [rbp + 0x1b0]
14593e611: 8994087c010000 mov dword ptr [rax + rcx + 0x17c], edx
14593e618: 488b95a8010000 mov rdx, qword ptr [rbp + 0x1a8]
14593e61f: 4889940874010000 mov qword ptr [rax + rcx + 0x174], rdx
14593e627: 488b95a8010000 mov rdx, qword ptr [rbp + 0x1a8]
14593e62e: 4889940880010000 mov qword ptr [rax + rcx + 0x180], rdx
14593e636: 8b95b0010000 mov edx, dword ptr [rbp + 0x1b0]
14593e63c: 89940888010000 mov dword ptr [rax + rcx + 0x188], edx
14593e643: f30f11b4088c010000 movss dword ptr [rax + rcx + 0x18c], xmm6
14593e64c: c784089001000000000000 mov dword ptr [rax + rcx + 0x190], 0
14593e657: f3440f11bc0894010000 movss dword ptr [rax + rcx + 0x194], xmm15
14593e661: f30f11bc0898010000 movss dword ptr [rax + rcx + 0x198], xmm7
14593e66a: 440f11a4089c010000 movups xmmword ptr [rax + rcx + 0x19c], xmm12
14593e673: 440f11a408ac010000 movups xmmword ptr [rax + rcx + 0x1ac], xmm12
14593e67c: f3440f119c08bc010000 movss dword ptr [rax + rcx + 0x1bc], xmm11
14593e686: 440f11a408c0010000 movups xmmword ptr [rax + rcx + 0x1c0], xmm12
14593e68f: 889c08d0010000 mov byte ptr [rax + rcx + 0x1d0], bl
14593e696: 48ffc7 inc rdi
14593e699: 4889be70050000 mov qword ptr [rsi + 0x570], rdi
14593e6a0: b801000000 mov eax, 1
14593e6a5: 4c89e2 mov rdx, r12
14593e6a8: 0f28b5c0010000 movaps xmm6, xmmword ptr [rbp + 0x1c0]
14593e6af: 0f28bdd0010000 movaps xmm7, xmmword ptr [rbp + 0x1d0]
14593e6b6: 440f2885e0010000 movaps xmm8, xmmword ptr [rbp + 0x1e0]
14593e6be: 440f288df0010000 movaps xmm9, xmmword ptr [rbp + 0x1f0]
14593e6c6: 440f289500020000 movaps xmm10, xmmword ptr [rbp + 0x200]
14593e6ce: 440f289d10020000 movaps xmm11, xmmword ptr [rbp + 0x210]
14593e6d6: 440f28a520020000 movaps xmm12, xmmword ptr [rbp + 0x220]
14593e6de: 440f28ad30020000 movaps xmm13, xmmword ptr [rbp + 0x230]
14593e6e6: 440f28b540020000 movaps xmm14, xmmword ptr [rbp + 0x240]
14593e6ee: 440f28bd50020000 movaps xmm15, xmmword ptr [rbp + 0x250]
14593e6f6: 4881c4e8020000 add rsp, 0x2e8
14593e6fd: 5b pop rbx
14593e6fe: 5f pop rdi
14593e6ff: 5e pop rsi
14593e700: 415c pop r12
14593e702: 415d pop r13
14593e704: 415e pop r14
14593e706: 415f pop r15
14593e708: 5d pop rbp
14593e709: c3 ret
14593e70a: 4c8d052fc22c01 lea r8, [rip + 0x12cc22f]
14593e711: 4c89f1 mov rcx, r14
14593e714: e86ab14600 call 0x145da9883
14593e719: 0f0b ud2
