1458fa123: 450f57c0 xorps xmm8, xmm8
1458fa35c: f20f10059cd96200 movsd xmm0, qword ptr [rip + 0x62d99c]
1458fa7ef: 440f1185100a0000 movups xmmword ptr [rbp + 0xa10], xmm8
1458fa7f7: f20f1185d00a0000 movsd qword ptr [rbp + 0xad0], xmm0
14590412c: f30f10874c0a0000 movss xmm0, dword ptr [rdi + 0xa4c]
145904134: f30f5e05a4464b00 divss xmm0, dword ptr [rip + 0x4b46a4]
14590413c: f30f114568 movss dword ptr [rbp + 0x68], xmm0
145904d79: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
145904d80: 488bbdf8030000 mov rdi, qword ptr [rbp + 0x3f8]
145904d87: 488b81e8090000 mov rax, qword ptr [rcx + 0x9e8]
145904d8e: 4883f805 cmp rax, 5
145904d92: 0f8314170000 jae 0x1459064ac
145904d98: 488b9788000000 mov rdx, qword ptr [rdi + 0x88]
145904d9f: 486bc868 imul rcx, rax, 0x68
145904da3: f30f104d68 movss xmm1, dword ptr [rbp + 0x68]
145904da8: 0f2e4c0a50 ucomiss xmm1, dword ptr [rdx + rcx + 0x50]
145904dad: 0f82c1170000 jb 0x145906574
145904db3: 4801ca add rdx, rcx
145904db6: 48ffc0 inc rax
145904db9: 488b8d38040000 mov rcx, qword ptr [rbp + 0x438]
145904dc0: 488981e8090000 mov qword ptr [rcx + 0x9e8], rax
145904dc7: e824630300 call 0x14593b0f0
145904dcc: 90 nop
145904dcd: 488b85f0020000 mov rax, qword ptr [rbp + 0x2f0]
145904dd4: f30f1000 movss xmm0, dword ptr [rax]
145904dd8: e997170000 jmp 0x145906574
14590649b: 488b81e8090000 mov rax, qword ptr [rcx + 0x9e8]
1459064a2: 4883f805 cmp rax, 5
1459064a6: 0f82ece8ffff jb 0x145904d98
1459064ac: 80b9d00a000000 cmp byte ptr [rcx + 0xad0], 0
1459064b3: 0f84bb000000 je 0x145906574
1459064b9: 0f2e81a80a0000 ucomiss xmm0, dword ptr [rcx + 0xaa8]
1459064c0: 0f82ae000000 jb 0x145906574
1459064c6: 488b8538040000 mov rax, qword ptr [rbp + 0x438]
1459064cd: 4c8b88b8090000 mov r9, qword ptr [rax + 0x9b8]
1459064d4: 488b88c0090000 mov rcx, qword ptr [rax + 0x9c0]
1459064db: 4c8b90d0090000 mov r10, qword ptr [rax + 0x9d0]
1459064e2: 4c8b80c8090000 mov r8, qword ptr [rax + 0x9c8]
1459064e9: 41bb05000000 mov r11d, 5
1459064ef: 90 nop
1459064f0: 4b8d0411 lea rax, [r9 + r10]
1459064f4: 48c1c017 rol rax, 0x17
1459064f8: 4c01c8 add rax, r9
1459064fb: 4889ca mov rdx, rcx
1459064fe: 48c1e211 shl rdx, 0x11
145906502: 4d31c8 xor r8, r9
145906505: 4931ca xor r10, rcx
145906508: 4c31c1 xor rcx, r8
14590650b: 4d31d1 xor r9, r10
14590650e: 49c1c22d rol r10, 0x2d
145906512: 4931d0 xor r8, rdx
145906515: 49f7e3 mul r11
145906518: 48c1e83d shr rax, 0x3d
14590651c: 83f804 cmp eax, 4
14590651f: 77cf ja 0x1459064f0
145906521: 488bb538040000 mov rsi, qword ptr [rbp + 0x438]
145906528: 4c898eb8090000 mov qword ptr [rsi + 0x9b8], r9
14590652f: 4c8996d0090000 mov qword ptr [rsi + 0x9d0], r10
145906536: 48898ec0090000 mov qword ptr [rsi + 0x9c0], rcx
14590653d: 4c8986c8090000 mov qword ptr [rsi + 0x9c8], r8
145906544: 486bd268 imul rdx, rdx, 0x68
145906548: 48039788000000 add rdx, qword ptr [rdi + 0x88]
14590654f: 4889f1 mov rcx, rsi
145906552: e8994b0300 call 0x14593b0f0
145906557: 90 nop
145906558: f30f10864c0a0000 movss xmm0, dword ptr [rsi + 0xa4c]
145906560: f30f100d68fb2f01 movss xmm1, dword ptr [rip + 0x12ffb68]
145906568: f30f58c8 addss xmm1, xmm0
14590656c: f30f118ea80a0000 movss dword ptr [rsi + 0xaa8], xmm1
14590d825: 4180bc24d80a000000 cmp byte ptr [r12 + 0xad8], 0
14590d82e: 4c89a528010000 mov qword ptr [rbp + 0x128], r12
14590d835: 0f84fe020000 je 0x14590db39
14590dac7: 498b8c24a8020000 mov rcx, qword ptr [r12 + 0x2a8]
14590dacf: 498b9424b0020000 mov rdx, qword ptr [r12 + 0x2b0]
14590dad7: e8e4b2f8ff call 0x145898dc0
14590dadc: 4869c0f0000000 imul rax, rax, 0xf0
14590dae3: 488d0d464b2e01 lea rcx, [rip + 0x12e4b46]
14590daea: 488bbc0888000000 mov rdi, qword ptr [rax + rcx + 0x88]
14590daf2: 4c89e1 mov rcx, r12
14590daf5: 4889fa mov rdx, rdi
14590daf8: e8f3d50200 call 0x14593b0f0
14590dafd: 488d5768 lea rdx, [rdi + 0x68]
14590db01: 4c89e1 mov rcx, r12
14590db04: e8e7d50200 call 0x14593b0f0
14590db09: 488d97d0000000 lea rdx, [rdi + 0xd0]
14590db10: 4c89e1 mov rcx, r12
14590db13: e8d8d50200 call 0x14593b0f0
14590db18: 488d9738010000 lea rdx, [rdi + 0x138]
14590db1f: 4c89e1 mov rcx, r12
14590db22: e8c9d50200 call 0x14593b0f0
14590db27: 4881c7a0010000 add rdi, 0x1a0
14590db2e: 4c89e1 mov rcx, r12
14590db31: 4889fa mov rdx, rdi
14590db34: e8b7d50200 call 0x14593b0f0
14593b1d0: 490fbdc9 bsr rcx, r9
14593b1d4: f7d1 not ecx
14593b1d6: 4d89c8 mov r8, r9
14593b1d9: 49d3e0 shl r8, cl
14593b1dc: 49ffc8 dec r8
14593b1df: 4c8b9eb8090000 mov r11, qword ptr [rsi + 0x9b8]
14593b1e6: 488b8ec0090000 mov rcx, qword ptr [rsi + 0x9c0]
14593b1ed: 488b9ed0090000 mov rbx, qword ptr [rsi + 0x9d0]
14593b1f4: 4c8b96c8090000 mov r10, qword ptr [rsi + 0x9c8]
14593b1fb: 0f1f440000 nop dword ptr [rax + rax]
14593b200: 498d041b lea rax, [r11 + rbx]
14593b204: 48c1c017 rol rax, 0x17
14593b208: 4c01d8 add rax, r11
14593b20b: 4889cf mov rdi, rcx
14593b20e: 48c1e711 shl rdi, 0x11
14593b212: 4d31da xor r10, r11
14593b215: 4831cb xor rbx, rcx
14593b218: 4931db xor r11, rbx
14593b21b: 48c1c32d rol rbx, 0x2d
14593b21f: 4c31d1 xor rcx, r10
14593b222: 49f7e1 mul r9
14593b225: 4931fa xor r10, rdi
14593b228: 4939c0 cmp r8, rax
14593b22b: 72d3 jb 0x14593b200
14593b22d: 4c899eb8090000 mov qword ptr [rsi + 0x9b8], r11
14593b234: 48899ed0090000 mov qword ptr [rsi + 0x9d0], rbx
14593b23b: 48898ec0090000 mov qword ptr [rsi + 0x9c0], rcx
14593b242: 4c8996c8090000 mov qword ptr [rsi + 0x9c8], r10
14593b249: 4939d1 cmp r9, rdx
14593b24c: 0f86a60b0000 jbe 0x14593bdf8
14593b252: 488b85e8010000 mov rax, qword ptr [rbp + 0x1e8]
14593b259: 4c8b3cd0 mov r15, qword ptr [rax + rdx*8]
14593b386: 458b7540 mov r14d, dword ptr [r13 + 0x40]
14593b38a: 8b86780a0000 mov eax, dword ptr [rsi + 0xa78]
14593b390: ffc0 inc eax
14593b392: 8986780a0000 mov dword ptr [rsi + 0xa78], eax
14593b398: 4489f1 mov ecx, r14d
14593b39b: 81e1ffffff00 and ecx, 0xffffff
14593b3a1: 48c1e118 shl rcx, 0x18
14593b3a5: 25ffffff00 and eax, 0xffffff
14593b3aa: 4809c8 or rax, rcx
14593b3ad: 48bb00000000000030f1 movabs rbx, 0xf130000000000000
14593b3b7: 4809c3 or rbx, rax
14593b3ba: 458b4d44 mov r9d, dword ptr [r13 + 0x44]
14593b3be: f3450f104548 movss xmm8, dword ptr [r13 + 0x48]
14593b3c4: 488d85d0010000 lea rax, [rbp + 0x1d0]
14593b3cb: 4889442438 mov qword ptr [rsp + 0x38], rax
14593b3d0: f30f117c2428 movss dword ptr [rsp + 0x28], xmm7
14593b3d6: f3440f11442420 movss dword ptr [rsp + 0x20], xmm8
14593b3dd: c644243001 mov byte ptr [rsp + 0x30], 1
14593b3e2: 4889f1 mov rcx, rsi
14593b3e5: 4889da mov rdx, rbx
14593b3e8: 4589f0 mov r8d, r14d
14593b3eb: e880110000 call 0x14593c570
14593b3f0: 4d8b7d10 mov r15, qword ptr [r13 + 0x10]
14593b3f4: 4d8b6518 mov r12, qword ptr [r13 + 0x18]
14593b3f8: 4d85e4 test r12, r12
14593b3fb: 0f8427010000 je 0x14593b528
14593b401: 4889df mov rdi, rbx
14593b404: 4a8d1ca500000000 lea rbx, [r12*4]
14593b40c: e8ef6d6cfa call 0x140002200
14593b411: ba04000000 mov edx, 4
14593b416: 4889d9 mov rcx, rbx
14593b419: e8a26d6cfa call 0x1400021c0
14593b41e: 4885c0 test rax, rax
14593b421: 0f84e6090000 je 0x14593be0d
14593b427: 4983fc0c cmp r12, 0xc
14593b42b: 0f8301010000 jae 0x14593b532
14593b431: 31c9 xor ecx, ecx
14593b433: 4889fb mov rbx, rdi
14593b436: e9d7010000 jmp 0x14593b612
14593b48d: 498d5f08 lea rbx, [r15 + 8]
14593b491: 48ffcf dec rdi
14593b494: 49bcffffffffffffff1f movabs r12, 0x1fffffffffffffff
14593b49e: 4921fc and r12, rdi
14593b4a1: eb1a jmp 0x14593b4bd
14593b4b0: 4883c308 add rbx, 8
14593b4b4: 49ffcc dec r12
14593b4b7: 0f84a0fdffff je 0x14593b25d
14593b4bd: 488b85c8010000 mov rax, qword ptr [rbp + 0x1c8]
14593b4c4: f3410f1007 movss xmm0, dword ptr [r15]
14593b4c9: f3410f104f04 movss xmm1, dword ptr [r15 + 4]
14593b4cf: f30f5c00 subss xmm0, dword ptr [rax]
14593b4d3: f30f5c4804 subss xmm1, dword ptr [rax + 4]
14593b4d8: e852ef2c00 call 0x145c0a42f
14593b4dd: 0f28f0 movaps xmm6, xmm0
14593b4e0: 488b85c8010000 mov rax, qword ptr [rbp + 0x1c8]
14593b4e7: f30f1003 movss xmm0, dword ptr [rbx]
14593b4eb: f30f104b04 movss xmm1, dword ptr [rbx + 4]
14593b4f0: f30f5c00 subss xmm0, dword ptr [rax]
14593b4f4: f30f5c4804 subss xmm1, dword ptr [rax + 4]
14593b4f9: e831ef2c00 call 0x145c0a42f
14593b4fe: 0f14f0 unpcklps xmm6, xmm0
14593b501: 0f28c6 movaps xmm0, xmm6
14593b504: 660f72e01f psrad xmm0, 0x1f
14593b509: 660f72d001 psrld xmm0, 1
14593b50e: 660fefc6 pxor xmm0, xmm6
14593b512: 660f70c855 pshufd xmm1, xmm0, 0x55
14593b517: 660f66c1 pcmpgtd xmm0, xmm1
14593b51b: 660f7ec0 movd eax, xmm0
14593b51f: a801 test al, 1
14593b521: 758d jne 0x14593b4b0
14593b523: 4989df mov r15, rbx
14593b526: eb88 jmp 0x14593b4b0
14593b528: b804000000 mov eax, 4
14593b52d: e9ab010000 jmp 0x14593b6dd
14593b532: 4a8d0ca0 lea rcx, [rax + r12*4]
14593b536: 498d5730 lea rdx, [r15 + 0x30]
14593b53a: 4d6bc438 imul r8, r12, 0x38
14593b53e: 4d01f8 add r8, r15
14593b541: 4983c0fc add r8, -4
14593b545: 4c39c0 cmp rax, r8
14593b548: 410f92c0 setb r8b
14593b54c: 4839ca cmp rdx, rcx
14593b54f: 0f92c1 setb cl
14593b552: 4184c8 test r8b, cl
14593b555: 4889fb mov rbx, rdi
14593b558: 7424 je 0x14593b57e
14593b57e: 4c89e1 mov rcx, r12
14593b581: 4883e1f8 and rcx, 0xfffffffffffffff8
14593b585: 498d97b8010000 lea rdx, [r15 + 0x1b8]
14593b58c: 4531c0 xor r8d, r8d
14593b58f: 0f28057ad82c01 movaps xmm0, xmmword ptr [rip + 0x12cd87a]
14593b596: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593b5a0: f30f108a78feffff movss xmm1, dword ptr [rdx - 0x188]
14593b5a8: f30f1092b0feffff movss xmm2, dword ptr [rdx - 0x150]
14593b5b0: 0f14ca unpcklps xmm1, xmm2
14593b5b3: f30f1092e8feffff movss xmm2, dword ptr [rdx - 0x118]
14593b5bb: f30f109a20ffffff movss xmm3, dword ptr [rdx - 0xe0]
14593b5c3: 0f14d3 unpcklps xmm2, xmm3
14593b5c6: 0f16ca movlhps xmm1, xmm2
14593b5c9: f30f1012 movss xmm2, dword ptr [rdx]
14593b5cd: f30f105ac8 movss xmm3, dword ptr [rdx - 0x38]
14593b5d2: 0f14da unpcklps xmm3, xmm2
14593b5d5: f30f105290 movss xmm2, dword ptr [rdx - 0x70]
14593b5da: f30f10a258ffffff movss xmm4, dword ptr [rdx - 0xa8]
14593b5e2: 0f14e2 unpcklps xmm4, xmm2
14593b5e5: 0f16e3 movlhps xmm4, xmm3
14593b5e8: 0f59c8 mulps xmm1, xmm0
14593b5eb: 0f59e0 mulps xmm4, xmm0
14593b5ee: 420f110c80 movups xmmword ptr [rax + r8*4], xmm1
14593b5f3: 420f11648010 movups xmmword ptr [rax + r8*4 + 0x10], xmm4
14593b5f9: 4983c008 add r8, 8
14593b5fd: 4881c2c0010000 add rdx, 0x1c0
14593b604: 4c39c1 cmp rcx, r8
14593b607: 7597 jne 0x14593b5a0
14593b609: 4939cc cmp r12, rcx
14593b60c: 0f84cb000000 je 0x14593b6dd
14593b612: 4d89e0 mov r8, r12
14593b615: 4889ca mov rdx, rcx
14593b618: 4983e003 and r8, 3
14593b61c: 744d je 0x14593b66b
14593b61e: 486bd138 imul rdx, rcx, 0x38
14593b622: 4e8d0c3a lea r9, [rdx + r15]
14593b626: 4983c130 add r9, 0x30
14593b62a: 4b8d1400 lea rdx, [r8 + r8]
14593b62e: 41c1e004 shl r8d, 4
14593b632: 4929d0 sub r8, rdx
14593b635: 4531d2 xor r10d, r10d
14593b638: f30f1005f0604700 movss xmm0, dword ptr [rip + 0x4760f0]
14593b640: 4889ca mov rdx, rcx
14593b643: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593b650: f3430f100c91 movss xmm1, dword ptr [r9 + r10*4]
14593b656: f30f59c8 mulss xmm1, xmm0
14593b65a: f30f110c90 movss dword ptr [rax + rdx*4], xmm1
14593b65f: 48ffc2 inc rdx
14593b662: 4983c20e add r10, 0xe
14593b666: 4d39d0 cmp r8, r10
14593b669: 75e5 jne 0x14593b650
14593b66b: 4c29e1 sub rcx, r12
14593b66e: 4883f9fc cmp rcx, -4
14593b672: 7769 ja 0x14593b6dd
14593b674: 486bca38 imul rcx, rdx, 0x38
14593b678: 4c01f9 add rcx, r15
14593b67b: 4881c1d8000000 add rcx, 0xd8
14593b682: f30f1005a6604700 movss xmm0, dword ptr [rip + 0x4760a6]
14593b68a: 660f1f440000 nop word ptr [rax + rax]
14593b690: f30f108958ffffff movss xmm1, dword ptr [rcx - 0xa8]
14593b698: f30f59c8 mulss xmm1, xmm0
14593b69c: f30f110c90 movss dword ptr [rax + rdx*4], xmm1
14593b6a1: f30f104990 movss xmm1, dword ptr [rcx - 0x70]
14593b6a6: f30f59c8 mulss xmm1, xmm0
14593b6aa: f30f114c9004 movss dword ptr [rax + rdx*4 + 4], xmm1
14593b6b0: f30f1049c8 movss xmm1, dword ptr [rcx - 0x38]
14593b6b5: f30f59c8 mulss xmm1, xmm0
14593b6b9: f30f114c9008 movss dword ptr [rax + rdx*4 + 8], xmm1
14593b6bf: f30f1009 movss xmm1, dword ptr [rcx]
14593b6c3: f30f59c8 mulss xmm1, xmm0
14593b6c7: f30f114c900c movss dword ptr [rax + rdx*4 + 0xc], xmm1
14593b6cd: 4883c204 add rdx, 4
14593b6d1: 4881c1e0000000 add rcx, 0xe0
14593b6d8: 4939d4 cmp r12, rdx
14593b6db: 75b3 jne 0x14593b690
14593b8ca: 4d8d7d40 lea r15, [r13 + 0x40]
14593b8ce: 4869cfd8010000 imul rcx, rdi, 0x1d8
14593b8d5: 48038e68050000 add rcx, qword ptr [rsi + 0x568]
14593b8dc: 488d55c0 lea rdx, [rbp - 0x40]
14593b8e0: 41b8d8010000 mov r8d, 0x1d8
14593b8e6: e8f0ea2c00 call 0x145c0a3db
14593b8eb: 48ffc7 inc rdi
14593b8ee: 4889be70050000 mov qword ptr [rsi + 0x570], rdi
14593b8f5: 4181feb5020000 cmp r14d, 0x2b5
14593b8fc: 0f8480040000 je 0x14593bd82
14593b902: 4181fe43040000 cmp r14d, 0x443
14593b909: 751d jne 0x14593b928
14593b90b: 4c8d059aaf2a01 lea r8, [rip + 0x12aaf9a]
14593b912: 4180781d02 cmp byte ptr [r8 + 0x1d], 2
14593b917: 740f je 0x14593b928
14593b919: 4983c004 add r8, 4
14593b91d: 4889f1 mov rcx, rsi
14593b920: 4889da mov rdx, rbx
14593b923: e8189afdff call 0x145915340
14593b928: 4c89bde0010000 mov qword ptr [rbp + 0x1e0], r15
14593b92f: 488d05aa322b00 lea rax, [rip + 0x2b32aa]
14593b936: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
14593b93d: 488d15ac852a01 lea rdx, [rip + 0x12a85ac]
14593b944: 488d4dc0 lea rcx, [rbp - 0x40]
14593b948: 4c8d85e0010000 lea r8, [rbp + 0x1e0]
14593b94f: e8dc172a00 call 0x145bdd130
14593b954: 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
14593b958: 488b55d0 mov rdx, qword ptr [rbp - 0x30]
14593b95c: 498b7d00 mov rdi, qword ptr [r13]
14593b960: 4c89ada8010000 mov qword ptr [rbp + 0x1a8], r13
14593b967: 4d8b7508 mov r14, qword ptr [r13 + 8]
14593b96b: 48898df8010000 mov qword ptr [rbp + 0x1f8], rcx
14593b972: e859240500 call 0x14598ddd0
14593b977: 90 nop
14593b978: 4989c4 mov r12, rax
14593b97b: 4989d5 mov r13, rdx
14593b97e: 48899d00020000 mov qword ptr [rbp + 0x200], rbx
14593b985: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14593b989: 4885d2 test rdx, rdx
14593b98c: 7412 je 0x14593b9a0
14593b9a0: 4d85e4 test r12, r12
14593b9a3: 4889bdb0010000 mov qword ptr [rbp + 0x1b0], rdi
14593b9aa: 4c0f44e7 cmove r12, rdi
14593b9ae: 4c89b5b8010000 mov qword ptr [rbp + 0x1b8], r14
14593b9b5: 4d0f44ee cmove r13, r14
14593b9b9: 4c89bdf8010000 mov qword ptr [rbp + 0x1f8], r15
14593b9c0: 4c89bde0010000 mov qword ptr [rbp + 0x1e0], r15
14593b9c7: 488d0512322b00 lea rax, [rip + 0x2b3212]
14593b9ce: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
14593b9d5: 488d1522852a01 lea rdx, [rip + 0x12a8522]
14593b9dc: 488d4dc0 lea rcx, [rbp - 0x40]
14593b9e0: 4c8d85e0010000 lea r8, [rbp + 0x1e0]
14593b9e7: e844172a00 call 0x145bdd130
14593b9ec: 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
14593b9f0: 488b55d0 mov rdx, qword ptr [rbp - 0x30]
14593b9f4: 488b85a8010000 mov rax, qword ptr [rbp + 0x1a8]
14593b9fb: 488b7820 mov rdi, qword ptr [rax + 0x20]
14593b9ff: 4c8b7028 mov r14, qword ptr [rax + 0x28]
14593ba03: 48898dc0010000 mov qword ptr [rbp + 0x1c0], rcx
14593ba0a: e8c1230500 call 0x14598ddd0
14593ba0f: 90 nop
14593ba10: 4889c3 mov rbx, rax
14593ba13: 4989d7 mov r15, rdx
14593ba16: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14593ba1a: 4885d2 test rdx, rdx
14593ba1d: 7412 je 0x14593ba31
14593ba31: 488d8620060000 lea rax, [rsi + 0x620]
14593ba38: 4885db test rbx, rbx
14593ba3b: 480f45fb cmovne rdi, rbx
14593ba3f: 4d0f44fe cmove r15, r14
14593ba43: 4c897c2428 mov qword ptr [rsp + 0x28], r15
14593ba48: 48897c2420 mov qword ptr [rsp + 0x20], rdi
14593ba4d: 488d4dc0 lea rcx, [rbp - 0x40]
14593ba51: 488b9500020000 mov rdx, qword ptr [rbp + 0x200]
14593ba58: 4d89e0 mov r8, r12
14593ba5b: 4d89e9 mov r9, r13
14593ba5e: 4989c5 mov r13, rax
14593ba61: e8aa85f8ff call 0x1458c4010
14593ba66: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
14593ba6d: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
14593ba74: 7509 jne 0x14593ba7f
14593ba7f: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14593ba86: 4889f9 mov rcx, rdi
14593ba89: 48c1e105 shl rcx, 5
14593ba8d: 0f1045c0 movups xmm0, xmmword ptr [rbp - 0x40]
14593ba91: 0f104dd0 movups xmm1, xmmword ptr [rbp - 0x30]
14593ba95: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14593ba9a: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14593ba9e: 48ffc7 inc rdi
14593baa1: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
14593baa8: 488b85f8010000 mov rax, qword ptr [rbp + 0x1f8]
14593baaf: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
14593bab6: 488d0523312b00 lea rax, [rip + 0x2b3123]
14593babd: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
14593bac4: 488d1525842a01 lea rdx, [rip + 0x12a8425]
14593bacb: 488d4dc0 lea rcx, [rbp - 0x40]
14593bacf: 4c8d85e0010000 lea r8, [rbp + 0x1e0]
14593bad6: e855162a00 call 0x145bdd130
14593badb: 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
14593badf: 488b55d0 mov rdx, qword ptr [rbp - 0x30]
14593bae3: 48898d00020000 mov qword ptr [rbp + 0x200], rcx
14593baea: e8e1220500 call 0x14598ddd0
14593baef: 90 nop
14593baf0: 4c8bb5a8010000 mov r14, qword ptr [rbp + 0x1a8]
14593baf7: 4889c3 mov rbx, rax
14593bafa: 4989d4 mov r12, rdx
14593bafd: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14593bb01: 4885d2 test rdx, rdx
14593bb04: 7412 je 0x14593bb18
14593bb18: 4885db test rbx, rbx
14593bb1b: 480f449db0010000 cmove rbx, qword ptr [rbp + 0x1b0]
14593bb23: 4c0f44a5b8010000 cmove r12, qword ptr [rbp + 0x1b8]
14593bb2b: 4c8d3dd6ed2c01 lea r15, [rip + 0x12cedd6]
14593bb32: bf1a000000 mov edi, 0x1a
14593bb37: ba1a000000 mov edx, 0x1a
14593bb3c: 4c89f9 mov rcx, r15
14593bb3f: e88c220500 call 0x14598ddd0
14593bb44: 4885c0 test rax, rax
14593bb47: 4c0f45f8 cmovne r15, rax
14593bb4b: 480f44d7 cmove rdx, rdi
14593bb4f: 4889542420 mov qword ptr [rsp + 0x20], rdx
14593bb54: 488d4dc0 lea rcx, [rbp - 0x40]
14593bb58: 4889da mov rdx, rbx
14593bb5b: 4d89e0 mov r8, r12
14593bb5e: 4d89f9 mov r9, r15
14593bb61: e85a67f8ff call 0x1458c22c0
14593bb66: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
14593bb6d: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
14593bb74: 7509 jne 0x14593bb7f
14593bb7f: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14593bb86: 4889f9 mov rcx, rdi
14593bb89: 48c1e105 shl rcx, 5
14593bb8d: 0f1045c0 movups xmm0, xmmword ptr [rbp - 0x40]
14593bb91: 0f104dd0 movups xmm1, xmmword ptr [rbp - 0x30]
14593bb95: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14593bb9a: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14593bb9e: 48ffc7 inc rdi
14593bba1: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
14593bba8: e853666cfa call 0x140002200
14593bbad: b920000000 mov ecx, 0x20
14593bbb2: ba01000000 mov edx, 1
14593bbb7: e804666cfa call 0x1400021c0
14593bbbc: 4885c0 test rax, rax
14593bbbf: 0f8422020000 je 0x14593bde7
14593bbc5: 48898500020000 mov qword ptr [rbp + 0x200], rax
14593bbcc: c700ee1f0000 mov dword ptr [rax], 0x1fee
14593bbd2: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
14593bbd9: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
14593bbe0: 488b9df8010000 mov rbx, qword ptr [rbp + 0x1f8]
14593bbe7: 7509 jne 0x14593bbf2
14593bbf2: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14593bbf9: 4889f9 mov rcx, rdi
14593bbfc: 48c1e105 shl rcx, 5
14593bc00: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14593bc08: 488b9500020000 mov rdx, qword ptr [rbp + 0x200]
14593bc0f: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14593bc14: 48c744081004000000 mov qword ptr [rax + rcx + 0x10], 4
14593bc1d: 66c7440818d202 mov word ptr [rax + rcx + 0x18], 0x2d2
14593bc24: 48ffc7 inc rdi
14593bc27: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
14593bc2e: 418b7e60 mov edi, dword ptr [r14 + 0x60]
14593bc32: 85ff test edi, edi
14593bc34: 747b je 0x14593bcb1
14593bc36: e8c5656cfa call 0x140002200
14593bc3b: b920000000 mov ecx, 0x20
14593bc40: ba01000000 mov edx, 1
14593bc45: e876656cfa call 0x1400021c0
14593bc4a: 4885c0 test rax, rax
14593bc4d: 0f8494010000 je 0x14593bde7
14593bc53: 48898500020000 mov qword ptr [rbp + 0x200], rax
14593bc5a: 8938 mov dword ptr [rax], edi
14593bc5c: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
14593bc63: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
14593bc6a: 7509 jne 0x14593bc75
14593bc75: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14593bc7c: 4889f9 mov rcx, rdi
14593bc7f: 48c1e105 shl rcx, 5
14593bc83: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14593bc8b: 488b9500020000 mov rdx, qword ptr [rbp + 0x200]
14593bc92: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14593bc97: 48c744081004000000 mov qword ptr [rax + rcx + 0x10], 4
14593bca0: 66c7440818d202 mov word ptr [rax + rcx + 0x18], 0x2d2
14593bca7: 48ffc7 inc rdi
14593bcaa: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
14593bcb1: 48899de0010000 mov qword ptr [rbp + 0x1e0], rbx
14593bcb8: 488d05212f2b00 lea rax, [rip + 0x2b2f21]
14593bcbf: 488985e8010000 mov qword ptr [rbp + 0x1e8], rax
14593bcc6: 488d1523822a01 lea rdx, [rip + 0x12a8223]
14593bccd: 488d4dc0 lea rcx, [rbp - 0x40]
14593bcd1: 4c8d85e0010000 lea r8, [rbp + 0x1e0]
14593bcd8: e853142a00 call 0x145bdd130
14593bcdd: 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
14593bce1: 488b55d0 mov rdx, qword ptr [rbp - 0x30]
14593bce5: 48898df8010000 mov qword ptr [rbp + 0x1f8], rcx
14593bcec: e8df200500 call 0x14598ddd0
14593bcf1: 90 nop
14593bcf2: 4989c7 mov r15, rax
14593bcf5: 4889d3 mov rbx, rdx
14593bcf8: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
14593bcfc: 4885d2 test rdx, rdx
14593bcff: 7412 je 0x14593bd13
14593bd13: 4d85ff test r15, r15
14593bd16: 488b95b0010000 mov rdx, qword ptr [rbp + 0x1b0]
14593bd1d: 490f45d7 cmovne rdx, r15
14593bd21: 480f449db8010000 cmove rbx, qword ptr [rbp + 0x1b8]
14593bd29: 450fb64e64 movzx r9d, byte ptr [r14 + 0x64]
14593bd2e: 488d7dc0 lea rdi, [rbp - 0x40]
14593bd32: 4889f9 mov rcx, rdi
14593bd35: 4989d8 mov r8, rbx
14593bd38: e803020500 call 0x14598bf40
14593bd3d: 4889f1 mov rcx, rsi
14593bd40: 4889fa mov rdx, rdi
14593bd43: e85872fdff call 0x145912fa0
14593bd82: 4c8d0503ab2a01 lea r8, [rip + 0x12aab03]
14593bd89: 4180781d02 cmp byte ptr [r8 + 0x1d], 2
14593bd8e: 0f8585fbffff jne 0x14593b919
14593d500: 4157 push r15
14593d502: 4156 push r14
14593d504: 4155 push r13
14593d506: 4154 push r12
14593d508: 56 push rsi
14593d509: 57 push rdi
14593d50a: 55 push rbp
14593d50b: 53 push rbx
14593d50c: 4881ecf8000000 sub rsp, 0xf8
14593d513: 440f29bc24e0000000 movaps xmmword ptr [rsp + 0xe0], xmm15
14593d51c: 440f29b424d0000000 movaps xmmword ptr [rsp + 0xd0], xmm14
14593d525: 440f29ac24c0000000 movaps xmmword ptr [rsp + 0xc0], xmm13
14593d52e: 440f29a424b0000000 movaps xmmword ptr [rsp + 0xb0], xmm12
14593d537: 440f299c24a0000000 movaps xmmword ptr [rsp + 0xa0], xmm11
14593d540: 440f29942490000000 movaps xmmword ptr [rsp + 0x90], xmm10
14593d549: 440f298c2480000000 movaps xmmword ptr [rsp + 0x80], xmm9
14593d552: 440f29442470 movaps xmmword ptr [rsp + 0x70], xmm8
14593d558: 0f297c2460 movaps xmmword ptr [rsp + 0x60], xmm7
14593d55d: 0f29742450 movaps xmmword ptr [rsp + 0x50], xmm6
14593d562: f30f115c2428 movss dword ptr [rsp + 0x28], xmm3
14593d568: f30f11542424 movss dword ptr [rsp + 0x24], xmm2
14593d56e: 4889d7 mov rdi, rdx
14593d571: 48894c2438 mov qword ptr [rsp + 0x38], rcx
14593d576: f30f10842460010000 movss xmm0, dword ptr [rsp + 0x160]
14593d57f: f30f11442434 movss dword ptr [rsp + 0x34], xmm0
14593d585: f20f108ae0090000 movsd xmm1, qword ptr [rdx + 0x9e0]
14593d58d: 0f28c1 movaps xmm0, xmm1
14593d590: 0f59c1 mulps xmm0, xmm1
14593d593: f30f16d0 movshdup xmm2, xmm0
14593d597: f30f58d0 addss xmm2, xmm0
14593d59b: 0f29542440 movaps xmmword ptr [rsp + 0x40], xmm2
14593d5a0: 0f2e158d954700 ucomiss xmm2, dword ptr [rip + 0x47958d]
14593d5a7: 760f jbe 0x14593d5b8
14593d5a9: f30f16c1 movshdup xmm0, xmm1
14593d5ad: e895ce2c00 call 0x145c0a447
14593d5b2: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
14593d5b8: f3440f1005a73d4700 movss xmm8, dword ptr [rip + 0x473da7]
14593d5c1: f30f1015bbd54700 movss xmm2, dword ptr [rip + 0x47d5bb]
14593d5c9: f30f101d97b62c01 movss xmm3, dword ptr [rip + 0x12cb697]
14593d5d1: f30f102527db4700 movss xmm4, dword ptr [rip + 0x47db27]
14593d5d9: f3440f103de23e4700 movss xmm15, dword ptr [rip + 0x473ee2]
14593d5e2: 488d2d47502b01 lea rbp, [rip + 0x12b5047]
14593d5e9: f30f103daf414700 movss xmm7, dword ptr [rip + 0x4741af]
14593d5f1: 4531ed xor r13d, r13d
14593d5f4: eb2f jmp 0x14593d625
14593d600: 41ffc5 inc r13d
14593d603: 4183fd10 cmp r13d, 0x10
14593d607: f30f101575d54700 movss xmm2, dword ptr [rip + 0x47d575]
14593d60f: f30f101d51b62c01 movss xmm3, dword ptr [rip + 0x12cb651]
14593d617: f30f1025e1da4700 movss xmm4, dword ptr [rip + 0x47dae1]
14593d61f: 0f84c9060000 je 0x14593dcee
14593d625: 0f28442440 movaps xmm0, xmmword ptr [rsp + 0x40]
14593d62a: 0f2e0503954700 ucomiss xmm0, dword ptr [rip + 0x479503]
14593d631: 488b97b8090000 mov rdx, qword ptr [rdi + 0x9b8]
14593d638: 488b87c0090000 mov rax, qword ptr [rdi + 0x9c0]
14593d63f: 4c8b87d0090000 mov r8, qword ptr [rdi + 0x9d0]
14593d646: 488b8fc8090000 mov rcx, qword ptr [rdi + 0x9c8]
14593d64d: 0f86bd000000 jbe 0x14593d710
14593d653: 4d8d0c10 lea r9, [r8 + rdx]
14593d657: 49c1c117 rol r9, 0x17
14593d65b: 4901d1 add r9, rdx
14593d65e: 4989c2 mov r10, rax
14593d661: 49c1e211 shl r10, 0x11
14593d665: 4831d1 xor rcx, rdx
14593d668: 4931c0 xor r8, rax
14593d66b: 4831c8 xor rax, rcx
14593d66e: 4c31c2 xor rdx, r8
14593d671: 49c1c02d rol r8, 0x2d
14593d675: 49c1e928 shr r9, 0x28
14593d679: 0f57c0 xorps xmm0, xmm0
14593d67c: f3410f2ac1 cvtsi2ss xmm0, r9d
14593d681: 4c31d1 xor rcx, r10
14593d684: f30f5905b4535800 mulss xmm0, dword ptr [rip + 0x5853b4]
14593d68c: f30f104c2434 movss xmm1, dword ptr [rsp + 0x34]
14593d692: 0f2ec8 ucomiss xmm1, xmm0
14593d695: 7679 jbe 0x14593d710
14593d710: 4e8d0c02 lea r9, [rdx + r8]
14593d714: 49c1c117 rol r9, 0x17
14593d718: 4901d1 add r9, rdx
14593d71b: 4989c2 mov r10, rax
14593d71e: 49c1e211 shl r10, 0x11
14593d722: 4831d1 xor rcx, rdx
14593d725: 4931c0 xor r8, rax
14593d728: 4831c8 xor rax, rcx
14593d72b: 4c31c2 xor rdx, r8
14593d72e: 49c1c02d rol r8, 0x2d
14593d732: 4c31d1 xor rcx, r10
14593d735: 49c1e929 shr r9, 0x29
14593d739: 4181c90000803f or r9d, 0x3f800000
14593d740: 66450f6ed9 movd xmm11, r9d
14593d745: f3450f58d8 addss xmm11, xmm8
14593d74a: f3440f59df mulss xmm11, xmm7
14593d74f: 410f2efb ucomiss xmm7, xmm11
14593d753: 76bb jbe 0x14593d710
14593d755: 0f57c0 xorps xmm0, xmm0
14593d758: f3440f58d8 addss xmm11, xmm0
14593d75d: 488997b8090000 mov qword ptr [rdi + 0x9b8], rdx
14593d764: 4c8987d0090000 mov qword ptr [rdi + 0x9d0], r8
14593d76b: 488987c0090000 mov qword ptr [rdi + 0x9c0], rax
14593d772: 48898fc8090000 mov qword ptr [rdi + 0x9c8], rcx
14593d779: 488d8fb8090000 lea rcx, [rdi + 0x9b8]
14593d780: f30f104c2424 movss xmm1, dword ptr [rsp + 0x24]
14593d786: f30f10542428 movss xmm2, dword ptr [rsp + 0x28]
14593d78c: e8ff550800 call 0x1459c2d90
14593d791: 410f2ec7 ucomiss xmm0, xmm15
14593d795: 0f8265feffff jb 0x14593d600
14593d79b: 440f28c8 movaps xmm9, xmm0
14593d79f: f20f10b7d0040000 movsd xmm6, qword ptr [rdi + 0x4d0]
14593d7a7: 410f28c3 movaps xmm0, xmm11
14593d7ab: e867cc2c00 call 0x145c0a417
14593d7b0: 440f28d0 movaps xmm10, xmm0
14593d7b4: 410f28c3 movaps xmm0, xmm11
14593d7b8: e854cc2c00 call 0x145c0a411
14593d7bd: 4c8bb7a8020000 mov r14, qword ptr [rdi + 0x2a8]
14593d7c4: 4c8bbfb0020000 mov r15, qword ptr [rdi + 0x2b0]
14593d7cb: f30f108fd8040000 movss xmm1, dword ptr [rdi + 0x4d8]
14593d7d3: f30f114c242c movss dword ptr [rsp + 0x2c], xmm1
14593d7d9: 488b9fb0090000 mov rbx, qword ptr [rdi + 0x9b0]
14593d7e0: 488bb7d8090000 mov rsi, qword ptr [rdi + 0x9d8]
14593d7e7: 440f14d0 unpcklps xmm10, xmm0
14593d7eb: 4885f6 test rsi, rsi
14593d7ee: 7523 jne 0x14593d813
14593d7f0: e9fe020000 jmp 0x14593daf3
14593d800: f3440f580dbbc24800 addss xmm9, dword ptr [rip + 0x48c2bb]
14593d809: 450f2ecf ucomiss xmm9, xmm15
14593d80d: 0f82edfdffff jb 0x14593d600
14593d813: f3450f12d9 movsldup xmm11, xmm9
14593d818: 450f59da mulps xmm11, xmm10
14593d81c: 440f58de addps xmm11, xmm6
14593d820: f3450f16e3 movshdup xmm12, xmm11
14593d825: 4c89f1 mov rcx, r14
14593d828: 4c89fa mov rdx, r15
14593d82b: e890b5f5ff call 0x145898dc0
14593d830: 4c69e0f0000000 imul r12, rax, 0xf0
14593d837: f3410f108c2cc8000000 movss xmm1, dword ptr [r12 + rbp + 0xc8]
14593d841: 410f28c3 movaps xmm0, xmm11
14593d845: f30f5cc1 subss xmm0, xmm1
14593d849: f3410f10942ccc000000 movss xmm2, dword ptr [r12 + rbp + 0xcc]
14593d853: 410f28cc movaps xmm1, xmm12
14593d857: f30f5cca subss xmm1, xmm2
14593d85b: e8cfcb2c00 call 0x145c0a42f
14593d860: 440f28e8 movaps xmm13, xmm0
14593d864: f3450f10b42cd8000000 movss xmm14, dword ptr [r12 + rbp + 0xd8]
14593d86e: 410f28c6 movaps xmm0, xmm14
14593d872: f30f5805aa3e4700 addss xmm0, dword ptr [rip + 0x473eaa]
14593d87a: 440f2ee8 ucomiss xmm13, xmm0
14593d87e: 7780 ja 0x14593d800
14593d880: 488d4b10 lea rcx, [rbx + 0x10]
14593d884: 410f28cb movaps xmm1, xmm11
14593d888: 410f28d4 movaps xmm2, xmm12
14593d88c: e8af32f6ff call 0x1458a0b40
14593d891: a801 test al, 1
14593d893: 0f8467ffffff je 0x14593d800
14593d899: 31c0 xor eax, eax
14593d89b: 450f2eee ucomiss xmm13, xmm14
14593d89f: 0f97c0 seta al
14593d8a2: 0f28c8 movaps xmm1, xmm0
14593d8a5: f30f5c4c242c subss xmm1, dword ptr [rsp + 0x2c]
14593d8ab: 0f540dbeaf4700 andps xmm1, xmmword ptr [rip + 0x47afbe]
14593d8b2: 488d0db7b32c01 lea rcx, [rip + 0x12cb3b7]
14593d8b9: 0f2e0c81 ucomiss xmm1, dword ptr [rcx + rax*4]
14593d8bd: 0f873dffffff ja 0x14593d800
14593d8c3: 48837b40ff cmp qword ptr [rbx + 0x40], -1
14593d8c8: 0f84af030000 je 0x14593dc7d
14593d8ce: f20f105360 movsd xmm2, qword ptr [rbx + 0x60]
14593d8d3: 410f28cb movaps xmm1, xmm11
14593d8d7: 0f5cca subps xmm1, xmm2
14593d8da: 0f28d1 movaps xmm2, xmm1
14593d8dd: 0f57db xorps xmm3, xmm3
14593d8e0: 0fc2d301 cmpltps xmm2, xmm3
14593d8e4: 0f14d2 unpcklps xmm2, xmm2
14593d8e7: 660f50c2 movmskpd eax, xmm2
14593d8eb: 85c0 test eax, eax
14593d8ed: 0f85b5000000 jne 0x14593d9a8
14593d8f3: 0f28d1 movaps xmm2, xmm1
14593d8f6: f30f101d42904700 movss xmm3, dword ptr [rip + 0x479042]
14593d8fe: f30f5cd3 subss xmm2, xmm3
14593d902: f3480f2cca cvttss2si rcx, xmm2
14593d907: f3480f2cd1 cvttss2si rdx, xmm1
14593d90c: 4889d0 mov rax, rdx
14593d90f: 48c1f83f sar rax, 0x3f
14593d913: 4821c8 and rax, rcx
14593d916: 4809d0 or rax, rdx
14593d919: 0f57e4 xorps xmm4, xmm4
14593d91c: 0f2ecc ucomiss xmm1, xmm4
14593d91f: 41b900000000 mov r9d, 0
14593d925: 490f42c1 cmovb rax, r9
14593d929: f30f102d13904700 movss xmm5, dword ptr [rip + 0x479013]
14593d931: 0f2ecd ucomiss xmm1, xmm5
14593d934: 49c7c2ffffffff mov r10, 0xffffffffffffffff
14593d93b: 490f47c2 cmova rax, r10
14593d93f: f30f16c9 movshdup xmm1, xmm1
14593d943: 0f28d1 movaps xmm2, xmm1
14593d946: f30f5cd3 subss xmm2, xmm3
14593d94a: f3480f2cca cvttss2si rcx, xmm2
14593d94f: f34c0f2cc1 cvttss2si r8, xmm1
14593d954: 4c89c2 mov rdx, r8
14593d957: 48c1fa3f sar rdx, 0x3f
14593d95b: 4821ca and rdx, rcx
14593d95e: 4c09c2 or rdx, r8
14593d961: 0f2ecc ucomiss xmm1, xmm4
14593d964: 490f42d1 cmovb rdx, r9
14593d968: 0f2ecd ucomiss xmm1, xmm5
14593d96b: 490f47d2 cmova rdx, r10
14593d96f: 488b4b58 mov rcx, qword ptr [rbx + 0x58]
14593d973: 4839c8 cmp rax, rcx
14593d976: 410f93c0 setae r8b
14593d97a: 4839ca cmp rdx, rcx
14593d97d: 410f93c1 setae r9b
14593d981: 4508c1 or r9b, r8b
14593d984: 7522 jne 0x14593d9a8
14593d986: 480fafca imul rcx, rdx
14593d98a: 4801c1 add rcx, rax
14593d98d: 488b5350 mov rdx, qword ptr [rbx + 0x50]
14593d991: 4839d1 cmp rcx, rdx
14593d994: 0f83cf030000 jae 0x14593dd69
14593d99a: 488b4348 mov rax, qword ptr [rbx + 0x48]
14593d99e: 803c0800 cmp byte ptr [rax + rcx], 0
14593d9a2: 0f8558feffff jne 0x14593d800
14593d9a8: 48817e3091010000 cmp qword ptr [rsi + 0x30], 0x191
14593d9b0: 0f82c7020000 jb 0x14593dc7d
14593d9b6: 410f28d3 movaps xmm2, xmm11
14593d9ba: 0f5cd6 subps xmm2, xmm6
14593d9bd: f30f16ca movshdup xmm1, xmm2
14593d9c1: 440f28e8 movaps xmm13, xmm0
14593d9c5: 0f28c2 movaps xmm0, xmm2
14593d9c8: e862ca2c00 call 0x145c0a42f
14593d9cd: f30f105b60 movss xmm3, dword ptr [rbx + 0x60]
14593d9d2: 410f28d3 movaps xmm2, xmm11
14593d9d6: f30f5cd3 subss xmm2, xmm3
14593d9da: 0f57db xorps xmm3, xmm3
14593d9dd: 0f2eda ucomiss xmm3, xmm2
14593d9e0: 0f871afeffff ja 0x14593d800
14593d9e6: f3440f5c6364 subss xmm12, dword ptr [rbx + 0x64]
14593d9ec: 410f2edc ucomiss xmm3, xmm12
14593d9f0: 0f870afeffff ja 0x14593d800
14593d9f6: 0f28da movaps xmm3, xmm2
14593d9f9: f30f10253f8f4700 movss xmm4, dword ptr [rip + 0x478f3f]
14593da01: f30f5cdc subss xmm3, xmm4
14593da05: f3480f2ccb cvttss2si rcx, xmm3
14593da0a: f3480f2cd2 cvttss2si rdx, xmm2
14593da0f: 4889d0 mov rax, rdx
14593da12: 48c1f83f sar rax, 0x3f
14593da16: 4821c8 and rax, rcx
14593da19: 4809d0 or rax, rdx
14593da1c: 0f57db xorps xmm3, xmm3
14593da1f: 0f2ed3 ucomiss xmm2, xmm3
14593da22: 41b900000000 mov r9d, 0
14593da28: 490f42c1 cmovb rax, r9
14593da2c: f30f102d108f4700 movss xmm5, dword ptr [rip + 0x478f10]
14593da34: 0f2ed5 ucomiss xmm2, xmm5
14593da37: 49c7c2ffffffff mov r10, 0xffffffffffffffff
14593da3e: 490f47c2 cmova rax, r10
14593da42: 410f28d4 movaps xmm2, xmm12
14593da46: f30f5cd4 subss xmm2, xmm4
14593da4a: f3480f2cca cvttss2si rcx, xmm2
14593da4f: f34d0f2cc4 cvttss2si r8, xmm12
14593da54: 4c89c2 mov rdx, r8
14593da57: 48c1fa3f sar rdx, 0x3f
14593da5b: 4821ca and rdx, rcx
14593da5e: 4c09c2 or rdx, r8
14593da61: 440f2ee3 ucomiss xmm12, xmm3
14593da65: 490f42d1 cmovb rdx, r9
14593da69: 440f2ee5 ucomiss xmm12, xmm5
14593da6d: 490f47d2 cmova rdx, r10
14593da71: 488b4b58 mov rcx, qword ptr [rbx + 0x58]
14593da75: 4839c8 cmp rax, rcx
14593da78: 0f8382fdffff jae 0x14593d800
14593da7e: 4839ca cmp rdx, rcx
14593da81: 0f8379fdffff jae 0x14593d800
14593da87: 480fafca imul rcx, rdx
14593da8b: 4801c1 add rcx, rax
14593da8e: 488b5620 mov rdx, qword ptr [rsi + 0x20]
14593da92: 4839d1 cmp rcx, rdx
14593da95: 0f83dc020000 jae 0x14593dd77
14593da9b: 488b4618 mov rax, qword ptr [rsi + 0x18]
14593da9f: 0fb70448 movzx eax, word ptr [rax + rcx*2]
14593daa3: 6683f8ff cmp ax, -1
14593daa7: 0f8453fdffff je 0x14593d800
14593daad: 0f28c8 movaps xmm1, xmm0
14593dab0: 410f28c5 movaps xmm0, xmm13
14593dab4: 0fb7c0 movzx eax, ax
14593dab7: 0f57d2 xorps xmm2, xmm2
14593daba: f30f2ad0 cvtsi2ss xmm2, eax
14593dabe: f30f590dd2d54700 mulss xmm1, dword ptr [rip + 0x47d5d2]
14593dac6: f3410f58cf addss xmm1, xmm15
14593dacb: 0f2ed1 ucomiss xmm2, xmm1
14593dace: 0f872cfdffff ja 0x14593d800
14593dad4: e9a4010000 jmp 0x14593dc7d
14593dae0: f3440f580ddbbf4800 addss xmm9, dword ptr [rip + 0x48bfdb]
14593dae9: 450f2ecf ucomiss xmm9, xmm15
14593daed: 0f820dfbffff jb 0x14593d600
14593daf3: f3450f12d9 movsldup xmm11, xmm9
14593daf8: 450f59da mulps xmm11, xmm10
14593dafc: 440f58de addps xmm11, xmm6
14593db00: f3450f16e3 movshdup xmm12, xmm11
14593db05: 4c89f1 mov rcx, r14
14593db08: 4c89fa mov rdx, r15
14593db0b: e8b0b2f5ff call 0x145898dc0
14593db10: 4869f0f0000000 imul rsi, rax, 0xf0
14593db17: f30f108c2ec8000000 movss xmm1, dword ptr [rsi + rbp + 0xc8]
14593db20: 410f28c3 movaps xmm0, xmm11
14593db24: f30f5cc1 subss xmm0, xmm1
14593db28: f30f10942ecc000000 movss xmm2, dword ptr [rsi + rbp + 0xcc]
14593db31: 410f28cc movaps xmm1, xmm12
14593db35: f30f5cca subss xmm1, xmm2
14593db39: e8f1c82c00 call 0x145c0a42f
14593db3e: 440f28e8 movaps xmm13, xmm0
14593db42: f3440f10b42ed8000000 movss xmm14, dword ptr [rsi + rbp + 0xd8]
14593db4c: 410f28c6 movaps xmm0, xmm14
14593db50: f30f5805cc3b4700 addss xmm0, dword ptr [rip + 0x473bcc]
14593db58: 440f2ee8 ucomiss xmm13, xmm0
14593db5c: 7782 ja 0x14593dae0
14593db5e: 488d4b10 lea rcx, [rbx + 0x10]
14593db62: 410f28cb movaps xmm1, xmm11
14593db66: 410f28d4 movaps xmm2, xmm12
14593db6a: e8d12ff6ff call 0x1458a0b40
14593db6f: a801 test al, 1
14593db71: 0f8469ffffff je 0x14593dae0
14593db77: 31c0 xor eax, eax
14593db79: 450f2eee ucomiss xmm13, xmm14
14593db7d: 0f97c0 seta al
14593db80: 0f28c8 movaps xmm1, xmm0
14593db83: f30f5c4c242c subss xmm1, dword ptr [rsp + 0x2c]
14593db89: 0f540de0ac4700 andps xmm1, xmmword ptr [rip + 0x47ace0]
14593db90: 488d0dd9b02c01 lea rcx, [rip + 0x12cb0d9]
14593db97: 0f2e0c81 ucomiss xmm1, dword ptr [rcx + rax*4]
14593db9b: 0f873fffffff ja 0x14593dae0
14593dba1: 48837b40ff cmp qword ptr [rbx + 0x40], -1
14593dba6: 0f84d1000000 je 0x14593dc7d
14593dbac: f20f105360 movsd xmm2, qword ptr [rbx + 0x60]
14593dbb1: 410f28cb movaps xmm1, xmm11
14593dbb5: 0f5cca subps xmm1, xmm2
14593dbb8: 0f28d1 movaps xmm2, xmm1
14593dbbb: 0f57db xorps xmm3, xmm3
14593dbbe: 0fc2d301 cmpltps xmm2, xmm3
14593dbc2: 0f14d2 unpcklps xmm2, xmm2
14593dbc5: 660f50c2 movmskpd eax, xmm2
14593dbc9: 85c0 test eax, eax
14593dbcb: 0f85ac000000 jne 0x14593dc7d
14593dbd1: 0f28d1 movaps xmm2, xmm1
14593dbd4: f30f101d648d4700 movss xmm3, dword ptr [rip + 0x478d64]
14593dbdc: f30f5cd3 subss xmm2, xmm3
14593dbe0: f3480f2cca cvttss2si rcx, xmm2
14593dbe5: f3480f2cd1 cvttss2si rdx, xmm1
14593dbea: 4889d0 mov rax, rdx
14593dbed: 48c1f83f sar rax, 0x3f
14593dbf1: 4821c8 and rax, rcx
14593dbf4: 4809d0 or rax, rdx
14593dbf7: 0f57e4 xorps xmm4, xmm4
14593dbfa: 0f2ecc ucomiss xmm1, xmm4
14593dbfd: 41b900000000 mov r9d, 0
14593dc03: 490f42c1 cmovb rax, r9
14593dc07: f30f102d358d4700 movss xmm5, dword ptr [rip + 0x478d35]
14593dc0f: 0f2ecd ucomiss xmm1, xmm5
14593dc12: 49c7c2ffffffff mov r10, 0xffffffffffffffff
14593dc19: 490f47c2 cmova rax, r10
14593dc1d: f30f16c9 movshdup xmm1, xmm1
14593dc21: 0f28d1 movaps xmm2, xmm1
14593dc24: f30f5cd3 subss xmm2, xmm3
14593dc28: f3480f2cca cvttss2si rcx, xmm2
14593dc2d: f34c0f2cc1 cvttss2si r8, xmm1
14593dc32: 4c89c2 mov rdx, r8
14593dc35: 48c1fa3f sar rdx, 0x3f
14593dc39: 4821ca and rdx, rcx
14593dc3c: 4c09c2 or rdx, r8
14593dc3f: 0f2ecc ucomiss xmm1, xmm4
14593dc42: 490f42d1 cmovb rdx, r9
14593dc46: 0f2ecd ucomiss xmm1, xmm5
14593dc49: 490f47d2 cmova rdx, r10
14593dc4d: 488b4b58 mov rcx, qword ptr [rbx + 0x58]
14593dc51: 4839c8 cmp rax, rcx
14593dc54: 7327 jae 0x14593dc7d
14593dc56: 4839ca cmp rdx, rcx
14593dc59: 7322 jae 0x14593dc7d
14593dc5b: 480fafca imul rcx, rdx
14593dc5f: 4801c1 add rcx, rax
14593dc62: 488b5350 mov rdx, qword ptr [rbx + 0x50]
14593dc66: 4839d1 cmp rcx, rdx
14593dc69: 0f83fa000000 jae 0x14593dd69
14593dc6f: 488b4348 mov rax, qword ptr [rbx + 0x48]
14593dc73: 803c0801 cmp byte ptr [rax + rcx], 1
14593dc77: 0f8463feffff je 0x14593dae0
14593dc7d: 488b442438 mov rax, qword ptr [rsp + 0x38]
14593dc82: 440f1318 movlps qword ptr [rax], xmm11
14593dc86: f30f114008 movss dword ptr [rax + 8], xmm0
14593dc8b: 0f28742450 movaps xmm6, xmmword ptr [rsp + 0x50]
14593dc90: 0f287c2460 movaps xmm7, xmmword ptr [rsp + 0x60]
14593dc95: 440f28442470 movaps xmm8, xmmword ptr [rsp + 0x70]
14593dc9b: 440f288c2480000000 movaps xmm9, xmmword ptr [rsp + 0x80]
14593dca4: 440f28942490000000 movaps xmm10, xmmword ptr [rsp + 0x90]
14593dcad: 440f289c24a0000000 movaps xmm11, xmmword ptr [rsp + 0xa0]
14593dcb6: 440f28a424b0000000 movaps xmm12, xmmword ptr [rsp + 0xb0]
14593dcbf: 440f28ac24c0000000 movaps xmm13, xmmword ptr [rsp + 0xc0]
14593dcc8: 440f28b424d0000000 movaps xmm14, xmmword ptr [rsp + 0xd0]
14593dcd1: 440f28bc24e0000000 movaps xmm15, xmmword ptr [rsp + 0xe0]
14593dcda: 4881c4f8000000 add rsp, 0xf8
14593dce1: 5b pop rbx
14593dce2: 5d pop rbp
14593dce3: 5f pop rdi
14593dce4: 5e pop rsi
14593dce5: 415c pop r12
14593dce7: 415d pop r13
14593dce9: 415e pop r14
14593dceb: 415f pop r15
14593dced: c3 ret
14593dcee: 488b4c2438 mov rcx, qword ptr [rsp + 0x38]
14593dcf3: 4889fa mov rdx, rdi
14593dcf6: f30f10542424 movss xmm2, dword ptr [rsp + 0x24]
14593dcfc: f30f105c2428 movss xmm3, dword ptr [rsp + 0x28]
14593dd02: 0f28742450 movaps xmm6, xmmword ptr [rsp + 0x50]
14593dd07: 0f287c2460 movaps xmm7, xmmword ptr [rsp + 0x60]
14593dd0c: 440f28442470 movaps xmm8, xmmword ptr [rsp + 0x70]
14593dd12: 440f288c2480000000 movaps xmm9, xmmword ptr [rsp + 0x80]
14593dd1b: 440f28942490000000 movaps xmm10, xmmword ptr [rsp + 0x90]
14593dd24: 440f289c24a0000000 movaps xmm11, xmmword ptr [rsp + 0xa0]
14593dd2d: 440f28a424b0000000 movaps xmm12, xmmword ptr [rsp + 0xb0]
14593dd36: 440f28ac24c0000000 movaps xmm13, xmmword ptr [rsp + 0xc0]
14593dd3f: 440f28b424d0000000 movaps xmm14, xmmword ptr [rsp + 0xd0]
14593dd48: 440f28bc24e0000000 movaps xmm15, xmmword ptr [rsp + 0xe0]
14593dd51: 4881c4f8000000 add rsp, 0xf8
14593dd58: 5b pop rbx
14593dd59: 5d pop rbp
14593dd5a: 5f pop rdi
14593dd5b: 5e pop rsi
14593dd5c: 415c pop r12
14593dd5e: 415d pop r13
14593dd60: 415e pop r14
14593dd62: 415f pop r15
14593dd64: e9970a0000 jmp 0x14593e800
14593e800: 4157 push r15
14593e802: 4156 push r14
14593e804: 4154 push r12
14593e806: 56 push rsi
14593e807: 57 push rdi
14593e808: 55 push rbp
14593e809: 53 push rbx
14593e80a: 4881ecd0000000 sub rsp, 0xd0
14593e811: 440f29bc24c0000000 movaps xmmword ptr [rsp + 0xc0], xmm15
14593e81a: 440f29b424b0000000 movaps xmmword ptr [rsp + 0xb0], xmm14
14593e823: 440f29ac24a0000000 movaps xmmword ptr [rsp + 0xa0], xmm13
14593e82c: 440f29a42490000000 movaps xmmword ptr [rsp + 0x90], xmm12
14593e835: 440f299c2480000000 movaps xmmword ptr [rsp + 0x80], xmm11
14593e83e: 440f29542470 movaps xmmword ptr [rsp + 0x70], xmm10
14593e844: 440f294c2460 movaps xmmword ptr [rsp + 0x60], xmm9
14593e84a: 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
14593e850: 0f297c2440 movaps xmmword ptr [rsp + 0x40], xmm7
14593e855: 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
14593e85a: 0f28fb movaps xmm7, xmm3
14593e85d: 440f28c2 movaps xmm8, xmm2
14593e861: 4889d7 mov rdi, rdx
14593e864: 4889ce mov rsi, rcx
14593e867: 488b8aa8020000 mov rcx, qword ptr [rdx + 0x2a8]
14593e86e: 488b92b0020000 mov rdx, qword ptr [rdx + 0x2b0]
14593e875: e846a5f5ff call 0x145898dc0
14593e87a: 4869c0f0000000 imul rax, rax, 0xf0
14593e881: 4c8d35a83d2b01 lea r14, [rip + 0x12b3da8]
14593e888: 4901c6 add r14, rax
14593e88b: 488d9fb8090000 lea rbx, [rdi + 0x9b8]
14593e892: 4531ff xor r15d, r15d
14593e895: f3440f1025ca2a4700 movss xmm12, dword ptr [rip + 0x472aca]
14593e89e: f3440f102df92e4700 movss xmm13, dword ptr [rip + 0x472ef9]
14593e8a7: 450f57f6 xorps xmm14, xmm14
14593e8ab: f3440f103d90804700 movss xmm15, dword ptr [rip + 0x478090]
14593e8b4: 49c7c4ffffffff mov r12, 0xffffffffffffffff
14593e8bb: 31ed xor ebp, ebp
14593e8bd: eb0c jmp 0x14593e8cb
14593e8c0: ffc5 inc ebp
14593e8c2: 83fd0c cmp ebp, 0xc
14593e8c5: 0f8429020000 je 0x14593eaf4
14593e8cb: f20f10b7d0040000 movsd xmm6, qword ptr [rdi + 0x4d0]
14593e8d3: 4c8b87b8090000 mov r8, qword ptr [rdi + 0x9b8]
14593e8da: 488b97d0090000 mov rdx, qword ptr [rdi + 0x9d0]
14593e8e1: 488b8fc0090000 mov rcx, qword ptr [rdi + 0x9c0]
14593e8e8: 488b87c8090000 mov rax, qword ptr [rdi + 0x9c8]
14593e8ef: 90 nop
14593e8f0: 4d8d0c10 lea r9, [r8 + rdx]
14593e8f4: 49c1c117 rol r9, 0x17
14593e8f8: 4d01c1 add r9, r8
14593e8fb: 4989ca mov r10, rcx
14593e8fe: 49c1e211 shl r10, 0x11
14593e902: 4c31c0 xor rax, r8
14593e905: 4831ca xor rdx, rcx
14593e908: 4831c1 xor rcx, rax
14593e90b: 4931d0 xor r8, rdx
14593e90e: 48c1c22d rol rdx, 0x2d
14593e912: 4c31d0 xor rax, r10
14593e915: 49c1e929 shr r9, 0x29
14593e919: 4181c90000803f or r9d, 0x3f800000
14593e920: 66450f6ec9 movd xmm9, r9d
14593e925: f3450f58cc addss xmm9, xmm12
14593e92a: f3450f59cd mulss xmm9, xmm13
14593e92f: 450f2ee9 ucomiss xmm13, xmm9
14593e933: 76bb jbe 0x14593e8f0
14593e935: f3450f58ce addss xmm9, xmm14
14593e93a: 4c8987b8090000 mov qword ptr [rdi + 0x9b8], r8
14593e941: 488997d0090000 mov qword ptr [rdi + 0x9d0], rdx
14593e948: 48898fc0090000 mov qword ptr [rdi + 0x9c0], rcx
14593e94f: 488987c8090000 mov qword ptr [rdi + 0x9c8], rax
14593e956: 4889d9 mov rcx, rbx
14593e959: 410f28c8 movaps xmm1, xmm8
14593e95d: 0f28d7 movaps xmm2, xmm7
14593e960: e82b440800 call 0x1459c2d90
14593e965: 440f28d0 movaps xmm10, xmm0
14593e969: 410f28c1 movaps xmm0, xmm9
14593e96d: e8a5ba2c00 call 0x145c0a417
14593e972: 440f28d8 movaps xmm11, xmm0
14593e976: 410f28c1 movaps xmm0, xmm9
14593e97a: e892ba2c00 call 0x145c0a411
14593e97f: 440f14d8 unpcklps xmm11, xmm0
14593e983: f3410f12c2 movsldup xmm0, xmm10
14593e988: 410f59c3 mulps xmm0, xmm11
14593e98c: 0f58f0 addps xmm6, xmm0
14593e98f: f2410f1086c8000000 movsd xmm0, qword ptr [r14 + 0xc8]
14593e998: 0f28ce movaps xmm1, xmm6
14593e99b: 0f5cc8 subps xmm1, xmm0
14593e99e: 0f28d1 movaps xmm2, xmm1
14593e9a1: 0f59d1 mulps xmm2, xmm1
14593e9a4: f30f16da movshdup xmm3, xmm2
14593e9a8: f30f58da addss xmm3, xmm2
14593e9ac: f30f51db sqrtss xmm3, xmm3
14593e9b0: f3410f1096d8000000 movss xmm2, dword ptr [r14 + 0xd8]
14593e9b9: 0f2eda ucomiss xmm3, xmm2
14593e9bc: 7614 jbe 0x14593e9d2
14593e9d2: 488b8fb0090000 mov rcx, qword ptr [rdi + 0x9b0]
14593e9d9: 48837940ff cmp qword ptr [rcx + 0x40], -1
14593e9de: 0f84cc000000 je 0x14593eab0
14593e9e4: f20f104960 movsd xmm1, qword ptr [rcx + 0x60]
14593e9e9: 0f28c6 movaps xmm0, xmm6
14593e9ec: 0f5cc1 subps xmm0, xmm1
14593e9ef: 0f28c8 movaps xmm1, xmm0
14593e9f2: 0f57d2 xorps xmm2, xmm2
14593e9f5: 0fc2ca01 cmpltps xmm1, xmm2
14593e9f9: 0f14c9 unpcklps xmm1, xmm1
14593e9fc: 660f50c1 movmskpd eax, xmm1
14593ea00: 85c0 test eax, eax
14593ea02: 0f85a8000000 jne 0x14593eab0
14593ea08: 0f28c8 movaps xmm1, xmm0
14593ea0b: f30f10152d7f4700 movss xmm2, dword ptr [rip + 0x477f2d]
14593ea13: f30f5cca subss xmm1, xmm2
14593ea17: f3480f2cc1 cvttss2si rax, xmm1
14593ea1c: f34c0f2cc0 cvttss2si r8, xmm0
14593ea21: 4c89c2 mov rdx, r8
14593ea24: 48c1fa3f sar rdx, 0x3f
14593ea28: 4821c2 and rdx, rax
14593ea2b: 4c09c2 or rdx, r8
14593ea2e: 410f2ec6 ucomiss xmm0, xmm14
14593ea32: 490f42d7 cmovb rdx, r15
14593ea36: 410f2ec7 ucomiss xmm0, xmm15
14593ea3a: 490f47d4 cmova rdx, r12
14593ea3e: f30f16c0 movshdup xmm0, xmm0
14593ea42: 0f28c8 movaps xmm1, xmm0
14593ea45: f30f5cca subss xmm1, xmm2
14593ea49: f3480f2cc1 cvttss2si rax, xmm1
14593ea4e: f34c0f2cc8 cvttss2si r9, xmm0
14593ea53: 4d89c8 mov r8, r9
14593ea56: 49c1f83f sar r8, 0x3f
14593ea5a: 4921c0 and r8, rax
14593ea5d: 4d09c8 or r8, r9
14593ea60: 410f2ec6 ucomiss xmm0, xmm14
14593ea64: 4d0f42c7 cmovb r8, r15
14593ea68: 410f2ec7 ucomiss xmm0, xmm15
14593ea6c: 4d0f47c4 cmova r8, r12
14593ea70: 488b4158 mov rax, qword ptr [rcx + 0x58]
14593ea74: 4839c2 cmp rdx, rax
14593ea77: 410f93c1 setae r9b
14593ea7b: 4939c0 cmp r8, rax
14593ea7e: 410f93c2 setae r10b
14593ea82: 4508ca or r10b, r9b
14593ea85: 7529 jne 0x14593eab0
14593ea87: 490fafc0 imul rax, r8
14593ea8b: 4801d0 add rax, rdx
14593ea8e: 488b5150 mov rdx, qword ptr [rcx + 0x50]
14593ea92: 4839d0 cmp rax, rdx
14593ea95: 0f83d8010000 jae 0x14593ec73
14593ea9b: 488b5148 mov rdx, qword ptr [rcx + 0x48]
14593ea9f: 803c0200 cmp byte ptr [rdx + rax], 0
14593eaa3: 0f8517feffff jne 0x14593e8c0
14593eaa9: 0f1f8000000000 nop dword ptr [rax]
14593eab0: 4883c110 add rcx, 0x10
14593eab4: f30f16d6 movshdup xmm2, xmm6
14593eab8: 0f28ce movaps xmm1, xmm6
14593eabb: e88020f6ff call 0x1458a0b40
14593eac0: a801 test al, 1
14593eac2: 0f84f8fdffff je 0x14593e8c0
14593eac8: f30f108fd8040000 movss xmm1, dword ptr [rdi + 0x4d8]
14593ead0: 0f28d0 movaps xmm2, xmm0
14593ead3: f30f5cd1 subss xmm2, xmm1
14593ead7: 0f5415929d4700 andps xmm2, xmmword ptr [rip + 0x479d92]
14593eade: f30f100d6a045500 movss xmm1, dword ptr [rip + 0x55046a]
14593eae6: 0f2eca ucomiss xmm1, xmm2
14593eae9: 0f86d1fdffff jbe 0x14593e8c0
14593eaef: e91c010000 jmp 0x14593ec10
14593eaf4: f20f10b7d0040000 movsd xmm6, qword ptr [rdi + 0x4d0]
14593eafc: 4c8b87b8090000 mov r8, qword ptr [rdi + 0x9b8]
14593eb03: 488b97d0090000 mov rdx, qword ptr [rdi + 0x9d0]
14593eb0a: 488b8fc0090000 mov rcx, qword ptr [rdi + 0x9c0]
14593eb11: 488b87c8090000 mov rax, qword ptr [rdi + 0x9c8]
14593eb18: 0f1f840000000000 nop dword ptr [rax + rax]
14593eb20: 4d8d0c10 lea r9, [r8 + rdx]
14593eb24: 49c1c117 rol r9, 0x17
14593eb28: 4d01c1 add r9, r8
14593eb2b: 4989ca mov r10, rcx
14593eb2e: 49c1e211 shl r10, 0x11
14593eb32: 4c31c0 xor rax, r8
14593eb35: 4831ca xor rdx, rcx
14593eb38: 4831c1 xor rcx, rax
14593eb3b: 4931d0 xor r8, rdx
14593eb3e: 48c1c22d rol rdx, 0x2d
14593eb42: 4c31d0 xor rax, r10
14593eb45: 49c1e929 shr r9, 0x29
14593eb49: 4181c90000803f or r9d, 0x3f800000
14593eb50: 66450f6ec9 movd xmm9, r9d
14593eb55: f3450f58cc addss xmm9, xmm12
14593eb5a: f3450f59cd mulss xmm9, xmm13
14593eb5f: 450f2ee9 ucomiss xmm13, xmm9
14593eb63: 76bb jbe 0x14593eb20
14593eb65: 0f57c0 xorps xmm0, xmm0
14593eb68: f3440f58c8 addss xmm9, xmm0
14593eb6d: 4c8987b8090000 mov qword ptr [rdi + 0x9b8], r8
14593eb74: 488997d0090000 mov qword ptr [rdi + 0x9d0], rdx
14593eb7b: 48898fc0090000 mov qword ptr [rdi + 0x9c0], rcx
14593eb82: 488987c8090000 mov qword ptr [rdi + 0x9c8], rax
14593eb89: 4889d9 mov rcx, rbx
14593eb8c: 410f28c8 movaps xmm1, xmm8
14593eb90: 0f28d7 movaps xmm2, xmm7
14593eb93: e8f8410800 call 0x1459c2d90
14593eb98: 0f28f8 movaps xmm7, xmm0
14593eb9b: 410f28c1 movaps xmm0, xmm9
14593eb9f: e873b82c00 call 0x145c0a417
14593eba4: 440f28c0 movaps xmm8, xmm0
14593eba8: 410f28c1 movaps xmm0, xmm9
14593ebac: e860b82c00 call 0x145c0a411
14593ebb1: 440f14c0 unpcklps xmm8, xmm0
14593ebb5: f30f12c7 movsldup xmm0, xmm7
14593ebb9: 410f59c0 mulps xmm0, xmm8
14593ebbd: 0f58f0 addps xmm6, xmm0
14593ebc0: f30f16fe movshdup xmm7, xmm6
14593ebc4: 488bbfb0090000 mov rdi, qword ptr [rdi + 0x9b0]
14593ebcb: 488d4f10 lea rcx, [rdi + 0x10]
14593ebcf: 0f28ce movaps xmm1, xmm6
14593ebd2: 0f28d7 movaps xmm2, xmm7
14593ebd5: e8661ff6ff call 0x1458a0b40
14593ebda: a801 test al, 1
14593ebdc: 7532 jne 0x14593ec10
14593ec10: 0f1336 movlps qword ptr [rsi], xmm6
14593ec13: f30f114608 movss dword ptr [rsi + 8], xmm0
14593ec18: 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
14593ec1d: 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
14593ec22: 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
14593ec28: 440f284c2460 movaps xmm9, xmmword ptr [rsp + 0x60]
14593ec2e: 440f28542470 movaps xmm10, xmmword ptr [rsp + 0x70]
14593ec34: 440f289c2480000000 movaps xmm11, xmmword ptr [rsp + 0x80]
14593ec3d: 440f28a42490000000 movaps xmm12, xmmword ptr [rsp + 0x90]
14593ec46: 440f28ac24a0000000 movaps xmm13, xmmword ptr [rsp + 0xa0]
14593ec4f: 440f28b424b0000000 movaps xmm14, xmmword ptr [rsp + 0xb0]
14593ec58: 440f28bc24c0000000 movaps xmm15, xmmword ptr [rsp + 0xc0]
14593ec61: 4881c4d0000000 add rsp, 0xd0
14593ec68: 5b pop rbx
14593ec69: 5d pop rbp
14593ec6a: 5f pop rdi
14593ec6b: 5e pop rsi
14593ec6c: 415c pop r12
14593ec6e: 415e pop r14
14593ec70: 415f pop r15
14593ec72: c3 ret
145940411: 488bb550010000 mov rsi, qword ptr [rbp + 0x150]
145940418: 7444 je 0x14594045e
14594041a: 488b8f68050000 mov rcx, qword ptr [rdi + 0x568]
145940421: 48698770050000d8010000 imul rax, qword ptr [rdi + 0x570], 0x1d8
14594042c: 0f1f4000 nop dword ptr [rax]
145940430: 4885c0 test rax, rax
145940433: 0f84fd010000 je 0x145940636
145940439: 4889ca mov rdx, rcx
14594043c: 4881c1d8010000 add rcx, 0x1d8
145940443: 480528feffff add rax, -0x1d8
145940449: 80bab000000000 cmp byte ptr [rdx + 0xb0], 0
145940450: 75de jne 0x145940430
145940452: 48837a18ff cmp qword ptr [rdx + 0x18], -1
145940457: 74d7 je 0x145940430
145940459: e904020000 jmp 0x145940662
145940636: 8b8784070000 mov eax, dword ptr [rdi + 0x784]
14594063c: 83f802 cmp eax, 2
14594063f: 0f94c1 sete cl
145940642: 08c8 or al, cl
145940644: a801 test al, 1
145940646: 751a jne 0x145940662
145940648: f30f10874c0a0000 movss xmm0, dword ptr [rdi + 0xa4c]
145940650: c7878407000001000000 mov dword ptr [rdi + 0x784], 1
14594065a: f30f118788070000 movss dword ptr [rdi + 0x788], xmm0
145940662: ff8798070000 inc dword ptr [rdi + 0x798]
145940668: c6856701000000 mov byte ptr [rbp + 0x167], 0
14594066f: 4c89e1 mov rcx, r12
145940672: e86977f5ff call 0x145897de0
145940677: 90 nop
145940678: 4989c6 mov r14, rax
14594067b: 4989d5 mov r13, rdx
14594067e: c6856701000000 mov byte ptr [rbp + 0x167], 0
145940685: 4c8d3db7a42c01 lea r15, [rip + 0x12ca4b7]
14594068c: be0d000000 mov esi, 0xd
145940691: ba0d000000 mov edx, 0xd
145940696: 4c89f9 mov rcx, r15
145940699: e832d70400 call 0x14598ddd0
14594069e: 90 nop
14594069f: 4885c0 test rax, rax
1459406a2: 4c0f45f8 cmovne r15, rax
1459406a6: 480f44d6 cmove rdx, rsi
1459406aa: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459406b1: 4889542428 mov qword ptr [rsp + 0x28], rdx
1459406b6: 4c897c2420 mov qword ptr [rsp + 0x20], r15
1459406bb: 488d8de0000000 lea rcx, [rbp + 0xe0]
1459406c2: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
1459406c9: 4d89f0 mov r8, r14
1459406cc: 4d89e9 mov r9, r13
1459406cf: e83c39f8ff call 0x1458c4010
1459406d4: 90 nop
1459406d5: 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
1459406dc: 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
1459406e3: 750d jne 0x1459406f2
1459406f2: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
1459406f9: 4889f1 mov rcx, rsi
1459406fc: 48c1e105 shl rcx, 5
145940700: 0f1085e0000000 movups xmm0, xmmword ptr [rbp + 0xe0]
145940707: 0f108df0000000 movups xmm1, xmmword ptr [rbp + 0xf0]
14594070e: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145940713: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145940717: 48ffc6 inc rsi
14594071a: 4889b730060000 mov qword ptr [rdi + 0x630], rsi
145940721: c6856701000000 mov byte ptr [rbp + 0x167], 0
145940728: 4c89e1 mov rcx, r12
14594072b: e8b076f5ff call 0x145897de0
145940730: 90 nop
145940731: 4989d0 mov r8, rdx
145940734: c6856701000000 mov byte ptr [rbp + 0x167], 0
14594073b: 488d8de0000000 lea rcx, [rbp + 0xe0]
145940742: 4889c2 mov rdx, rax
145940745: e806c20400 call 0x14598c950
14594074a: 90 nop
14594074b: c6856701000000 mov byte ptr [rbp + 0x167], 0
145940752: 488d95e0000000 lea rdx, [rbp + 0xe0]
145940759: 4889f9 mov rcx, rdi
14594075c: e83f28fdff call 0x145912fa0
145940761: 90 nop
145940762: 8b8798070000 mov eax, dword ptr [rdi + 0x798]
145940768: 8d0480 lea eax, [rax + rax*4]
14594076b: 448d04853c000000 lea r8d, [rax*4 + 0x3c]
145940773: c6856701000000 mov byte ptr [rbp + 0x167], 0
14594077a: 4c8d8d40010000 lea r9, [rbp + 0x140]
145940781: 4889f9 mov rcx, rdi
145940784: 31d2 xor edx, edx
145940786: e8853b0000 call 0x145944310
14594078b: 90 nop
14594078c: 8b8798070000 mov eax, dword ptr [rdi + 0x798]
145940792: 8d0480 lea eax, [rax + rax*4]
145940795: 448d048528000000 lea r8d, [rax*4 + 0x28]
14594079d: f2440f10a540010000 movsd xmm12, qword ptr [rbp + 0x140]
1459407a6: f30f10bd48010000 movss xmm7, dword ptr [rbp + 0x148]
1459407ae: f20f10058a862c01 movsd xmm0, qword ptr [rip + 0x12c868a]
1459407b6: 410f58c4 addps xmm0, xmm12
1459407ba: 0f1385e0000000 movlps qword ptr [rbp + 0xe0], xmm0
1459407c1: f30f11bde8000000 movss dword ptr [rbp + 0xe8], xmm7
1459407c9: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459407d0: 4c8d8de0000000 lea r9, [rbp + 0xe0]
1459407d7: 4889f9 mov rcx, rdi
1459407da: ba01000000 mov edx, 1
1459407df: e82c3b0000 call 0x145944310
1459407e4: 90 nop
1459407e5: 4883bfb807000000 cmp qword ptr [rdi + 0x7b8], 0
1459407ed: 7465 je 0x145940854
1459407ef: 488b87b0070000 mov rax, qword ptr [rdi + 0x7b0]
1459407f6: f30f1000 movss xmm0, dword ptr [rax]
1459407fa: 0f2e874c0a0000 ucomiss xmm0, dword ptr [rdi + 0xa4c]
145940801: 7751 ja 0x145940854
145940803: 488d8fa8070000 lea rcx, [rdi + 0x7a8]
14594080a: c6856701000000 mov byte ptr [rbp + 0x167], 0
145940811: 4c8d0510a12c01 lea r8, [rip + 0x12ca110]
145940818: 31d2 xor edx, edx
14594081a: e8d16b0800 call 0x1459c73f0
14594081f: 90 nop
145940820: 440f5825f8852c01 addps xmm12, xmmword ptr [rip + 0x12c85f8]
145940828: 440f13a5e0000000 movlps qword ptr [rbp + 0xe0], xmm12
145940830: f30f11bde8000000 movss dword ptr [rbp + 0xe8], xmm7
145940838: c6856701000000 mov byte ptr [rbp + 0x167], 0
14594083f: 4c8d8de0000000 lea r9, [rbp + 0xe0]
145940846: 4889f9 mov rcx, rdi
145940849: ba06000000 mov edx, 6
14594084e: e8bd3a0000 call 0x145944310
145940853: 90 nop
145940854: 80bfd80a000000 cmp byte ptr [rdi + 0xad8], 0
14594085b: 0f85d6020000 jne 0x145940b37
145940861: 488b8fa8020000 mov rcx, qword ptr [rdi + 0x2a8]
145940868: 488b97b0020000 mov rdx, qword ptr [rdi + 0x2b0]
14594086f: e84c85f5ff call 0x145898dc0
145940874: 4869c8f0000000 imul rcx, rax, 0xf0
14594087b: 488d05ae1d2b01 lea rax, [rip + 0x12b1dae]
145940882: 488b940188000000 mov rdx, qword ptr [rcx + rax + 0x88]
14594088a: 4c39e2 cmp rdx, r12
14594088d: 0f84b0000000 je 0x145940943
145940893: 4c8d4268 lea r8, [rdx + 0x68]
145940897: 4d39e0 cmp r8, r12
14594089a: 0f84a8000000 je 0x145940948
1459408a0: 4c8d82d0000000 lea r8, [rdx + 0xd0]
1459408a7: 4d39e0 cmp r8, r12
1459408aa: 0f84a0000000 je 0x145940950
1459408b0: 4c8d8238010000 lea r8, [rdx + 0x138]
1459408b7: 4d39e0 cmp r8, r12
1459408ba: 0f84e4000000 je 0x1459409a4
1459408c0: 4881c2a0010000 add rdx, 0x1a0
1459408c7: 4c39e2 cmp rdx, r12
1459408ca: 0f8567020000 jne 0x145940b37
1459408d0: 41be04000000 mov r14d, 4
1459408d6: e9cf000000 jmp 0x1459409aa
145940943: 4531f6 xor r14d, r14d
145940946: eb62 jmp 0x1459409aa
145940948: 41be01000000 mov r14d, 1
14594094e: eb5a jmp 0x1459409aa
145940950: 41be02000000 mov r14d, 2
145940956: eb52 jmp 0x1459409aa
1459409a4: 41be03000000 mov r14d, 3
1459409aa: 4801c8 add rax, rcx
1459409ad: 488b4808 mov rcx, qword ptr [rax + 8]
1459409b1: 488b5010 mov rdx, qword ptr [rax + 0x10]
1459409b5: e80684f5ff call 0x145898dc0
1459409ba: 4989c7 mov r15, rax
1459409bd: 488d8fc8020000 lea rcx, [rdi + 0x2c8]
1459409c4: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459409cb: e8d0cd0500 call 0x14599d7a0
1459409d0: 90 nop
1459409d1: 0f28f8 movaps xmm7, xmm0
1459409d4: 0fb6971c030000 movzx edx, byte ptr [rdi + 0x31c]
1459409db: c6856701000000 mov byte ptr [rbp + 0x167], 0
1459409e2: 488d8de0000000 lea rcx, [rbp + 0xe0]
1459409e9: 4d89f8 mov r8, r15
1459409ec: 4d89f1 mov r9, r14
1459409ef: e82c400500 call 0x145994a20
1459409f4: 90 nop
1459409f5: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
1459409fc: 488985d8000000 mov qword ptr [rbp + 0xd8], rax
145940a03: 488b85e8000000 mov rax, qword ptr [rbp + 0xe8]
145940a0a: 48898538010000 mov qword ptr [rbp + 0x138], rax
145940a11: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
145940a18: 4885c0 test rax, rax
145940a1b: 0f84f4000000 je 0x145940b15
145940a21: 4c8bad38010000 mov r13, qword ptr [rbp + 0x138]
145940a28: 4c8d3cc500000000 lea r15, [rax*8]
145940a30: 4d01ef add r15, r13
145940a33: 4c8db780060000 lea r14, [rdi + 0x680]
145940a3a: f3440f1025fd1f5800 movss xmm12, dword ptr [rip + 0x581ffd]
145940a43: eb21 jmp 0x145940a66
145940a45: 488b8788060000 mov rax, qword ptr [rdi + 0x688]
145940a4c: 891cb0 mov dword ptr [rax + rsi*4], ebx
145940a4f: 48ffc6 inc rsi
145940a52: 4889b790060000 mov qword ptr [rdi + 0x690], rsi
145940a59: 4983c508 add r13, 8
145940a5d: 4d39fd cmp r13, r15
145940a60: 0f84af000000 je 0x145940b15
145940a66: 418b5d00 mov ebx, dword ptr [r13]
145940a6a: f3410f104504 movss xmm0, dword ptr [r13 + 4]
145940a70: 488b87d0090000 mov rax, qword ptr [rdi + 0x9d0]
145940a77: 488b8fb8090000 mov rcx, qword ptr [rdi + 0x9b8]
145940a7e: 488b97c0090000 mov rdx, qword ptr [rdi + 0x9c0]
145940a85: 4c8d0408 lea r8, [rax + rcx]
145940a89: 49c1c017 rol r8, 0x17
145940a8d: 4901c8 add r8, rcx
145940a90: 4989d1 mov r9, rdx
145940a93: 49c1e111 shl r9, 0x11
145940a97: 4c8b97c8090000 mov r10, qword ptr [rdi + 0x9c8]
145940a9e: 4931ca xor r10, rcx
145940aa1: 4831d0 xor rax, rdx
145940aa4: 4c31d2 xor rdx, r10
145940aa7: 488997c0090000 mov qword ptr [rdi + 0x9c0], rdx
145940aae: 4831c1 xor rcx, rax
145940ab1: 48898fb8090000 mov qword ptr [rdi + 0x9b8], rcx
145940ab8: 4d31ca xor r10, r9
145940abb: 48c1c02d rol rax, 0x2d
145940abf: 49c1e828 shr r8, 0x28
145940ac3: 0f57c9 xorps xmm1, xmm1
145940ac6: f3410f2ac8 cvtsi2ss xmm1, r8d
145940acb: 4c8997c8090000 mov qword ptr [rdi + 0x9c8], r10
145940ad2: 488987d0090000 mov qword ptr [rdi + 0x9d0], rax
145940ad9: f30f5887a0020000 addss xmm0, dword ptr [rdi + 0x2a0]
145940ae1: f3410f59cc mulss xmm1, xmm12
145940ae6: f30f59c7 mulss xmm0, xmm7
145940aea: 0f2ec1 ucomiss xmm0, xmm1
145940aed: 0f8666ffffff jbe 0x145940a59
145940af3: 488bb790060000 mov rsi, qword ptr [rdi + 0x690]
145940afa: 483bb780060000 cmp rsi, qword ptr [rdi + 0x680]
145940b01: 0f853effffff jne 0x145940a45
145940b15: 488b95d8000000 mov rdx, qword ptr [rbp + 0xd8]
145940b1c: 4885d2 test rdx, rdx
145940b1f: 7416 je 0x145940b37
145940b21: 48c1e203 shl rdx, 3
145940b25: 41b804000000 mov r8d, 4
145940b2b: 488b8d38010000 mov rcx, qword ptr [rbp + 0x138]
145940b32: e899166cfa call 0x1400021d0
145940b37: c6856701000000 mov byte ptr [rbp + 0x167], 0
145940b3e: 4889f9 mov rcx, rdi
145940b41: e80ae00000 call 0x14594eb50
145940b46: 90 nop
145940b47: 41807c246401 cmp byte ptr [r12 + 0x64], 1
145940b4d: 488bb550010000 mov rsi, qword ptr [rbp + 0x150]
145940b54: 0f8587020000 jne 0x145940de1
145940b5a: 80bf8809000000 cmp byte ptr [rdi + 0x988], 0
145940b61: 0f857a020000 jne 0x145940de1
145940b67: c7878809000001000000 mov dword ptr [rdi + 0x988], 1
145940b71: f3440f11878c090000 movss dword ptr [rdi + 0x98c], xmm8
145940b7a: e962020000 jmp 0x145940de1
14594eb50: 55 push rbp
14594eb51: 4157 push r15
14594eb53: 4156 push r14
14594eb55: 4155 push r13
14594eb57: 4154 push r12
14594eb59: 56 push rsi
14594eb5a: 57 push rdi
14594eb5b: 53 push rbx
14594eb5c: 4881ec28010000 sub rsp, 0x128
14594eb63: 488dac2480000000 lea rbp, [rsp + 0x80]
14594eb6b: 440f299d90000000 movaps xmmword ptr [rbp + 0x90], xmm11
14594eb73: 440f299580000000 movaps xmmword ptr [rbp + 0x80], xmm10
14594eb7b: 440f294d70 movaps xmmword ptr [rbp + 0x70], xmm9
14594eb80: 440f294560 movaps xmmword ptr [rbp + 0x60], xmm8
14594eb85: 0f297d50 movaps xmmword ptr [rbp + 0x50], xmm7
14594eb89: 0f297540 movaps xmmword ptr [rbp + 0x40], xmm6
14594eb8d: 48c74538feffffff mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
14594eb95: 4889ce mov rsi, rcx
14594eb98: f20f10b1d0040000 movsd xmm6, qword ptr [rcx + 0x4d0]
14594eba0: f30f16fe movshdup xmm7, xmm6
14594eba4: 8b81d8040000 mov eax, dword ptr [rcx + 0x4d8]
14594ebaa: 89452c mov dword ptr [rbp + 0x2c], eax
14594ebad: f3440f10814c0a0000 movss xmm8, dword ptr [rcx + 0xa4c]
14594ebb6: 48c7451000000000 mov qword ptr [rbp + 0x10], 0
14594ebbe: 48c7451808000000 mov qword ptr [rbp + 0x18], 8
14594ebc6: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594ebce: 488b9910060000 mov rbx, qword ptr [rcx + 0x610]
14594ebd5: 488b8118060000 mov rax, qword ptr [rcx + 0x618]
14594ebdc: 488d04c0 lea rax, [rax + rax*8]
14594ebe0: 488d04c3 lea rax, [rbx + rax*8]
14594ebe4: 4531f6 xor r14d, r14d
14594ebe7: f3440f100df4e84500 movss xmm9, dword ptr [rip + 0x45e8f4]
14594ebf0: f3440f1015537f4600 movss xmm10, dword ptr [rip + 0x467f53]
14594ebf9: 488d7d10 lea rdi, [rbp + 0x10]
14594ebfd: 48894500 mov qword ptr [rbp], rax
14594ec01: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594ec10: 4883c348 add rbx, 0x48
14594ec14: 488d4bb8 lea rcx, [rbx - 0x48]
14594ec18: 4839c1 cmp rcx, rax
14594ec1b: 0f84aa000000 je 0x14594eccb
14594ec21: 83792000 cmp dword ptr [rcx + 0x20], 0
14594ec25: 75e9 jne 0x14594ec10
14594ec27: 837bd000 cmp dword ptr [rbx - 0x30], 0
14594ec2b: 75e3 jne 0x14594ec10
14594ec2d: 48894d08 mov qword ptr [rbp + 8], rcx
14594ec31: f30f1043ec movss xmm0, dword ptr [rbx - 0x14]
14594ec36: f30f104bf0 movss xmm1, dword ptr [rbx - 0x10]
14594ec3b: f30f5cc6 subss xmm0, xmm6
14594ec3f: f30f5ccf subss xmm1, xmm7
14594ec43: f30f59c0 mulss xmm0, xmm0
14594ec47: f30f59c9 mulss xmm1, xmm1
14594ec4b: f30f58c8 addss xmm1, xmm0
14594ec4f: 450f57db xorps xmm11, xmm11
14594ec53: f3440f51d9 sqrtss xmm11, xmm1
14594ec58: f3450f5ed9 divss xmm11, xmm9
14594ec5d: f3450f5fda maxss xmm11, xmm10
14594ec62: 410f28c0 movaps xmm0, xmm8
14594ec66: f3410f58c3 addss xmm0, xmm11
14594ec6b: c743d001000000 mov dword ptr [rbx - 0x30], 1
14594ec72: f30f1143d4 movss dword ptr [rbx - 0x2c], xmm0
14594ec77: 4c8b7be0 mov r15, qword ptr [rbx - 0x20]
14594ec7b: 488b43ec mov rax, qword ptr [rbx - 0x14]
14594ec7f: 8b4bf4 mov ecx, dword ptr [rbx - 0xc]
14594ec82: 894de0 mov dword ptr [rbp - 0x20], ecx
14594ec85: 488945d8 mov qword ptr [rbp - 0x28], rax
14594ec89: 4c3b7510 cmp r14, qword ptr [rbp + 0x10]
14594ec8d: 7509 jne 0x14594ec98
14594ec8f: 4889f9 mov rcx, rdi
14594ec92: e809ed2b00 call 0x145c0d9a0
14594ec97: 90 nop
14594ec98: 488b4518 mov rax, qword ptr [rbp + 0x18]
14594ec9c: 4b8d0c76 lea rcx, [r14 + r14*2]
14594eca0: 4c893cc8 mov qword ptr [rax + rcx*8], r15
14594eca4: 488b55d8 mov rdx, qword ptr [rbp - 0x28]
14594eca8: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
14594ecad: 8b55e0 mov edx, dword ptr [rbp - 0x20]
14594ecb0: 8954c810 mov dword ptr [rax + rcx*8 + 0x10], edx
14594ecb4: f3440f115cc814 movss dword ptr [rax + rcx*8 + 0x14], xmm11
14594ecbb: 49ffc6 inc r14
14594ecbe: 4c897520 mov qword ptr [rbp + 0x20], r14
14594ecc2: 488b4500 mov rax, qword ptr [rbp]
14594ecc6: e945ffffff jmp 0x14594ec10
14594eccb: 48894d08 mov qword ptr [rbp + 8], rcx
14594eccf: 488b4510 mov rax, qword ptr [rbp + 0x10]
14594ecd3: 48894530 mov qword ptr [rbp + 0x30], rax
14594ecd7: 488b7d18 mov rdi, qword ptr [rbp + 0x18]
14594ecdb: 4b8d0476 lea rax, [r14 + r14*2]
14594ecdf: 4c8d2cc7 lea r13, [rdi + rax*8]
14594ece3: f30f103d959b4600 movss xmm7, dword ptr [rip + 0x469b95]
14594eceb: 450f57c0 xorps xmm8, xmm8
14594ecef: f3440f100d4c7e4600 movss xmm9, dword ptr [rip + 0x467e4c]
14594ecf8: 488d5dd8 lea rbx, [rbp - 0x28]
14594ecfc: 4c8d75c8 lea r14, [rbp - 0x38]
14594ed00: 4c8d7db8 lea r15, [rbp - 0x48]
14594ed04: 48897df8 mov qword ptr [rbp - 8], rdi
14594ed08: eb33 jmp 0x14594ed3d
14594ed10: 4883c718 add rdi, 0x18
14594ed14: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
14594ed1b: 4c89e1 mov rcx, r12
14594ed1e: 48c1e105 shl rcx, 5
14594ed22: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
14594ed26: 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
14594ed2a: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594ed2f: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594ed33: 49ffc4 inc r12
14594ed36: 4c89a630060000 mov qword ptr [rsi + 0x630], r12
14594ed3d: 4c39ef cmp rdi, r13
14594ed40: 0f8492000000 je 0x14594edd8
14594ed46: 488b17 mov rdx, qword ptr [rdi]
14594ed49: 8b4710 mov eax, dword ptr [rdi + 0x10]
14594ed4c: 8945d0 mov dword ptr [rbp - 0x30], eax
14594ed4f: 488b4708 mov rax, qword ptr [rdi + 8]
14594ed53: 488945c8 mov qword ptr [rbp - 0x38], rax
14594ed57: f30f104714 movss xmm0, dword ptr [rdi + 0x14]
14594ed5c: 8b867c0a0000 mov eax, dword ptr [rsi + 0xa7c]
14594ed62: ffc0 inc eax
14594ed64: f30f59c7 mulss xmm0, xmm7
14594ed68: f3480f2cc8 cvttss2si rcx, xmm0
14594ed6d: 410f2ec0 ucomiss xmm0, xmm8
14594ed71: 41b800000000 mov r8d, 0
14594ed77: 410f42c8 cmovb ecx, r8d
14594ed7b: 89867c0a0000 mov dword ptr [rsi + 0xa7c], eax
14594ed81: 410f2ec1 ucomiss xmm0, xmm9
14594ed85: 41b8ffffffff mov r8d, 0xffffffff
14594ed8b: 7703 ja 0x14594ed90
14594ed8d: 4189c8 mov r8d, ecx
14594ed90: 0f1375b8 movlps qword ptr [rbp - 0x48], xmm6
14594ed94: 8b4d2c mov ecx, dword ptr [rbp + 0x2c]
14594ed97: 894dc0 mov dword ptr [rbp - 0x40], ecx
14594ed9a: 4489442428 mov dword ptr [rsp + 0x28], r8d
14594ed9f: 89442420 mov dword ptr [rsp + 0x20], eax
14594eda3: 4889d9 mov rcx, rbx
14594eda6: 4d89f0 mov r8, r14
14594eda9: 4d89f9 mov r9, r15
14594edac: e83f4ef7ff call 0x1458c3bf0
14594edb1: 90 nop
14594edb2: 4c8ba630060000 mov r12, qword ptr [rsi + 0x630]
14594edb9: 4c3ba620060000 cmp r12, qword ptr [rsi + 0x620]
14594edc0: 0f854affffff jne 0x14594ed10
14594edd8: 488b4530 mov rax, qword ptr [rbp + 0x30]
14594eddc: 4885c0 test rax, rax
14594eddf: 7417 je 0x14594edf8
14594ede1: 48c1e003 shl rax, 3
14594ede5: 488d1440 lea rdx, [rax + rax*2]
14594ede9: 41b808000000 mov r8d, 8
14594edef: 488b4df8 mov rcx, qword ptr [rbp - 8]
14594edf3: e8d8336bfa call 0x1400021d0
14594edf8: 0f287540 movaps xmm6, xmmword ptr [rbp + 0x40]
14594edfc: 0f287d50 movaps xmm7, xmmword ptr [rbp + 0x50]
14594ee00: 440f284560 movaps xmm8, xmmword ptr [rbp + 0x60]
14594ee05: 440f284d70 movaps xmm9, xmmword ptr [rbp + 0x70]
14594ee0a: 440f289580000000 movaps xmm10, xmmword ptr [rbp + 0x80]
14594ee12: 440f289d90000000 movaps xmm11, xmmword ptr [rbp + 0x90]
14594ee1a: 4881c428010000 add rsp, 0x128
14594ee21: 5b pop rbx
14594ee22: 5f pop rdi
14594ee23: 5e pop rsi
14594ee24: 415c pop r12
14594ee26: 415d pop r13
14594ee28: 415e pop r14
14594ee2a: 415f pop r15
14594ee2c: 5d pop rbp
14594ee2d: c3 ret
14598bf40: 55 push rbp
14598bf41: 4157 push r15
14598bf43: 4156 push r14
14598bf45: 4155 push r13
14598bf47: 4154 push r12
14598bf49: 56 push rsi
14598bf4a: 57 push rdi
14598bf4b: 53 push rbx
14598bf4c: 4881ec88000000 sub rsp, 0x88
14598bf53: 488dac2480000000 lea rbp, [rsp + 0x80]
14598bf5b: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
14598bf63: 4889ce mov rsi, rcx
14598bf66: 488955e0 mov qword ptr [rbp - 0x20], rdx
14598bf6a: 4c8945e8 mov qword ptr [rbp - 0x18], r8
14598bf6e: 4584c9 test r9b, r9b
14598bf71: 0f8497000000 je 0x14598c00e
14598bf77: 488d3dbc945b01 lea rdi, [rip + 0x15b94bc]
14598bf7e: bb10000000 mov ebx, 0x10
14598bf83: ba10000000 mov edx, 0x10
14598bf88: 4889f9 mov rcx, rdi
14598bf8b: e8401e0000 call 0x14598ddd0
14598bf90: 4885c0 test rax, rax
14598bf93: 480f45f8 cmovne rdi, rax
14598bf97: 480f45da cmovne rbx, rdx
14598bf9b: 488d054e945b01 lea rax, [rip + 0x15b944e]
14598bfa2: 488945a8 mov qword ptr [rbp - 0x58], rax
14598bfa6: 48c745b004000000 mov qword ptr [rbp - 0x50], 4
14598bfae: 488d45e0 lea rax, [rbp - 0x20]
14598bfb2: 488945b8 mov qword ptr [rbp - 0x48], rax
14598bfb6: 488d0513945b01 lea rax, [rip + 0x15b9413]
14598bfbd: 488945c0 mov qword ptr [rbp - 0x40], rax
14598bfc1: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14598bfca: 488d4dc8 lea rcx, [rbp - 0x38]
14598bfce: 4c8d4da8 lea r9, [rbp - 0x58]
14598bfd2: 4889fa mov rdx, rdi
14598bfd5: 4989d8 mov r8, rbx
14598bfd8: e8a3210000 call 0x14598e180
14598bfdd: 488b7de8 mov rdi, qword ptr [rbp - 0x18]
14598bfe1: 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
14598bfe5: 4c8b6dd0 mov r13, qword ptr [rbp - 0x30]
14598bfe9: 4885ff test rdi, rdi
14598bfec: 0f89ac000000 jns 0x14598c09e
14598c00e: 488d3d0f945b01 lea rdi, [rip + 0x15b940f]
14598c015: bb12000000 mov ebx, 0x12
14598c01a: ba12000000 mov edx, 0x12
14598c01f: 4889f9 mov rcx, rdi
14598c022: e8a91d0000 call 0x14598ddd0
14598c027: 4885c0 test rax, rax
14598c02a: 480f45f8 cmovne rdi, rax
14598c02e: 480f45da cmovne rbx, rdx
14598c032: 488d05b7935b01 lea rax, [rip + 0x15b93b7]
14598c039: 488945a8 mov qword ptr [rbp - 0x58], rax
14598c03d: 48c745b004000000 mov qword ptr [rbp - 0x50], 4
14598c045: 488d45e0 lea rax, [rbp - 0x20]
14598c049: 488945b8 mov qword ptr [rbp - 0x48], rax
14598c04d: 488d057c935b01 lea rax, [rip + 0x15b937c]
14598c054: 488945c0 mov qword ptr [rbp - 0x40], rax
14598c058: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14598c061: 488d4dc8 lea rcx, [rbp - 0x38]
14598c065: 4c8d4da8 lea r9, [rbp - 0x58]
14598c069: 4889fa mov rdx, rdi
14598c06c: 4989d8 mov r8, rbx
14598c06f: e80c210000 call 0x14598e180
14598c074: 488b7de8 mov rdi, qword ptr [rbp - 0x18]
14598c078: 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
14598c07c: 4c8b6dd0 mov r13, qword ptr [rbp - 0x30]
14598c080: 4885ff test rdi, rdi
14598c083: 7953 jns 0x14598c0d8
14598c09e: 746e je 0x14598c10e
14598c0a0: 4c8b75e0 mov r14, qword ptr [rbp - 0x20]
14598c0a4: e8576167fa call 0x140002200
14598c0a9: 41bf01000000 mov r15d, 1
14598c0af: ba01000000 mov edx, 1
14598c0b4: 4889f9 mov rcx, rdi
14598c0b7: e8046167fa call 0x1400021c0
14598c0bc: 4885c0 test rax, rax
14598c0bf: 0f8430ffffff je 0x14598bff5
14598c0c5: 4889c3 mov rbx, rax
14598c0c8: 4889c1 mov rcx, rax
14598c0cb: 4c89f2 mov rdx, r14
14598c0ce: 4989f8 mov r8, rdi
14598c0d1: e805e32700 call 0x145c0a3db
14598c0d6: eb3b jmp 0x14598c113
14598c0d8: 744e je 0x14598c128
14598c0da: 4c8b75e0 mov r14, qword ptr [rbp - 0x20]
14598c0de: e81d6167fa call 0x140002200
14598c0e3: 41bf01000000 mov r15d, 1
14598c0e9: ba01000000 mov edx, 1
14598c0ee: 4889f9 mov rcx, rdi
14598c0f1: e8ca6067fa call 0x1400021c0
14598c0f6: 4885c0 test rax, rax
14598c0f9: 748d je 0x14598c088
14598c0fb: 4889c3 mov rbx, rax
14598c0fe: 4889c1 mov rcx, rax
14598c101: 4c89f2 mov rdx, r14
14598c104: 4989f8 mov r8, rdi
14598c107: e8cfe22700 call 0x145c0a3db
14598c10c: eb1f jmp 0x14598c12d
14598c113: 488d0530935b01 lea rax, [rip + 0x15b9330]
14598c11a: 48894630 mov qword ptr [rsi + 0x30], rax
14598c11e: 48c7463809000000 mov qword ptr [rsi + 0x38], 9
14598c126: eb18 jmp 0x14598c140
14598c12d: 488d0502935b01 lea rax, [rip + 0x15b9302]
14598c134: 48894630 mov qword ptr [rsi + 0x30], rax
14598c138: 48c7463804000000 mov qword ptr [rsi + 0x38], 4
14598c140: 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
14598c144: 0f1106 movups xmmword ptr [rsi], xmm0
14598c147: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14598c14b: 48894610 mov qword ptr [rsi + 0x10], rax
14598c14f: 48897e18 mov qword ptr [rsi + 0x18], rdi
14598c153: 48895e20 mov qword ptr [rsi + 0x20], rbx
14598c157: 48897e28 mov qword ptr [rsi + 0x28], rdi
14598c15b: c6464001 mov byte ptr [rsi + 0x40], 1
14598c15f: 4889f0 mov rax, rsi
14598c162: 4881c488000000 add rsp, 0x88
14598c169: 5b pop rbx
14598c16a: 5f pop rdi
14598c16b: 5e pop rsi
14598c16c: 415c pop r12
14598c16e: 415d pop r13
14598c170: 415e pop r14
14598c172: 415f pop r15
14598c174: 5d pop rbp
14598c175: c3 ret
14598c950: 55 push rbp
14598c951: 4157 push r15
14598c953: 4156 push r14
14598c955: 4155 push r13
14598c957: 4154 push r12
14598c959: 56 push rsi
14598c95a: 57 push rdi
14598c95b: 53 push rbx
14598c95c: 4881ec88000000 sub rsp, 0x88
14598c963: 488dac2480000000 lea rbp, [rsp + 0x80]
14598c96b: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
14598c973: 4889ce mov rsi, rcx
14598c976: 488955f0 mov qword ptr [rbp - 0x10], rdx
14598c97a: 4c8945f8 mov qword ptr [rbp - 8], r8
14598c97e: 488d3da48b5b01 lea rdi, [rip + 0x15b8ba4]
14598c985: bb13000000 mov ebx, 0x13
14598c98a: ba13000000 mov edx, 0x13
14598c98f: 4889f9 mov rcx, rdi
14598c992: e839140000 call 0x14598ddd0
14598c997: 4885c0 test rax, rax
14598c99a: 480f45f8 cmovne rdi, rax
14598c99e: 480f45da cmovne rbx, rdx
14598c9a2: 488d05478a5b01 lea rax, [rip + 0x15b8a47]
14598c9a9: 488945a8 mov qword ptr [rbp - 0x58], rax
14598c9ad: 48c745b004000000 mov qword ptr [rbp - 0x50], 4
14598c9b5: 488d45f0 lea rax, [rbp - 0x10]
14598c9b9: 488945b8 mov qword ptr [rbp - 0x48], rax
14598c9bd: 488d050c8a5b01 lea rax, [rip + 0x15b8a0c]
14598c9c4: 488945c0 mov qword ptr [rbp - 0x40], rax
14598c9c8: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
14598c9d1: 488d4dc8 lea rcx, [rbp - 0x38]
14598c9d5: 4c8d4da8 lea r9, [rbp - 0x58]
14598c9d9: 4889fa mov rdx, rdi
14598c9dc: 4989d8 mov r8, rbx
14598c9df: e89c170000 call 0x14598e180
14598c9e4: 488b7df8 mov rdi, qword ptr [rbp - 8]
14598c9e8: 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
14598c9ec: 4c8b6dd0 mov r13, qword ptr [rbp - 0x30]
14598c9f0: 4885ff test rdi, rdi
14598c9f3: 7919 jns 0x14598ca0e
14598ca0e: 7434 je 0x14598ca44
14598ca10: 4c8b75f0 mov r14, qword ptr [rbp - 0x10]
14598ca14: e8e75767fa call 0x140002200
14598ca19: 41bf01000000 mov r15d, 1
14598ca1f: ba01000000 mov edx, 1
14598ca24: 4889f9 mov rcx, rdi
14598ca27: e8945767fa call 0x1400021c0
14598ca2c: 4885c0 test rax, rax
14598ca2f: 74c7 je 0x14598c9f8
14598ca31: 4889c3 mov rbx, rax
14598ca34: 4889c1 mov rcx, rax
14598ca37: 4c89f2 mov rdx, r14
14598ca3a: 4989f8 mov r8, rdi
14598ca3d: e899d92700 call 0x145c0a3db
14598ca42: eb05 jmp 0x14598ca49
14598ca49: 488d05ec8a5b01 lea rax, [rip + 0x15b8aec]
14598ca50: 48894630 mov qword ptr [rsi + 0x30], rax
14598ca54: 48c7463808000000 mov qword ptr [rsi + 0x38], 8
14598ca5c: 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
14598ca60: 0f1106 movups xmmword ptr [rsi], xmm0
14598ca63: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14598ca67: 48894610 mov qword ptr [rsi + 0x10], rax
14598ca6b: 48897e18 mov qword ptr [rsi + 0x18], rdi
14598ca6f: 48895e20 mov qword ptr [rsi + 0x20], rbx
14598ca73: 48897e28 mov qword ptr [rsi + 0x28], rdi
14598ca77: c6464001 mov byte ptr [rsi + 0x40], 1
14598ca7b: 4889f0 mov rax, rsi
14598ca7e: 4881c488000000 add rsp, 0x88
14598ca85: 5b pop rbx
14598ca86: 5f pop rdi
14598ca87: 5e pop rsi
14598ca88: 415c pop r12
14598ca8a: 415d pop r13
14598ca8c: 415e pop r14
14598ca8e: 415f pop r15
14598ca90: 5d pop rbp
14598ca91: c3 ret
145994a20: 55 push rbp
145994a21: 4157 push r15
145994a23: 4156 push r14
145994a25: 4155 push r13
145994a27: 4154 push r12
145994a29: 56 push rsi
145994a2a: 57 push rdi
145994a2b: 53 push rbx
145994a2c: 4881ece8000000 sub rsp, 0xe8
145994a33: 488dac2480000000 lea rbp, [rsp + 0x80]
145994a3b: 0f297d50 movaps xmmword ptr [rbp + 0x50], xmm7
145994a3f: 0f297540 movaps xmmword ptr [rbp + 0x40], xmm6
145994a43: 48c74538feffffff mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
145994a4b: 4889ce mov rsi, rcx
145994a4e: 885537 mov byte ptr [rbp + 0x37], dl
145994a51: 4983f80c cmp r8, 0xc
145994a55: 0f92c0 setb al
145994a58: 4983f905 cmp r9, 5
145994a5c: 0f92c1 setb cl
145994a5f: 84c8 test al, cl
145994a61: 747a je 0x145994add
145994a63: 4969c8f0000000 imul rcx, r8, 0xf0
145994a6a: 488d05bfdb2501 lea rax, [rip + 0x125dbbf]
145994a71: 488b8c0188000000 mov rcx, qword ptr [rcx + rax + 0x88]
145994a79: 4d6bd168 imul r10, r9, 0x68
145994a7d: 4c8d1d5c5e8801 lea r11, [rip + 0x1885e5c]
145994a84: 4f8b24c3 mov r12, qword ptr [r11 + r8*8]
145994a88: 4c896510 mov qword ptr [rbp + 0x10], r12
145994a8c: 4c8d1d85688801 lea r11, [rip + 0x1886885]
145994a93: f3430f1034a3 movss xmm6, dword ptr [r11 + r12*4]
145994a99: f30f117530 movss dword ptr [rbp + 0x30], xmm6
145994a9e: 42807c116400 cmp byte ptr [rcx + r10 + 0x64], 0
145994aa4: 7453 je 0x145994af9
145994aa6: 8d42ff lea eax, [rdx - 1]
145994aa9: 3c0a cmp al, 0xa
145994aab: 0f872e010000 ja 0x145994bdf
145994ab1: 0fb6c0 movzx eax, al
145994ab4: b9df050000 mov ecx, 0x5df
145994ab9: 0fa3c1 bt ecx, eax
145994abc: 0f831d010000 jae 0x145994bdf
145994ac2: 488d0d2fbc8801 lea rcx, [rip + 0x188bc2f]
145994ac9: 488b04c1 mov rax, qword ptr [rcx + rax*8]
145994acd: 4c8bb080000000 mov r14, qword ptr [rax + 0x80]
145994ad4: 4983c608 add r14, 8
145994ad8: e905010000 jmp 0x145994be2
145994af9: 488945a8 mov qword ptr [rbp - 0x58], rax
145994afd: 488d056ce62501 lea rax, [rip + 0x125e66c]
145994b04: 488945b0 mov qword ptr [rbp - 0x50], rax
145994b08: 48c745b800000000 mov qword ptr [rbp - 0x48], 0
145994b10: 488d5d10 lea rbx, [rbp + 0x10]
145994b14: 48895dc0 mov qword ptr [rbp - 0x40], rbx
145994b18: 48c745c800000000 mov qword ptr [rbp - 0x38], 0
145994b20: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
145994b28: 488d7d18 lea rdi, [rbp + 0x18]
145994b2c: 488d55a8 lea rdx, [rbp - 0x58]
145994b30: 4889f9 mov rcx, rdi
145994b33: 4d89ce mov r14, r9
145994b36: 4d89c7 mov r15, r8
145994b39: e862a90300 call 0x1459cf4a0
145994b3e: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
145994b42: 4c8b4528 mov r8, qword ptr [rbp + 0x28]
145994b46: 4d85c0 test r8, r8
145994b49: 0f84d3000000 je 0x145994c22
145994b4f: 4c89f8 mov rax, r15
145994b52: 4c89f2 mov rdx, r14
145994b55: 49c1e004 shl r8, 4
145994b59: 4901c8 add r8, rcx
145994b5c: 4531c9 xor r9d, r9d
145994b5f: 4989ca mov r10, rcx
145994b62: eb1c jmp 0x145994b80
145994b70: 4983c210 add r10, 0x10
145994b74: 49ffc1 inc r9
145994b77: 4d39c2 cmp r10, r8
145994b7a: 0f84a2000000 je 0x145994c22
145994b80: 493902 cmp qword ptr [r10], rax
145994b83: 75eb jne 0x145994b70
145994b85: 49395208 cmp qword ptr [r10 + 8], rdx
145994b89: 75e5 jne 0x145994b70
145994b8b: 4c894d08 mov qword ptr [rbp + 8], r9
145994b8f: 48897da8 mov qword ptr [rbp - 0x58], rdi
145994b93: 488d4508 lea rax, [rbp + 8]
145994b97: 488945b0 mov qword ptr [rbp - 0x50], rax
145994b9b: 48c745b800000000 mov qword ptr [rbp - 0x48], 0
145994ba3: 48c745c008000000 mov qword ptr [rbp - 0x40], 8
145994bab: 488d4537 lea rax, [rbp + 0x37]
145994baf: 488945c8 mov qword ptr [rbp - 0x38], rax
145994bb3: 48895dd0 mov qword ptr [rbp - 0x30], rbx
145994bb7: 488d4530 lea rax, [rbp + 0x30]
145994bbb: 488945d8 mov qword ptr [rbp - 0x28], rax
145994bbf: 488d55a8 lea rdx, [rbp - 0x58]
145994bc3: 4889f1 mov rcx, rsi
145994bc6: e8a55b0300 call 0x1459ca770
145994bcb: 90 nop
145994bcc: 488b5518 mov rdx, qword ptr [rbp + 0x18]
145994bd0: 4885d2 test rdx, rdx
145994bd3: 0f84d6010000 je 0x145994daf
145994bd9: 488b4d20 mov rcx, qword ptr [rbp + 0x20]
145994bdd: eb67 jmp 0x145994c46
145994be2: 31db xor ebx, ebx
145994be4: 4d89f7 mov r15, r14
145994be7: 4983ef08 sub r15, 8
145994beb: 4c0f42fb cmovb r15, rbx
145994bef: 4a8d3cfd00000000 lea rdi, [r15*8]
145994bf7: 4c89f8 mov rax, r15
145994bfa: 48c1e83d shr rax, 0x3d
145994bfe: 0f95c0 setne al
145994c01: 48b9fcffffffffffff7f movabs rcx, 0x7ffffffffffffffc
145994c0b: 4839cf cmp rdi, rcx
145994c0e: 0f97c1 seta cl
145994c11: 08c1 or cl, al
145994c13: 7445 je 0x145994c5a
145994c46: 48c1e204 shl rdx, 4
145994c4a: 41b808000000 mov r8d, 8
145994c50: e87bd566fa call 0x1400021d0
145994c55: e955010000 jmp 0x145994daf
145994c5a: 4885ff test rdi, rdi
145994c5d: 745b je 0x145994cba
145994c5f: 4989d5 mov r13, rdx
145994c62: e899d566fa call 0x140002200
145994c67: bb04000000 mov ebx, 4
145994c6c: ba04000000 mov edx, 4
145994c71: 4889f9 mov rcx, rdi
145994c74: e847d566fa call 0x1400021c0
145994c79: 4885c0 test rax, rax
145994c7c: 7497 je 0x145994c15
145994c7e: 4c89ea mov rdx, r13
145994c81: 4983fe09 cmp r14, 9
145994c85: 7241 jb 0x145994cc8
145994c87: 0fb6ca movzx ecx, dl
145994c8a: 69d1e8030000 imul edx, ecx, 0x3e8
145994c90: 4983fc05 cmp r12, 5
145994c94: b905000000 mov ecx, 5
145994c99: 490f42cc cmovb rcx, r12
145994c9d: 01c9 add ecx, ecx
145994c9f: 448d0489 lea r8d, [rcx + rcx*4]
145994ca3: 4d8d56f8 lea r10, [r14 - 8]
145994ca7: 4983fa04 cmp r10, 4
145994cab: 7322 jae 0x145994ccf
145994cad: 41b908000000 mov r9d, 8
145994cb3: 31c9 xor ecx, ecx
145994cb5: e9be000000 jmp 0x145994d78
145994d78: 4d29ce sub r14, r9
145994d7b: 456bc964 imul r9d, r9d, 0x64
145994d7f: 4401ca add edx, r9d
145994d82: 4401c2 add edx, r8d
145994d85: 81c2a0860100 add edx, 0x186a0
145994d8b: 0f1f440000 nop dword ptr [rax + rax]
145994d90: 8914c8 mov dword ptr [rax + rcx*8], edx
145994d93: f30f1174c804 movss dword ptr [rax + rcx*8 + 4], xmm6
145994d99: 48ffc1 inc rcx
145994d9c: 83c264 add edx, 0x64
145994d9f: 49ffce dec r14
145994da2: 75ec jne 0x145994d90
145994da4: 4c893e mov qword ptr [rsi], r15
145994da7: 48894608 mov qword ptr [rsi + 8], rax
145994dab: 48894e10 mov qword ptr [rsi + 0x10], rcx
145994daf: 4889f0 mov rax, rsi
145994db2: 0f287540 movaps xmm6, xmmword ptr [rbp + 0x40]
145994db6: 0f287d50 movaps xmm7, xmmword ptr [rbp + 0x50]
145994dba: 4881c4e8000000 add rsp, 0xe8
145994dc1: 5b pop rbx
145994dc2: 5f pop rdi
145994dc3: 5e pop rsi
145994dc4: 415c pop r12
145994dc6: 415d pop r13
145994dc8: 415e pop r14
145994dca: 415f pop r15
145994dcc: 5d pop rbp
145994dcd: c3 ret
14599d7a0: 660f6e01 movd xmm0, dword ptr [rcx]
14599d7a4: 660fefc9 pxor xmm1, xmm1
14599d7a8: 660f61c1 punpcklwd xmm0, xmm1
14599d7ac: 0f5bc0 cvtdq2ps xmm0, xmm0
14599d7af: 0f28152a892601 movaps xmm2, xmmword ptr [rip + 0x126892a]
14599d7b6: 0f58c2 addps xmm0, xmm2
14599d7b9: 0f281d00af1501 movaps xmm3, xmmword ptr [rip + 0x115af00]
14599d7c0: 0f5ec3 divps xmm0, xmm3
14599d7c3: 0f590526892601 mulps xmm0, xmmword ptr [rip + 0x1268926]
14599d7ca: 660f6e6104 movd xmm4, dword ptr [rcx + 4]
14599d7cf: 660f61e1 punpcklwd xmm4, xmm1
14599d7d3: 0f5bcc cvtdq2ps xmm1, xmm4
14599d7d6: 0f58ca addps xmm1, xmm2
14599d7d9: 0f5ecb divps xmm1, xmm3
14599d7dc: 0f590d1d892601 mulps xmm1, xmmword ptr [rip + 0x126891d]
14599d7e3: f30f16d0 movshdup xmm2, xmm0
14599d7e7: f30f58d0 addss xmm2, xmm0
14599d7eb: f30f58d1 addss xmm2, xmm1
14599d7ef: f30f16c1 movshdup xmm0, xmm1
14599d7f3: f30f58c2 addss xmm0, xmm2
14599d7f7: f30f580561fa4000 addss xmm0, dword ptr [rip + 0x40fa61]
14599d7ff: f30f5d0561fa4000 minss xmm0, dword ptr [rip + 0x40fa61]
14599d807: c3 ret
1459c2d90: 56 push rsi
1459c2d91: 4883ec20 sub rsp, 0x20
1459c2d95: 0f2ed1 ucomiss xmm2, xmm1
1459c2d98: 0f8638010000 jbe 0x1459c2ed6
1459c2d9e: 0f28da movaps xmm3, xmm2
1459c2da1: f30f5cd9 subss xmm3, xmm1
1459c2da5: 66410f7eda movd r10d, xmm3
1459c2daa: 4489d0 mov eax, r10d
1459c2dad: 25ffffff7f and eax, 0x7fffffff
1459c2db2: 3dffff7f7f cmp eax, 0x7f7fffff
1459c2db7: 0f8f33010000 jg 0x1459c2ef0
1459c2dbd: 4c8b01 mov r8, qword ptr [rcx]
1459c2dc0: 488b4108 mov rax, qword ptr [rcx + 8]
1459c2dc4: 4c8b4918 mov r9, qword ptr [rcx + 0x18]
1459c2dc8: 488b5110 mov rdx, qword ptr [rcx + 0x10]
1459c2dcc: 660f7ece movd esi, xmm1
1459c2dd0: 81e6ffffff7f and esi, 0x7fffffff
1459c2dd6: 66410f7ed3 movd r11d, xmm2
1459c2ddb: 4181e3ffffff7f and r11d, 0x7fffffff
1459c2de2: 4181fb0000807f cmp r11d, 0x7f800000
1459c2de9: 410f9cc3 setl r11b
1459c2ded: 81feffff7f7f cmp esi, 0x7f7fffff
1459c2df3: 0f8f7e000000 jg 0x1459c2e77
1459c2df9: 4584db test r11b, r11b
1459c2dfc: 7479 je 0x1459c2e77
1459c2dfe: f30f101d62e53e00 movss xmm3, dword ptr [rip + 0x3ee562]
1459c2e06: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459c2e10: 4f8d1c08 lea r11, [r8 + r9]
1459c2e14: 49c1c317 rol r11, 0x17
1459c2e18: 4d01c3 add r11, r8
1459c2e1b: 4889c6 mov rsi, rax
1459c2e1e: 48c1e611 shl rsi, 0x11
1459c2e22: 4c31c2 xor rdx, r8
1459c2e25: 4931c1 xor r9, rax
1459c2e28: 4831d0 xor rax, rdx
1459c2e2b: 4d31c8 xor r8, r9
1459c2e2e: 4831f2 xor rdx, rsi
1459c2e31: 49c1c12d rol r9, 0x2d
1459c2e35: 49c1eb29 shr r11, 0x29
1459c2e39: 4181cb0000803f or r11d, 0x3f800000
1459c2e40: 66410f6ee3 movd xmm4, r11d
1459c2e45: f30f58e3 addss xmm4, xmm3
1459c2e49: 66410f6ec2 movd xmm0, r10d
1459c2e4e: f30f59c4 mulss xmm0, xmm4
1459c2e52: f30f58c1 addss xmm0, xmm1
1459c2e56: 0f2ed0 ucomiss xmm2, xmm0
1459c2e59: 7766 ja 0x1459c2ec1
1459c2ec1: 4c8901 mov qword ptr [rcx], r8
1459c2ec4: 4c894918 mov qword ptr [rcx + 0x18], r9
1459c2ec8: 48894108 mov qword ptr [rcx + 8], rax
1459c2ecc: 48895110 mov qword ptr [rcx + 0x10], rdx
1459c2ed0: 4883c420 add rsp, 0x20
1459c2ed4: 5e pop rsi
1459c2ed5: c3 ret
1459ca770: 55 push rbp
1459ca771: 4157 push r15
1459ca773: 4156 push r14
1459ca775: 4155 push r13
1459ca777: 4154 push r12
1459ca779: 56 push rsi
1459ca77a: 57 push rdi
1459ca77b: 53 push rbx
1459ca77c: 4881ec88000000 sub rsp, 0x88
1459ca783: 488dac2480000000 lea rbp, [rsp + 0x80]
1459ca78b: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
1459ca78f: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
1459ca797: 4989d0 mov r8, rdx
1459ca79a: 4c8b7a18 mov r15, qword ptr [rdx + 0x18]
1459ca79e: 488b7a10 mov rdi, qword ptr [rdx + 0x10]
1459ca7a2: 4c8b22 mov r12, qword ptr [rdx]
1459ca7a5: 4c8b6a08 mov r13, qword ptr [rdx + 8]
1459ca7a9: 6bdf64 imul ebx, edi, 0x64
1459ca7ac: 81c33c860100 add ebx, 0x1863c
1459ca7b2: eb20 jmp 0x1459ca7d4
1459ca7d4: 4c39ff cmp rdi, r15
1459ca7d7: 0f8384010000 jae 0x1459ca961
1459ca7dd: 4d8b4c2410 mov r9, qword ptr [r12 + 0x10]
1459ca7e2: 4d85c9 test r9, r9
1459ca7e5: 0f84bd010000 je 0x1459ca9a8
1459ca7eb: 4889f8 mov rax, rdi
1459ca7ee: 4c09c8 or rax, r9
1459ca7f1: 48c1e820 shr rax, 0x20
1459ca7f5: 75c9 jne 0x1459ca7c0
1459ca7f7: 89f8 mov eax, edi
1459ca7f9: 31d2 xor edx, edx
1459ca7fb: 41f7f1 div r9d
1459ca7fe: 48ffc7 inc rdi
1459ca801: 83c364 add ebx, 0x64
1459ca804: 493b5500 cmp rdx, qword ptr [r13]
1459ca808: 75ca jne 0x1459ca7d4
1459ca80a: 48894da8 mov qword ptr [rbp - 0x58], rcx
1459ca80e: 498b4020 mov rax, qword ptr [r8 + 0x20]
1459ca812: 498b4828 mov rcx, qword ptr [r8 + 0x28]
1459ca816: 488945b0 mov qword ptr [rbp - 0x50], rax
1459ca81a: 440fb630 movzx r14d, byte ptr [rax]
1459ca81e: 48894db8 mov qword ptr [rbp - 0x48], rcx
1459ca822: 488b31 mov rsi, qword ptr [rcx]
1459ca825: 498b4030 mov rax, qword ptr [r8 + 0x30]
1459ca829: 488945c0 mov qword ptr [rbp - 0x40], rax
1459ca82d: f30f1030 movss xmm6, dword ptr [rax]
1459ca831: e8ca7963fa call 0x140002200
1459ca836: b920000000 mov ecx, 0x20
1459ca83b: ba04000000 mov edx, 4
1459ca840: e87b7963fa call 0x1400021c0
1459ca845: 4885c0 test rax, rax
1459ca848: 0f8477010000 je 0x1459ca9c5
1459ca84e: 4989c1 mov r9, rax
1459ca851: 4169c6e8030000 imul eax, r14d, 0x3e8
1459ca858: 4883fe05 cmp rsi, 5
1459ca85c: ba05000000 mov edx, 5
1459ca861: 480f43f2 cmovae rsi, rdx
1459ca865: 8d14b6 lea edx, [rsi + rsi*4]
1459ca868: 8d0450 lea eax, [rax + rdx*2]
1459ca86b: 01d8 add eax, ebx
1459ca86d: 418901 mov dword ptr [r9], eax
1459ca870: f3410f117104 movss dword ptr [r9 + 4], xmm6
1459ca876: 48c745c804000000 mov qword ptr [rbp - 0x38], 4
1459ca87e: 4c894dd0 mov qword ptr [rbp - 0x30], r9
1459ca882: bb01000000 mov ebx, 1
1459ca887: 488d4dc8 lea rcx, [rbp - 0x38]
1459ca88b: 48895dd8 mov qword ptr [rbp - 0x28], rbx
1459ca88f: 446bf764 imul r14d, edi, 0x64
1459ca893: 4181c63c860100 add r14d, 0x1863c
1459ca89a: eb19 jmp 0x1459ca8b5
1459ca8b5: 4c39ff cmp rdi, r15
1459ca8b8: 0f83bc000000 jae 0x1459ca97a
1459ca8be: 4d8b442410 mov r8, qword ptr [r12 + 0x10]
1459ca8c3: 4d85c0 test r8, r8
1459ca8c6: 0f84ea000000 je 0x1459ca9b6
1459ca8cc: 4889f8 mov rax, rdi
1459ca8cf: 4c09c0 or rax, r8
1459ca8d2: 48c1e820 shr rax, 0x20
1459ca8d6: 75c8 jne 0x1459ca8a0
1459ca8d8: 89f8 mov eax, edi
1459ca8da: 31d2 xor edx, edx
1459ca8dc: 41f7f0 div r8d
1459ca8df: 48ffc7 inc rdi
1459ca8e2: 4183c664 add r14d, 0x64
1459ca8e6: 493b5500 cmp rdx, qword ptr [r13]
1459ca8ea: 75c9 jne 0x1459ca8b5
1459ca97a: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459ca97e: 488b4da8 mov rcx, qword ptr [rbp - 0x58]
1459ca982: 48894110 mov qword ptr [rcx + 0x10], rax
1459ca986: 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
1459ca98a: 0f1101 movups xmmword ptr [rcx], xmm0
1459ca98d: 4889c8 mov rax, rcx
1459ca990: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
1459ca994: 4881c488000000 add rsp, 0x88
1459ca99b: 5b pop rbx
1459ca99c: 5f pop rdi
1459ca99d: 5e pop rsi
1459ca99e: 415c pop r12
1459ca9a0: 415d pop r13
1459ca9a2: 415e pop r14
1459ca9a4: 415f pop r15
1459ca9a6: 5d pop rbp
1459ca9a7: c3 ret
1459cbf00: 55 push rbp
1459cbf01: 4157 push r15
1459cbf03: 4156 push r14
1459cbf05: 4155 push r13
1459cbf07: 4154 push r12
1459cbf09: 56 push rsi
1459cbf0a: 57 push rdi
1459cbf0b: 53 push rbx
1459cbf0c: 4883ec68 sub rsp, 0x68
1459cbf10: 488d6c2460 lea rbp, [rsp + 0x60]
1459cbf15: 0f2975f0 movaps xmmword ptr [rbp - 0x10], xmm6
1459cbf19: 48c745e8feffffff mov qword ptr [rbp - 0x18], 0xfffffffffffffffe
1459cbf21: 4889ce mov rsi, rcx
1459cbf24: 4c8b22 mov r12, qword ptr [rdx]
1459cbf27: 4c8b7a08 mov r15, qword ptr [rdx + 8]
1459cbf2b: 4d39fc cmp r12, r15
1459cbf2e: 7444 je 0x1459cbf74
1459cbf30: 4889d7 mov rdi, rdx
1459cbf33: 4c8b6a10 mov r13, qword ptr [rdx + 0x10]
1459cbf37: f30f1035f5573e00 movss xmm6, dword ptr [rip + 0x3e57f5]
1459cbf3f: 90 nop
1459cbf40: 498d5c2408 lea rbx, [r12 + 8]
1459cbf45: 48891f mov qword ptr [rdi], rbx
1459cbf48: 498b4500 mov rax, qword ptr [r13]
1459cbf4c: f3410f100424 movss xmm0, dword ptr [r12]
1459cbf52: f3410f104c2404 movss xmm1, dword ptr [r12 + 4]
1459cbf59: f30f5c00 subss xmm0, dword ptr [rax]
1459cbf5d: f30f5c4804 subss xmm1, dword ptr [rax + 4]
1459cbf62: e8c8e42300 call 0x145c0a42f
1459cbf67: 0f2ec6 ucomiss xmm0, xmm6
1459cbf6a: 7324 jae 0x1459cbf90
1459cbf6c: 4989dc mov r12, rbx
1459cbf6f: 4c39fb cmp rbx, r15
1459cbf72: 75cc jne 0x1459cbf40
1459cbf74: 48c70600000000 mov qword ptr [rsi], 0
1459cbf7b: 48c7460808000000 mov qword ptr [rsi + 8], 8
1459cbf83: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
1459cbf8b: e9d5000000 jmp 0x1459cc065
1459cbf90: e86b6263fa call 0x140002200
1459cbf95: b920000000 mov ecx, 0x20
1459cbf9a: ba08000000 mov edx, 8
1459cbf9f: e81c6263fa call 0x1400021c0
1459cbfa4: 4885c0 test rax, rax
1459cbfa7: 0f84d0000000 je 0x1459cc07d
1459cbfad: 4889c3 mov rbx, rax
1459cbfb0: 4c8920 mov qword ptr [rax], r12
1459cbfb3: 4983c408 add r12, 8
1459cbfb7: 48c745d004000000 mov qword ptr [rbp - 0x30], 4
1459cbfbf: 488945d8 mov qword ptr [rbp - 0x28], rax
1459cbfc3: 48c745e001000000 mov qword ptr [rbp - 0x20], 1
1459cbfcb: 4d39fc cmp r12, r15
1459cbfce: 0f847a000000 je 0x1459cc04e
1459cbfd4: bf01000000 mov edi, 1
1459cbfd9: 4c8d75d0 lea r14, [rbp - 0x30]
1459cbfdd: 0f1f00 nop dword ptr [rax]
1459cbfe0: 498b4500 mov rax, qword ptr [r13]
1459cbfe4: f3410f100424 movss xmm0, dword ptr [r12]
1459cbfea: f3410f104c2404 movss xmm1, dword ptr [r12 + 4]
1459cbff1: f30f5c00 subss xmm0, dword ptr [rax]
1459cbff5: f30f5c4804 subss xmm1, dword ptr [rax + 4]
1459cbffa: e830e42300 call 0x145c0a42f
1459cbfff: 0f2ec6 ucomiss xmm0, xmm6
1459cc002: 730b jae 0x1459cc00f
1459cc004: 4983c408 add r12, 8
1459cc008: 4d39fc cmp r12, r15
1459cc00b: 75d3 jne 0x1459cbfe0
1459cc00d: eb3f jmp 0x1459cc04e
1459cc00f: 483b7dd0 cmp rdi, qword ptr [rbp - 0x30]
1459cc013: 7525 jne 0x1459cc03a
1459cc015: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
1459cc01e: 41b801000000 mov r8d, 1
1459cc024: 41b908000000 mov r9d, 8
1459cc02a: 4c89f1 mov rcx, r14
1459cc02d: 4889fa mov rdx, rdi
1459cc030: e83b142400 call 0x145c0d470
1459cc035: 90 nop
1459cc036: 488b5dd8 mov rbx, qword ptr [rbp - 0x28]
1459cc03a: 4c8924fb mov qword ptr [rbx + rdi*8], r12
1459cc03e: 4983c408 add r12, 8
1459cc042: 48ffc7 inc rdi
1459cc045: 48897de0 mov qword ptr [rbp - 0x20], rdi
1459cc049: 4d39fc cmp r12, r15
1459cc04c: 7592 jne 0x1459cbfe0
1459cc04e: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1459cc052: 48894610 mov qword ptr [rsi + 0x10], rax
1459cc056: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1459cc05a: 488906 mov qword ptr [rsi], rax
1459cc05d: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1459cc061: 48894608 mov qword ptr [rsi + 8], rax
1459cc065: 4889f0 mov rax, rsi
1459cc068: 0f2875f0 movaps xmm6, xmmword ptr [rbp - 0x10]
1459cc06c: 4883c468 add rsp, 0x68
1459cc070: 5b pop rbx
1459cc071: 5f pop rdi
1459cc072: 5e pop rsi
1459cc073: 415c pop r12
1459cc075: 415d pop r13
1459cc077: 415e pop r14
1459cc079: 415f pop r15
1459cc07b: 5d pop rbp
1459cc07c: c3 ret
1459cf4a0: 55 push rbp
1459cf4a1: 4157 push r15
1459cf4a3: 4156 push r14
1459cf4a5: 4155 push r13
1459cf4a7: 4154 push r12
1459cf4a9: 56 push rsi
1459cf4aa: 57 push rdi
1459cf4ab: 53 push rbx
1459cf4ac: 4881ec98000000 sub rsp, 0x98
1459cf4b3: 488dac2480000000 lea rbp, [rsp + 0x80]
1459cf4bb: 48c74510feffffff mov qword ptr [rbp + 0x10], 0xfffffffffffffffe
1459cf4c3: 4889d7 mov rdi, rdx
1459cf4c6: 488d4238 lea rax, [rdx + 0x38]
1459cf4ca: 488b5220 mov rdx, qword ptr [rdx + 0x20]
1459cf4ce: 4c8b5728 mov r10, qword ptr [rdi + 0x28]
1459cf4d2: 4c8b7f30 mov r15, qword ptr [rdi + 0x30]
1459cf4d6: 488b1f mov rbx, qword ptr [rdi]
1459cf4d9: 4c8b7708 mov r14, qword ptr [rdi + 8]
1459cf4dd: 488b7710 mov rsi, qword ptr [rdi + 0x10]
1459cf4e1: 4c8b4718 mov r8, qword ptr [rdi + 0x18]
1459cf4e5: 4c8945c0 mov qword ptr [rbp - 0x40], r8
1459cf4e9: 4c8d25f0b38401 lea r12, [rip + 0x184b3f0]
1459cf4f0: 4c8975f8 mov qword ptr [rbp - 8], r14
1459cf4f4: 48894dd0 mov qword ptr [rbp - 0x30], rcx
1459cf4f8: 4c895500 mov qword ptr [rbp], r10
1459cf4fc: 4885d2 test rdx, rdx
1459cf4ff: 743f je 0x1459cf540
1459cf501: 4883c268 add rdx, 0x68
1459cf505: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459cf510: 4d89fd mov r13, r15
1459cf513: 4c8d4298 lea r8, [rdx - 0x68]
1459cf517: 4c3b4500 cmp r8, qword ptr [rbp]
1459cf51b: 7433 je 0x1459cf550
1459cf51d: 48895720 mov qword ptr [rdi + 0x20], rdx
1459cf521: 4d8d7d01 lea r15, [r13 + 1]
1459cf525: 4c8d7268 lea r14, [rdx + 0x68]
1459cf529: 807afc00 cmp byte ptr [rdx - 4], 0
1459cf52d: 4c897f30 mov qword ptr [rdi + 0x30], r15
1459cf531: 4c89f2 mov rdx, r14
1459cf534: 75da jne 0x1459cf510
1459cf536: e930010000 jmp 0x1459cf66b
1459cf540: 4d89fd mov r13, r15
1459cf543: 4885db test rbx, rbx
1459cf546: 751d jne 0x1459cf565
1459cf565: 488d14f500000000 lea rdx, [rsi*8]
1459cf56d: 4531c0 xor r8d, r8d
1459cf570: eb29 jmp 0x1459cf59b
1459cf580: 4d8d4801 lea r9, [r8 + 1]
1459cf584: 4e8d1c06 lea r11, [rsi + r8]
1459cf588: 49ffc3 inc r11
1459cf58b: 4d89c8 mov r8, r9
1459cf58e: 4c8b7dc0 mov r15, qword ptr [rbp - 0x40]
1459cf592: 4d3b17 cmp r10, qword ptr [r15]
1459cf595: 4c895f10 mov qword ptr [rdi + 0x10], r11
1459cf599: 7435 je 0x1459cf5d0
1459cf59b: 4e8d0c06 lea r9, [rsi + r8]
1459cf59f: 4c39f3 cmp rbx, r14
1459cf5a2: 746b je 0x1459cf60f
1459cf5a4: 4881c3f0000000 add rbx, 0xf0
1459cf5ab: 48891f mov qword ptr [rdi], rbx
1459cf5ae: 41ba04000000 mov r10d, 4
1459cf5b4: 4983f90b cmp r9, 0xb
1459cf5b8: 77c6 ja 0x1459cf580
1459cf5ba: 4e8d0cc2 lea r9, [rdx + r8*8]
1459cf5be: 4f8b140c mov r10, qword ptr [r12 + r9]
1459cf5c2: ebbc jmp 0x1459cf580
1459cf5d0: 488b5398 mov rdx, qword ptr [rbx - 0x68]
1459cf5d4: 4c6b53a068 imul r10, qword ptr [rbx - 0x60], 0x68
1459cf5d9: 4901d2 add r10, rdx
1459cf5dc: 48895720 mov qword ptr [rdi + 0x20], rdx
1459cf5e0: 4c895728 mov qword ptr [rdi + 0x28], r10
1459cf5e4: 48c7473000000000 mov qword ptr [rdi + 0x30], 0
1459cf5ec: 4e8d040e lea r8, [rsi + r9]
1459cf5f0: 49ffc8 dec r8
1459cf5f3: 4c01ce add rsi, r9
1459cf5f6: 4c894738 mov qword ptr [rdi + 0x38], r8
1459cf5fa: 4531ff xor r15d, r15d
1459cf5fd: 4c895500 mov qword ptr [rbp], r10
1459cf601: 4885d2 test rdx, rdx
1459cf604: 0f85f7feffff jne 0x1459cf501
1459cf66b: 4983c698 add r14, -0x68
1459cf66f: 4d89ec mov r12, r13
1459cf672: 488b00 mov rax, qword ptr [rax]
1459cf675: 48894508 mov qword ptr [rbp + 8], rax
1459cf679: e8822b63fa call 0x140002200
1459cf67e: b940000000 mov ecx, 0x40
1459cf683: ba08000000 mov edx, 8
1459cf688: e8332b63fa call 0x1400021c0
1459cf68d: 4885c0 test rax, rax
1459cf690: 4c8b6d00 mov r13, qword ptr [rbp]
1459cf694: 0f842d020000 je 0x1459cf8c7
1459cf69a: 488b4d08 mov rcx, qword ptr [rbp + 8]
1459cf69e: 488908 mov qword ptr [rax], rcx
1459cf6a1: 4c896008 mov qword ptr [rax + 8], r12
1459cf6a5: 48c745e004000000 mov qword ptr [rbp - 0x20], 4
1459cf6ad: 488945e8 mov qword ptr [rbp - 0x18], rax
1459cf6b1: 48c745f001000000 mov qword ptr [rbp - 0x10], 1
1459cf6b9: 488b4f38 mov rcx, qword ptr [rdi + 0x38]
1459cf6bd: 48894dc8 mov qword ptr [rbp - 0x38], rcx
1459cf6c1: 4c8b6740 mov r12, qword ptr [rdi + 0x40]
1459cf6c5: 488b4f48 mov rcx, qword ptr [rdi + 0x48]
1459cf6c9: 48894db0 mov qword ptr [rbp - 0x50], rcx
1459cf6cd: 488b4f50 mov rcx, qword ptr [rdi + 0x50]
1459cf6d1: 48894dd8 mov qword ptr [rbp - 0x28], rcx
1459cf6d5: 488b4f58 mov rcx, qword ptr [rdi + 0x58]
1459cf6d9: 48894db8 mov qword ptr [rbp - 0x48], rcx
1459cf6dd: b901000000 mov ecx, 1
1459cf6e2: 48894d08 mov qword ptr [rbp + 8], rcx
1459cf6e6: eb27 jmp 0x1459cf70f
1459cf6f0: 4889d1 mov rcx, rdx
1459cf6f3: 48c1e104 shl rcx, 4
1459cf6f7: 48893c08 mov qword ptr [rax + rcx], rdi
1459cf6fb: 4c8b4500 mov r8, qword ptr [rbp]
1459cf6ff: 4c89440808 mov qword ptr [rax + rcx + 8], r8
1459cf704: 48ffc2 inc rdx
1459cf707: 48895508 mov qword ptr [rbp + 8], rdx
1459cf70b: 488955f0 mov qword ptr [rbp - 0x10], rdx
1459cf70f: 4c89f1 mov rcx, r14
1459cf712: 4c8b4df8 mov r9, qword ptr [rbp - 8]
1459cf716: 4c8b55c0 mov r10, qword ptr [rbp - 0x40]
1459cf71a: 4c8b5db0 mov r11, qword ptr [rbp - 0x50]
1459cf71e: 4885c9 test rcx, rcx
1459cf721: 7434 je 0x1459cf757
1459cf723: 31d2 xor edx, edx
1459cf725: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459cf730: 4c39e9 cmp rcx, r13
1459cf733: 741b je 0x1459cf750
1459cf735: 4c8d7168 lea r14, [rcx + 0x68]
1459cf739: 48ffca dec rdx
1459cf73c: 80796400 cmp byte ptr [rcx + 0x64], 0
1459cf740: 4c89f1 mov rcx, r14
1459cf743: 75eb jne 0x1459cf730
1459cf745: e9d6000000 jmp 0x1459cf820
1459cf750: 4929d7 sub r15, rdx
1459cf753: 4c8b4df8 mov r9, qword ptr [rbp - 8]
1459cf757: 4885db test rbx, rbx
1459cf75a: 0f8409010000 je 0x1459cf869
1459cf760: 488d0d79b18401 lea rcx, [rip + 0x184b179]
1459cf767: 488d0cf1 lea rcx, [rcx + rsi*8]
1459cf76b: eb17 jmp 0x1459cf784
1459cf770: 4881c3f0000000 add rbx, 0xf0
1459cf777: 488d7201 lea rsi, [rdx + 1]
1459cf77b: 4883c108 add rcx, 8
1459cf77f: 4d3b02 cmp r8, qword ptr [r10]
1459cf782: 741c je 0x1459cf7a0
1459cf784: 4889f2 mov rdx, rsi
1459cf787: 4c39cb cmp rbx, r9
1459cf78a: 7434 je 0x1459cf7c0
1459cf78c: 41b804000000 mov r8d, 4
1459cf792: 4883fa0b cmp rdx, 0xb
1459cf796: 77d8 ja 0x1459cf770
1459cf798: 4c8b01 mov r8, qword ptr [rcx]
1459cf79b: ebd3 jmp 0x1459cf770
1459cf7a0: 4c6b6ba068 imul r13, qword ptr [rbx - 0x60], 0x68
1459cf7a5: 488b4b98 mov rcx, qword ptr [rbx - 0x68]
1459cf7a9: 4901cd add r13, rcx
1459cf7ac: 488955c8 mov qword ptr [rbp - 0x38], rdx
1459cf7b0: 4531ff xor r15d, r15d
1459cf7b3: 4885c9 test rcx, rcx
1459cf7b6: 0f8567ffffff jne 0x1459cf723
1459cf7c0: 4889d6 mov rsi, rdx
1459cf7c3: 4d85e4 test r12, r12
1459cf7c6: 0f84a8000000 je 0x1459cf874
1459cf820: 4929d7 sub r15, rdx
1459cf823: 498d4fff lea rcx, [r15 - 1]
1459cf827: 48894d00 mov qword ptr [rbp], rcx
1459cf82b: 488b7dc8 mov rdi, qword ptr [rbp - 0x38]
1459cf82f: 488b5508 mov rdx, qword ptr [rbp + 8]
1459cf833: 483b55e0 cmp rdx, qword ptr [rbp - 0x20]
1459cf837: 0f85b3feffff jne 0x1459cf6f0
1459cf83d: 48c744242010000000 mov qword ptr [rsp + 0x20], 0x10
1459cf846: 41b801000000 mov r8d, 1
1459cf84c: 41b908000000 mov r9d, 8
1459cf852: 488d4de0 lea rcx, [rbp - 0x20]
1459cf856: e815dc2300 call 0x145c0d470
1459cf85b: 90 nop
1459cf85c: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1459cf860: 488b5508 mov rdx, qword ptr [rbp + 8]
1459cf864: e987feffff jmp 0x1459cf6f0
1459cf874: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
1459cf878: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1459cf87c: 48894810 mov qword ptr [rax + 0x10], rcx
1459cf880: 0f1045e0 movups xmm0, xmmword ptr [rbp - 0x20]
1459cf884: 0f1100 movups xmmword ptr [rax], xmm0
1459cf887: eb2a jmp 0x1459cf8b3
1459cf8b3: 4881c498000000 add rsp, 0x98
1459cf8ba: 5b pop rbx
1459cf8bb: 5f pop rdi
1459cf8bc: 5e pop rsi
1459cf8bd: 415c pop r12
1459cf8bf: 415d pop r13
1459cf8c1: 415e pop r14
1459cf8c3: 415f pop r15
1459cf8c5: 5d pop rbp
1459cf8c6: c3 ret
