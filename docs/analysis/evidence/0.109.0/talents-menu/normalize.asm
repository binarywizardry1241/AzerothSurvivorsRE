1459106e0: push      rbp
1459106e1: push      r15
1459106e3: push      r14
1459106e5: push      r13
1459106e7: push      r12
1459106e9: push      rsi
1459106ea: push      rdi
1459106eb: push      rbx
1459106ec: sub       rsp, 0x128
1459106f3: lea       rbp, [rsp + 0x80]
1459106fb: mov       qword ptr [rbp + 0xa0], 0xfffffffffffffffe
145910706: mov       rsi, rcx
145910709: mov       byte ptr [rbp + 0x9e], r8b
145910710: cmp       r8b, 0xb
145910714: ja        0x145910e29
14591071a: movzx     eax, r8b
14591071e: mov       ecx, 0xbbe
145910723: bt        ecx, eax
145910726: jae       0x145910e29
14591072c: mov       r14d, r9d
14591072f: mov       rcx, qword ptr [rdx + 8]
145910733: mov       qword ptr [rbp + 0x28], rdx
145910737: mov       rax, qword ptr [rdx + 0x10]
14591073b: shl       rax, 4
14591073f: add       rax, rcx
145910742: mov       qword ptr [rbp + 0x30], rcx
145910746: mov       qword ptr [rbp - 0x18], rcx
14591074a: mov       qword ptr [rbp - 0x10], rax
14591074e: lea       rax, [rbp + 0x9e]
145910755: mov       qword ptr [rbp - 8], rax
145910759: lea       rcx, [rbp - 0x60]
14591075d: lea       rdx, [rbp - 0x18]
145910761: call      0x1459bfb40
145910766: nop
145910767: mov       rax, qword ptr [rbp - 0x58]
14591076b: mov       qword ptr [rbp + 0x68], rax
14591076f: mov       rbx, qword ptr [rbp - 0x50]
145910773: lea       rax, [rbp + 0x77]
145910777: mov       qword ptr [rbp - 0x18], rax
14591077b: cmp       rbx, 2
14591077f: jae       0x145910e5b
145910785: mov       qword ptr [rbp - 0x20], rsi
145910789: mov       qword ptr [rbp + 0x48], 0
145910791: mov       qword ptr [rbp + 0x50], 8
145910799: mov       qword ptr [rbp + 0x58], 0
1459107a1: mov       rax, qword ptr [rbp - 0x60]
1459107a5: mov       qword ptr [rbp + 0x40], rax
1459107a9: test      rbx, rbx
1459107ac: je        0x145910dc0
1459107b2: lea       rax, [rbx + rbx*2]
1459107b6: mov       rcx, qword ptr [rbp + 0x68]
1459107ba: lea       rax, [rcx + rax*8]
1459107be: mov       qword ptr [rbp - 0x28], rax
1459107c2: mov       r12d, 0x5df
1459107c8: mov       dword ptr [rbp + 0x3c], r14d
1459107cc: jmp       0x1459107e2
1459107ce: nop
1459107d0: mov       rcx, qword ptr [rbp - 0x30]
1459107d4: add       rcx, 0x18
1459107d8: cmp       rcx, qword ptr [rbp - 0x28]
1459107dc: je        0x145910dc0
1459107e2: mov       rax, qword ptr [rcx]
1459107e5: mov       qword ptr [rbp - 0x40], rax
1459107e9: test      rax, rax
1459107ec: je        0x145910dc0
1459107f2: mov       qword ptr [rbp - 0x30], rcx
1459107f6: movzx     eax, byte ptr [rcx + 0x10]
1459107fa: mov       byte ptr [rbp + 0x9c], al
145910800: test      al, al
145910802: je        0x1459107d0
145910804: xor       eax, eax
145910806: jmp       0x14591082d
145910808: mov       rcx, qword ptr [rbp + 0x90]
14591080f: mov       qword ptr [rcx + rbx], rsi
145910813: mov       byte ptr [rcx + rbx + 8], 1
145910818: inc       rax
14591081b: mov       qword ptr [rbp + 0x58], rax
14591081f: nop
145910820: mov       eax, dword ptr [rbp + 0x38]
145910823: inc       al
145910825: cmp       al, byte ptr [rbp + 0x9c]
14591082b: je        0x1459107d0
14591082d: mov       dword ptr [rbp + 0x38], eax
145910830: movzx     eax, byte ptr [rbp + 0x9e]
145910837: mov       qword ptr [rbp + 0x18], rax
14591083b: dec       eax
14591083d: mov       dword ptr [rbp + 0x78], eax
145910840: cmp       al, 0xa
145910842: ja        0x145910820
145910844: movzx     ecx, byte ptr [rbp + 0x78]
145910848: bt        r12d, ecx
14591084c: jae       0x145910820
14591084e: mov       rax, qword ptr [rbp - 0x40]
145910852: mov       rbx, qword ptr [rax + 0x20]
145910856: mov       r13, qword ptr [rax + 0x28]
14591085a: lea       rax, [rip + 0x1918b77]
145910861: mov       qword ptr [rbp + 0x80], rcx
145910868: mov       rsi, qword ptr [rax + rcx*8]
14591086c: mov       rax, qword ptr [rsi + 0x38]
145910870: test      rax, rax
145910873: je        0x1459108b1
145910875: mov       r15, qword ptr [rsi + 0x30]
145910879: imul      rdi, rax, 0x78
14591087d: jmp       0x14591088a
14591087f: nop
145910880: add       r15, 0x78
145910884: add       rdi, -0x78
145910888: je        0x1459108b1
14591088a: cmp       qword ptr [r15 + 0x28], r13
14591088e: jne       0x145910880
145910890: mov       rcx, qword ptr [r15 + 0x20]
145910894: mov       rdx, rbx
145910897: mov       r8, r13
14591089a: call      0x145bfa0e1
14591089f: test      eax, eax
1459108a1: jne       0x145910880
1459108a3: xor       esi, esi
1459108a5: mov       rdi, qword ptr [rbp + 0x80]
1459108ac: jmp       0x14591095c
1459108b1: mov       rax, qword ptr [rsi + 0x78]
1459108b5: test      rax, rax
1459108b8: je        0x145910901
1459108ba: mov       r15, qword ptr [rsi + 0x70]
1459108be: imul      rdi, rax, 0x78
1459108c2: jmp       0x1459108da
1459108c4: nop       word ptr cs:[rax + rax]
1459108d0: add       r15, 0x78
1459108d4: add       rdi, -0x78
1459108d8: je        0x145910901
1459108da: cmp       qword ptr [r15 + 0x28], r13
1459108de: jne       0x1459108d0
1459108e0: mov       rcx, qword ptr [r15 + 0x20]
1459108e4: mov       rdx, rbx
1459108e7: mov       r8, r13
1459108ea: call      0x145bfa0e1
1459108ef: test      eax, eax
1459108f1: jne       0x1459108d0
1459108f3: mov       esi, 1
1459108f8: mov       rdi, qword ptr [rbp + 0x80]
1459108ff: jmp       0x14591095c
145910901: mov       rax, qword ptr [rsi + 0xb8]
145910908: test      rax, rax
14591090b: mov       rdi, qword ptr [rbp + 0x80]
145910912: je        0x145910820
145910918: mov       r15, qword ptr [rsi + 0xb0]
14591091f: imul      rsi, rax, 0x78
145910923: jmp       0x14591093e
145910925: nop       word ptr cs:[rax + rax]
145910930: add       r15, 0x78
145910934: add       rsi, -0x78
145910938: je        0x145910820
14591093e: cmp       qword ptr [r15 + 0x28], r13
145910942: jne       0x145910930
145910944: mov       rcx, qword ptr [r15 + 0x20]
145910948: mov       rdx, rbx
14591094b: mov       r8, r13
14591094e: call      0x145bfa0e1
145910953: test      eax, eax
145910955: jne       0x145910930
145910957: mov       esi, 2
14591095c: mov       qword ptr [rbp + 0x60], rbx
145910960: mov       rax, qword ptr [rbp + 0x50]
145910964: mov       qword ptr [rbp + 0x90], rax
14591096b: mov       r8, qword ptr [rbp + 0x58]
14591096f: test      r8, r8
145910972: mov       qword ptr [rbp + 0x88], r8
145910979: je        0x14591098d
14591097b: mov       eax, r8d
14591097e: and       eax, 3
145910981: cmp       r8, 4
145910985: jae       0x1459109a7
145910987: xor       edx, edx
145910989: xor       ecx, ecx
14591098b: jmp       0x1459109f1
14591098d: test      r14d, r14d
145910990: je        0x145910820
145910996: xor       eax, eax
145910998: cmp       al, byte ptr [r15 + 0x72]
14591099c: jae       0x145910820
1459109a2: jmp       0x145910aaa
1459109a7: and       r8, 0xfffffffffffffffc
1459109ab: mov       rcx, qword ptr [rbp + 0x90]
1459109b2: lea       r9, [rcx + 0x38]
1459109b6: xor       edx, edx
1459109b8: xor       ecx, ecx
1459109ba: nop       word ptr [rax + rax]
1459109c0: movzx     r10d, byte ptr [r9 - 0x30]
1459109c5: add       r10d, ecx
1459109c8: movzx     ecx, byte ptr [r9 - 0x20]
1459109cd: movzx     r11d, byte ptr [r9 - 0x10]
1459109d2: add       r11d, ecx
1459109d5: add       r11d, r10d
1459109d8: movzx     ecx, byte ptr [r9]
1459109dc: add       ecx, r11d
1459109df: add       rdx, 4
1459109e3: add       r9, 0x40
1459109e7: cmp       r8, rdx
1459109ea: jne       0x1459109c0
1459109ec: test      rax, rax
1459109ef: je        0x145910a21
1459109f1: shl       rdx, 4
1459109f5: mov       r8, qword ptr [rbp + 0x90]
1459109fc: add       rdx, r8
1459109ff: add       rdx, 8
145910a03: shl       eax, 4
145910a06: xor       r8d, r8d
145910a09: nop       dword ptr [rax]
145910a10: movzx     r9d, byte ptr [rdx + r8]
145910a15: add       ecx, r9d
145910a18: add       r8, 0x10
145910a1c: cmp       rax, r8
145910a1f: jne       0x145910a10
145910a21: cmp       ecx, r14d
145910a24: jae       0x145910820
145910a2a: mov       r12d, r14d
145910a2d: mov       r14, rsi
145910a30: mov       rsi, qword ptr [rbp + 0x88]
145910a37: shl       rsi, 4
145910a3b: xor       edi, edi
145910a3d: mov       rbx, qword ptr [rbp + 0x60]
145910a41: jmp       0x145910a59
145910a43: nop       word ptr cs:[rax + rax]
145910a50: add       rdi, 0x10
145910a54: cmp       rsi, rdi
145910a57: je        0x145910a8b
145910a59: mov       rax, qword ptr [rbp + 0x90]
145910a60: mov       rax, qword ptr [rax + rdi]
145910a64: cmp       qword ptr [rax + 0x28], r13
145910a68: jne       0x145910a50
145910a6a: mov       rcx, qword ptr [rax + 0x20]
145910a6e: mov       rdx, rbx
145910a71: mov       r8, r13
145910a74: call      0x145bfa0e1
145910a79: test      eax, eax
145910a7b: jne       0x145910a50
145910a7d: mov       rax, qword ptr [rbp + 0x90]
145910a84: movzx     eax, byte ptr [rax + rdi + 8]
145910a89: jmp       0x145910a8d
145910a8b: xor       eax, eax
145910a8d: mov       rdi, qword ptr [rbp + 0x80]
145910a94: mov       rsi, r14
145910a97: mov       r14d, r12d
145910a9a: mov       r12d, 0x5df
145910aa0: cmp       al, byte ptr [r15 + 0x72]
145910aa4: jae       0x145910820
145910aaa: movzx     r9d, byte ptr [r15 + 0x70]
145910aaf: mov       dword ptr [rbp + 0x7c], 0
145910ab6: mov       ecx, dword ptr [rbp + 0x78]
145910ab9: cmp       cl, 0xa
145910abc: ja        0x145910adf
145910abe: mov       r8, qword ptr [rbp + 0x88]
145910ac5: test      r8, r8
145910ac8: sete      al
145910acb: mov       edx, 0x5df
145910ad0: shr       edx, cl
145910ad2: not       dl
145910ad4: or        dl, al
145910ad6: test      dl, 1
145910ad9: je        0x145910bcd
145910adf: movzx     eax, r9b
145910ae3: lea       eax, [rax + rax*4]
145910ae6: cmp       dword ptr [rbp + 0x7c], eax
145910ae9: mov       r14d, dword ptr [rbp + 0x3c]
145910aed: jb        0x145910820
145910af3: lea       rcx, [rbp + 0x48]
145910af7: mov       rdx, qword ptr [rbp + 0x18]
145910afb: mov       r8, qword ptr [rbp + 0x60]
145910aff: mov       r9, r13
145910b02: call      0x14590fb00
145910b07: test      rax, rax
145910b0a: jne       0x145910820
145910b10: mov       rax, qword ptr [rbp + 0x18]
145910b14: mov       byte ptr [rbp + 0x9b], al
145910b1a: mov       rax, qword ptr [r15]
145910b1d: test      rax, rax
145910b20: je        0x145910b64
145910b22: mov       rcx, qword ptr [r15 + 8]
145910b26: movups    xmm0, xmmword ptr [r15 + 0x10]
145910b2b: mov       qword ptr [rbp - 0x18], 1
145910b33: mov       qword ptr [rbp - 0x10], rax
145910b37: mov       qword ptr [rbp - 8], rcx
145910b3b: mov       qword ptr [rbp], 1
145910b43: movups    xmmword ptr [rbp + 8], xmm0
145910b47: lea       rcx, [rbp - 0x18]
145910b4b: lea       rdx, [rbp + 0x9b]
145910b52: lea       r8, [rbp + 0x48]
145910b56: call      0x1459a00c0
145910b5b: nop
145910b5c: test      al, al
145910b5e: je        0x145910820
145910b64: cmp       byte ptr [rbp + 0x78], 0xa
145910b68: ja        0x145910820
145910b6e: bt        r12d, edi
145910b72: jae       0x145910820
145910b78: lea       rax, [rip + 0x1918859]
145910b7f: mov       rbx, qword ptr [rax + rdi*8]
145910b83: mov       rax, qword ptr [rbx + 0x38]
145910b87: test      rax, rax
145910b8a: je        0x145910ca5
145910b90: mov       rsi, qword ptr [rbx + 0x30]
145910b94: imul      rdi, rax, 0x78
145910b98: jmp       0x145910bae
145910b9a: nop       word ptr [rax + rax]
145910ba0: add       rsi, 0x78
145910ba4: add       rdi, -0x78
145910ba8: je        0x145910ca5
145910bae: cmp       qword ptr [rsi + 0x28], r13
145910bb2: jne       0x145910ba0
145910bb4: mov       rcx, qword ptr [rsi + 0x20]
145910bb8: mov       rdx, qword ptr [rbp + 0x60]
145910bbc: mov       r8, r13
145910bbf: call      0x145bfa0e1
145910bc4: test      eax, eax
145910bc6: jne       0x145910ba0
145910bc8: jmp       0x145910d38
145910bcd: shl       esi, 6
145910bd0: lea       rax, [rip + 0x1918801]
145910bd7: add       rsi, qword ptr [rax + rdi*8]
145910bdb: xor       r14d, r14d
145910bde: mov       dword ptr [rbp + 0x7c], 0
145910be5: mov       qword ptr [rbp + 0x20], rsi
145910be9: mov       byte ptr [rbp + 0x9f], r9b
145910bf0: jmp       0x145910c2c
145910bf2: nop       word ptr cs:[rax + rax]
145910c00: mov       r12d, 0x5df
145910c06: mov       r8, qword ptr [rbp + 0x88]
145910c0d: mov       rdi, qword ptr [rbp + 0x80]
145910c14: mov       rsi, qword ptr [rbp + 0x20]
145910c18: movzx     r9d, byte ptr [rbp + 0x9f]
145910c20: inc       r14
145910c23: cmp       r14, r8
145910c26: je        0x145910adf
145910c2c: mov       rdx, r14
145910c2f: shl       rdx, 4
145910c33: mov       rax, qword ptr [rbp + 0x90]
145910c3a: mov       rax, qword ptr [rax + rdx]
145910c3e: cmp       byte ptr [rax + 0x70], r9b
145910c42: jae       0x145910c20
145910c44: mov       rcx, qword ptr [rsi + 0x38]
145910c48: test      rcx, rcx
145910c4b: je        0x145910c20
145910c4d: add       rdx, qword ptr [rbp + 0x90]
145910c54: mov       qword ptr [rbp - 0x38], rdx
145910c58: mov       rdi, qword ptr [rsi + 0x30]
145910c5c: imul      r12, rcx, 0x78
145910c60: mov       rcx, qword ptr [rax + 0x20]
145910c64: mov       qword ptr [rbp - 0x48], rcx
145910c68: mov       rsi, qword ptr [rax + 0x28]
145910c6c: xor       ebx, ebx
145910c6e: jmp       0x145910c79
145910c70: add       rbx, 0x78
145910c74: cmp       r12, rbx
145910c77: je        0x145910c00
145910c79: cmp       qword ptr [rdi + rbx + 0x28], rsi
145910c7e: jne       0x145910c70
145910c80: mov       rcx, qword ptr [rdi + rbx + 0x20]
145910c85: mov       rdx, qword ptr [rbp - 0x48]
145910c89: mov       r8, rsi
145910c8c: call      0x145bfa0e1
145910c91: test      eax, eax
145910c93: jne       0x145910c70
145910c95: mov       rax, qword ptr [rbp - 0x38]
145910c99: movzx     eax, byte ptr [rax + 8]
145910c9d: add       dword ptr [rbp + 0x7c], eax
145910ca0: jmp       0x145910c00
145910ca5: mov       rax, qword ptr [rbx + 0x78]
145910ca9: test      rax, rax
145910cac: je        0x145910ce6
145910cae: mov       rsi, qword ptr [rbx + 0x70]
145910cb2: imul      rdi, rax, 0x78
145910cb6: jmp       0x145910cca
145910cb8: nop       dword ptr [rax + rax]
145910cc0: add       rsi, 0x78
145910cc4: add       rdi, -0x78
145910cc8: je        0x145910ce6
145910cca: cmp       qword ptr [rsi + 0x28], r13
145910cce: jne       0x145910cc0
145910cd0: mov       rcx, qword ptr [rsi + 0x20]
145910cd4: mov       rdx, qword ptr [rbp + 0x60]
145910cd8: mov       r8, r13
145910cdb: call      0x145bfa0e1
145910ce0: test      eax, eax
145910ce2: jne       0x145910cc0
145910ce4: jmp       0x145910d38
145910ce6: mov       rax, qword ptr [rbx + 0xb8]
145910ced: test      rax, rax
145910cf0: je        0x145910820
145910cf6: mov       rsi, qword ptr [rbx + 0xb0]
145910cfd: imul      rdi, rax, 0x78
145910d01: jmp       0x145910d1e
145910d03: nop       word ptr cs:[rax + rax]
145910d10: add       rsi, 0x78
145910d14: add       rdi, -0x78
145910d18: je        0x145910820
145910d1e: cmp       qword ptr [rsi + 0x28], r13
145910d22: jne       0x145910d10
145910d24: mov       rcx, qword ptr [rsi + 0x20]
145910d28: mov       rdx, qword ptr [rbp + 0x60]
145910d2c: mov       r8, r13
145910d2f: call      0x145bfa0e1
145910d34: test      eax, eax
145910d36: jne       0x145910d10
145910d38: mov       rax, qword ptr [rbp + 0x88]
145910d3f: mov       rbx, rax
145910d42: shl       rbx, 4
145910d46: test      rax, rax
145910d49: je        0x145910d8e
145910d4b: xor       edi, edi
145910d4d: jmp       0x145910d59
145910d4f: nop
145910d50: add       rdi, 0x10
145910d54: cmp       rbx, rdi
145910d57: je        0x145910d8e
145910d59: mov       rax, qword ptr [rbp + 0x90]
145910d60: mov       rax, qword ptr [rax + rdi]
145910d64: cmp       qword ptr [rax + 0x28], r13
145910d68: jne       0x145910d50
145910d6a: mov       rcx, qword ptr [rax + 0x20]
145910d6e: mov       rdx, qword ptr [rbp + 0x60]
145910d72: mov       r8, r13
145910d75: call      0x145bfa0e1
145910d7a: test      eax, eax
145910d7c: jne       0x145910d50
145910d7e: mov       rax, qword ptr [rbp + 0x90]
145910d85: inc       byte ptr [rax + rdi + 8]
145910d89: jmp       0x145910820
145910d8e: mov       rax, qword ptr [rbp + 0x88]
145910d95: cmp       rax, qword ptr [rbp + 0x48]
145910d99: jne       0x145910808
145910d9f: lea       rcx, [rbp + 0x48]
145910da3: call      0x145bfaef0
145910da8: nop
145910da9: mov       rax, qword ptr [rbp + 0x50]
145910dad: mov       qword ptr [rbp + 0x90], rax
145910db4: mov       rax, qword ptr [rbp + 0x88]
145910dbb: jmp       0x145910808
145910dc0: mov       rax, qword ptr [rbp + 0x40]
145910dc4: test      rax, rax
145910dc7: je        0x145910de0
145910dc9: shl       rax, 3
145910dcd: lea       rdx, [rax + rax*2]
145910dd1: mov       r8d, 8
145910dd7: mov       rcx, qword ptr [rbp + 0x68]
145910ddb: call      0x1400021d0
145910de0: mov       rax, qword ptr [rbp + 0x58]
145910de4: mov       rsi, qword ptr [rbp - 0x20]
145910de8: mov       qword ptr [rsi + 0x10], rax
145910dec: movups    xmm0, xmmword ptr [rbp + 0x48]
145910df0: movups    xmmword ptr [rsi], xmm0
145910df3: mov       rax, qword ptr [rbp + 0x28]
145910df7: mov       rdx, qword ptr [rax]
145910dfa: test      rdx, rdx
145910dfd: je        0x145910e12
145910dff: shl       rdx, 4
145910e03: mov       r8d, 8
145910e09: mov       rcx, qword ptr [rbp + 0x30]
145910e0d: call      0x1400021d0
145910e12: mov       rax, rsi
145910e15: add       rsp, 0x128
145910e1c: pop       rbx
145910e1d: pop       rdi
145910e1e: pop       rsi
145910e1f: pop       r12
145910e21: pop       r13
145910e23: pop       r14
145910e25: pop       r15
145910e27: pop       rbp
145910e28: ret
145910e29: mov       qword ptr [rsi], 0
145910e30: mov       qword ptr [rsi + 8], 8
145910e38: mov       qword ptr [rsi + 0x10], 0
145910e40: mov       rax, rdx
145910e43: mov       rdx, qword ptr [rdx]
145910e46: test      rdx, rdx
145910e49: je        0x145910e12
145910e4b: mov       rcx, qword ptr [rax + 8]
145910e4f: shl       rdx, 4
145910e53: mov       r8d, 8
145910e59: jmp       0x145910e0d
145910e5b: cmp       rbx, 0x15
145910e5f: jae       0x145910e7c
145910e61: lea       r9, [rbp - 0x18]
145910e65: mov       r8d, 1
145910e6b: mov       rcx, qword ptr [rbp + 0x68]
145910e6f: mov       rdx, rbx
145910e72: call      0x1459af300
145910e77: jmp       0x145910785
145910e7c: mov       byte ptr [rbp + 0x9d], 1
145910e83: lea       r8, [rbp - 0x18]
145910e87: mov       rcx, qword ptr [rbp + 0x68]
145910e8b: mov       rdx, rbx
145910e8e: call      0x1459ded30
145910e93: nop
145910e94: jmp       0x145910785
