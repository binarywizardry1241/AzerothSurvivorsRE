1445617b0: push      rbp
1445617b1: push      r15
1445617b3: push      r14
1445617b5: push      r13
1445617b7: push      r12
1445617b9: push      rsi
1445617ba: push      rdi
1445617bb: push      rbx
1445617bc: sub       rsp, 0x1c8
1445617c3: lea       rbp, [rsp + 0x80]
1445617cb: mov       qword ptr [rbp + 0x140], 0xfffffffffffffffe
1445617d6: mov       rsi, qword ptr [rcx + 0x18]
1445617da: cmp       qword ptr [rsi + 0x50], 0
1445617df: je        0x144561896
1445617e5: mov       rax, qword ptr [rdx]
1445617e8: mov       r8, qword ptr [rdx + 8]
1445617ec: mov       r11, r8
1445617ef: shr       r11, 0x39
1445617f3: mov       r9, qword ptr [rsi + 0x38]
1445617f7: mov       r10, qword ptr [rsi + 0x40]
1445617fb: movd      xmm0, r11d
144561800: punpcklbw xmm0, xmm0
144561804: pshuflw   xmm0, xmm0, 0
144561809: pshufd    xmm0, xmm0, 0x44
14456180e: xor       r11d, r11d
144561811: pcmpeqd   xmm1, xmm1
144561815: mov       rdi, r8
144561818: and       rdi, r10
14456181b: movdqu    xmm2, xmmword ptr [r9 + rdi]
144561821: movdqa    xmm3, xmm2
144561825: pcmpeqb   xmm3, xmm0
144561829: pmovmskb  ebx, xmm3
14456182d: test      ebx, ebx
14456182f: je        0x144561870
144561831: tzcnt     r14d, ebx
144561836: add       r14, rdi
144561839: and       r14, r10
14456183c: neg       r14
14456183f: lea       r14, [r14 + r14*2]
144561843: mov       r15, qword ptr [r9 + r14*8 - 0x10]
144561848: xor       r15, r8
14456184b: mov       r12, qword ptr [r9 + r14*8 - 0x18]
144561850: xor       r12, rax
144561853: or        r12, r15
144561856: je        0x144561889
144561858: lea       r14d, [rbx - 1]
14456185c: and       r14w, bx
144561860: mov       ebx, r14d
144561863: jne       0x144561831
144561865: nop       word ptr cs:[rax + rax]
144561870: pcmpeqb   xmm2, xmm1
144561874: pmovmskb  ebx, xmm2
144561878: test      ebx, ebx
14456187a: jne       0x14456189d
14456187c: add       rdi, r11
14456187f: add       rdi, 0x10
144561883: add       r11, 0x10
144561887: jmp       0x144561818
144561889: lea       rax, [r9 + r14*8]
14456188d: mov       rdi, qword ptr [rax - 8]
144561891: jmp       0x144561b0c
144561896: mov       rax, qword ptr [rdx]
144561899: mov       r8, qword ptr [rdx + 8]
14456189d: movzx     r9d, byte ptr [rsi + 0x60]
1445618a2: mov       r11, r8
1445618a5: shr       r11, 0x39
1445618a9: mov       r9, qword ptr [rsi + 0xa0]
1445618b0: mov       r10, qword ptr [rsi + 0xa8]
1445618b7: movd      xmm0, r11d
1445618bc: punpcklbw xmm0, xmm0
1445618c0: pshuflw   xmm0, xmm0, 0
1445618c5: pshufd    xmm0, xmm0, 0x44
1445618ca: xor       r11d, r11d
1445618cd: pcmpeqd   xmm1, xmm1
1445618d1: mov       rbx, r8
1445618d4: and       rbx, r10
1445618d7: movdqu    xmm2, xmmword ptr [r9 + rbx]
1445618dd: movdqa    xmm3, xmm2
1445618e1: pcmpeqb   xmm3, xmm0
1445618e5: pmovmskb  r15d, xmm3
1445618ea: test      r15d, r15d
1445618ed: je        0x144561930
1445618ef: tzcnt     r14d, r15d
1445618f4: add       r14, rbx
1445618f7: and       r14, r10
1445618fa: mov       r12, r14
1445618fd: shl       r12, 7
144561901: mov       rdi, r9
144561904: sub       rdi, r12
144561907: mov       r12, qword ptr [rdi - 0x78]
14456190b: xor       r12, r8
14456190e: mov       r13, qword ptr [rdi - 0x80]
144561912: xor       r13, rax
144561915: or        r13, r12
144561918: je        0x14456194d
14456191a: lea       edi, [r15 - 1]
14456191e: and       di, r15w
144561922: mov       r15d, edi
144561925: jne       0x1445618ef
144561927: nop       word ptr [rax + rax]
144561930: pcmpeqb   xmm2, xmm1
144561934: pmovmskb  edi, xmm2
144561938: test      edi, edi
14456193a: jne       0x1445619c5
144561940: add       rbx, r11
144561943: add       rbx, 0x10
144561947: add       r11, 0x10
14456194b: jmp       0x1445618d4
14456194d: lea       rax, [r14 - 0x10]
144561951: and       rax, r10
144561954: movdqu    xmm0, xmmword ptr [r9 + rax]
14456195a: pcmpeqd   xmm1, xmm1
14456195e: pcmpeqb   xmm0, xmm1
144561962: pmovmskb  r8d, xmm0
144561967: movdqu    xmm0, xmmword ptr [r9 + r14]
14456196d: pcmpeqb   xmm0, xmm1
144561971: pmovmskb  r10d, xmm0
144561976: mov       r11w, 0x1f
14456197b: bsr       r11w, r8w
144561980: xor       r11d, 0xf
144561984: or        r10d, 0x10000
14456198b: tzcnt     r10d, r10d
144561990: add       r10d, r11d
144561993: mov       r8b, 0x80
144561996: cmp       r10w, 0xf
14456199b: ja        0x1445619a7
14456199d: inc       qword ptr [rsi + 0xb0]
1445619a4: mov       r8b, 0xff
1445619a7: mov       byte ptr [r9 + r14], r8b
1445619ab: mov       byte ptr [r9 + rax + 0x10], r8b
1445619b0: dec       qword ptr [rsi + 0xb8]
1445619b7: mov       rax, qword ptr [rdi - 0x70]
1445619bb: cmp       rax, 2
1445619bf: jne       0x144561ab6
1445619c5: mov       rbx, rdx
1445619c8: mov       rax, qword ptr [rcx + 0x20]
1445619cc: mov       rdi, qword ptr [rax]
1445619cf: lea       r14, [rdi + 1]
1445619d3: mov       qword ptr [rax], r14
1445619d6: mov       word ptr [rbp + 0x128], 0x100
1445619df: mov       qword ptr [rbp + 0xd8], 1
1445619ea: movdqu    xmm0, xmmword ptr [rip + 0x23cd12e]
1445619f2: movdqu    xmmword ptr [rbp + 0xe0], xmm0
1445619fa: mov       qword ptr [rbp + 0x100], 8
144561a05: mov       qword ptr [rbp + 0x108], 0x80
144561a10: lea       rax, [rip - 0x4508d17]
144561a17: mov       qword ptr [rbp + 0x120], rax
144561a1e: mov       byte ptr [rbp + 0x12a], 1
144561a25: mov       qword ptr [rbp + 0xf0], 0
144561a30: mov       byte ptr [rbp + 0x110], 2
144561a37: lea       rcx, [rbp - 0x58]
144561a3b: lea       r8, [rbp + 0xd8]
144561a42: mov       rdx, rdi
144561a45: call      0x144e444e0
144561a4a: cmp       qword ptr [rsi + 0x10], r14
144561a4e: jae       0x144561a63
144561a50: mov       byte ptr [rbp + 0x13f], 1
144561a57: mov       rcx, rsi
144561a5a: mov       rdx, r14
144561a5d: call      0x140089d90
144561a62: nop
144561a63: mov       rax, qword ptr [rsi + 8]
144561a67: imul      rcx, rdi, 0x130
144561a6e: lea       rdx, [rax + rcx]
144561a72: mov       qword ptr [rbp + 0x130], rdx
144561a79: cmp       dword ptr [rax + rcx], 2
144561a7d: je        0x144561a8c
144561a7f: mov       rcx, qword ptr [rbp + 0x130]
144561a86: call      0x1406e2b60
144561a8b: nop
144561a8c: lea       rdx, [rbp - 0x58]
144561a90: mov       r8d, 0x130
144561a96: mov       rcx, qword ptr [rbp + 0x130]
144561a9d: call      0x145bfa0e7
144561aa2: add       rsi, 0x38
144561aa6: mov       rcx, rsi
144561aa9: mov       rdx, rbx
144561aac: mov       r8, rdi
144561aaf: call      0x14000f180
144561ab4: jmp       0x144561b0c
144561ab6: mov       rdx, qword ptr [rdi - 8]
144561aba: mov       qword ptr [rbp + 0x10], rdx
144561abe: movups    xmm0, xmmword ptr [rdi - 0x18]
144561ac2: movups    xmmword ptr [rbp], xmm0
144561ac6: movups    xmm0, xmmword ptr [rdi - 0x28]
144561aca: movups    xmmword ptr [rbp - 0x10], xmm0
144561ace: movdqu    xmm0, xmmword ptr [rdi - 0x68]
144561ad3: movdqu    xmm1, xmmword ptr [rdi - 0x58]
144561ad8: movdqu    xmm2, xmmword ptr [rdi - 0x48]
144561add: movdqu    xmm3, xmmword ptr [rdi - 0x38]
144561ae2: movdqu    xmmword ptr [rbp - 0x20], xmm3
144561ae7: movdqu    xmmword ptr [rbp - 0x30], xmm2
144561aec: movdqu    xmmword ptr [rbp - 0x40], xmm1
144561af1: movdqu    xmmword ptr [rbp - 0x50], xmm0
144561af6: mov       qword ptr [rbp - 0x58], rax
144561afa: lea       rax, [rbp - 0x58]
144561afe: mov       rdx, rcx
144561b01: mov       rcx, rax
144561b04: call      0x144e08f20
144561b09: mov       rdi, rax
144561b0c: mov       rax, rdi
144561b0f: add       rsp, 0x1c8
144561b16: pop       rbx
144561b17: pop       rdi
144561b18: pop       rsi
144561b19: pop       r12
144561b1b: pop       r13
144561b1d: pop       r14
144561b1f: pop       r15
144561b21: pop       rbp
144561b22: ret
