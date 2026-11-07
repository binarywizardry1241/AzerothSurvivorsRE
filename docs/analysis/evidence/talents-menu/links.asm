14010b540: push      rbp
14010b541: push      r15
14010b543: push      r14
14010b545: push      r13
14010b547: push      r12
14010b549: push      rsi
14010b54a: push      rdi
14010b54b: push      rbx
14010b54c: sub       rsp, 0x538
14010b553: lea       rbp, [rsp + 0x80]
14010b55b: movaps    xmmword ptr [rbp + 0x4a0], xmm15
14010b563: movaps    xmmword ptr [rbp + 0x490], xmm14
14010b56b: movaps    xmmword ptr [rbp + 0x480], xmm13
14010b573: movaps    xmmword ptr [rbp + 0x470], xmm12
14010b57b: movaps    xmmword ptr [rbp + 0x460], xmm11
14010b583: movaps    xmmword ptr [rbp + 0x450], xmm10
14010b58b: movdqa    xmmword ptr [rbp + 0x440], xmm9
14010b594: movaps    xmmword ptr [rbp + 0x430], xmm8
14010b59c: movaps    xmmword ptr [rbp + 0x420], xmm7
14010b5a3: movaps    xmmword ptr [rbp + 0x410], xmm6
14010b5aa: mov       qword ptr [rbp + 0x408], 0xfffffffffffffffe
14010b5b5: mov       qword ptr [rbp + 0x3b0], r9
14010b5bc: mov       byte ptr [rbp + 0x407], dl
14010b5c2: mov       rsi, qword ptr [r8 + 0x30]
14010b5c6: imul      r13, qword ptr [r8 + 0x38], 0x78
14010b5cb: add       r13, rsi
14010b5ce: lea       r14, [rbp + 0x1f8]
14010b5d5: mov       rax, qword ptr [rcx]
14010b5d8: mov       qword ptr [rbp + 0x3c8], rax
14010b5df: add       rcx, 8
14010b5e3: mov       qword ptr [rbp + 0x3b8], rcx
14010b5ea: mov       ecx, 2
14010b5ef: movss     xmm8, dword ptr [rip + 0x5c91cac]
14010b5f8: movss     xmm10, dword ptr [rip + 0x5cc96e3]
14010b601: movss     xmm11, dword ptr [rip + 0x5cc96de]
14010b60a: movss     xmm12, dword ptr [rip + 0x5cc1add]
14010b613: xorps     xmm15, xmm15
14010b617: movaps    xmm14, xmmword ptr [rip + 0x5c91c31]
14010b61f: mov       qword ptr [rbp + 0x3c0], r13
14010b626: test      rcx, rcx
14010b629: je        0x14010b650
14010b62b: nop       dword ptr [rax + rax]
14010b630: cmp       rcx, 2
14010b634: je        0x14010b678
14010b636: test      rbx, rbx
14010b639: jne       0x14010b7dc
14010b63f: mov       qword ptr [rbp + 0x3f8], 0
14010b64a: jmp       0x14010b657
14010b64c: nop       dword ptr [rax]
14010b650: mov       qword ptr [rbp + 0x3f8], rbx
14010b657: cmp       qword ptr [rbp + 0x3e8], 1
14010b65f: jne       0x14010b880
14010b665: test      r12, r12
14010b668: mov       rbx, qword ptr [rbp + 0x3f8]
14010b66f: jne       0x14010b838
14010b675: xor       r12d, r12d
14010b678: cmp       rsi, r13
14010b67b: je        0x14010b890
14010b681: mov       eax, 2
14010b686: mov       qword ptr [rbp + 0x3f0], rax
14010b68d: lea       rcx, [rbp + 0x160]
14010b694: mov       rdx, rsi
14010b697: call      0x14590ea90
14010b69c: mov       rax, qword ptr [rbp + 0x160]
14010b6a3: cmp       rax, 2
14010b6a7: jne       0x14010b6c0
14010b6a9: mov       qword ptr [rbp + 0x3f8], rbx
14010b6b0: add       rsi, 0x78
14010b6b4: jmp       0x14010b8a3
14010b6b9: nop       dword ptr [rax]
14010b6c0: mov       rdx, qword ptr [rbp + 0x168]
14010b6c7: mov       rcx, qword ptr [rbp + 0x170]
14010b6ce: mov       r8, qword ptr [rbp + 0x178]
14010b6d5: mov       r12, qword ptr [rbp + 0x180]
14010b6dc: mov       r9, qword ptr [rbp + 0x188]
14010b6e3: nop       word ptr cs:[rax + rax]
14010b6f0: mov       rdi, r9
14010b6f3: cmp       rax, 1
14010b6f7: mov       qword ptr [rbp + 0x3a0], rcx
14010b6fe: mov       qword ptr [rbp + 0x3e8], r8
14010b705: jne       0x14010b730
14010b707: test      rdx, rdx
14010b70a: je        0x14010b770
14010b70c: mov       r15, rcx
14010b70f: movzx     ecx, byte ptr [rbp + 0x407]
14010b716: mov       r8, r15
14010b719: call      0x145912d90
14010b71e: test      rdx, rdx
14010b721: jne       0x14010bdf5
14010b727: xor       edx, edx
14010b729: mov       r8, qword ptr [rbp + 0x3e8]
14010b730: cmp       r8, 1
14010b734: mov       qword ptr [rbp + 0x3f8], rdx
14010b73b: jne       0x14010b780
14010b73d: test      r12, r12
14010b740: je        0x14010b75d
14010b742: movzx     ecx, byte ptr [rbp + 0x407]
14010b749: mov       rdx, r12
14010b74c: mov       r8, rdi
14010b74f: call      0x145912d90
14010b754: test      rdx, rdx
14010b757: jne       0x14010be1e
14010b75d: xor       ebx, ebx
14010b75f: mov       r15, rsi
14010b762: add       rsi, 0x78
14010b766: cmp       rsi, r13
14010b769: jne       0x14010b793
14010b76b: jmp       0x14010b82f
14010b770: xor       edx, edx
14010b772: cmp       r8, 1
14010b776: mov       qword ptr [rbp + 0x3f8], rdx
14010b77d: je        0x14010b73d
14010b77f: nop
14010b780: mov       rbx, r12
14010b783: mov       r15, rsi
14010b786: add       rsi, 0x78
14010b78a: cmp       rsi, r13
14010b78d: je        0x14010b82f
14010b793: lea       rcx, [rbp + 0x160]
14010b79a: mov       rdx, rsi
14010b79d: call      0x14590ea90
14010b7a2: mov       rax, qword ptr [rbp + 0x160]
14010b7a9: mov       rdx, qword ptr [rbp + 0x168]
14010b7b0: mov       rcx, qword ptr [rbp + 0x170]
14010b7b7: mov       r8, qword ptr [rbp + 0x178]
14010b7be: mov       r12, qword ptr [rbp + 0x180]
14010b7c5: mov       r9, qword ptr [rbp + 0x188]
14010b7cc: cmp       rax, 2
14010b7d0: jne       0x14010b6f0
14010b7d6: add       rsi, 0x78
14010b7da: jmp       0x14010b833
14010b7dc: movzx     ecx, byte ptr [rbp + 0x407]
14010b7e3: mov       rdx, rbx
14010b7e6: mov       r8, qword ptr [rbp + 0x3a0]
14010b7ed: call      0x145912d90
14010b7f2: test      rdx, rdx
14010b7f5: je        0x14010b63f
14010b7fb: mov       eax, 0
14010b800: mov       qword ptr [rbp + 0x3f8], rax
14010b807: test      r15, r15
14010b80a: je        0x14010b657
14010b810: mov       rbx, rdx
14010b813: mov       eax, 1
14010b818: mov       qword ptr [rbp + 0x3f0], rax
14010b81f: mov       qword ptr [rbp + 0x3f8], 0
14010b82a: mov       rax, r15
14010b82d: jmp       0x14010b8a5
14010b82f: lea       rsi, [r15 + 0x78]
14010b833: mov       r12, rbx
14010b836: jmp       0x14010b8a3
14010b838: movzx     ecx, byte ptr [rbp + 0x407]
14010b83f: mov       rdx, r12
14010b842: mov       r8, rdi
14010b845: call      0x145912d90
14010b84a: test      rdx, rdx
14010b84d: mov       rax, r15
14010b850: cmove     rax, rdx
14010b854: test      rax, rax
14010b857: je        0x14010b878
14010b859: mov       rbx, rdx
14010b85c: mov       ecx, 1
14010b861: mov       qword ptr [rbp + 0x3e8], rcx
14010b868: xor       r12d, r12d
14010b86b: mov       qword ptr [rbp + 0x3f0], 0
14010b876: jmp       0x14010b8a5
14010b878: xor       r12d, r12d
14010b87b: nop       dword ptr [rax + rax]
14010b880: mov       rbx, qword ptr [rbp + 0x3f8]
14010b887: cmp       rsi, r13
14010b88a: jne       0x14010b681
14010b890: mov       qword ptr [rbp + 0x3f8], rbx
14010b897: mov       eax, 2
14010b89c: mov       qword ptr [rbp + 0x3f0], rax
14010b8a3: xor       eax, eax
14010b8a5: test      rax, rax
14010b8a8: je        0x14010be4a
14010b8ae: movzx     ecx, byte ptr [rbx + 0x71]
14010b8b2: cvtsi2ss  xmm6, ecx
14010b8b6: addss     xmm6, xmm8
14010b8bb: movss     xmm0, dword ptr [rip + 0x5cc941d]
14010b8c3: mulss     xmm6, xmm0
14010b8c7: movzx     ecx, byte ptr [rbx + 0x70]
14010b8cb: cvtsi2ss  xmm7, ecx
14010b8cf: addss     xmm6, xmm10
14010b8d4: addss     xmm7, xmm8
14010b8d9: mulss     xmm7, xmm11
14010b8de: addss     xmm7, xmm10
14010b8e3: movzx     ecx, byte ptr [rax + 0x71]
14010b8e7: cvtsi2ss  xmm13, ecx
14010b8ec: addss     xmm13, xmm8
14010b8f1: mulss     xmm13, xmm0
14010b8f6: addss     xmm13, xmm10
14010b8fb: movzx     eax, byte ptr [rax + 0x70]
14010b8ff: cvtsi2ss  xmm9, eax
14010b904: addss     xmm9, xmm8
14010b909: mulss     xmm9, xmm11
14010b90e: addss     xmm9, xmm10
14010b913: mov       rdx, qword ptr [rbx + 0x20]
14010b917: mov       r8, qword ptr [rbx + 0x28]
14010b91b: mov       rcx, qword ptr [rbp + 0x3b0]
14010b922: call      0x14590fa20
14010b927: addss     xmm6, xmm12
14010b92c: addss     xmm7, xmm12
14010b931: addss     xmm13, xmm12
14010b936: addss     xmm9, xmm12
14010b93b: movaps    xmm0, xmm13
14010b93f: subss     xmm0, xmm6
14010b943: movaps    xmm1, xmm9
14010b947: subss     xmm1, xmm7
14010b94b: movaps    xmm2, xmm0
14010b94e: mulss     xmm2, xmm0
14010b952: movaps    xmm3, xmm1
14010b955: mulss     xmm3, xmm1
14010b959: addss     xmm3, xmm2
14010b95d: sqrtss    xmm3, xmm3
14010b961: movss     xmm2, dword ptr [rip + 0x5c91937]
14010b969: divss     xmm2, xmm3
14010b96d: movd      r8d, xmm2
14010b972: test      r8d, r8d
14010b975: setns     cl
14010b978: mov       edx, r8d
14010b97b: and       edx, 0x7fffffff
14010b981: add       edx, 0xff800000
14010b987: cmp       edx, 0x7f000000
14010b98d: setb      dl
14010b990: and       dl, cl
14010b992: dec       r8d
14010b995: cmp       r8d, 0x7fffff
14010b99c: setb      cl
14010b99f: or        cl, dl
14010b9a1: xorps     xmm4, xmm4
14010b9a4: test      cl, cl
14010b9a6: jne       0x14010b9b0
14010b9a8: xorps     xmm1, xmm1
14010b9ab: jmp       0x14010b9b4
14010b9ad: nop       dword ptr [rax]
14010b9b0: mulss     xmm1, xmm2
14010b9b4: mov       rcx, rdi
14010b9b7: movzx     ebx, byte ptr [rbx + 0x72]
14010b9bb: addss     xmm3, dword ptr [rip + 0x5cc937d]
14010b9c3: maxss     xmm3, xmm4
14010b9c7: addss     xmm6, xmm13
14010b9cc: addss     xmm7, xmm9
14010b9d1: mulss     xmm6, xmm8
14010b9d6: mulss     xmm7, xmm8
14010b9db: addss     xmm6, dword ptr [rip + 0x5cc9361]
14010b9e3: movaps    xmm4, xmm3
14010b9e6: mulss     xmm4, xmm8
14010b9eb: subss     xmm7, xmm4
14010b9ef: mov       word ptr [rbp + 0x2c4], 0
14010b9f8: mov       byte ptr [rbp + 0x2b4], 1
14010b9ff: mov       dword ptr [rbp + 0x1c8], 1
14010ba09: movss     dword ptr [rbp + 0x1cc], xmm6
14010ba11: mov       qword ptr [rbp + 0x1d0], 0
14010ba1c: mov       dword ptr [rbp + 0x1d8], 1
14010ba26: movss     dword ptr [rbp + 0x1dc], xmm7
14010ba2e: movaps    xmm4, xmmword ptr [rip + 0x5cc14fb]
14010ba35: movaps    xmmword ptr [rbp + 0x1e0], xmm4
14010ba3c: mov       dword ptr [rbp + 0x1f0], 1
14010ba46: movss     dword ptr [rbp + 0x1f4], xmm3
14010ba4e: mov       qword ptr [rbp + 0x1c0], 0
14010ba59: movups    xmmword ptr [r14 + 0x10], xmm15
14010ba5e: movups    xmmword ptr [r14], xmm15
14010ba62: mov       word ptr [r14 + 0xe4], 0
14010ba6c: mov       dword ptr [r14 + 0xe0], 0
14010ba77: movups    xmm3, xmmword ptr [rip + 0x5cca37a]
14010ba7e: movups    xmmword ptr [r14 + 0x30], xmm3
14010ba83: movups    xmm3, xmmword ptr [rip + 0x5cca35e]
14010ba8a: movups    xmmword ptr [r14 + 0x20], xmm3
14010ba8f: movups    xmm3, xmmword ptr [rip + 0x5cca382]
14010ba96: movups    xmmword ptr [r14 + 0x50], xmm3
14010ba9b: movups    xmm3, xmmword ptr [rip + 0x5cca366]
14010baa2: movups    xmmword ptr [r14 + 0x40], xmm3
14010baa7: movups    xmm3, xmmword ptr [rip + 0x5cca38a]
14010baae: movups    xmmword ptr [r14 + 0x70], xmm3
14010bab3: movups    xmm3, xmmword ptr [rip + 0x5cca36e]
14010baba: movups    xmmword ptr [r14 + 0x60], xmm3
14010babf: movups    xmmword ptr [rbp + 0x278], xmm14
14010bac7: movups    xmmword ptr [rbp + 0x288], xmm14
14010bacf: mov       word ptr [rbp + 0x2d6], 0
14010bad8: mov       dword ptr [rbp + 0x2d2], 0x100
14010bae2: mov       qword ptr [rbp + 0x2b8], 0
14010baed: mov       dword ptr [rbp + 0x2c0], 0x3f800000
14010baf7: movaps    xmm3, xmmword ptr [rip + 0x5c91772]
14010bafe: movups    xmmword ptr [rbp + 0x298], xmm3
14010bb05: mov       dword ptr [rbp + 0x2a8], 1
14010bb0f: mov       qword ptr [rbp + 0x2ac], 0
14010bb1a: movups    xmm3, xmmword ptr [rip + 0x5cca20f]
14010bb21: movaps    xmmword ptr [rbp + 0x160], xmm3
14010bb28: mov       qword ptr [rbp + 0x170], 0
14010bb33: movups    xmm3, xmmword ptr [rip + 0x5cca20e]
14010bb3a: movups    xmmword ptr [r14 - 0x80], xmm3
14010bb3f: mov       qword ptr [r14 - 0x70], 0
14010bb47: movups    xmm3, xmmword ptr [rip + 0x5cca212]
14010bb4e: movups    xmmword ptr [r14 - 0x68], xmm3
14010bb53: mov       qword ptr [r14 - 0x58], 0
14010bb5b: movups    xmm3, xmmword ptr [rip + 0x5cca216]
14010bb62: movups    xmmword ptr [r14 - 0x50], xmm3
14010bb67: mov       qword ptr [r14 - 0x40], 0
14010bb6f: mov       dword ptr [r14 + 0xce], 0x10000
14010bb7a: mov       word ptr [r14 + 0xd2], 0
14010bb84: mov       word ptr [r14 + 0xd8], 0
14010bb8e: mov       dword ptr [r14 + 0xd4], 0x10000
14010bb99: mov       edi, eax
14010bb9b: jne       0x14010bbb0
14010bb9d: movss     xmm0, dword ptr [rip + 0x5c91b6b]
14010bba5: jmp       0x14010bbbb
14010bba7: nop       word ptr [rax + rax]
14010bbb0: xorps     xmm2, xmmword ptr [rip + 0x5cc14e9]
14010bbb7: mulss     xmm0, xmm2
14010bbbb: mov       qword ptr [rbp + 0x3a8], rcx
14010bbc2: call      0x145bfa123
14010bbc7: movaps    xmm7, xmm0
14010bbca: call      0x145bfa117
14010bbcf: movaps    xmm6, xmm0
14010bbd2: movaps    xmm0, xmm7
14010bbd5: call      0x145bfa11d
14010bbda: movaps    xmm7, xmm0
14010bbdd: xor       r13d, r13d
14010bbe0: cmp       dil, bl
14010bbe3: setb      bl
14010bbe6: jae       0x14010bc10
14010bbe8: movups    xmm0, xmmword ptr [rip + 0x5cc9ea1]
14010bbef: movaps    xmmword ptr [rbp + 0x3d0], xmm0
14010bbf6: mov       dword ptr [rbp + 0x3e0], 0x3f59999a
14010bc00: jmp       0x14010bc28
14010bc02: nop       word ptr cs:[rax + rax]
14010bc10: movups    xmm0, xmmword ptr [rip + 0x5cca681]
14010bc17: movaps    xmmword ptr [rbp + 0x3d0], xmm0
14010bc1e: mov       dword ptr [rbp + 0x3e0], 0x3f19999a
14010bc28: lea       rdi, [rbp + 0x340]
14010bc2f: mov       rcx, rdi
14010bc32: lea       rdx, [rbp + 0x3d0]
14010bc39: call      0x144c7dcf0
14010bc3e: nop
14010bc3f: movaps    xmm0, xmmword ptr [rbp + 0x340]
14010bc46: movups    xmmword ptr [rbp + 0x390], xmm0
14010bc4d: mov       dword ptr [rbp + 0x38c], 1
14010bc57: mov       dword ptr [rsp + 0x48], 0x40c00000
14010bc5f: mov       dword ptr [rsp + 0x40], 1
14010bc67: mov       dword ptr [rsp + 0x38], 0
14010bc6f: mov       dword ptr [rsp + 0x30], 1
14010bc77: mov       dword ptr [rsp + 0x28], 0
14010bc7f: mov       dword ptr [rsp + 0x20], 1
14010bc87: xorps     xmm3, xmm3
14010bc8a: mov       rcx, rdi
14010bc8d: lea       rdx, [rbp + 0x38c]
14010bc94: mov       r8d, 1
14010bc9a: call      0x142649b80
14010bc9f: nop
14010bca0: mov       r13b, bl
14010bca3: movd      xmm0, r13d
14010bca8: pshufd    xmm9, xmm0, 0
14010bcae: pslld     xmm9, 0x1f
14010bcb4: psrad     xmm9, 0x1f
14010bcba: movdqa    xmm0, xmm9
14010bcbf: pandn     xmm0, xmmword ptr [rip + 0x5cc9089]
14010bcc7: pand      xmm9, xmmword ptr [rip + 0x5cc9090]
14010bcd0: por       xmm9, xmm0
14010bcd5: lea       rax, [rip + 0x5cc9094]
14010bcdc: movss     xmm13, dword ptr [rax + r13*4]
14010bce2: mov       r8d, 0x180
14010bce8: lea       r13, [rbp - 0x30]
14010bcec: mov       rcx, r13
14010bcef: lea       rbx, [rbp + 0x160]
14010bcf6: mov       rdx, rbx
14010bcf9: call      0x145bfa0e7
14010bcfe: movups    xmm0, xmmword ptr [rip + 0x5cca5fb]
14010bd05: lea       rax, [rbp + 0x150]
14010bd0c: movups    xmmword ptr [rax], xmm0
14010bd0f: mov       rax, qword ptr [rbp + 0x350]
14010bd16: lea       rcx, [rbp + 0x374]
14010bd1d: mov       qword ptr [rcx + 0x10], rax
14010bd21: movups    xmm0, xmmword ptr [rbp + 0x340]
14010bd28: movups    xmmword ptr [rcx], xmm0
14010bd2b: mov       r8d, 0x190
14010bd31: lea       rcx, [rbp + 0x168]
14010bd38: mov       rdx, r13
14010bd3b: call      0x145bfa0e7
14010bd40: movsd     xmm0, qword ptr [rip + 0x5cc1118]
14010bd48: movsd     qword ptr [rbp + 0x2f8], xmm0
14010bd50: movss     dword ptr [rbp + 0x300], xmm7
14010bd58: movss     dword ptr [rbp + 0x304], xmm6
14010bd60: mov       dword ptr [rbp + 0x308], 0
14010bd6a: movq      qword ptr [rbp + 0x30c], xmm9
14010bd73: movss     dword ptr [rbp + 0x314], xmm13
14010bd7c: mov       dword ptr [rbp + 0x318], 0x3f800000
14010bd86: movups    xmm0, xmmword ptr [rbp + 0x370]
14010bd8d: movups    xmm1, xmmword ptr [rbp + 0x37c]
14010bd94: movups    xmmword ptr [r14 + 0x124], xmm0
14010bd9c: movups    xmmword ptr [r14 + 0x130], xmm1
14010bda4: mov       rax, qword ptr [rbp + 0x3c8]
14010bdab: mov       qword ptr [rbp + 0x160], rax
14010bdb2: mov       rcx, rdi
14010bdb5: mov       rdx, qword ptr [rbp + 0x3b8]
14010bdbc: mov       r8, rbx
14010bdbf: lea       r9, [rip + 0x5cc966a]
14010bdc6: call      0x1401e18e0
14010bdcb: mov       r13, qword ptr [rbp + 0x3c0]
14010bdd2: mov       rdi, qword ptr [rbp + 0x3a8]
14010bdd9: mov       rcx, qword ptr [rbp + 0x3f0]
14010bde0: mov       rbx, qword ptr [rbp + 0x3f8]
14010bde7: test      rcx, rcx
14010bdea: jne       0x14010b630
14010bdf0: jmp       0x14010b650
14010bdf5: mov       rbx, rdx
14010bdf8: mov       rax, rsi
14010bdfb: add       rsi, 0x78
14010bdff: mov       ecx, 1
14010be04: mov       qword ptr [rbp + 0x3f0], rcx
14010be0b: mov       qword ptr [rbp + 0x3f8], 0
14010be16: mov       r15, rax
14010be19: jmp       0x14010b8a5
14010be1e: mov       rbx, rdx
14010be21: mov       rax, rsi
14010be24: add       rsi, 0x78
14010be28: mov       ecx, 1
14010be2d: mov       qword ptr [rbp + 0x3e8], rcx
14010be34: xor       r12d, r12d
14010be37: mov       qword ptr [rbp + 0x3f0], 0
14010be42: mov       r15, rax
14010be45: jmp       0x14010b8a5
14010be4a: movaps    xmm6, xmmword ptr [rbp + 0x410]
14010be51: movaps    xmm7, xmmword ptr [rbp + 0x420]
14010be58: movaps    xmm8, xmmword ptr [rbp + 0x430]
14010be60: movaps    xmm9, xmmword ptr [rbp + 0x440]
14010be68: movaps    xmm10, xmmword ptr [rbp + 0x450]
14010be70: movaps    xmm11, xmmword ptr [rbp + 0x460]
14010be78: movaps    xmm12, xmmword ptr [rbp + 0x470]
14010be80: movaps    xmm13, xmmword ptr [rbp + 0x480]
14010be88: movaps    xmm14, xmmword ptr [rbp + 0x490]
14010be90: movaps    xmm15, xmmword ptr [rbp + 0x4a0]
14010be98: add       rsp, 0x538
14010be9f: pop       rbx
14010bea0: pop       rdi
14010bea1: pop       rsi
14010bea2: pop       r12
14010bea4: pop       r13
14010bea6: pop       r14
14010bea8: pop       r15
14010beaa: pop       rbp
14010beab: ret
