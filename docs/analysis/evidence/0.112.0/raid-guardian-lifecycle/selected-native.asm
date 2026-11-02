145898dc4: 4883fa06 cmp rdx, 6
145898dc8: 0f87fa000000 ja 0x145898ec8
145898dce: 488d05af5f3601 lea rax, [rip + 0x1365faf]
145898dd5: 48631490 movsxd rdx, dword ptr [rax + rdx*4]
145898dd9: 4801c2 add rdx, rax
145898ddc: ffe2 jmp rdx
145898dde: 6681396162 cmp word ptr [rcx], 0x6261
145898de3: 0f84e2000000 je 0x145898ecb
145898de9: 668139736d cmp word ptr [rcx], 0x6d73
145898dee: 0f84e9000000 je 0x145898edd
145898df4: 6681396176 cmp word ptr [rcx], 0x7661
145898df9: 0f84e4000000 je 0x145898ee3
145898dff: 6681396171 cmp word ptr [rcx], 0x7161
145898e04: 0f85be000000 jne 0x145898ec8
145898e0a: b80a000000 mov eax, 0xa
145898e0f: c3 ret
145898e10: b8656c7779 mov eax, 0x79776c65
145898e15: 3301 xor eax, dword ptr [rcx]
145898e17: 0fb75104 movzx edx, word ptr [rcx + 4]
145898e1b: 81f26e6e0000 xor edx, 0x6e6e
145898e21: 09c2 or edx, eax
145898e23: 0f849f000000 je 0x145898ec8
145898e29: b8756e676f mov eax, 0x6f676e75
145898e2e: 3301 xor eax, dword ptr [rcx]
145898e30: 0fb74904 movzx ecx, word ptr [rcx + 4]
145898e34: 81f1726f0000 xor ecx, 0x6f72
145898e3a: 09c1 or ecx, eax
145898e3c: 0f8586000000 jne 0x145898ec8
145898e42: b803000000 mov eax, 3
145898e47: c3 ret
145898e48: 31d2 xor edx, edx
145898e4a: 81396e617878 cmp dword ptr [rcx], 0x7878616e
145898e50: b80b000000 mov eax, 0xb
145898e55: 480f45c2 cmovne rax, rdx
145898e59: c3 ret
145898e5a: b86172656e mov eax, 0x6e657261
145898e5f: 3301 xor eax, dword ptr [rcx]
145898e61: 0fb64904 movzx ecx, byte ptr [rcx + 4]
145898e65: 83f161 xor ecx, 0x61
145898e68: 09c1 or ecx, eax
145898e6a: 755c jne 0x145898ec8
145898e6c: b806000000 mov eax, 6
145898e71: c3 ret
145898e72: 0fb701 movzx eax, word ptr [rcx]
145898e75: 3577730000 xor eax, 0x7377
145898e7a: 0fb65102 movzx edx, byte ptr [rcx + 2]
145898e7e: 83f267 xor edx, 0x67
145898e81: 6609c2 or dx, ax
145898e84: 744b je 0x145898ed1
145898e86: 0fb701 movzx eax, word ptr [rcx]
145898e89: 3562720000 xor eax, 0x7262
145898e8e: 0fb64902 movzx ecx, byte ptr [rcx + 2]
145898e92: 83f16d xor ecx, 0x6d
145898e95: 6609c1 or cx, ax
145898e98: 752e jne 0x145898ec8
145898e9a: b809000000 mov eax, 9
145898e9f: c3 ret
145898ea0: b866657261 mov eax, 0x61726566
145898ea5: 3301 xor eax, dword ptr [rcx]
145898ea7: ba616c6173 mov edx, 0x73616c61
145898eac: 335103 xor edx, dword ptr [rcx + 3]
145898eaf: 09c2 or edx, eax
145898eb1: 7515 jne 0x145898ec8
145898eb3: b805000000 mov eax, 5
145898eb8: c3 ret
145898eb9: 48b86475736b776f6f64 movabs rax, 0x646f6f776b737564
145898ec3: 483901 cmp qword ptr [rcx], rax
145898ec6: 740f je 0x145898ed7
145898ec8: 31c0 xor eax, eax
145898eca: c3 ret
145898ecb: b804000000 mov eax, 4
145898ed0: c3 ret
145898ed1: b802000000 mov eax, 2
145898ed6: c3 ret
145898ed7: b801000000 mov eax, 1
145898edc: c3 ret
145898edd: b807000000 mov eax, 7
145898ee2: c3 ret
145898ee3: b808000000 mov eax, 8
145898ee8: c3 ret
1458fa88c: c785fe0a000000000000 mov dword ptr [rbp + 0xafe], 0
1458fab8e: c785020b0000000000ff mov dword ptr [rbp + 0xb02], 0xff000000
1458fb08f: 488d5528 lea rdx, [rbp + 0x28]
1458fb093: 41b8e00a0000 mov r8d, 0xae0
1458fb099: 488bb5680c0000 mov rsi, qword ptr [rbp + 0xc68]
1458fb0a0: 4889f1 mov rcx, rsi
1458fb0a3: e833f33000 call 0x145c0a3db
1458fb907: 4989cd mov r13, rcx
1458fb90a: 0fb681df0a0000 movzx eax, byte ptr [rcx + 0xadf]
1458fb911: 84c0 test al, al
1458fb913: 7522 jne 0x1458fb937
1458fb915: 4180bdd70a000000 cmp byte ptr [r13 + 0xad7], 0
1458fb91d: 7418 je 0x1458fb937
1458fb937: 3c01 cmp al, 1
1458fb939: 4c89ad38040000 mov qword ptr [rbp + 0x438], r13
1458fb940: 0f8513c00000 jne 0x145907959
145904118: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
14590411f: 80bfdb0a000000 cmp byte ptr [rdi + 0xadb], 0
145904126: 0f85fa360000 jne 0x145907826
145906574: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
14590657b: 0f2e809c0a0000 ucomiss xmm0, dword ptr [rax + 0xa9c]
145906582: 0f821d020000 jb 0x1459067a5
145906588: f30f100db4977800 movss xmm1, dword ptr [rip + 0x7897b4]
145906590: f30f58c8 addss xmm1, xmm0
145906594: f30f11889c0a0000 movss dword ptr [rax + 0xa9c], xmm1
14590659c: 488b8018060000 mov rax, qword ptr [rax + 0x618]
1459065a3: 4885c0 test rax, rax
1459065a6: 0f8413010000 je 0x1459066bf
1459066bf: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
1459066c6: 488b91b8090000 mov rdx, qword ptr [rcx + 0x9b8]
1459066cd: 488b81c0090000 mov rax, qword ptr [rcx + 0x9c0]
1459066d4: 4c8b81d0090000 mov r8, qword ptr [rcx + 0x9d0]
1459066db: 488b89c8090000 mov rcx, qword ptr [rcx + 0x9c8]
1459066e2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459066f0: 4e8d0c02 lea r9, [rdx + r8]
1459066f4: 49c1c117 rol r9, 0x17
1459066f8: 4901d1 add r9, rdx
1459066fb: 4989c2 mov r10, rax
1459066fe: 49c1e211 shl r10, 0x11
145906702: 4831d1 xor rcx, rdx
145906705: 4931c0 xor r8, rax
145906708: 4831c8 xor rax, rcx
14590670b: 4c31c2 xor rdx, r8
14590670e: 4c31d1 xor rcx, r10
145906711: 49c1c02d rol r8, 0x2d
145906715: 49c1e920 shr r9, 0x20
145906719: 4b8d3449 lea rsi, [r9 + r9*2]
14590671d: 4189f1 mov r9d, esi
145906720: 41f7d1 not r9d
145906723: 41f7c1000000c0 test r9d, 0xc0000000
14590672a: 74c4 je 0x1459066f0
14590672c: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
145906733: 488997b8090000 mov qword ptr [rdi + 0x9b8], rdx
14590673a: 4c8987d0090000 mov qword ptr [rdi + 0x9d0], r8
145906741: 488987c0090000 mov qword ptr [rdi + 0x9c0], rax
145906748: 48898fc8090000 mov qword ptr [rdi + 0x9c8], rcx
14590674f: 488d8da0000000 lea rcx, [rbp + 0xa0]
145906756: 660f6e15a27c4b00 movd xmm2, dword ptr [rip + 0x4b7ca2]
14590675e: 660f6e1d7e6d4a00 movd xmm3, dword ptr [rip + 0x4a6d7e]
145906766: 4889fa mov rdx, rdi
145906769: e892800300 call 0x14593e800
14590676e: 90 nop
14590676f: 48c1ee20 shr rsi, 0x20
145906773: 31c0 xor eax, eax
145906775: 4883fe01 cmp rsi, 1
145906779: 0f94c0 sete al
14590677c: 83f005 xor eax, 5
14590677f: 4885f6 test rsi, rsi
145906782: ba03000000 mov edx, 3
145906787: 0f45d0 cmovne edx, eax
14590678a: 4c8d8da0000000 lea r9, [rbp + 0xa0]
145906791: 4889f9 mov rcx, rdi
145906794: e877db0300 call 0x145944310
145906799: 90 nop
14590679a: 488b85f0020000 mov rax, qword ptr [rbp + 0x2f0]
1459067a1: f30f1000 movss xmm0, dword ptr [rax]
1459067a5: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
1459067ac: 0f2e87a00a0000 ucomiss xmm0, dword ptr [rdi + 0xaa0]
1459067b3: 0f822d010000 jb 0x1459068e6
1459067b9: f30f5805e7d77a00 addss xmm0, dword ptr [rip + 0x7ad7e7]
1459067c1: f30f1187a00a0000 movss dword ptr [rdi + 0xaa0], xmm0
1459067c9: 488b8718060000 mov rax, qword ptr [rdi + 0x618]
1459067d0: 4885c0 test rax, rax
1459067d3: 0f84d8000000 je 0x1459068b1
1459068b1: 488d8da0000000 lea rcx, [rbp + 0xa0]
1459068b8: 660f6e1564ae4a00 movd xmm2, dword ptr [rip + 0x4aae64]
1459068c0: 660f6e1df8865800 movd xmm3, dword ptr [rip + 0x5886f8]
1459068c8: 4889fa mov rdx, rdi
1459068cb: e8307f0300 call 0x14593e800
1459068d0: 90 nop
1459068d1: 4c8d8da0000000 lea r9, [rbp + 0xa0]
1459068d8: 4889f9 mov rcx, rdi
1459068db: ba02000000 mov edx, 2
1459068e0: e82bda0300 call 0x145944310
1459068e5: 90 nop
1459068e6: 488bb7b8070000 mov rsi, qword ptr [rdi + 0x7b8]
1459068ed: 4885f6 test rsi, rsi
1459068f0: 0f844b010000 je 0x145906a41
1459068f6: 488b8fb0070000 mov rcx, qword ptr [rdi + 0x7b0]
1459068fd: f30f10874c0a0000 movss xmm0, dword ptr [rdi + 0xa4c]
145906905: 0f2e4104 ucomiss xmm0, dword ptr [rcx + 4]
145906909: 0f8232010000 jb 0x145906a41
14590690f: 488d5108 lea rdx, [rcx + 8]
145906913: 4c8d04f5f8ffffff lea r8, [rsi*8 - 8]
14590691b: 48ffce dec rsi
14590691e: e8ca3a3000 call 0x145c0a3ed
145906923: 4889b7b8070000 mov qword ptr [rdi + 0x7b8], rsi
14590692a: 488d8d00030000 lea rcx, [rbp + 0x300]
145906931: f30f101517865800 movss xmm2, dword ptr [rip + 0x588617]
145906939: f30f101d7f865800 movss xmm3, dword ptr [rip + 0x58867f]
145906941: 4889fa mov rdx, rdi
145906944: e8b77e0300 call 0x14593e800
145906949: 90 nop
14590694a: 4c8d8d00030000 lea r9, [rbp + 0x300]
145906951: 4889f9 mov rcx, rdi
145906954: ba06000000 mov edx, 6
145906959: e8b2d90300 call 0x145944310
14590695e: 90 nop
14590695f: 4c8d350eeb6301 lea r14, [rip + 0x163eb0e]
145906966: be34000000 mov esi, 0x34
14590696b: ba34000000 mov edx, 0x34
145906970: 4c89f1 mov rcx, r14
145906973: e858740800 call 0x14598ddd0
145906978: 90 nop
145906979: 4889d3 mov rbx, rdx
14590697c: 4885c0 test rax, rax
14590697f: 4c0f45f0 cmovne r14, rax
145906983: 480f44de cmove rbx, rsi
145906987: 4885db test rbx, rbx
14590698a: 7914 jns 0x1459069a0
1459069a0: 7430 je 0x1459069d2
1459069a2: e859b86ffa call 0x140002200
1459069a7: 41bf01000000 mov r15d, 1
1459069ad: ba01000000 mov edx, 1
1459069b2: 4889d9 mov rcx, rbx
1459069b5: e806b86ffa call 0x1400021c0
1459069ba: 4885c0 test rax, rax
1459069bd: 74d0 je 0x14590698f
1459069bf: 4889c7 mov rdi, rax
1459069c2: 4889c1 mov rcx, rax
1459069c5: 4c89f2 mov rdx, r14
1459069c8: 4989d8 mov r8, rbx
1459069cb: e80b3a3000 call 0x145c0a3db
1459069d0: eb05 jmp 0x1459069d7
1459069d7: 488d05f7ea6301 lea rax, [rip + 0x163eaf7]
1459069de: 488985d0000000 mov qword ptr [rbp + 0xd0], rax
1459069e5: 48c785d800000006000000 mov qword ptr [rbp + 0xd8], 6
1459069f0: 48899da0000000 mov qword ptr [rbp + 0xa0], rbx
1459069f7: 4889bda8000000 mov qword ptr [rbp + 0xa8], rdi
1459069fe: 48899db0000000 mov qword ptr [rbp + 0xb0], rbx
145906a05: 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
145906a10: 48c785c000000001000000 mov qword ptr [rbp + 0xc0], 1
145906a1b: 48c785c800000000000000 mov qword ptr [rbp + 0xc8], 0
145906a26: c685e000000000 mov byte ptr [rbp + 0xe0], 0
145906a2d: 488d95a0000000 lea rdx, [rbp + 0xa0]
145906a34: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
145906a3b: e860c50000 call 0x145912fa0
145906a40: 90 nop
145906a41: 488b9590030000 mov rdx, qword ptr [rbp + 0x390]
145906a48: 4885d2 test rdx, rdx
145906a4b: 7416 je 0x145906a63
145906a63: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
145906a6a: 80bfd80a000000 cmp byte ptr [rdi + 0xad8], 0
145906a71: 0f85af0d0000 jne 0x145907826
145906a77: 4c8ba778060000 mov r12, qword ptr [rdi + 0x678]
145906a7e: 4d85e4 test r12, r12
145906a81: 0f843b090000 je 0x1459073c2
145906a87: 488d8760050000 lea rax, [rdi + 0x560]
145906a8e: 488985c8030000 mov qword ptr [rbp + 0x3c8], rax
145906a95: 31db xor ebx, ebx
145906a97: f3440f100dc8a84a00 movss xmm9, dword ptr [rip + 0x4aa8c8]
145906aa0: f3440f1015f7ac4a00 movss xmm10, dword ptr [rip + 0x4aacf7]
145906aa9: f3440f101db2674a00 movss xmm11, dword ptr [rip + 0x4a67b2]
145906ab2: 440f2805366a4a00 movaps xmm8, xmmword ptr [rip + 0x4a6a36]
145906aba: 4c89a5e8030000 mov qword ptr [rbp + 0x3e8], r12
145906ac1: eb49 jmp 0x145906b0c
145906b0c: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
145906b13: 488b9078060000 mov rdx, qword ptr [rax + 0x678]
145906b1a: 4839d3 cmp rbx, rdx
145906b1d: 0f839d180000 jae 0x1459083c0
145906b23: 488b8070060000 mov rax, qword ptr [rax + 0x670]
145906b2a: 488d0c9b lea rcx, [rbx + rbx*4]
145906b2e: 48833cc800 cmp qword ptr [rax + rcx*8], 0
145906b33: 75cb jne 0x145906b00
145906b35: 488d34c8 lea rsi, [rax + rcx*8]
145906b39: 488b85f0020000 mov rax, qword ptr [rbp + 0x2f0]
145906b40: f30f1000 movss xmm0, dword ptr [rax]
145906b44: 0f2e4624 ucomiss xmm0, dword ptr [rsi + 0x24]
145906b48: 72b6 jb 0x145906b00
145906b4a: 4c8ba538040000 mov r12, qword ptr [rbp + 0x438]
145906b51: 498b8c24a8020000 mov rcx, qword ptr [r12 + 0x2a8]
145906b59: 498b9424b0020000 mov rdx, qword ptr [r12 + 0x2b0]
145906b61: e85a22f9ff call 0x145898dc0
145906b66: 4869c0f0000000 imul rax, rax, 0xf0
145906b6d: 8b4e20 mov ecx, dword ptr [rsi + 0x20]
145906b70: 894d28 mov dword ptr [rbp + 0x28], ecx
145906b73: 488b4e18 mov rcx, qword ptr [rsi + 0x18]
145906b77: 48894d20 mov qword ptr [rbp + 0x20], rcx
145906b7b: 488b7e10 mov rdi, qword ptr [rsi + 0x10]
145906b7f: 4a8b942880000000 mov rdx, qword ptr [rax + r13 + 0x80]
145906b87: 4839d7 cmp rdi, rdx
145906b8a: 0f8345190000 jae 0x1459084d5
145906b90: 4c01e8 add rax, r13
145906b93: 488b7078 mov rsi, qword ptr [rax + 0x78]
145906b97: 4c8d34bf lea r14, [rdi + rdi*4]
145906b9b: 49c1e604 shl r14, 4
145906b9f: 4a8d0436 lea rax, [rsi + r14]
145906ba3: 48898510040000 mov qword ptr [rbp + 0x410], rax
145906baa: 4c89e1 mov rcx, r12
145906bad: 4889fa mov rdx, rdi
145906bb0: e82b380600 call 0x14596a3e0
145906bb5: 0f28f0 movaps xmm6, xmm0
145906bb8: 4c89e1 mov rcx, r12
145906bbb: 4889fa mov rdx, rdi
145906bbe: e81d3c0600 call 0x14596a7e0
145906bc3: f30f1185f8030000 movss dword ptr [rbp + 0x3f8], xmm0
145906bcb: f3460f107c3628 movss xmm15, dword ptr [rsi + r14 + 0x28]
145906bd2: f3440f593d691f3001 mulss xmm15, dword ptr [rip + 0x1301f69]
145906bdb: 468b443620 mov r8d, dword ptr [rsi + r14 + 0x20]
145906be0: 458bbc24780a0000 mov r15d, dword ptr [r12 + 0xa78]
145906be8: 41ffc7 inc r15d
145906beb: 4589bc24780a0000 mov dword ptr [r12 + 0xa78], r15d
145906bf3: 4489c0 mov eax, r8d
145906bf6: 25ffffff00 and eax, 0xffffff
145906bfb: 48c1e018 shl rax, 0x18
145906bff: 4181e7ffffff00 and r15d, 0xffffff
145906c06: 4909c7 or r15, rax
145906c09: 48b800000000000030f1 movabs rax, 0xf130000000000000
145906c13: 4909c7 or r15, rax
145906c16: 468b4c3624 mov r9d, dword ptr [rsi + r14 + 0x24]
145906c1b: 488d4520 lea rax, [rbp + 0x20]
145906c1f: 4889442438 mov qword ptr [rsp + 0x38], rax
145906c24: f30f11b508040000 movss dword ptr [rbp + 0x408], xmm6
145906c2c: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
145906c32: f3440f117c2420 movss dword ptr [rsp + 0x20], xmm15
145906c39: c644243001 mov byte ptr [rsp + 0x30], 1
145906c3e: 4c89e1 mov rcx, r12
145906c41: 4c89fa mov rdx, r15
145906c44: e827590300 call 0x14593c570
145906c49: f3410f1084244c0a0000 movss xmm0, dword ptr [r12 + 0xa4c]
145906c53: 0f298580030000 movaps xmmword ptr [rbp + 0x380], xmm0
145906c5a: f3460f106c3638 movss xmm13, dword ptr [rsi + r14 + 0x38]
145906c61: f3420f107c363c movss xmm7, dword ptr [rsi + r14 + 0x3c]
145906c68: 420fb67c364c movzx edi, byte ptr [rsi + r14 + 0x4c]
145906c6e: 450fb79424ce020000 movzx r10d, word ptr [r12 + 0x2ce]
145906c77: 4d8b8c24b8090000 mov r9, qword ptr [r12 + 0x9b8]
145906c7f: 4d8b8424d0090000 mov r8, qword ptr [r12 + 0x9d0]
145906c87: 498b9424c0090000 mov rdx, qword ptr [r12 + 0x9c0]
145906c8f: 498b8424c8090000 mov rax, qword ptr [r12 + 0x9c8]
145906c97: 660f1f840000000000 nop word ptr [rax + rax]
145906ca0: 4b8d0c01 lea rcx, [r9 + r8]
145906ca4: 48c1c117 rol rcx, 0x17
145906ca8: 4c01c9 add rcx, r9
145906cab: 4989d3 mov r11, rdx
145906cae: 49c1e311 shl r11, 0x11
145906cb2: 4c31c8 xor rax, r9
145906cb5: 4931d0 xor r8, rdx
145906cb8: 4831c2 xor rdx, rax
145906cbb: 4d31c1 xor r9, r8
145906cbe: 49c1c02d rol r8, 0x2d
145906cc2: 4c31d8 xor rax, r11
145906cc5: 48c1e929 shr rcx, 0x29
145906cc9: 81c90000803f or ecx, 0x3f800000
145906ccf: 66440f6ee1 movd xmm12, ecx
145906cd4: f3450f58e1 addss xmm12, xmm9
145906cd9: f3450f59e2 mulss xmm12, xmm10
145906cde: 450f2ed4 ucomiss xmm10, xmm12
145906ce2: 76bc jbe 0x145906ca0
145906ce4: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
145906ceb: 4c8989b8090000 mov qword ptr [rcx + 0x9b8], r9
145906cf2: 4c8981d0090000 mov qword ptr [rcx + 0x9d0], r8
145906cf9: 488991c0090000 mov qword ptr [rcx + 0x9c0], rdx
145906d00: 488981c8090000 mov qword ptr [rcx + 0x9c8], rax
145906d07: 488bb510040000 mov rsi, qword ptr [rbp + 0x410]
145906d0e: 8b4e20 mov ecx, dword ptr [rsi + 0x20]
145906d11: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145907018: f30f59fe mulss xmm7, xmm6
14590701c: 0f57c0 xorps xmm0, xmm0
14590701f: f3440f58e0 addss xmm12, xmm0
145907024: 488d8d40010000 lea rcx, [rbp + 0x140]
14590702b: c6410800 mov byte ptr [rcx + 8], 0
14590702f: 48c70100000000 mov qword ptr [rcx], 0
145907036: 48c785a000000000000000 mov qword ptr [rbp + 0xa0], 0
145907041: 48c785a800000008000000 mov qword ptr [rbp + 0xa8], 8
14590704c: 48c785b000000000000000 mov qword ptr [rbp + 0xb0], 0
145907057: 48c785b8000000ffffffff mov qword ptr [rbp + 0xb8], 0xffffffffffffffff
145907062: 4c89a5f8000000 mov qword ptr [rbp + 0xf8], r12
145907069: 48898500010000 mov qword ptr [rbp + 0x100], rax
145907070: 4c89a508010000 mov qword ptr [rbp + 0x108], r12
145907077: 4c89b510010000 mov qword ptr [rbp + 0x110], r14
14590707e: 4c89a518010000 mov qword ptr [rbp + 0x118], r12
145907085: 4c89b520010000 mov qword ptr [rbp + 0x120], r14
14590708c: 4c89a528010000 mov qword ptr [rbp + 0x128], r12
145907093: 48899d30010000 mov qword ptr [rbp + 0x130], rbx
14590709a: 48899538010000 mov qword ptr [rbp + 0x138], rdx
1459070a1: c7855001000000000000 mov dword ptr [rbp + 0x150], 0
1459070ab: c7855801000000000000 mov dword ptr [rbp + 0x158], 0
1459070b5: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
1459070bf: c78570010000ffffffff mov dword ptr [rbp + 0x170], 0xffffffff
1459070c9: 4c89bd90010000 mov qword ptr [rbp + 0x190], r15
1459070d0: 4889b598010000 mov qword ptr [rbp + 0x198], rsi
1459070d7: 660fefc9 pxor xmm1, xmm1
1459070db: f30f7f89a0000000 movdqu xmmword ptr [rcx + 0xa0], xmm1
1459070e3: f30f7f8990000000 movdqu xmmword ptr [rcx + 0x90], xmm1
1459070eb: f30f7f8980000000 movdqu xmmword ptr [rcx + 0x80], xmm1
1459070f3: f30f7f4970 movdqu xmmword ptr [rcx + 0x70], xmm1
1459070f8: f30f7f4960 movdqu xmmword ptr [rcx + 0x60], xmm1
1459070fd: 48c781b000000000000000 mov qword ptr [rcx + 0xb0], 0
145907108: 660f7ea5f8010000 movd dword ptr [rbp + 0x1f8], xmm4
145907110: 660f7ea5fc010000 movd dword ptr [rbp + 0x1fc], xmm4
145907118: 660f7ead00020000 movd dword ptr [rbp + 0x200], xmm5
145907120: f30f11bd04020000 movss dword ptr [rbp + 0x204], xmm7
145907128: f30f1085d8030000 movss xmm0, dword ptr [rbp + 0x3d8]
145907130: f30f118508020000 movss dword ptr [rbp + 0x208], xmm0
145907138: f3440f11b50c020000 movss dword ptr [rbp + 0x20c], xmm14
145907141: f3440f11bd10020000 movss dword ptr [rbp + 0x210], xmm15
14590714a: 8b4528 mov eax, dword ptr [rbp + 0x28]
14590714d: 8981dc000000 mov dword ptr [rcx + 0xdc], eax
145907153: 488b4520 mov rax, qword ptr [rbp + 0x20]
145907157: 488981d4000000 mov qword ptr [rcx + 0xd4], rax
14590715e: 8b4528 mov eax, dword ptr [rbp + 0x28]
145907161: 8981e8000000 mov dword ptr [rcx + 0xe8], eax
145907167: 488b4520 mov rax, qword ptr [rbp + 0x20]
14590716b: 488981e0000000 mov qword ptr [rcx + 0xe0], rax
145907172: 0f57c0 xorps xmm0, xmm0
145907175: 0f289580030000 movaps xmm2, xmmword ptr [rbp + 0x380]
14590717c: f30f10c2 movss xmm0, xmm2
145907180: 0f13852c020000 movlps qword ptr [rbp + 0x22c], xmm0
145907187: f30f119534020000 movss dword ptr [rbp + 0x234], xmm2
14590718f: f3440f11ad38020000 movss dword ptr [rbp + 0x238], xmm13
145907198: f30f7f890c010000 movdqu xmmword ptr [rcx + 0x10c], xmm1
1459071a0: f30f7f89fc000000 movdqu xmmword ptr [rcx + 0xfc], xmm1
1459071a8: f3440f11a55c020000 movss dword ptr [rbp + 0x25c], xmm12
1459071b1: f30f7f8920010000 movdqu xmmword ptr [rcx + 0x120], xmm1
1459071b9: 4088bd70020000 mov byte ptr [rbp + 0x270], dil
1459071c0: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
1459071c7: 488bb070050000 mov rsi, qword ptr [rax + 0x570]
1459071ce: 483bb060050000 cmp rsi, qword ptr [rax + 0x560]
1459071d5: 750d jne 0x1459071e4
1459071e4: 4869ced8010000 imul rcx, rsi, 0x1d8
1459071eb: 488bbd38040000 mov rdi, qword ptr [rbp + 0x438]
1459071f2: 48038f68050000 add rcx, qword ptr [rdi + 0x568]
1459071f9: 41b8d8010000 mov r8d, 0x1d8
1459071ff: 488d95a0000000 lea rdx, [rbp + 0xa0]
145907206: e8d0313000 call 0x145c0a3db
14590720b: 48ffc6 inc rsi
14590720e: 4889b770050000 mov qword ptr [rdi + 0x570], rsi
145907215: 488b9778060000 mov rdx, qword ptr [rdi + 0x678]
14590721c: 4839d3 cmp rbx, rdx
14590721f: 4c8ba5e8030000 mov r12, qword ptr [rbp + 0x3e8]
145907226: 4c8d349b lea r14, [rbx + rbx*4]
14590722a: 0f83b6120000 jae 0x1459084e6
145907230: 488b8770060000 mov rax, qword ptr [rdi + 0x670]
145907237: 4ac704f001000000 mov qword ptr [rax + r14*8], 1
14590723f: 4e897cf008 mov qword ptr [rax + r14*8 + 8], r15
145907244: 48c70700000000 mov qword ptr [rdi], 0
14590724b: f30f10874c0a0000 movss xmm0, dword ptr [rdi + 0xa4c]
145907253: 0f2e050e83c200 ucomiss xmm0, dword ptr [rip + 0xc2830e]
14590725a: 0f86a0f8ffff jbe 0x145906b00
145907826: 83bf8809000000 cmp dword ptr [rdi + 0x988], 0
14590782d: 0fb687df0a0000 movzx eax, byte ptr [rdi + 0xadf]
145907834: 4989fd mov r13, rdi
145907837: 0f841c010000 je 0x145907959
14590783d: 3c01 cmp al, 1
14590783f: 0f8514010000 jne 0x145907959
145907845: 4180bdd00a000000 cmp byte ptr [r13 + 0xad0], 0
14590784d: 0f8506010000 jne 0x145907959
145907853: 41c685df0a000005 mov byte ptr [r13 + 0xadf], 5
14590785b: 4c89e9 mov rcx, r13
14590785e: e8fd8afeff call 0x1458f0360
145907863: 498b9568040000 mov rdx, qword ptr [r13 + 0x468]
14590786a: 458b8550050000 mov r8d, dword ptr [r13 + 0x550]
145907871: 488d8da0000000 lea rcx, [rbp + 0xa0]
145907878: e8b3aefbff call 0x1458c2730
14590787d: 498bb530060000 mov rsi, qword ptr [r13 + 0x630]
145907884: 493bb520060000 cmp rsi, qword ptr [r13 + 0x620]
14590788b: 750d jne 0x14590789a
14590789a: 498b8528060000 mov rax, qword ptr [r13 + 0x628]
1459078a1: 4889f1 mov rcx, rsi
1459078a4: 48c1e105 shl rcx, 5
1459078a8: 0f1085a0000000 movups xmm0, xmmword ptr [rbp + 0xa0]
1459078af: 0f108db0000000 movups xmm1, xmmword ptr [rbp + 0xb0]
1459078b6: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1459078bb: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1459078bf: 48ffc6 inc rsi
1459078c2: 4989b530060000 mov qword ptr [r13 + 0x630], rsi
1459078c9: 41ff8550050000 inc dword ptr [r13 + 0x550]
1459078d0: 4c8d052c183001 lea r8, [rip + 0x130182c]
1459078d7: 488d8da0000000 lea rcx, [rbp + 0xa0]
1459078de: 41b907000000 mov r9d, 7
1459078e4: 4c89ea mov rdx, r13
1459078e7: e8f4c40000 call 0x145913de0
1459078ec: 498bb548060000 mov rsi, qword ptr [r13 + 0x648]
1459078f3: 493bb538060000 cmp rsi, qword ptr [r13 + 0x638]
1459078fa: 7529 jne 0x145907925
145907925: 498b8540060000 mov rax, qword ptr [r13 + 0x640]
14590792c: 488d0c76 lea rcx, [rsi + rsi*2]
145907930: 488b95b0000000 mov rdx, qword ptr [rbp + 0xb0]
145907937: 488954c810 mov qword ptr [rax + rcx*8 + 0x10], rdx
14590793c: 0f1085a0000000 movups xmm0, xmmword ptr [rbp + 0xa0]
145907943: 0f1104c8 movups xmmword ptr [rax + rcx*8], xmm0
145907947: 48ffc6 inc rsi
14590794a: 4989b548060000 mov qword ptr [r13 + 0x648], rsi
145907951: 410fb685df0a0000 movzx eax, byte ptr [r13 + 0xadf]
145907959: 418bb56c0a0000 mov esi, dword ptr [r13 + 0xa6c]
145907960: 85f6 test esi, esi
145907962: 0f8414010000 je 0x145907a7c
145907968: 3c01 cmp al, 1
14590796a: 0f850c010000 jne 0x145907a7c
145907970: 41c7856c0a000000000000 mov dword ptr [r13 + 0xa6c], 0
14590797b: f30f1035b1f14a00 movss xmm6, dword ptr [rip + 0x4af1b1]
145907983: f30f103d3d9b4a00 movss xmm7, dword ptr [rip + 0x4a9b3d]
14590798b: f3440f1005a8f14a00 movss xmm8, dword ptr [rip + 0x4af1a8]
145907994: 450f57c9 xorps xmm9, xmm9
145907998: f3440f1015a3f14a00 movss xmm10, dword ptr [rip + 0x4af1a3]
1459079a1: eb23 jmp 0x1459079c6
1459079b0: 83fa01 cmp edx, 1
1459079b3: 83d200 adc edx, 0
1459079b6: 4c89e9 mov rcx, r13
1459079b9: e8c2a40000 call 0x145911e80
1459079be: ffce dec esi
1459079c0: 0f848b000000 je 0x145907a51
1459079c6: 41ff85680a0000 inc dword ptr [r13 + 0xa68]
1459079cd: 418b85e0040000 mov eax, dword ptr [r13 + 0x4e0]
1459079d4: 83f801 cmp eax, 1
1459079d7: 83d0ff adc eax, -1
1459079da: 0f57c9 xorps xmm1, xmm1
1459079dd: f3480f2ac8 cvtsi2ss xmm1, rax
1459079e2: 0f28c1 movaps xmm0, xmm1
1459079e5: f3410f59c0 mulss xmm0, xmm8
1459079ea: f30f59c1 mulss xmm0, xmm1
1459079ee: f30f59ce mulss xmm1, xmm6
1459079f2: f30f58cf addss xmm1, xmm7
1459079f6: f30f58c1 addss xmm0, xmm1
1459079fa: e81e2a3000 call 0x145c0a41d
1459079ff: 31d2 xor edx, edx
145907a01: 410f2ec1 ucomiss xmm0, xmm9
145907a05: b800000000 mov eax, 0
145907a0a: 7224 jb 0x145907a30
145907a0c: f3480f2cc0 cvttss2si rax, xmm0
145907a11: 410f2ec2 ucomiss xmm0, xmm10
145907a15: b9ffffffff mov ecx, 0xffffffff
145907a1a: 761f jbe 0x145907a3b
145907a3b: 89c1 mov ecx, eax
145907a3d: 412b8de4040000 sub ecx, dword ptr [r13 + 0x4e4]
145907a44: 0f8266ffffff jb 0x1459079b0
145907a4a: 89ca mov edx, ecx
145907a4c: e95fffffff jmp 0x1459079b0
145907a51: 4183bd680a000000 cmp dword ptr [r13 + 0xa68], 0
145907a59: 7421 je 0x145907a7c
145907a5b: 4180bdd80a000000 cmp byte ptr [r13 + 0xad8], 0
145907a63: 7517 jne 0x145907a7c
145907a65: 4180bddf0a000001 cmp byte ptr [r13 + 0xadf], 1
145907a6d: 750d jne 0x145907a7c
145907a6f: 4c89e9 mov rcx, r13
145907a72: b202 mov dl, 2
145907a74: 41b001 mov r8b, 1
145907a77: e8e44f0500 call 0x14595ca60
14590f612: 4180bdd80a000000 cmp byte ptr [r13 + 0xad8], 0
14590f61a: 0f85fd000000 jne 0x14590f71d
14590f620: eb28 jmp 0x14590f64a
14590f64a: 4c89f1 mov rcx, r14
14590f64d: 4c89fa mov rdx, r15
14590f650: e86b97f8ff call 0x145898dc0
14590f655: 4869c8f0000000 imul rcx, rax, 0xf0
14590f65c: 488d15cd2f2e01 lea rdx, [rip + 0x12e2fcd]
14590f663: 488d340a lea rsi, [rdx + rcx]
14590f667: 4883f80b cmp rax, 0xb
14590f66b: 7530 jne 0x14590f69d
14590f66d: 4c8b7c1150 mov r15, qword ptr [rcx + rdx + 0x50]
14590f672: 4a8d3cfd00000000 lea rdi, [r15*8]
14590f67a: 48b8f8ffffffffffff7f movabs rax, 0x7ffffffffffffff8
14590f684: 4839c7 cmp rdi, rax
14590f687: 0f860c080000 jbe 0x14590fe99
14590f69d: 488b4678 mov rax, qword ptr [rsi + 0x78]
14590f6a1: 488b8e80000000 mov rcx, qword ptr [rsi + 0x80]
14590f6a8: 488d0c89 lea rcx, [rcx + rcx*4]
14590f6ac: 48c1e104 shl rcx, 4
14590f6b0: 4801c1 add rcx, rax
14590f6b3: 48898530010000 mov qword ptr [rbp + 0x130], rax
14590f6ba: 48898d38010000 mov qword ptr [rbp + 0x138], rcx
14590f6c1: 48c7854001000000000000 mov qword ptr [rbp + 0x140], 0
14590f6cc: 488d8d08010000 lea rcx, [rbp + 0x108]
14590f6d3: 488d9530010000 lea rdx, [rbp + 0x130]
14590f6da: e8612d0c00 call 0x1459d2440
14590f6df: 4883bd1801000000 cmp qword ptr [rbp + 0x118], 0
14590f6e7: 0f8580090000 jne 0x14591006d
14590fe99: 488b5e48 mov rbx, qword ptr [rsi + 0x48]
14590fe9d: 4885ff test rdi, rdi
14590fea0: 0f84a0010000 je 0x145910046
14590fea6: e855236ffa call 0x140002200
14590feab: 41be08000000 mov r14d, 8
14590feb1: ba08000000 mov edx, 8
14590feb6: 4889f9 mov rcx, rdi
14590feb9: e802236ffa call 0x1400021c0
14590febe: 4885c0 test rax, rax
14590fec1: 0f84c9f7ffff je 0x14590f690
14590fec7: 4889c1 mov rcx, rax
14590feca: 4c89f8 mov rax, r15
14590fecd: e97b010000 jmp 0x14591004d
14591004d: 48898508010000 mov qword ptr [rbp + 0x108], rax
145910054: 48898d10010000 mov qword ptr [rbp + 0x110], rcx
14591005b: 4889da mov rdx, rbx
14591005e: 4989f8 mov r8, rdi
145910061: e875a32f00 call 0x145c0a3db
145910066: 4c89bd18010000 mov qword ptr [rbp + 0x118], r15
14591006d: 488d86d8000000 lea rax, [rsi + 0xd8]
145910074: 803e00 cmp byte ptr [rsi], 0
145910077: 488d4e04 lea rcx, [rsi + 4]
14591007b: 480f45c1 cmovne rax, rcx
14591007f: f3440f1028 movss xmm13, dword ptr [rax]
145910084: 498bbdb0090000 mov rdi, qword ptr [r13 + 0x9b0]
14591008b: 488d4f10 lea rcx, [rdi + 0x10]
14591008f: f20f10b6c8000000 movsd xmm6, qword ptr [rsi + 0xc8]
145910097: f3440f16c6 movshdup xmm8, xmm6
14591009c: 0f28ce movaps xmm1, xmm6
14591009f: 410f28d0 movaps xmm2, xmm8
1459100a3: e8980af9ff call 0x1458a0b40
1459100a8: f30f1185c8000000 movss dword ptr [rbp + 0xc8], xmm0
1459100b0: a801 test al, 1
1459100b2: 7542 jne 0x1459100f6
1459100b4: 48837f68ff cmp qword ptr [rdi + 0x68], -1
1459100b9: 742b je 0x1459100e6
1459100bb: 488d5768 lea rdx, [rdi + 0x68]
1459100bf: 488d8d30010000 lea rcx, [rbp + 0x130]
1459100c6: 0f28d6 movaps xmm2, xmm6
1459100c9: 410f28d8 movaps xmm3, xmm8
1459100cd: e88e4cf9ff call 0x1458a4d60
1459100d2: 90 nop
1459100d3: 83bd3001000001 cmp dword ptr [rbp + 0x130], 1
1459100da: 750a jne 0x1459100e6
1459100dc: f30f10853c010000 movss xmm0, dword ptr [rbp + 0x13c]
1459100e4: eb08 jmp 0x1459100ee
1459100e6: f30f1087b8000000 movss xmm0, dword ptr [rdi + 0xb8]
1459100ee: f30f1185c8000000 movss dword ptr [rbp + 0xc8], xmm0
1459100f6: f30f100566d14900 movss xmm0, dword ptr [rip + 0x49d166]
1459100fe: f3410f59c5 mulss xmm0, xmm13
145910103: 498d8568060000 lea rax, [r13 + 0x668]
14591010a: 48894558 mov qword ptr [rbp + 0x58], rax
14591010e: f30f108ed4000000 movss xmm1, dword ptr [rsi + 0xd4]
145910116: f30f580d42d56500 addss xmm1, dword ptr [rip + 0x65d542]
14591011e: f30f118d84000000 movss dword ptr [rbp + 0x84], xmm1
145910126: 488b4e38 mov rcx, qword ptr [rsi + 0x38]
14591012a: 488b4640 mov rax, qword ptr [rsi + 0x40]
14591012e: 488b9510010000 mov rdx, qword ptr [rbp + 0x110]
145910135: 48895548 mov qword ptr [rbp + 0x48], rdx
145910139: f30f12c0 movsldup xmm0, xmm0
14591013d: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
145910141: 48c1e004 shl rax, 4
145910145: 48898570010000 mov qword ptr [rbp + 0x170], rax
14591014c: f3440f1035eb674a00 movss xmm14, dword ptr [rip + 0x4a67eb]
145910155: 450f57c9 xorps xmm9, xmm9
145910159: f30f103de3674a00 movss xmm7, dword ptr [rip + 0x4a67e3]
145910161: 440f2805778b2f01 movaps xmm8, xmmword ptr [rip + 0x12f8b77]
145910169: 450f57ff xorps xmm15, xmm15
14591016d: 4531c0 xor r8d, r8d
145910170: 48894d50 mov qword ptr [rbp + 0x50], rcx
145910174: eb4c jmp 0x1459101c2
145910180: 498b8570060000 mov rax, qword ptr [r13 + 0x670]
145910187: 488d0cb6 lea rcx, [rsi + rsi*4]
14591018b: 48c704c800000000 mov qword ptr [rax + rcx*8], 0
145910193: 48895cc810 mov qword ptr [rax + rcx*8 + 0x10], rbx
145910198: 440f1354c818 movlps qword ptr [rax + rcx*8 + 0x18], xmm10
14591019e: f3440f115cc820 movss dword ptr [rax + rcx*8 + 0x20], xmm11
1459101a5: c744c8240000a041 mov dword ptr [rax + rcx*8 + 0x24], 0x41a00000
1459101ad: 48ffc6 inc rsi
1459101b0: 4989b578060000 mov qword ptr [r13 + 0x678], rsi
1459101b7: 4c8b85a8000000 mov r8, qword ptr [rbp + 0xa8]
1459101be: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
1459101c2: 4983f803 cmp r8, 3
1459101c6: 0f8721f5ffff ja 0x14590f6ed
1459101cc: 498d5001 lea rdx, [r8 + 1]
1459101d0: 450f57d2 xorps xmm10, xmm10
1459101d4: f34d0f2ad0 cvtsi2ss xmm10, r8
1459101d9: f3440f5915be154a00 mulss xmm10, dword ptr [rip + 0x4a15be]
1459101e2: f3440f5915a5114a00 mulss xmm10, dword ptr [rip + 0x4a11a5]
1459101eb: f3440f589584000000 addss xmm10, dword ptr [rbp + 0x84]
1459101f4: 31c0 xor eax, eax
1459101f6: 488995a8000000 mov qword ptr [rbp + 0xa8], rdx
1459101fd: 4c8985d0000000 mov qword ptr [rbp + 0xd0], r8
145910204: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145910210: 4889c7 mov rdi, rax
145910213: 48398570010000 cmp qword ptr [rbp + 0x170], rax
14591021a: 0f8482000000 je 0x1459102a2
145910220: 488d4710 lea rax, [rdi + 0x10]
145910224: 4c390439 cmp qword ptr [rcx + rdi], r8
145910228: 75e6 jne 0x145910210
14591022a: f20f104c01f8 movsd xmm1, qword ptr [rcx + rax - 8]
145910230: f3440f16d9 movshdup xmm11, xmm1
145910235: 498bb5b0090000 mov rsi, qword ptr [r13 + 0x9b0]
14591023c: 488d4e10 lea rcx, [rsi + 0x10]
145910240: 0f298db0000000 movaps xmmword ptr [rbp + 0xb0], xmm1
145910247: 410f28d3 movaps xmm2, xmm11
14591024b: e8f008f9ff call 0x1458a0b40
145910250: f30f1185d8000000 movss dword ptr [rbp + 0xd8], xmm0
145910258: a801 test al, 1
14591025a: 7546 jne 0x1459102a2
14591025c: 48837e68ff cmp qword ptr [rsi + 0x68], -1
145910261: 742f je 0x145910292
145910263: 488d5668 lea rdx, [rsi + 0x68]
145910267: 488d8d30010000 lea rcx, [rbp + 0x130]
14591026e: 0f2895b0000000 movaps xmm2, xmmword ptr [rbp + 0xb0]
145910275: 410f28db movaps xmm3, xmm11
145910279: e8e24af9ff call 0x1458a4d60
14591027e: 90 nop
14591027f: 83bd3001000001 cmp dword ptr [rbp + 0x130], 1
145910286: 750a jne 0x145910292
145910288: f30f10853c010000 movss xmm0, dword ptr [rbp + 0x13c]
145910290: eb08 jmp 0x14591029a
145910292: f30f1086b8000000 movss xmm0, dword ptr [rsi + 0xb8]
14591029a: f30f1185d8000000 movss dword ptr [rbp + 0xd8], xmm0
1459102a2: 0f2805278a2f01 movaps xmm0, xmmword ptr [rip + 0x12f8a27]
1459102a9: 0f118540010000 movups xmmword ptr [rbp + 0x140], xmm0
1459102b0: c785500100005c8fc23e mov dword ptr [rbp + 0x150], 0x3ec28f5c
1459102ba: 410f28c2 movaps xmm0, xmm10
1459102be: e854a12f00 call 0x145c0a417
1459102c3: 440f28d8 movaps xmm11, xmm0
1459102c7: 410f28c2 movaps xmm0, xmm10
1459102cb: e841a12f00 call 0x145c0a411
1459102d0: 440f14d8 unpcklps xmm11, xmm0
1459102d4: 48c785e000000000000000 mov qword ptr [rbp + 0xe0], 0
1459102df: 4889bde8000000 mov qword ptr [rbp + 0xe8], rdi
1459102e6: eb16 jmp 0x1459102fe
1459102f0: 4c8bad28010000 mov r13, qword ptr [rbp + 0x128]
1459102f7: 488bbde8000000 mov rdi, qword ptr [rbp + 0xe8]
1459102fe: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
145910305: 4883f805 cmp rax, 5
145910309: 0f8421070000 je 0x145910a30
14591030f: 4839bd70010000 cmp qword ptr [rbp + 0x170], rdi
145910316: 0f8534070000 jne 0x145910a50
14591031c: f30f10848540010000 movss xmm0, dword ptr [rbp + rax*4 + 0x140]
145910325: f3410f59c5 mulss xmm0, xmm13
14591032a: 48ffc0 inc rax
14591032d: 488985e0000000 mov qword ptr [rbp + 0xe0], rax
145910334: f3440f12d0 movsldup xmm10, xmm0
145910339: 450f59d3 mulps xmm10, xmm11
14591033d: 440f58d6 addps xmm10, xmm6
145910341: 498b8db0090000 mov rcx, qword ptr [r13 + 0x9b0]
145910348: 48837940ff cmp qword ptr [rcx + 0x40], -1
14591034d: f3410f16d2 movshdup xmm2, xmm10
145910352: 0f84c8040000 je 0x145910820
145910358: 0f28c2 movaps xmm0, xmm2
14591035b: f30f580561974b00 addss xmm0, dword ptr [rip + 0x4b9761]
145910363: f30f104964 movss xmm1, dword ptr [rcx + 0x64]
145910368: f30f5cc1 subss xmm0, xmm1
14591036c: f3480f2cc0 cvttss2si rax, xmm0
145910371: 4889c2 mov rdx, rax
145910374: 48c1fa3f sar rdx, 0x3f
145910378: 0f28d8 movaps xmm3, xmm0
14591037b: f3410f5cde subss xmm3, xmm14
145910380: f34c0f2cf3 cvttss2si r14, xmm3
145910385: 4921d6 and r14, rdx
145910388: 4909c6 or r14, rax
14591038b: 410f2ec1 ucomiss xmm0, xmm9
14591038f: 41b800000000 mov r8d, 0
145910395: 4d0f42f0 cmovb r14, r8
145910399: 0f2ec7 ucomiss xmm0, xmm7
14591039c: 49c7c5ffffffff mov r13, 0xffffffffffffffff
1459103a3: 4d0f47f5 cmova r14, r13
1459103a7: 410f28da movaps xmm3, xmm10
1459103ab: 410fc6da55 shufps xmm3, xmm10, 0x55
1459103b0: 410f58d8 addps xmm3, xmm8
1459103b4: 0fc6c900 shufps xmm1, xmm1, 0
1459103b8: 0f5cd9 subps xmm3, xmm1
1459103bb: 0f28cb movaps xmm1, xmm3
1459103be: 0fc6cbff shufps xmm1, xmm3, 0xff
1459103c2: f3480f2cc1 cvttss2si rax, xmm1
1459103c7: 4889c2 mov rdx, rax
1459103ca: 48c1fa3f sar rdx, 0x3f
1459103ce: 0f28e1 movaps xmm4, xmm1
1459103d1: f3410f5ce6 subss xmm4, xmm14
1459103d6: f3480f2cf4 cvttss2si rsi, xmm4
1459103db: 4821d6 and rsi, rdx
1459103de: 4809c6 or rsi, rax
1459103e1: 410f2ec9 ucomiss xmm1, xmm9
1459103e5: 490f42f0 cmovb rsi, r8
1459103e9: 0f2ecf ucomiss xmm1, xmm7
1459103ec: 490f47f5 cmova rsi, r13
1459103f0: 0f28cb movaps xmm1, xmm3
1459103f3: 660f15cb unpckhpd xmm1, xmm3
1459103f7: f3480f2cc1 cvttss2si rax, xmm1
1459103fc: 4889c2 mov rdx, rax
1459103ff: 48c1fa3f sar rdx, 0x3f
145910403: 0f28e1 movaps xmm4, xmm1
145910406: f3410f5ce6 subss xmm4, xmm14
14591040b: f34c0f2cdc cvttss2si r11, xmm4
145910410: 4921d3 and r11, rdx
145910413: 4909c3 or r11, rax
145910416: 410f2ec9 ucomiss xmm1, xmm9
14591041a: 4d0f42d8 cmovb r11, r8
14591041e: 0f2ecf ucomiss xmm1, xmm7
145910421: 4d0f47dd cmova r11, r13
145910425: f30f16cb movshdup xmm1, xmm3
145910429: f3480f2cc1 cvttss2si rax, xmm1
14591042e: 4889c2 mov rdx, rax
145910431: 48c1fa3f sar rdx, 0x3f
145910435: 0f28e1 movaps xmm4, xmm1
145910438: f3410f5ce6 subss xmm4, xmm14
14591043d: f34c0f2cd4 cvttss2si r10, xmm4
145910442: 4921d2 and r10, rdx
145910445: 4909c2 or r10, rax
145910448: 410f2ec9 ucomiss xmm1, xmm9
14591044c: 4d0f42d0 cmovb r10, r8
145910450: 0f2ecf ucomiss xmm1, xmm7
145910453: 4d0f47d5 cmova r10, r13
145910457: f30f104960 movss xmm1, dword ptr [rcx + 0x60]
14591045c: 0f28e3 movaps xmm4, xmm3
14591045f: 410fc2e701 cmpltps xmm4, xmm15
145910464: 440f50cc movmskps r9d, xmm4
145910468: 4489cb mov ebx, r9d
14591046b: 80e302 and bl, 2
14591046e: d0eb shr bl, 1
145910470: 4589cc mov r12d, r9d
145910473: 4180e404 and r12b, 4
145910477: 41c0ec02 shr r12b, 2
14591047b: 4589cf mov r15d, r9d
14591047e: 41c0ef03 shr r15b, 3
145910482: f3480f2cc3 cvttss2si rax, xmm3
145910487: 4889c2 mov rdx, rax
14591048a: 48c1fa3f sar rdx, 0x3f
14591048e: 0f28e3 movaps xmm4, xmm3
145910491: f3410f5ce6 subss xmm4, xmm14
145910496: f3480f2cfc cvttss2si rdi, xmm4
14591049b: 4821d7 and rdi, rdx
14591049e: 4809c7 or rdi, rax
1459104a1: 410f2ed9 ucomiss xmm3, xmm9
1459104a5: 490f42f8 cmovb rdi, r8
1459104a9: 0f2edf ucomiss xmm3, xmm7
1459104ac: 49c7c0ffffffff mov r8, 0xffffffffffffffff
1459104b3: 490f47fd cmova rdi, r13
1459104b7: 4889bd80010000 mov qword ptr [rbp + 0x180], rdi
1459104be: 41bdfeffffff mov r13d, 0xfffffffe
1459104c4: eb17 jmp 0x1459104dd
1459104dd: 0f57db xorps xmm3, xmm3
1459104e0: f3410f2add cvtsi2ss xmm3, r13d
1459104e5: f3410f58da addss xmm3, xmm10
1459104ea: f30f5cd9 subss xmm3, xmm1
1459104ee: 440f2ecb ucomiss xmm9, xmm3
1459104f2: 7769 ja 0x14591055d
1459104f4: 440f2ec8 ucomiss xmm9, xmm0
1459104f8: 7763 ja 0x14591055d
1459104fa: f3480f2cc3 cvttss2si rax, xmm3
1459104ff: 4889c2 mov rdx, rax
145910502: 48c1fa3f sar rdx, 0x3f
145910506: 0f28e3 movaps xmm4, xmm3
145910509: f3410f5ce6 subss xmm4, xmm14
14591050e: f3480f2cfc cvttss2si rdi, xmm4
145910513: 4821d7 and rdi, rdx
145910516: 4809c7 or rdi, rax
145910519: 410f2ed9 ucomiss xmm3, xmm9
14591051d: ba00000000 mov edx, 0
145910522: 480f43d7 cmovae rdx, rdi
145910526: 0f2edf ucomiss xmm3, xmm7
145910529: 490f47d0 cmova rdx, r8
14591052d: 488b4158 mov rax, qword ptr [rcx + 0x58]
145910531: 4839c2 cmp rdx, rax
145910534: 7327 jae 0x14591055d
145910536: 4939c6 cmp r14, rax
145910539: 7322 jae 0x14591055d
14591053b: 490fafc6 imul rax, r14
14591053f: 4801d0 add rax, rdx
145910542: 488b5150 mov rdx, qword ptr [rcx + 0x50]
145910546: 4839d0 cmp rax, rdx
145910549: 0f836f060000 jae 0x145910bbe
14591054f: 488b5148 mov rdx, qword ptr [rcx + 0x48]
145910553: 803c0200 cmp byte ptr [rdx + rax], 0
145910557: 0f8593fdffff jne 0x1459102f0
145910820: 4883c110 add rcx, 0x10
145910824: 410f28ca movaps xmm1, xmm10
145910828: e81303f9ff call 0x1458a0b40
14591082d: 90 nop
14591082e: a801 test al, 1
145910830: 0f84c8faffff je 0x1459102fe
145910836: 0f28c8 movaps xmm1, xmm0
145910839: f30f5c8dc8000000 subss xmm1, dword ptr [rbp + 0xc8]
145910841: 0f540d28804a00 andps xmm1, xmmword ptr [rip + 0x4a8028]
145910848: f30f101524cc4900 movss xmm2, dword ptr [rip + 0x49cc24]
145910850: 0f2ed1 ucomiss xmm2, xmm1
145910853: 0f86a5faffff jbe 0x1459102fe
145910859: e999020000 jmp 0x145910af7
145910a30: 4839bd70010000 cmp qword ptr [rbp + 0x170], rdi
145910a37: 0f8482000000 je 0x145910abf
145910a50: 440f2895b0000000 movaps xmm10, xmmword ptr [rbp + 0xb0]
145910a58: f3440f109dd8000000 movss xmm11, dword ptr [rbp + 0xd8]
145910a61: 488b85d0000000 mov rax, qword ptr [rbp + 0xd0]
145910a68: 488b8d18010000 mov rcx, qword ptr [rbp + 0x118]
145910a6f: 4885c9 test rcx, rcx
145910a72: 0f84f9010000 je 0x145910c71
145910a78: 4889c2 mov rdx, rax
145910a7b: 4809ca or rdx, rcx
145910a7e: 48c1ea20 shr rdx, 0x20
145910a82: 740c je 0x145910a90
145910a90: 31d2 xor edx, edx
145910a92: f7f1 div ecx
145910a94: 488b4548 mov rax, qword ptr [rbp + 0x48]
145910a98: 488b1cd0 mov rbx, qword ptr [rax + rdx*8]
145910a9c: 498bb578060000 mov rsi, qword ptr [r13 + 0x678]
145910aa3: 493bb568060000 cmp rsi, qword ptr [r13 + 0x668]
145910aaa: 0f85d0f6ffff jne 0x145910180
145910abf: 440f595dc0 mulps xmm11, xmmword ptr [rbp - 0x40]
145910ac4: 450f28d3 movaps xmm10, xmm11
145910ac8: 440f58d6 addps xmm10, xmm6
145910acc: f3450f16e2 movshdup xmm12, xmm10
145910ad1: 498bb5b0090000 mov rsi, qword ptr [r13 + 0x9b0]
145910ad8: 488d4e10 lea rcx, [rsi + 0x10]
145910adc: 410f28ca movaps xmm1, xmm10
145910ae0: 410f28d4 movaps xmm2, xmm12
145910ae4: e85700f9ff call 0x1458a0b40
145910ae9: 90 nop
145910aea: a801 test al, 1
145910aec: 741e je 0x145910b0c
145910aee: 440f28d8 movaps xmm11, xmm0
145910af2: e96affffff jmp 0x145910a61
145910af7: f30f1185d8000000 movss dword ptr [rbp + 0xd8], xmm0
145910aff: 440f2995b0000000 movaps xmmword ptr [rbp + 0xb0], xmm10
145910b07: e94cffffff jmp 0x145910a58
145910b0c: 48837e68ff cmp qword ptr [rsi + 0x68], -1
145910b11: 7430 je 0x145910b43
145910b13: 488d5668 lea rdx, [rsi + 0x68]
145910b17: 488d8d30010000 lea rcx, [rbp + 0x130]
145910b1e: 410f28d2 movaps xmm2, xmm10
145910b22: 410f28dc movaps xmm3, xmm12
145910b26: e83542f9ff call 0x1458a4d60
145910b2b: 90 nop
145910b2c: 83bd3001000001 cmp dword ptr [rbp + 0x130], 1
145910b33: 750e jne 0x145910b43
145910b35: f3440f109d3c010000 movss xmm11, dword ptr [rbp + 0x13c]
145910b3e: e91effffff jmp 0x145910a61
145910b43: f3440f109eb8000000 movss xmm11, dword ptr [rsi + 0xb8]
145910b4c: e910ffffff jmp 0x145910a61
14593d3f0: 56 push rsi
14593d3f1: 57 push rdi
14593d3f2: 53 push rbx
14593d3f3: 4883ec30 sub rsp, 0x30
14593d3f7: 488bb9b8070000 mov rdi, qword ptr [rcx + 0x7b8]
14593d3fe: 4885ff test rdi, rdi
14593d401: 0f84e7000000 je 0x14593d4ee
14593d407: 488b81b0070000 mov rax, qword ptr [rcx + 0x7b0]
14593d40e: f30f1000 movss xmm0, dword ptr [rax]
14593d412: 0f2e814c0a0000 ucomiss xmm0, dword ptr [rcx + 0xa4c]
14593d419: 0f87cf000000 ja 0x14593d4ee
14593d41f: 4c8b81d0090000 mov r8, qword ptr [rcx + 0x9d0]
14593d426: 4c8b89b8090000 mov r9, qword ptr [rcx + 0x9b8]
14593d42d: 4c8b91c0090000 mov r10, qword ptr [rcx + 0x9c0]
14593d434: 4f8d1c08 lea r11, [r8 + r9]
14593d438: 49c1c317 rol r11, 0x17
14593d43c: 4d01cb add r11, r9
14593d43f: 4c89d6 mov rsi, r10
14593d442: 48c1e611 shl rsi, 0x11
14593d446: 488b99c8090000 mov rbx, qword ptr [rcx + 0x9c8]
14593d44d: 4c31cb xor rbx, r9
14593d450: 4d31d0 xor r8, r10
14593d453: 4931da xor r10, rbx
14593d456: 4c8991c0090000 mov qword ptr [rcx + 0x9c0], r10
14593d45d: 4d31c1 xor r9, r8
14593d460: 4c8989b8090000 mov qword ptr [rcx + 0x9b8], r9
14593d467: 4831f3 xor rbx, rsi
14593d46a: 488999c8090000 mov qword ptr [rcx + 0x9c8], rbx
14593d471: 49c1eb28 shr r11, 0x28
14593d475: 0f57c0 xorps xmm0, xmm0
14593d478: f3410f2ac3 cvtsi2ss xmm0, r11d
14593d47d: 49c1c02d rol r8, 0x2d
14593d481: f30f5905b7555800 mulss xmm0, dword ptr [rip + 0x5855b7]
14593d489: 4c8981d0090000 mov qword ptr [rcx + 0x9d0], r8
14593d490: 0f2e05cdfd4600 ucomiss xmm0, dword ptr [rip + 0x46fdcd]
14593d497: 7355 jae 0x14593d4ee
14593d499: 4c8d4808 lea r9, [rax + 8]
14593d49d: 4c8d04fdf8ffffff lea r8, [rdi*8 - 8]
14593d4a5: 48ffcf dec rdi
14593d4a8: 4889ce mov rsi, rcx
14593d4ab: 4889c1 mov rcx, rax
14593d4ae: 4889d3 mov rbx, rdx
14593d4b1: 4c89ca mov rdx, r9
14593d4b4: e834cf2c00 call 0x145c0a3ed
14593d4b9: 4889beb8070000 mov qword ptr [rsi + 0x7b8], rdi
14593d4c0: f30f104308 movss xmm0, dword ptr [rbx + 8]
14593d4c5: f20f100b movsd xmm1, qword ptr [rbx]
14593d4c9: 0f580d50b92c01 addps xmm1, xmmword ptr [rip + 0x12cb950]
14593d4d0: 0f134c2420 movlps qword ptr [rsp + 0x20], xmm1
14593d4d5: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
14593d4db: 4c8d4c2420 lea r9, [rsp + 0x20]
14593d4e0: 4889f1 mov rcx, rsi
14593d4e3: ba06000000 mov edx, 6
14593d4e8: e8236e0000 call 0x145944310
14593d4ed: 90 nop
14593d4ee: 4883c430 add rsp, 0x30
14593d4f2: 5b pop rbx
14593d4f3: 5f pop rdi
14593d4f4: 5e pop rsi
14593d4f5: c3 ret
14594045e: 4983feff cmp r14, -1
145940462: 0f8498040000 je 0x145940900
145940468: 488b4d78 mov rcx, qword ptr [rbp + 0x78]
14594046c: 483b8f78060000 cmp rcx, qword ptr [rdi + 0x678]
145940473: 7329 jae 0x14594049e
145940475: 488b8770060000 mov rax, qword ptr [rdi + 0x670]
14594047c: 488d0c89 lea rcx, [rcx + rcx*4]
145940480: 48c704c800000000 mov qword ptr [rax + rcx*8], 0
145940488: f30f10874c0a0000 movss xmm0, dword ptr [rdi + 0xa4c]
145940490: f30f5805e0ae5600 addss xmm0, dword ptr [rip + 0x56aee0]
145940498: f30f1144c824 movss dword ptr [rax + rcx*8 + 0x24], xmm0
14594049e: 48c70700000000 mov qword ptr [rdi], 0
1459404a5: ff8794070000 inc dword ptr [rdi + 0x794]
1459404ab: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459404b2: 4c8d3ddfb82c01 lea r15, [rip + 0x12cb8df]
1459404b9: be5e000000 mov esi, 0x5e
1459404be: ba5e000000 mov edx, 0x5e
1459404c3: 4c89f9 mov rcx, r15
1459404c6: e805d90400 call 0x14598ddd0
1459404cb: 90 nop
1459404cc: 4885c0 test rax, rax
1459404cf: 4c0f45f8 cmovne r15, rax
1459404d3: 480f44d6 cmove rdx, rsi
1459404d7: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459404de: 4889542420 mov qword ptr [rsp + 0x20], rdx
1459404e3: 488d8de0000000 lea rcx, [rbp + 0xe0]
1459404ea: 4c89ea mov rdx, r13
1459404ed: 4c8b8538010000 mov r8, qword ptr [rbp + 0x138]
1459404f4: 4d89f9 mov r9, r15
1459404f7: e8c41df8ff call 0x1458c22c0
1459404fc: 90 nop
1459404fd: 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
145940504: 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
14594050b: 750d jne 0x14594051a
14594051a: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
145940521: 4889f1 mov rcx, rsi
145940524: 48c1e105 shl rcx, 5
145940528: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
14594052f: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
145940536: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594053b: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594053f: 48ffc6 inc rsi
145940542: 4889b730060000 mov qword ptr [rdi + 0x630], rsi
145940549: c6856701000000 mov byte ptr [rbp + 0x167], 0
145940550: 488d8de0000000 lea rcx, [rbp + 0xe0]
145940557: baee1f0000 mov edx, 0x1fee
14594055c: e8bf2bf8ff call 0x1458c3120
145940561: 90 nop
145940562: 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
145940569: 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
145940570: 750d jne 0x14594057f
14594057f: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
145940586: 4889f1 mov rcx, rsi
145940589: 48c1e105 shl rcx, 5
14594058d: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
145940594: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
14594059b: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1459405a0: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1459405a4: 48ffc6 inc rsi
1459405a7: 4889b730060000 mov qword ptr [rdi + 0x630], rsi
1459405ae: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459405b5: 488d8de0000000 lea rcx, [rbp + 0xe0]
1459405bc: 4c89ea mov rdx, r13
1459405bf: 4c8b8538010000 mov r8, qword ptr [rbp + 0x138]
1459405c6: e845c00400 call 0x14598c610
1459405cb: 90 nop
1459405cc: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459405d3: 488d95e0000000 lea rdx, [rbp + 0xe0]
1459405da: 4889f9 mov rcx, rdi
1459405dd: e8be29fdff call 0x145912fa0
1459405e2: 90 nop
1459405e3: 8b8794070000 mov eax, dword ptr [rdi + 0x794]
1459405e9: 448d0480 lea r8d, [rax + rax*4]
1459405ed: 4183c019 add r8d, 0x19
1459405f1: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459405f8: 4c8d8d40010000 lea r9, [rbp + 0x140]
1459405ff: 4889f9 mov rcx, rdi
145940602: ba01000000 mov edx, 1
145940607: e8043d0000 call 0x145944310
14594060c: 90 nop
14594060d: c6856701000000 mov byte ptr [rbp + 0x167], 0
145940614: 488d9540010000 lea rdx, [rbp + 0x140]
14594061b: 4889f9 mov rcx, rdi
14594061e: e8cdcdffff call 0x14593d3f0
145940623: 90 nop
145940624: ff876c0a0000 inc dword ptr [rdi + 0xa6c]
1459470b5: 49837e58ff cmp qword ptr [r14 + 0x58], -1
1459470ba: 0f84d10c0000 je 0x145947d91
1459470c0: 498b8690000000 mov rax, qword ptr [r14 + 0x90]
1459470c7: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
1459470ce: 483b8178060000 cmp rax, qword ptr [rcx + 0x678]
1459470d5: 7318 jae 0x1459470ef
1459470d7: 488b8970060000 mov rcx, qword ptr [rcx + 0x670]
1459470de: 488d0480 lea rax, [rax + rax*4]
1459470e2: f2440f104cc118 movsd xmm9, qword ptr [rcx + rax*8 + 0x18]
1459470e9: 8b7cc120 mov edi, dword ptr [rcx + rax*8 + 0x20]
1459470ed: eb0a jmp 0x1459470f9
1459470ef: 8bbde8020000 mov edi, dword ptr [rbp + 0x2e8]
1459470f5: 450f28ce movaps xmm9, xmm14
14595ca60: 55 push rbp
14595ca61: 4157 push r15
14595ca63: 4156 push r14
14595ca65: 4155 push r13
14595ca67: 4154 push r12
14595ca69: 56 push rsi
14595ca6a: 57 push rdi
14595ca6b: 53 push rbx
14595ca6c: 4881ec38020000 sub rsp, 0x238
14595ca73: 488dac2480000000 lea rbp, [rsp + 0x80]
14595ca7b: 440f2995a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm10
14595ca83: 440f298d90010000 movaps xmmword ptr [rbp + 0x190], xmm9
14595ca8b: 66440f7f8580010000 movdqa xmmword ptr [rbp + 0x180], xmm8
14595ca94: 660f7fbd70010000 movdqa xmmword ptr [rbp + 0x170], xmm7
14595ca9c: 0f29b560010000 movaps xmmword ptr [rbp + 0x160], xmm6
14595caa3: 48c78558010000feffffff mov qword ptr [rbp + 0x158], 0xfffffffffffffffe
14595caae: 44888526010000 mov byte ptr [rbp + 0x126], r8b
14595cab5: 4889ce mov rsi, rcx
14595cab8: 889527010000 mov byte ptr [rbp + 0x127], dl
14595cabe: 0fb6c2 movzx eax, dl
14595cac1: 84c0 test al, al
14595cac3: 48898d28010000 mov qword ptr [rbp + 0x128], rcx
14595caca: 488945b0 mov qword ptr [rbp - 0x50], rax
14595cace: 740e je 0x14595cade
14595cad0: 488d4df0 lea rcx, [rbp - 0x10]
14595cad4: 83f801 cmp eax, 1
14595cad7: 7522 jne 0x14595cafb
14595cad9: 0f57d2 xorps xmm2, xmm2
14595cadc: eb25 jmp 0x14595cb03
14595cafb: f30f10158d484500 movss xmm2, dword ptr [rip + 0x45488d]
14595cb03: 4889f2 mov rdx, rsi
14596a3e0: 55 push rbp
14596a3e1: 4157 push r15
14596a3e3: 4156 push r14
14596a3e5: 56 push rsi
14596a3e6: 57 push rdi
14596a3e7: 53 push rbx
14596a3e8: 4881ecc8000000 sub rsp, 0xc8
14596a3ef: 488dac2480000000 lea rbp, [rsp + 0x80]
14596a3f7: 440f296530 movaps xmmword ptr [rbp + 0x30], xmm12
14596a3fc: 440f295d20 movaps xmmword ptr [rbp + 0x20], xmm11
14596a401: 440f295510 movaps xmmword ptr [rbp + 0x10], xmm10
14596a406: 440f294d00 movaps xmmword ptr [rbp], xmm9
14596a40b: 440f2945f0 movaps xmmword ptr [rbp - 0x10], xmm8
14596a410: 0f297de0 movaps xmmword ptr [rbp - 0x20], xmm7
14596a414: 0f2975d0 movaps xmmword ptr [rbp - 0x30], xmm6
14596a418: 48c745c8feffffff mov qword ptr [rbp - 0x38], 0xfffffffffffffffe
14596a420: 4889d7 mov rdi, rdx
14596a423: 4889ce mov rsi, rcx
14596a426: 488b89a8020000 mov rcx, qword ptr [rcx + 0x2a8]
14596a42d: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
14596a434: e887e9f2ff call 0x145898dc0
14596a439: 4c69f0f0000000 imul r14, rax, 0xf0
14596a440: 488d1de9812801 lea rbx, [rip + 0x12881e9]
14596a447: f30f10b64c0a0000 movss xmm6, dword ptr [rsi + 0xa4c]
14596a44f: 440f28ce movaps xmm9, xmm6
14596a453: f3440f5e0d84e34400 divss xmm9, dword ptr [rip + 0x44e384]
14596a45c: f3440f1096c00a0000 movss xmm10, dword ptr [rsi + 0xac0]
14596a465: f3450f10841ee0000000 movss xmm8, dword ptr [r14 + rbx + 0xe0]
14596a46f: 498b941e88000000 mov rdx, qword ptr [r14 + rbx + 0x88]
14596a477: 4c8d8208020000 lea r8, [rdx + 0x208]
14596a47e: 488d4da8 lea rcx, [rbp - 0x58]
14596a482: e899380600 call 0x1459cdd20
14596a487: 4c8b7db0 mov r15, qword ptr [rbp - 0x50]
14596a48b: 488b55b8 mov rdx, qword ptr [rbp - 0x48]
14596a48f: 4883fa01 cmp rdx, 1
14596a493: 0f84b5000000 je 0x14596a54e
14596a499: 450f57db xorps xmm11, xmm11
14596a49d: 4885d2 test rdx, rdx
14596a4a0: 0f84ae000000 je 0x14596a554
14596a4a6: f3410f1007 movss xmm0, dword ptr [r15]
14596a4ab: 410f2ec1 ucomiss xmm0, xmm9
14596a4af: 0f830f020000 jae 0x14596a6c4
14596a4b5: 488d04d500000000 lea rax, [rdx*8]
14596a4bd: 31c9 xor ecx, ecx
14596a4bf: 90 nop
14596a4c0: f3410f1004cf movss xmm0, dword ptr [r15 + rcx*8]
14596a4c6: 410f2ec1 ucomiss xmm0, xmm9
14596a4ca: 730d jae 0x14596a4d9
14596a4cc: 48ffc1 inc rcx
14596a4cf: 4883c0f8 add rax, -8
14596a4d3: 75eb jne 0x14596a4c0
14596a4d5: 488d4aff lea rcx, [rdx - 1]
14596a4d9: 4883f901 cmp rcx, 1
14596a4dd: 4883d100 adc rcx, 0
14596a4e1: 488d41ff lea rax, [rcx - 1]
14596a4e5: 4839d0 cmp rax, rdx
14596a4e8: 0f8329020000 jae 0x14596a717
14596a4ee: 4839d1 cmp rcx, rdx
14596a4f1: 0f8336020000 jae 0x14596a72d
14596a4f7: f3410f1044cff8 movss xmm0, dword ptr [r15 + rcx*8 - 8]
14596a4fe: f3410f104ccffc movss xmm1, dword ptr [r15 + rcx*8 - 4]
14596a505: f3410f1014cf movss xmm2, dword ptr [r15 + rcx*8]
14596a50b: f3410f105ccf04 movss xmm3, dword ptr [r15 + rcx*8 + 4]
14596a512: f30f5cd9 subss xmm3, xmm1
14596a516: 450f28d9 movaps xmm11, xmm9
14596a51a: f3440f5cd8 subss xmm11, xmm0
14596a51f: f3440f59db mulss xmm11, xmm3
14596a524: f30f5cd0 subss xmm2, xmm0
14596a528: f30f5f15f42f4400 maxss xmm2, dword ptr [rip + 0x442ff4]
14596a530: f3440f5eda divss xmm11, xmm2
14596a535: f3440f58d9 addss xmm11, xmm1
14596a53a: 4c01f3 add rbx, r14
14596a53d: 488b9380000000 mov rdx, qword ptr [rbx + 0x80]
14596a544: 4839d7 cmp rdi, rdx
14596a547: 721e jb 0x14596a567
14596a567: 488b4378 mov rax, qword ptr [rbx + 0x78]
14596a56b: 488d0cbf lea rcx, [rdi + rdi*4]
14596a56f: 48c1e104 shl rcx, 4
14596a573: f3440f10640830 movss xmm12, dword ptr [rax + rcx + 0x30]
14596a57a: f30f103dde2c4400 movss xmm7, dword ptr [rip + 0x442cde]
14596a582: 83be8809000001 cmp dword ptr [rsi + 0x988], 1
14596a589: 7533 jne 0x14596a5be
14596a58b: 80bed00a000000 cmp byte ptr [rsi + 0xad0], 0
14596a592: 742a je 0x14596a5be
14596a594: f30f5cb68c090000 subss xmm6, dword ptr [rsi + 0x98c]
14596a59c: f30f5e353ce24400 divss xmm6, dword ptr [rip + 0x44e23c]
14596a5a4: 0f57c0 xorps xmm0, xmm0
14596a5a7: f30f5ff0 maxss xmm6, xmm0
14596a5ab: f30f100551e82901 movss xmm0, dword ptr [rip + 0x129e851]
14596a5b3: 0f28ce movaps xmm1, xmm6
14596a5b6: e8aafe2900 call 0x145c0a465
14596a5bb: 0f28f8 movaps xmm7, xmm0
14596a5be: 0fb7beca020000 movzx edi, word ptr [rsi + 0x2ca]
14596a5c5: 8bb694070000 mov esi, dword ptr [rsi + 0x794]
14596a5cb: 488b55a8 mov rdx, qword ptr [rbp - 0x58]
14596a5cf: 4885d2 test rdx, rdx
14596a5d2: 7412 je 0x14596a5e6
14596a5d4: 48c1e203 shl rdx, 3
14596a5d8: 41b804000000 mov r8d, 4
14596a5de: 4c89f9 mov rcx, r15
14596a5e1: e8ea7b69fa call 0x1400021d0
14596a5e6: 0fb7c7 movzx eax, di
14596a5e9: 0f57c9 xorps xmm1, xmm1
14596a5ec: f30f2ac8 cvtsi2ss xmm1, eax
14596a5f0: f30f5e0d902e4400 divss xmm1, dword ptr [rip + 0x442e90]
14596a5f8: f3440f591d2f714400 mulss xmm11, dword ptr [rip + 0x44712f]
14596a601: f3450f59c2 mulss xmm8, xmm10
14596a606: f3450f59d8 mulss xmm11, xmm8
14596a60b: f30f100535c54400 movss xmm0, dword ptr [rip + 0x44c535]
14596a613: f3410f59c1 mulss xmm0, xmm9
14596a618: f30f1015402c4400 movss xmm2, dword ptr [rip + 0x442c40]
14596a620: f30f58c2 addss xmm0, xmm2
14596a624: f30f101da4094500 movss xmm3, dword ptr [rip + 0x4509a4]
14596a62c: f3410f59d9 mulss xmm3, xmm9
14596a631: f3410f59d9 mulss xmm3, xmm9
14596a636: f30f58d8 addss xmm3, xmm0
14596a63a: f3410f59d8 mulss xmm3, xmm8
14596a63f: f3410f59dc mulss xmm3, xmm12
14596a644: f30f591d94c34900 mulss xmm3, dword ptr [rip + 0x49c394]
14596a64c: 410f28c3 movaps xmm0, xmm11
14596a650: f30f5fc3 maxss xmm0, xmm3
14596a654: 0f28d8 movaps xmm3, xmm0
14596a657: f30fc2d803 cmpunordss xmm3, xmm0
14596a65c: 0f28e3 movaps xmm4, xmm3
14596a65f: 0f55e0 andnps xmm4, xmm0
14596a662: 410f54db andps xmm3, xmm11
14596a666: 0f56dc orps xmm3, xmm4
14596a669: f30f591d0f2e4400 mulss xmm3, dword ptr [rip + 0x442e0f]
14596a671: 89f0 mov eax, esi
14596a673: 0f57c0 xorps xmm0, xmm0
14596a676: f3480f2ac0 cvtsi2ss xmm0, rax
14596a67b: f30f59df mulss xmm3, xmm7
14596a67f: f30f5905096d4400 mulss xmm0, dword ptr [rip + 0x446d09]
14596a687: f30f58c2 addss xmm0, xmm2
14596a68b: f30f59c3 mulss xmm0, xmm3
14596a68f: f30f59c1 mulss xmm0, xmm1
14596a693: 0f2875d0 movaps xmm6, xmmword ptr [rbp - 0x30]
14596a697: 0f287de0 movaps xmm7, xmmword ptr [rbp - 0x20]
14596a69b: 440f2845f0 movaps xmm8, xmmword ptr [rbp - 0x10]
14596a6a0: 440f284d00 movaps xmm9, xmmword ptr [rbp]
14596a6a5: 440f285510 movaps xmm10, xmmword ptr [rbp + 0x10]
14596a6aa: 440f285d20 movaps xmm11, xmmword ptr [rbp + 0x20]
14596a6af: 440f286530 movaps xmm12, xmmword ptr [rbp + 0x30]
14596a6b4: 4881c4c8000000 add rsp, 0xc8
14596a6bb: 5b pop rbx
14596a6bc: 5f pop rdi
14596a6bd: 5e pop rsi
14596a6be: 415e pop r14
14596a6c0: 415f pop r15
14596a6c2: 5d pop rbp
14596a6c3: c3 ret
14596a6c4: f3440f101d33044500 movss xmm11, dword ptr [rip + 0x450433]
14596a6cd: f3450f59d9 mulss xmm11, xmm9
14596a6d2: f30f5f054a2e4400 maxss xmm0, dword ptr [rip + 0x442e4a]
14596a6da: f3440f5ed8 divss xmm11, xmm0
14596a6df: f3440f581d48704400 addss xmm11, dword ptr [rip + 0x447048]
14596a6e8: f3450f595f04 mulss xmm11, dword ptr [r15 + 4]
14596a6ee: 4c01f3 add rbx, r14
14596a6f1: 488b9380000000 mov rdx, qword ptr [rbx + 0x80]
14596a6f8: 4839d7 cmp rdi, rdx
14596a6fb: 0f8266feffff jb 0x14596a567
14596a7e0: 56 push rsi
14596a7e1: 57 push rdi
14596a7e2: 4883ec78 sub rsp, 0x78
14596a7e6: 440f29542460 movaps xmmword ptr [rsp + 0x60], xmm10
14596a7ec: 440f294c2450 movaps xmmword ptr [rsp + 0x50], xmm9
14596a7f2: 440f29442440 movaps xmmword ptr [rsp + 0x40], xmm8
14596a7f8: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
14596a7fd: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
14596a802: 4889d7 mov rdi, rdx
14596a805: 4889ce mov rsi, rcx
14596a808: 488b89a8020000 mov rcx, qword ptr [rcx + 0x2a8]
14596a80f: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
14596a816: e8a5e5f2ff call 0x145898dc0
14596a81b: 4869c8f0000000 imul rcx, rax, 0xf0
14596a822: 488d05077e2801 lea rax, [rip + 0x1287e07]
14596a829: 488b940180000000 mov rdx, qword ptr [rcx + rax + 0x80]
14596a831: 4839d7 cmp rdi, rdx
14596a834: 0f8324010000 jae 0x14596a95e
14596a83a: 4801c8 add rax, rcx
14596a83d: 488b4878 mov rcx, qword ptr [rax + 0x78]
14596a841: 488d14bf lea rdx, [rdi + rdi*4]
14596a845: 48c1e204 shl rdx, 4
14596a849: f30f10741134 movss xmm6, dword ptr [rcx + rdx + 0x34]
14596a84f: f3440f10964c0a0000 movss xmm10, dword ptr [rsi + 0xa4c]
14596a858: f3440f1080e0000000 movss xmm8, dword ptr [rax + 0xe0]
14596a861: f3440f108ec00a0000 movss xmm9, dword ptr [rsi + 0xac0]
14596a86a: f30f103dee294400 movss xmm7, dword ptr [rip + 0x4429ee]
14596a872: 83be8809000001 cmp dword ptr [rsi + 0x988], 1
14596a879: 0f28c7 movaps xmm0, xmm7
14596a87c: 7534 jne 0x14596a8b2
14596a87e: 80bed00a000000 cmp byte ptr [rsi + 0xad0], 0
14596a885: 0f28c7 movaps xmm0, xmm7
14596a888: 7428 je 0x14596a8b2
14596a88a: 410f28ca movaps xmm1, xmm10
14596a88e: f30f5c8e8c090000 subss xmm1, dword ptr [rsi + 0x98c]
14596a896: f30f5e0d42df4400 divss xmm1, dword ptr [rip + 0x44df42]
14596a89e: 0f57c0 xorps xmm0, xmm0
14596a8a1: f30f5fc8 maxss xmm1, xmm0
14596a8a5: f30f100553e52901 movss xmm0, dword ptr [rip + 0x129e553]
14596a8ad: e8b3fb2900 call 0x145c0a465
14596a8b2: f3440f5e1525df4400 divss xmm10, dword ptr [rip + 0x44df25]
14596a8bb: f30f100dc12b4400 movss xmm1, dword ptr [rip + 0x442bc1]
14596a8c3: f3410f59ca mulss xmm1, xmm10
14596a8c8: f30f58cf addss xmm1, xmm7
14596a8cc: f30f101518e62901 movss xmm2, dword ptr [rip + 0x129e618]
14596a8d4: f3410f59d2 mulss xmm2, xmm10
14596a8d9: f3410f59d2 mulss xmm2, xmm10
14596a8de: f30f58d1 addss xmm2, xmm1
14596a8e2: f3450f59c1 mulss xmm8, xmm9
14596a8e7: 0f57c9 xorps xmm1, xmm1
14596a8ea: f3410f51c8 sqrtss xmm1, xmm8
14596a8ef: f30f59ca mulss xmm1, xmm2
14596a8f3: f30f59f1 mulss xmm6, xmm1
14596a8f7: f30f5935956a4400 mulss xmm6, dword ptr [rip + 0x446a95]
14596a8ff: f30f59f0 mulss xmm6, xmm0
14596a903: 8b8694070000 mov eax, dword ptr [rsi + 0x794]
14596a909: 0f57c9 xorps xmm1, xmm1
14596a90c: f3480f2ac8 cvtsi2ss xmm1, rax
14596a911: f30f590d7f6a4400 mulss xmm1, dword ptr [rip + 0x446a7f]
14596a919: f30f58cf addss xmm1, xmm7
14596a91d: f30f59ce mulss xmm1, xmm6
14596a921: 0fb786cc020000 movzx eax, word ptr [rsi + 0x2cc]
14596a928: 0f57c0 xorps xmm0, xmm0
14596a92b: f30f2ac0 cvtsi2ss xmm0, eax
14596a92f: f30f5e05512b4400 divss xmm0, dword ptr [rip + 0x442b51]
14596a937: f30f59c1 mulss xmm0, xmm1
14596a93b: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14596a940: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
14596a945: 440f28442440 movaps xmm8, xmmword ptr [rsp + 0x40]
14596a94b: 440f284c2450 movaps xmm9, xmmword ptr [rsp + 0x50]
14596a951: 440f28542460 movaps xmm10, xmmword ptr [rsp + 0x60]
14596a957: 4883c478 add rsp, 0x78
14596a95b: 5f pop rdi
14596a95c: 5e pop rsi
14596a95d: c3 ret
14598c610: 55 push rbp
14598c611: 4157 push r15
14598c613: 4156 push r14
14598c615: 4155 push r13
14598c617: 4154 push r12
14598c619: 56 push rsi
14598c61a: 57 push rdi
14598c61b: 53 push rbx
14598c61c: 4881ec88000000 sub rsp, 0x88
14598c623: 488dac2480000000 lea rbp, [rsp + 0x80]
14598c62b: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
14598c633: 4889ce mov rsi, rcx
14598c636: 488955f0 mov qword ptr [rbp - 0x10], rdx
14598c63a: 4c8945f8 mov qword ptr [rbp - 8], r8
14598c63e: 488d3d968e5b01 lea rdi, [rip + 0x15b8e96]
14598c645: bb27000000 mov ebx, 0x27
14598c64a: ba27000000 mov edx, 0x27
14598c64f: 4889f9 mov rcx, rdi
14598c652: e879170000 call 0x14598ddd0
14598c657: 4885c0 test rax, rax
14598c65a: 480f45f8 cmovne rdi, rax
14598c65e: 480f45da cmovne rbx, rdx
14598c662: 488d05878d5b01 lea rax, [rip + 0x15b8d87]
14598c669: 488945a8 mov qword ptr [rbp - 0x58], rax
14598c66d: 48c745b004000000 mov qword ptr [rbp - 0x50], 4
14598c675: 488d45f0 lea rax, [rbp - 0x10]
14598c679: 488945b8 mov qword ptr [rbp - 0x48], rax
14598c67d: 488d054c8d5b01 lea rax, [rip + 0x15b8d4c]
14598c684: 488945c0 mov qword ptr [rbp - 0x40], rax
14598c688: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14598c691: 488d4dc8 lea rcx, [rbp - 0x38]
14598c695: 4c8d4da8 lea r9, [rbp - 0x58]
14598c699: 4889fa mov rdx, rdi
14598c69c: 4989d8 mov r8, rbx
14598c69f: e8dc1a0000 call 0x14598e180
14598c6a4: 488b7df8 mov rdi, qword ptr [rbp - 8]
14598c6a8: 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
14598c6ac: 4c8b6dd0 mov r13, qword ptr [rbp - 0x30]
14598c6b0: 4885ff test rdi, rdi
14598c6b3: 7919 jns 0x14598c6ce
14598c6ce: 7434 je 0x14598c704
14598c6d0: 4c8b75f0 mov r14, qword ptr [rbp - 0x10]
14598c6d4: e8275b67fa call 0x140002200
14598c6d9: 41bf01000000 mov r15d, 1
14598c6df: ba01000000 mov edx, 1
14598c6e4: 4889f9 mov rcx, rdi
14598c6e7: e8d45a67fa call 0x1400021c0
14598c6ec: 4885c0 test rax, rax
14598c6ef: 74c7 je 0x14598c6b8
14598c6f1: 4889c3 mov rbx, rax
14598c6f4: 4889c1 mov rcx, rax
14598c6f7: 4c89f2 mov rdx, r14
14598c6fa: 4989f8 mov r8, rdi
14598c6fd: e8d9dc2700 call 0x145c0a3db
14598c702: eb05 jmp 0x14598c709
14598c709: 488d05f28d5b01 lea rax, [rip + 0x15b8df2]
14598c710: 48894630 mov qword ptr [rsi + 0x30], rax
14598c714: 48c7463808000000 mov qword ptr [rsi + 0x38], 8
14598c71c: 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
14598c720: 0f1106 movups xmmword ptr [rsi], xmm0
14598c723: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14598c727: 48894610 mov qword ptr [rsi + 0x10], rax
14598c72b: 48897e18 mov qword ptr [rsi + 0x18], rdi
14598c72f: 48895e20 mov qword ptr [rsi + 0x20], rbx
14598c733: 48897e28 mov qword ptr [rsi + 0x28], rdi
14598c737: c6464001 mov byte ptr [rsi + 0x40], 1
14598c73b: 4889f0 mov rax, rsi
14598c73e: 4881c488000000 add rsp, 0x88
14598c745: 5b pop rbx
14598c746: 5f pop rdi
14598c747: 5e pop rsi
14598c748: 415c pop r12
14598c74a: 415d pop r13
14598c74c: 415e pop r14
14598c74e: 415f pop r15
14598c750: 5d pop rbp
14598c751: c3 ret
1459cdd20: 55 push rbp
1459cdd21: 4157 push r15
1459cdd23: 4156 push r14
1459cdd25: 56 push rsi
1459cdd26: 57 push rdi
1459cdd27: 53 push rbx
1459cdd28: 4883ec68 sub rsp, 0x68
1459cdd2c: 488d6c2460 lea rbp, [rsp + 0x60]
1459cdd31: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
1459cdd35: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
1459cdd3d: 4889ce mov rsi, rcx
1459cdd40: 4c39c2 cmp rdx, r8
1459cdd43: 741a je 0x1459cdd5f
1459cdd45: 4c89c7 mov rdi, r8
1459cdd48: 4889d3 mov rbx, rdx
1459cdd4b: 4883c368 add rbx, 0x68
1459cdd4f: 90 nop
1459cdd50: 807bfc01 cmp byte ptr [rbx - 4], 1
1459cdd54: 7525 jne 0x1459cdd7b
1459cdd7b: f20f1073e8 movsd xmm6, qword ptr [rbx - 0x18]
1459cdd80: e87b4463fa call 0x140002200
1459cdd85: b920000000 mov ecx, 0x20
1459cdd8a: ba04000000 mov edx, 4
1459cdd8f: e82c4463fa call 0x1400021c0
1459cdd94: 4885c0 test rax, rax
1459cdd97: 0f84b0000000 je 0x1459cde4d
1459cdd9d: 0f1330 movlps qword ptr [rax], xmm6
1459cdda0: 48c745d004000000 mov qword ptr [rbp - 0x30], 4
1459cdda8: 488945d8 mov qword ptr [rbp - 0x28], rax
1459cddac: 48c745e001000000 mov qword ptr [rbp - 0x20], 1
1459cddb4: 4839fb cmp rbx, rdi
1459cddb7: 7469 je 0x1459cde22
1459cddb9: 41be01000000 mov r14d, 1
1459cddbf: 4c8d7dd0 lea r15, [rbp - 0x30]
1459cddc3: 4883c368 add rbx, 0x68
1459cddc7: 660f1f840000000000 nop word ptr [rax + rax]
1459cddd0: 807bfc01 cmp byte ptr [rbx - 4], 1
1459cddd4: 750b jne 0x1459cdde1
1459cddd6: 4839fb cmp rbx, rdi
1459cddd9: 488d5b68 lea rbx, [rbx + 0x68]
1459cdddd: 75f1 jne 0x1459cddd0
1459cdddf: eb41 jmp 0x1459cde22
1459cdde1: f20f1073e8 movsd xmm6, qword ptr [rbx - 0x18]
1459cdde6: 4c3b75d0 cmp r14, qword ptr [rbp - 0x30]
1459cddea: 7525 jne 0x1459cde11
1459cde11: 420f1334f0 movlps qword ptr [rax + r14*8], xmm6
1459cde16: 49ffc6 inc r14
1459cde19: 4c8975e0 mov qword ptr [rbp - 0x20], r14
1459cde1d: 4839fb cmp rbx, rdi
1459cde20: 75a1 jne 0x1459cddc3
1459cde22: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1459cde26: 48894610 mov qword ptr [rsi + 0x10], rax
1459cde2a: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1459cde2e: 488906 mov qword ptr [rsi], rax
1459cde31: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459cde35: 48894608 mov qword ptr [rsi + 8], rax
1459cde39: 4889f0 mov rax, rsi
1459cde3c: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
1459cde40: 4883c468 add rsp, 0x68
1459cde44: 5b pop rbx
1459cde45: 5f pop rdi
1459cde46: 5e pop rsi
1459cde47: 415e pop r14
1459cde49: 415f pop r15
1459cde4b: 5d pop rbp
1459cde4c: c3 ret
1459d2440: 55 push rbp
1459d2441: 4157 push r15
1459d2443: 4156 push r14
1459d2445: 4155 push r13
1459d2447: 4154 push r12
1459d2449: 56 push rsi
1459d244a: 57 push rdi
1459d244b: 53 push rbx
1459d244c: 4883ec48 sub rsp, 0x48
1459d2450: 488d6c2440 lea rbp, [rsp + 0x40]
1459d2455: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
1459d245d: 4889ce mov rsi, rcx
1459d2460: 4c8b3a mov r15, qword ptr [rdx]
1459d2463: 4c8b7208 mov r14, qword ptr [rdx + 8]
1459d2467: 4d39f7 cmp r15, r14
1459d246a: 0f8419010000 je 0x1459d2589
1459d2470: 488b7a10 mov rdi, qword ptr [rdx + 0x10]
1459d2474: 4983c750 add r15, 0x50
1459d2478: b8ffffff7f mov eax, 0x7fffffff
1459d247d: eb21 jmp 0x1459d24a0
1459d2480: 488d4f01 lea rcx, [rdi + 1]
1459d2484: 48894a10 mov qword ptr [rdx + 0x10], rcx
1459d2488: 498d4fb0 lea rcx, [r15 - 0x50]
1459d248c: 4983c750 add r15, 0x50
1459d2490: 48ffc7 inc rdi
1459d2493: 4883c150 add rcx, 0x50
1459d2497: 4c39f1 cmp rcx, r14
1459d249a: 0f84e9000000 je 0x1459d2589
1459d24a0: 41807ffc01 cmp byte ptr [r15 - 4], 1
1459d24a5: 75d9 jne 0x1459d2480
1459d24a7: 418b4ff8 mov ecx, dword ptr [r15 - 8]
1459d24ab: 21c1 and ecx, eax
1459d24ad: 4c8d6701 lea r12, [rdi + 1]
1459d24b1: 4c896210 mov qword ptr [rdx + 0x10], r12
1459d24b5: 81f90000807f cmp ecx, 0x7f800000
1459d24bb: 7dcb jge 0x1459d2488
1459d24bd: 4c893a mov qword ptr [rdx], r15
1459d24c0: e83bfd62fa call 0x140002200
1459d24c5: b920000000 mov ecx, 0x20
1459d24ca: ba08000000 mov edx, 8
1459d24cf: e8ecfc62fa call 0x1400021c0
1459d24d4: 4885c0 test rax, rax
1459d24d7: 0f84d7000000 je 0x1459d25b4
1459d24dd: 488938 mov qword ptr [rax], rdi
1459d24e0: 48c745e804000000 mov qword ptr [rbp - 0x18], 4
1459d24e8: 488945f0 mov qword ptr [rbp - 0x10], rax
1459d24ec: 48c745f801000000 mov qword ptr [rbp - 8], 1
1459d24f4: 4d39f7 cmp r15, r14
1459d24f7: 7477 je 0x1459d2570
1459d24f9: bf01000000 mov edi, 1
1459d24fe: 41bdffffff7f mov r13d, 0x7fffffff
1459d2504: 488d5de8 lea rbx, [rbp - 0x18]
1459d2508: 4983c750 add r15, 0x50
1459d250c: eb0e jmp 0x1459d251c
1459d251c: 41807ffc01 cmp byte ptr [r15 - 4], 1
1459d2521: 75ed jne 0x1459d2510
1459d2523: 418b4ff8 mov ecx, dword ptr [r15 - 8]
1459d2527: 4421e9 and ecx, r13d
1459d252a: 81f90000807f cmp ecx, 0x7f800000
1459d2530: 7dde jge 0x1459d2510
1459d2532: 483b7de8 cmp rdi, qword ptr [rbp - 0x18]
1459d2536: 7525 jne 0x1459d255d
1459d255d: 4c8924f8 mov qword ptr [rax + rdi*8], r12
1459d2561: 49ffc4 inc r12
1459d2564: 48ffc7 inc rdi
1459d2567: 48897df8 mov qword ptr [rbp - 8], rdi
1459d256b: 4d39f7 cmp r15, r14
1459d256e: 7598 jne 0x1459d2508
1459d2570: 488b45f8 mov rax, qword ptr [rbp - 8]
1459d2574: 48894610 mov qword ptr [rsi + 0x10], rax
1459d2578: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459d257c: 488906 mov qword ptr [rsi], rax
1459d257f: 488b45f0 mov rax, qword ptr [rbp - 0x10]
1459d2583: 48894608 mov qword ptr [rsi + 8], rax
1459d2587: eb17 jmp 0x1459d25a0
1459d2589: 48c70600000000 mov qword ptr [rsi], 0
1459d2590: 48c7460808000000 mov qword ptr [rsi + 8], 8
1459d2598: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
1459d25a0: 4889f0 mov rax, rsi
1459d25a3: 4883c448 add rsp, 0x48
1459d25a7: 5b pop rbx
1459d25a8: 5f pop rdi
1459d25a9: 5e pop rsi
1459d25aa: 415c pop r12
1459d25ac: 415d pop r13
1459d25ae: 415e pop r14
1459d25b0: 415f pop r15
1459d25b2: 5d pop rbp
1459d25b3: c3 ret
