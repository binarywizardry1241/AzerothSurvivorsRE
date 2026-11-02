1400321f0: push      rbp
1400321f1: push      r14
1400321f3: push      rsi
1400321f4: push      rdi
1400321f5: push      rbx
1400321f6: sub       rsp, 0xc0
1400321fd: lea       rbp, [rsp + 0x80]
140032205: mov       qword ptr [rbp + 0x38], 0xfffffffffffffffe
14003220d: mov       rax, rcx
140032210: add       rcx, 0x40
140032214: lea       rdx, [rax + 0x5a8]
14003221b: mov       qword ptr [rbp + 0x28], rcx
14003221f: mov       qword ptr [rbp + 0x30], rdx
140032223: mov       qword ptr [rbp + 0x10], 0
14003222b: mov       qword ptr [rbp + 0x18], 8
140032233: mov       qword ptr [rbp + 0x20], 0
14003223b: cmp       qword ptr [rax + 0x90], 0
140032243: je        0x1400322e9
140032249: movabs    r9, 0xae0f80401a89979d
140032253: mov       r8, qword ptr [rax + 0x78]
140032257: mov       r10, qword ptr [rax + 0x80]
14003225e: xor       r11d, r11d
140032261: movdqa    xmm0, xmmword ptr [rip + 0x5d6b567]
140032269: pcmpeqd   xmm1, xmm1
14003226d: movdqa    xmm2, xmmword ptr [rip + 0x5d6b60b]
140032275: and       r9, r10
140032278: movdqu    xmm3, xmmword ptr [r8 + r9]
14003227e: movdqa    xmm4, xmm3
140032282: pcmpeqb   xmm4, xmm0
140032286: pmovmskb  esi, xmm4
14003228a: test      esi, esi
14003228c: je        0x1400322d0
14003228e: tzcnt     edi, esi
140032292: add       rdi, r9
140032295: and       rdi, r10
140032298: neg       rdi
14003229b: lea       rdi, [rdi + rdi*2]
14003229f: movdqu    xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
1400322a6: pcmpeqb   xmm4, xmm2
1400322aa: pmovmskb  ebx, xmm4
1400322ae: cmp       ebx, 0xffff
1400322b4: je        0x14003239d
1400322ba: lea       edi, [rsi - 1]
1400322bd: and       di, si
1400322c0: mov       esi, edi
1400322c2: jne       0x14003228e
1400322c4: nop       word ptr cs:[rax + rax]
1400322d0: pcmpeqb   xmm3, xmm1
1400322d4: pmovmskb  esi, xmm3
1400322d8: test      esi, esi
1400322da: jne       0x1400322e9
1400322dc: add       r9, r11
1400322df: add       r9, 0x10
1400322e3: add       r11, 0x10
1400322e7: jmp       0x140032275
1400322e9: movzx     r8d, byte ptr [rax + 0xa0]
1400322f1: mov       r8, qword ptr [rax + 0xe0]
1400322f8: mov       r9, qword ptr [rax + 0xe8]
1400322ff: movabs    r10, 0xae0f80401a89979d
140032309: xor       r11d, r11d
14003230c: movdqa    xmm0, xmmword ptr [rip + 0x5d6b4bc]
140032314: pcmpeqd   xmm1, xmm1
140032318: movdqa    xmm2, xmmword ptr [rip + 0x5d6b560]
140032320: and       r10, r9
140032323: movdqu    xmm3, xmmword ptr [r8 + r10]
140032329: movdqa    xmm4, xmm3
14003232d: pcmpeqb   xmm4, xmm0
140032331: pmovmskb  ebx, xmm4
140032335: test      ebx, ebx
140032337: je        0x140032380
140032339: tzcnt     edi, ebx
14003233d: add       rdi, r10
140032340: and       rdi, r9
140032343: mov       r14, rdi
140032346: shl       r14, 7
14003234a: mov       rsi, r8
14003234d: sub       rsi, r14
140032350: movdqu    xmm4, xmmword ptr [rsi - 0x80]
140032355: pcmpeqb   xmm4, xmm2
140032359: pmovmskb  r14d, xmm4
14003235e: cmp       r14d, 0xffff
140032365: je        0x1400323aa
140032367: lea       esi, [rbx - 1]
14003236a: and       si, bx
14003236d: mov       ebx, esi
14003236f: jne       0x140032339
140032371: nop       word ptr cs:[rax + rax]
140032380: pcmpeqb   xmm3, xmm1
140032384: pmovmskb  esi, xmm3
140032388: test      esi, esi
14003238a: jne       0x14003241c
140032390: add       r10, r11
140032393: add       r10, 0x10
140032397: add       r11, 0x10
14003239b: jmp       0x140032320
14003239d: lea       rax, [r8 + rdi*8]
1400323a1: mov       rsi, qword ptr [rax - 8]
1400323a5: jmp       0x140032506
1400323aa: lea       r10, [rdi - 0x10]
1400323ae: and       r10, r9
1400323b1: movdqu    xmm0, xmmword ptr [r8 + r10]
1400323b7: pcmpeqd   xmm1, xmm1
1400323bb: pcmpeqb   xmm0, xmm1
1400323bf: pmovmskb  r9d, xmm0
1400323c4: movdqu    xmm0, xmmword ptr [r8 + rdi]
1400323ca: pcmpeqb   xmm0, xmm1
1400323ce: pmovmskb  r11d, xmm0
1400323d3: mov       bx, 0x1f
1400323d7: bsr       bx, r9w
1400323dc: xor       ebx, 0xf
1400323df: or        r11d, 0x10000
1400323e6: tzcnt     r11d, r11d
1400323eb: add       r11d, ebx
1400323ee: mov       r9b, 0x80
1400323f1: cmp       r11w, 0xf
1400323f6: ja        0x140032402
1400323f8: inc       qword ptr [rax + 0xf0]
1400323ff: mov       r9b, 0xff
140032402: mov       byte ptr [r8 + rdi], r9b
140032406: mov       byte ptr [r8 + r10 + 0x10], r9b
14003240b: dec       qword ptr [rax + 0xf8]
140032412: mov       r8, qword ptr [rsi - 0x70]
140032416: cmp       r8, 2
14003241a: jne       0x140032495
14003241c: mov       rdi, rax
14003241f: mov       rsi, qword ptr [rdx]
140032422: lea       rax, [rsi + 1]
140032426: mov       qword ptr [rdx], rax
140032429: mov       word ptr [rbp - 0x10], 0x100
14003242f: mov       qword ptr [rbp - 0x60], 1
140032437: movdqu    xmm0, xmmword ptr [rip + 0x5d6bfc1]
14003243f: movdqu    xmmword ptr [rbp - 0x58], xmm0
140032444: mov       qword ptr [rbp - 0x38], 8
14003244c: mov       qword ptr [rbp - 0x30], 0x80
140032454: lea       rax, [rip + 0x268a5]
14003245b: mov       qword ptr [rbp - 0x18], rax
14003245f: mov       byte ptr [rbp - 0xe], 1
140032463: mov       qword ptr [rbp - 0x48], 0
14003246b: mov       byte ptr [rbp - 0x28], 2
14003246f: lea       r8, [rbp - 0x60]
140032473: mov       rdx, rsi
140032476: call      0x14000f330
14003247b: nop
14003247c: mov       rcx, rdi
14003247f: add       rcx, 0x78
140032483: lea       rdx, [rip + 0x5d6bf76]
14003248a: mov       r8, rsi
14003248d: call      0x14000f180
140032492: nop
140032493: jmp       0x140032506
140032495: mov       rax, qword ptr [rsi - 8]
140032499: mov       qword ptr [rbp + 8], rax
14003249d: movups    xmm0, xmmword ptr [rsi - 0x18]
1400324a1: movups    xmmword ptr [rbp - 8], xmm0
1400324a5: movups    xmm0, xmmword ptr [rsi - 0x28]
1400324a9: movups    xmmword ptr [rbp - 0x18], xmm0
1400324ad: movdqu    xmm0, xmmword ptr [rsi - 0x68]
1400324b2: movdqu    xmm1, xmmword ptr [rsi - 0x58]
1400324b7: movdqu    xmm2, xmmword ptr [rsi - 0x48]
1400324bc: movdqu    xmm3, xmmword ptr [rsi - 0x38]
1400324c1: movdqu    xmmword ptr [rbp - 0x28], xmm3
1400324c6: movdqu    xmmword ptr [rbp - 0x38], xmm2
1400324cb: movdqu    xmmword ptr [rbp - 0x48], xmm1
1400324d0: movdqu    xmmword ptr [rbp - 0x58], xmm0
1400324d5: mov       qword ptr [rbp - 0x60], r8
1400324d9: lea       rcx, [rbp - 0x60]
1400324dd: lea       rdx, [rbp + 0x10]
1400324e1: call      0x144e08f20
1400324e6: nop
1400324e7: mov       rsi, rax
1400324ea: mov       rdx, qword ptr [rbp + 0x10]
1400324ee: test      rdx, rdx
1400324f1: je        0x140032506
1400324f3: mov       rcx, qword ptr [rbp + 0x18]
1400324f7: shl       rdx, 3
1400324fb: mov       r8d, 8
140032501: call      0x1400021d0
140032506: mov       rax, rsi
140032509: add       rsp, 0xc0
140032510: pop       rbx
140032511: pop       rdi
140032512: pop       rsi
140032513: pop       r14
140032515: pop       rbp
140032516: ret
