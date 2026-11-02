140bfa200: push      rbp
140bfa201: push      r15
140bfa203: push      r14
140bfa205: push      rsi
140bfa206: push      rdi
140bfa207: push      rbx
140bfa208: sub       rsp, 0x4c8
140bfa20f: lea       rbp, [rsp + 0x80]
140bfa217: mov       qword ptr [rbp + 0x440], 0xfffffffffffffffe
140bfa222: mov       rsi, rdx
140bfa225: call      0x140002200
140bfa22a: mov       ecx, 0x20
140bfa22f: mov       edx, 8
140bfa234: call      0x1400021c0
140bfa239: test      rax, rax
140bfa23c: je        0x140bfa9c2
140bfa242: mov       qword ptr [rax], 0
140bfa249: mov       dword ptr [rax + 0x18], 0
140bfa250: mov       byte ptr [rax + 0x1c], 0
140bfa254: lea       rcx, [rip + 0x3ae3b5]
140bfa25b: mov       qword ptr [rbp - 0x10], rcx
140bfa25f: pxor      xmm0, xmm0
140bfa263: movdqu    xmmword ptr [rbp + 0x10], xmm0
140bfa268: mov       qword ptr [rbp - 8], rax
140bfa26c: lea       rax, [rip + 0x53db15d]
140bfa273: mov       qword ptr [rbp], rax
140bfa277: mov       qword ptr [rbp - 0x58], 0
140bfa27f: mov       qword ptr [rbp - 0x50], 8
140bfa287: movdqu    xmmword ptr [rbp - 0x48], xmm0
140bfa28c: mov       qword ptr [rbp - 0x38], 8
140bfa294: movdqu    xmmword ptr [rbp - 0x30], xmm0
140bfa299: mov       qword ptr [rbp - 0x20], 8
140bfa2a1: mov       qword ptr [rbp - 0x18], 0
140bfa2a9: lea       rax, [rip + 0x3afc50]
140bfa2b0: mov       qword ptr [rbp + 8], rax
140bfa2b4: lea       rcx, [rbp + 0x3c0]
140bfa2bb: lea       r8, [rbp - 0x58]
140bfa2bf: mov       rdx, rsi
140bfa2c2: call      0x140ec1a50
140bfa2c7: lea       rdi, [rsi + 0x40]
140bfa2cb: lea       rax, [rsi + 0x5a8]
140bfa2d2: mov       qword ptr [rbp + 0x3d8], rdi
140bfa2d9: mov       qword ptr [rbp + 0x3e0], rax
140bfa2e0: mov       qword ptr [rbp + 0x3c0], 0
140bfa2eb: mov       qword ptr [rbp + 0x3c8], 8
140bfa2f6: mov       qword ptr [rbp + 0x3d0], 0
140bfa301: cmp       qword ptr [rsi + 0x90], 0
140bfa309: je        0x140bfa3ab
140bfa30f: movabs    rdx, 0x46a681bcb906b635
140bfa319: mov       rcx, qword ptr [rsi + 0x78]
140bfa31d: mov       r8, qword ptr [rsi + 0x80]
140bfa324: xor       r9d, r9d
140bfa327: movdqa    xmm0, xmmword ptr [rip + 0x51d2bb1]
140bfa32f: pcmpeqd   xmm1, xmm1
140bfa333: movdqa    xmm2, xmmword ptr [rip + 0x5343af5]
140bfa33b: and       rdx, r8
140bfa33e: movdqu    xmm3, xmmword ptr [rcx + rdx]
140bfa343: movdqa    xmm4, xmm3
140bfa347: pcmpeqb   xmm4, xmm0
140bfa34b: pmovmskb  r10d, xmm4
140bfa350: test      r10d, r10d
140bfa353: je        0x140bfa390
140bfa355: tzcnt     r11d, r10d
140bfa35a: add       r11, rdx
140bfa35d: and       r11, r8
140bfa360: neg       r11
140bfa363: lea       r11, [r11 + r11*2]
140bfa367: movdqu    xmm4, xmmword ptr [rcx + r11*8 - 0x18]
140bfa36e: pcmpeqb   xmm4, xmm2
140bfa372: pmovmskb  ebx, xmm4
140bfa376: cmp       ebx, 0xffff
140bfa37c: je        0x140bfa45f
140bfa382: lea       r11d, [r10 - 1]
140bfa386: and       r11w, r10w
140bfa38a: mov       r10d, r11d
140bfa38d: jne       0x140bfa355
140bfa38f: nop
140bfa390: pcmpeqb   xmm3, xmm1
140bfa394: pmovmskb  r10d, xmm3
140bfa399: test      r10d, r10d
140bfa39c: jne       0x140bfa3ab
140bfa39e: add       rdx, r9
140bfa3a1: add       rdx, 0x10
140bfa3a5: add       r9, 0x10
140bfa3a9: jmp       0x140bfa33b
140bfa3ab: movzx     ecx, byte ptr [rsi + 0xa0]
140bfa3b2: mov       rcx, qword ptr [rsi + 0xe0]
140bfa3b9: mov       rdx, qword ptr [rsi + 0xe8]
140bfa3c0: movabs    r8, 0x46a681bcb906b635
140bfa3ca: xor       r9d, r9d
140bfa3cd: movdqa    xmm0, xmmword ptr [rip + 0x51d2b0b]
140bfa3d5: pcmpeqd   xmm1, xmm1
140bfa3d9: movdqa    xmm2, xmmword ptr [rip + 0x5343a4f]
140bfa3e1: and       r8, rdx
140bfa3e4: movdqu    xmm3, xmmword ptr [rcx + r8]
140bfa3ea: movdqa    xmm4, xmm3
140bfa3ee: pcmpeqb   xmm4, xmm0
140bfa3f2: pmovmskb  ebx, xmm4
140bfa3f6: test      ebx, ebx
140bfa3f8: je        0x140bfa440
140bfa3fa: tzcnt     r11d, ebx
140bfa3ff: add       r11, r8
140bfa402: and       r11, rdx
140bfa405: mov       r14, r11
140bfa408: shl       r14, 7
140bfa40c: mov       r10, rcx
140bfa40f: sub       r10, r14
140bfa412: movdqu    xmm4, xmmword ptr [r10 - 0x80]
140bfa418: pcmpeqb   xmm4, xmm2
140bfa41c: pmovmskb  r14d, xmm4
140bfa421: cmp       r14d, 0xffff
140bfa428: je        0x140bfa47c
140bfa42a: lea       r10d, [rbx - 1]
140bfa42e: and       r10w, bx
140bfa432: mov       ebx, r10d
140bfa435: jne       0x140bfa3fa
140bfa437: nop       word ptr [rax + rax]
140bfa440: pcmpeqb   xmm3, xmm1
140bfa444: pmovmskb  r10d, xmm3
140bfa449: test      r10d, r10d
140bfa44c: jne       0x140bfa4ee
140bfa452: add       r8, r9
140bfa455: add       r8, 0x10
140bfa459: add       r9, 0x10
140bfa45d: jmp       0x140bfa3e1
140bfa45f: lea       rax, [rcx + r11*8]
140bfa463: mov       rbx, qword ptr [rax - 8]
140bfa467: mov       rdx, qword ptr [rbp + 0x3c0]
140bfa46e: test      rdx, rdx
140bfa471: jne       0x140bfa56b
140bfa477: jmp       0x140bfa581
140bfa47c: lea       r8, [r11 - 0x10]
140bfa480: and       r8, rdx
140bfa483: movdqu    xmm0, xmmword ptr [rcx + r8]
140bfa489: pcmpeqd   xmm1, xmm1
140bfa48d: pcmpeqb   xmm0, xmm1
140bfa491: pmovmskb  edx, xmm0
140bfa495: movdqu    xmm0, xmmword ptr [rcx + r11]
140bfa49b: pcmpeqb   xmm0, xmm1
140bfa49f: pmovmskb  r9d, xmm0
140bfa4a4: mov       bx, 0x1f
140bfa4a8: bsr       bx, dx
140bfa4ac: xor       ebx, 0xf
140bfa4af: or        r9d, 0x10000
140bfa4b6: tzcnt     r9d, r9d
140bfa4bb: add       r9d, ebx
140bfa4be: mov       dl, 0x80
140bfa4c0: cmp       r9w, 0xf
140bfa4c5: ja        0x140bfa4d0
140bfa4c7: inc       qword ptr [rsi + 0xf0]
140bfa4ce: mov       dl, 0xff
140bfa4d0: mov       byte ptr [rcx + r11], dl
140bfa4d4: mov       byte ptr [rcx + r8 + 0x10], dl
140bfa4d9: dec       qword ptr [rsi + 0xf8]
140bfa4e0: mov       rcx, qword ptr [r10 - 0x70]
140bfa4e4: cmp       rcx, 2
140bfa4e8: jne       0x140bfa908
140bfa4ee: mov       rbx, qword ptr [rax]
140bfa4f1: lea       rcx, [rbx + 1]
140bfa4f5: mov       qword ptr [rax], rcx
140bfa4f8: mov       word ptr [rbp - 8], 0x100
140bfa4fe: mov       qword ptr [rbp - 0x58], 1
140bfa506: movdqu    xmm0, xmmword ptr [rip + 0x5343f92]
140bfa50e: movdqu    xmmword ptr [rbp - 0x50], xmm0
140bfa513: mov       qword ptr [rbp - 0x30], 4
140bfa51b: mov       qword ptr [rbp - 0x28], 4
140bfa523: mov       qword ptr [rbp - 0x10], 0
140bfa52b: mov       byte ptr [rbp - 6], 1
140bfa52f: mov       qword ptr [rbp - 0x40], 0
140bfa537: mov       byte ptr [rbp - 0x20], 2
140bfa53b: lea       r8, [rbp - 0x58]
140bfa53f: mov       rcx, rdi
140bfa542: mov       rdx, rbx
140bfa545: call      0x14000f330
140bfa54a: nop
140bfa54b: lea       rcx, [rsi + 0x78]
140bfa54f: lea       rdx, [rip + 0x5343f4a]
140bfa556: mov       r8, rbx
140bfa559: call      0x14000f180
140bfa55e: nop
140bfa55f: mov       rdx, qword ptr [rbp + 0x3c0]
140bfa566: test      rdx, rdx
140bfa569: je        0x140bfa581
140bfa56b: mov       rcx, qword ptr [rbp + 0x3c8]
140bfa572: shl       rdx, 3
140bfa576: mov       r8d, 8
140bfa57c: call      0x1400021d0
140bfa581: cmp       rbx, qword ptr [rsi + 0x218]
140bfa588: jae       0x140bfa5af
140bfa58a: mov       rax, qword ptr [rsi + 0x210]
140bfa591: mov       rax, qword ptr [rax + rbx*8]
140bfa595: test      rax, rax
140bfa598: je        0x140bfa5af
140bfa59a: mov       rcx, qword ptr [rsi + 0x1e0]
140bfa5a1: not       rax
140bfa5a4: imul      rax, rax, 0x38
140bfa5a8: cmp       byte ptr [rcx + rax + 0x30], 0
140bfa5ad: jne       0x140bfa624
140bfa5af: lea       r14, [rsi + 0x1d8]
140bfa5b6: call      0x140beb6a0
140bfa5bb: movd      dword ptr [rbp + 0x3c0], xmm0
140bfa5c3: mov       r15d, dword ptr [rsi + 0x5b0]
140bfa5ca: mov       rcx, rsi
140bfa5cd: call      0x144e65ff0
140bfa5d2: mov       qword ptr [rbp - 0x58], rbx
140bfa5d6: lea       r9, [rbp - 0x58]
140bfa5da: mov       rcx, r14
140bfa5dd: mov       rdx, rbx
140bfa5e0: mov       r8, rdi
140bfa5e3: call      0x140cb1b80
140bfa5e8: mov       rdi, rax
140bfa5eb: cmp       byte ptr [rax + 0x30], 1
140bfa5ef: jne       0x140bfa604
140bfa5f1: lea       r8, [rbp + 0x3c0]
140bfa5f8: mov       rcx, rdi
140bfa5fb: xor       edx, edx
140bfa5fd: call      0x144e7e940
140bfa602: jmp       0x140bfa620
140bfa604: mov       r8, qword ptr [rdi + 8]
140bfa608: mov       rcx, qword ptr [rdi + 0x10]
140bfa60c: lea       rdx, [rbp + 0x3c0]
140bfa613: call      0x145bfa0ed
140bfa618: mov       dword ptr [rdi + 0x28], r15d
140bfa61c: mov       byte ptr [rdi + 0x30], 1
140bfa620: mov       dword ptr [rdi + 0x2c], r15d
140bfa624: mov       rcx, rsi
140bfa627: call      0x140515110
140bfa62c: call      0x140002200
140bfa631: mov       ecx, 0x150
140bfa636: mov       edx, 8
140bfa63b: call      0x1400021c0
140bfa640: test      rax, rax
140bfa643: je        0x140bfa97b
140bfa649: mov       qword ptr [rbp + 0x438], rax
140bfa650: call      0x140002200
140bfa655: mov       ecx, 0x148
140bfa65a: mov       edx, 8
140bfa65f: call      0x1400021c0
140bfa664: test      rax, rax
140bfa667: je        0x140bfa98c
140bfa66d: mov       dword ptr [rax], 0
140bfa673: mov       byte ptr [rax + 4], 0
140bfa677: mov       qword ptr [rax + 0x100], 0xffffffffffffffff
140bfa682: lea       r8, [rip + 0x53a0aa7]
140bfa689: lea       rcx, [rbp + 0x350]
140bfa690: mov       rdx, rax
140bfa693: call      0x144e1fc30
140bfa698: nop
140bfa699: mov       qword ptr [rbp - 0x58], 0xffffffffffffffff
140bfa6a1: mov       dword ptr [rbp + 0x348], 0
140bfa6ab: mov       byte ptr [rbp + 0x34c], 0
140bfa6b2: call      0x140002200
140bfa6b7: mov       ecx, 0x3a8
140bfa6bc: mov       edx, 8
140bfa6c1: call      0x1400021c0
140bfa6c6: test      rax, rax
140bfa6c9: je        0x140bfa99e
140bfa6cf: mov       rdi, rax
140bfa6d2: lea       rdx, [rbp - 0x58]
140bfa6d6: mov       r8d, 0x3a8
140bfa6dc: mov       rcx, rax
140bfa6df: call      0x145bfa0e7
140bfa6e4: nop
140bfa6e5: lea       r8, [rip + 0x53a0aec]
140bfa6ec: lea       rcx, [rbp + 0x3c0]
140bfa6f3: mov       rdx, rdi
140bfa6f6: call      0x144e1fc30
140bfa6fb: nop
140bfa6fc: mov       qword ptr [rbp + 0x98], 0xffffffffffffffff
140bfa707: mov       dword ptr [rbp + 0x1f0], 0
140bfa711: mov       byte ptr [rbp + 0x1f4], 0
140bfa718: call      0x140002200
140bfa71d: mov       ecx, 0x250
140bfa722: mov       edx, 8
140bfa727: call      0x1400021c0
140bfa72c: test      rax, rax
140bfa72f: je        0x140bfa9b0
140bfa735: mov       rdi, rax
140bfa738: lea       rdx, [rbp - 0x58]
140bfa73c: mov       r8d, 0x250
140bfa742: mov       rcx, rax
140bfa745: call      0x145bfa0e7
140bfa74a: nop
140bfa74b: lea       r8, [rip + 0x53a088e]
140bfa752: lea       rcx, [rbp - 0x58]
140bfa756: mov       rdx, rdi
140bfa759: call      0x144e1fc30
140bfa75e: nop
140bfa75f: movups    xmm0, xmmword ptr [rbp + 0x3b0]
140bfa766: mov       rax, qword ptr [rbp + 0x438]
140bfa76d: movups    xmmword ptr [rax + 0x60], xmm0
140bfa771: movups    xmm0, xmmword ptr [rbp + 0x3a0]
140bfa778: movups    xmmword ptr [rax + 0x50], xmm0
140bfa77c: movups    xmm0, xmmword ptr [rbp + 0x390]
140bfa783: movups    xmmword ptr [rax + 0x40], xmm0
140bfa787: movups    xmm0, xmmword ptr [rbp + 0x350]
140bfa78e: movups    xmm1, xmmword ptr [rbp + 0x360]
140bfa795: movups    xmm2, xmmword ptr [rbp + 0x370]
140bfa79c: movups    xmm3, xmmword ptr [rbp + 0x380]
140bfa7a3: movups    xmmword ptr [rax + 0x30], xmm3
140bfa7a7: movups    xmmword ptr [rax + 0x20], xmm2
140bfa7ab: movups    xmmword ptr [rax + 0x10], xmm1
140bfa7af: movups    xmmword ptr [rax], xmm0
140bfa7b2: movups    xmm0, xmmword ptr [rbp + 0x3c0]
140bfa7b9: movups    xmm1, xmmword ptr [rbp + 0x3d0]
140bfa7c0: movups    xmm2, xmmword ptr [rbp + 0x3e0]
140bfa7c7: movups    xmm3, xmmword ptr [rbp + 0x3f0]
140bfa7ce: movups    xmmword ptr [rax + 0x70], xmm0
140bfa7d2: movups    xmmword ptr [rax + 0x80], xmm1
140bfa7d9: movups    xmmword ptr [rax + 0x90], xmm2
140bfa7e0: movups    xmmword ptr [rax + 0xa0], xmm3
140bfa7e7: movups    xmm0, xmmword ptr [rbp + 0x400]
140bfa7ee: movups    xmmword ptr [rax + 0xb0], xmm0
140bfa7f5: movups    xmm0, xmmword ptr [rbp + 0x410]
140bfa7fc: movups    xmmword ptr [rax + 0xc0], xmm0
140bfa803: movups    xmm0, xmmword ptr [rbp + 0x420]
140bfa80a: movups    xmmword ptr [rax + 0xd0], xmm0
140bfa811: movups    xmm0, xmmword ptr [rbp - 0x58]
140bfa815: movups    xmm1, xmmword ptr [rbp - 0x48]
140bfa819: movups    xmm2, xmmword ptr [rbp - 0x38]
140bfa81d: movups    xmm3, xmmword ptr [rbp - 0x28]
140bfa821: movups    xmmword ptr [rax + 0xe0], xmm0
140bfa828: movups    xmmword ptr [rax + 0xf0], xmm1
140bfa82f: movups    xmmword ptr [rax + 0x100], xmm2
140bfa836: movups    xmmword ptr [rax + 0x110], xmm3
140bfa83d: movups    xmm0, xmmword ptr [rbp - 0x18]
140bfa841: movups    xmmword ptr [rax + 0x120], xmm0
140bfa848: movups    xmm0, xmmword ptr [rbp - 8]
140bfa84c: movups    xmmword ptr [rax + 0x130], xmm0
140bfa853: movups    xmm0, xmmword ptr [rbp + 8]
140bfa857: movups    xmmword ptr [rax + 0x140], xmm0
140bfa85e: mov       qword ptr [rbp - 0x50], 3
140bfa866: mov       qword ptr [rbp - 0x48], rax
140bfa86a: mov       qword ptr [rbp - 0x40], 3
140bfa872: mov       qword ptr [rbp - 0x38], 0
140bfa87a: mov       qword ptr [rbp - 0x30], 8
140bfa882: xorps     xmm0, xmm0
140bfa885: movups    xmmword ptr [rbp - 0x28], xmm0
140bfa889: mov       qword ptr [rbp - 0x58], 0xffffffffffffffff
140bfa891: lea       rcx, [rbp - 0x20]
140bfa895: call      0x144e9bf10
140bfa89a: nop
140bfa89b: movups    xmm0, xmmword ptr [rbp + 8]
140bfa89f: movaps    xmmword ptr [rbp + 0x420], xmm0
140bfa8a6: movups    xmm0, xmmword ptr [rbp - 8]
140bfa8aa: movaps    xmmword ptr [rbp + 0x410], xmm0
140bfa8b1: movups    xmm0, xmmword ptr [rbp - 0x18]
140bfa8b5: movaps    xmmword ptr [rbp + 0x400], xmm0
140bfa8bc: movups    xmm0, xmmword ptr [rbp - 0x58]
140bfa8c0: movups    xmm1, xmmword ptr [rbp - 0x48]
140bfa8c4: movups    xmm2, xmmword ptr [rbp - 0x38]
140bfa8c8: movups    xmm3, xmmword ptr [rbp - 0x28]
140bfa8cc: movaps    xmmword ptr [rbp + 0x3f0], xmm3
140bfa8d3: movaps    xmmword ptr [rbp + 0x3e0], xmm2
140bfa8da: movaps    xmmword ptr [rbp + 0x3d0], xmm1
140bfa8e1: movaps    xmmword ptr [rbp + 0x3c0], xmm0
140bfa8e8: lea       rdx, [rbp + 0x3c0]
140bfa8ef: mov       rcx, rsi
140bfa8f2: call      0x14051a3a0
140bfa8f7: nop
140bfa8f8: add       rsp, 0x4c8
140bfa8ff: pop       rbx
140bfa900: pop       rdi
140bfa901: pop       rsi
140bfa902: pop       r14
140bfa904: pop       r15
140bfa906: pop       rbp
140bfa907: ret
140bfa908: mov       rax, qword ptr [r10 - 8]
140bfa90c: mov       qword ptr [rbp + 0x10], rax
140bfa910: movups    xmm0, xmmword ptr [r10 - 0x18]
140bfa915: movups    xmmword ptr [rbp], xmm0
140bfa919: movups    xmm0, xmmword ptr [r10 - 0x28]
140bfa91e: movups    xmmword ptr [rbp - 0x10], xmm0
140bfa922: movdqu    xmm0, xmmword ptr [r10 - 0x68]
140bfa928: movdqu    xmm1, xmmword ptr [r10 - 0x58]
140bfa92e: movdqu    xmm2, xmmword ptr [r10 - 0x48]
140bfa934: movdqu    xmm3, xmmword ptr [r10 - 0x38]
140bfa93a: movdqu    xmmword ptr [rbp - 0x20], xmm3
140bfa93f: movdqu    xmmword ptr [rbp - 0x30], xmm2
140bfa944: movdqu    xmmword ptr [rbp - 0x40], xmm1
140bfa949: movdqu    xmmword ptr [rbp - 0x50], xmm0
140bfa94e: mov       qword ptr [rbp - 0x58], rcx
140bfa952: lea       rcx, [rbp - 0x58]
140bfa956: lea       rdx, [rbp + 0x3c0]
140bfa95d: call      0x144e08f20
140bfa962: nop
140bfa963: mov       rbx, rax
140bfa966: mov       rdx, qword ptr [rbp + 0x3c0]
140bfa96d: test      rdx, rdx
140bfa970: jne       0x140bfa56b
140bfa976: jmp       0x140bfa581
140bfa97b: mov       ecx, 8
140bfa980: mov       edx, 0x150
140bfa985: call      0x145d992a1
140bfa98a: ud2
140bfa98c: mov       ecx, 8
140bfa991: mov       edx, 0x148
140bfa996: call      0x145d992a1
140bfa99b: nop
140bfa99c: jmp       0x140bfa9c0
140bfa99e: mov       ecx, 8
140bfa9a3: mov       edx, 0x3a8
140bfa9a8: call      0x145d992a1
140bfa9ad: nop
140bfa9ae: jmp       0x140bfa9c0
140bfa9b0: mov       ecx, 8
140bfa9b5: mov       edx, 0x250
140bfa9ba: call      0x145d992a1
140bfa9bf: nop
140bfa9c0: ud2
140bfa9c2: mov       ecx, 8
140bfa9c7: mov       edx, 0x20
140bfa9cc: call      0x145d992a1
140bfa9d1: ud2
