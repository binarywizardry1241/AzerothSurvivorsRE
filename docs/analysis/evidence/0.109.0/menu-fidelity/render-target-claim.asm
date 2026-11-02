140c035f0: push      r15
140c035f2: push      r14
140c035f4: push      r13
140c035f6: push      r12
140c035f8: push      rsi
140c035f9: push      rdi
140c035fa: push      rbp
140c035fb: push      rbx
140c035fc: push      rax
140c035fd: mov       r9, qword ptr [rdx]
140c03600: mov       r10, qword ptr [rdx + 8]
140c03604: mov       rax, qword ptr [r8]
140c03607: mov       rcx, qword ptr [r8 + 8]
140c0360b: mov       edx, dword ptr [r8 + 0x14]
140c0360f: mov       dword ptr [rsp + 4], edx
140c03613: mov       r11, qword ptr [r9 + 0xf8]
140c0361a: mov       rdx, qword ptr [r9 + 0x100]
140c03621: lea       rsi, [r11 + rdx*4]
140c03625: cmp       byte ptr [r9 + 0x108], 0
140c0362d: je        0x140c036ef
140c03633: xor       r8d, r8d
140c03636: mov       r15d, 8
140c0363c: xor       r14d, r14d
140c0363f: xor       ebx, ebx
140c03641: xor       ebp, ebp
140c03643: cmp       ebp, ebx
140c03645: jne       0x140c036b2
140c03647: nop       word ptr [rax + rax]
140c03650: cmp       r11, rsi
140c03653: je        0x140c037fd
140c03659: mov       ebx, dword ptr [r11]
140c0365c: add       r11, 4
140c03660: mov       rdx, qword ptr [r10 + 0x1a8]
140c03667: lea       r14, [rbx + rbx*8]
140c0366b: mov       rbx, qword ptr [rdx + r14*8 + 0x10]
140c03670: test      rbx, rbx
140c03673: je        0x140c03650
140c03675: lea       r15, [rdx + r14*8]
140c03679: mov       rdx, qword ptr [r9 + 0x110]
140c03680: cmp       rdx, qword ptr [r15 + 0x40]
140c03684: jae       0x140c036a9
140c03686: mov       r14, qword ptr [r15 + 0x38]
140c0368a: mov       rdx, qword ptr [r14 + rdx*8]
140c0368e: test      rdx, rdx
140c03691: je        0x140c036a9
140c03693: mov       r14, qword ptr [r15 + 0x18]
140c03697: not       rdx
140c0369a: lea       rdx, [rdx + rdx*2]
140c0369e: shl       rdx, 4
140c036a2: mov       r14, qword ptr [r14 + rdx + 0x10]
140c036a7: jmp       0x140c036ac
140c036a9: xor       r14d, r14d
140c036ac: mov       r15, qword ptr [r15 + 8]
140c036b0: xor       ebp, ebp
140c036b2: mov       r12d, ebp
140c036b5: inc       ebp
140c036b7: mov       r13, qword ptr [r15 + r12*8]
140c036bb: mov       rdx, r13
140c036be: shr       rdx, 0x20
140c036c2: test      r13d, r13d
140c036c5: cmovne    edi, edx
140c036c8: je        0x140c03643
140c036ce: je        0x140c03643
140c036d4: imul      rdx, r12, 0x110
140c036db: cmp       byte ptr [r14 + rdx + 0x100], 0
140c036e4: je        0x140c03643
140c036ea: jmp       0x140c037f3
140c036ef: xor       r8d, r8d
140c036f2: mov       r12d, 8
140c036f8: xor       r15d, r15d
140c036fb: xor       r14d, r14d
140c036fe: xor       ebp, ebp
140c03700: jmp       0x140c0371e
140c03702: nop       word ptr cs:[rax + rax]
140c03710: xor       r13d, r13d
140c03713: inc       ebp
140c03715: test      r13d, r13d
140c03718: jne       0x140c037e6
140c0371e: cmp       ebp, r14d
140c03721: jne       0x140c037af
140c03727: nop       word ptr [rax + rax]
140c03730: cmp       r11, rsi
140c03733: je        0x140c037fd
140c03739: mov       edx, dword ptr [r11]
140c0373c: add       r11, 4
140c03740: mov       r12, qword ptr [r10 + 0x108]
140c03747: lea       rdx, [rdx + rdx*4]
140c0374b: shl       rdx, 5
140c0374f: mov       r14, qword ptr [r12 + rdx + 0x58]
140c03754: test      r14, r14
140c03757: je        0x140c03730
140c03759: add       r12, rdx
140c0375c: mov       edx, dword ptr [r12 + 0x94]
140c03764: mov       r15, qword ptr [r10 + 0x1a8]
140c0376b: lea       r13, [rdx + rdx*8]
140c0376f: mov       rdx, qword ptr [r9 + 0x110]
140c03776: cmp       rdx, qword ptr [r15 + r13*8 + 0x40]
140c0377b: jae       0x140c037a5
140c0377d: lea       r15, [r15 + r13*8]
140c03781: mov       r13, qword ptr [r15 + 0x38]
140c03785: mov       rdx, qword ptr [r13 + rdx*8]
140c0378a: test      rdx, rdx
140c0378d: je        0x140c037a5
140c0378f: mov       r15, qword ptr [r15 + 0x18]
140c03793: not       rdx
140c03796: lea       rdx, [rdx + rdx*2]
140c0379a: shl       rdx, 4
140c0379e: mov       r15, qword ptr [r15 + rdx + 0x10]
140c037a3: jmp       0x140c037a8
140c037a5: xor       r15d, r15d
140c037a8: mov       r12, qword ptr [r12 + 0x50]
140c037ad: xor       ebp, ebp
140c037af: mov       edx, ebp
140c037b1: shl       rdx, 4
140c037b5: mov       r13, qword ptr [r12 + rdx]
140c037b9: test      r13d, r13d
140c037bc: je        0x140c03710
140c037c2: add       rdx, r12
140c037c5: mov       edx, dword ptr [rdx + 8]
140c037c8: not       edx
140c037ca: imul      rbx, rdx, 0x110
140c037d1: add       rbx, r15
140c037d4: mov       rdi, r13
140c037d7: shr       rdi, 0x20
140c037db: inc       ebp
140c037dd: test      r13d, r13d
140c037e0: je        0x140c0371e
140c037e6: cmp       byte ptr [rbx + 0x100], 1
140c037ed: jne       0x140c0371e
140c037f3: shl       rdi, 0x20
140c037f7: mov       r8d, r13d
140c037fa: or        r8, rdi
140c037fd: mov       r9, qword ptr [rax + 0xf8]
140c03804: mov       rdx, qword ptr [rax + 0x100]
140c0380b: lea       r10, [r9 + rdx*4]
140c0380f: cmp       byte ptr [rax + 0x108], 0
140c03816: je        0x140c038d8
140c0381c: xor       r11d, r11d
140c0381f: xor       edi, edi
140c03821: xor       ebx, ebx
140c03823: jmp       0x140c03841
140c03825: nop       word ptr cs:[rax + rax]
140c03830: test      r8d, r8d
140c03833: je        0x140c03841
140c03835: mov       edx, dword ptr [rsp + 4]
140c03839: mov       dword ptr [rsi + r14*4], edx
140c0383d: mov       qword ptr [rdi + r14*8], r8
140c03841: cmp       ebx, r11d
140c03844: jne       0x140c038a3
140c03846: nop       word ptr cs:[rax + rax]
140c03850: cmp       r9, r10
140c03853: je        0x140c039bd
140c03859: mov       r11d, dword ptr [r9]
140c0385c: add       r9, 4
140c03860: mov       rdx, qword ptr [rcx + 0x1a8]
140c03867: lea       rsi, [r11 + r11*8]
140c0386b: mov       r11, qword ptr [rdx + rsi*8 + 0x10]
140c03870: test      r11, r11
140c03873: je        0x140c03850
140c03875: lea       rdx, [rdx + rsi*8]
140c03879: mov       rsi, qword ptr [rax + 0x110]
140c03880: mov       rbx, qword ptr [rdx + 0x18]
140c03884: mov       rdx, qword ptr [rdx + 0x38]
140c03888: mov       rdx, qword ptr [rdx + rsi*8]
140c0388c: not       rdx
140c0388f: lea       rdx, [rdx + rdx*2]
140c03893: shl       rdx, 4
140c03897: mov       rdi, qword ptr [rbx + rdx + 0x10]
140c0389c: mov       rsi, qword ptr [rbx + rdx + 0x28]
140c038a1: xor       ebx, ebx
140c038a3: mov       r14d, ebx
140c038a6: inc       ebx
140c038a8: mov       r15d, dword ptr [rdi + r14*8]
140c038ac: test      r15, r15
140c038af: je        0x140c03830
140c038b5: test      r8d, r8d
140c038b8: je        0x140c03835
140c038be: mov       edx, dword ptr [rdi + r14*8 + 4]
140c038c3: shl       rdx, 0x20
140c038c7: or        rdx, r15
140c038ca: cmp       rdx, r8
140c038cd: je        0x140c03841
140c038d3: jmp       0x140c03835
140c038d8: xor       r11d, r11d
140c038db: mov       esi, 8
140c038e0: xor       ebx, ebx
140c038e2: xor       ebp, ebp
140c038e4: jmp       0x140c03901
140c038e6: nop       word ptr cs:[rax + rax]
140c038f0: test      r8d, r8d
140c038f3: je        0x140c03901
140c038f5: mov       edx, dword ptr [rsp + 4]
140c038f9: mov       dword ptr [rdi + r14*4], edx
140c038fd: mov       qword ptr [rbx + r14*8], r8
140c03901: cmp       ebp, r11d
140c03904: jne       0x140c0397d
140c03906: nop       word ptr cs:[rax + rax]
140c03910: cmp       r9, r10
140c03913: je        0x140c039bd
140c03919: mov       edx, dword ptr [r9]
140c0391c: add       r9, 4
140c03920: mov       rsi, qword ptr [rcx + 0x108]
140c03927: lea       rdx, [rdx + rdx*4]
140c0392b: shl       rdx, 5
140c0392f: mov       r11, qword ptr [rsi + rdx + 0x58]
140c03934: test      r11, r11
140c03937: je        0x140c03910
140c03939: add       rsi, rdx
140c0393c: mov       edx, dword ptr [rsi + 0x94]
140c03942: mov       rdi, qword ptr [rcx + 0x1a8]
140c03949: lea       rdx, [rdx + rdx*8]
140c0394d: mov       rbx, qword ptr [rax + 0x110]
140c03954: mov       r14, qword ptr [rdi + rdx*8 + 0x18]
140c03959: mov       rdx, qword ptr [rdi + rdx*8 + 0x38]
140c0395e: mov       rdx, qword ptr [rdx + rbx*8]
140c03962: not       rdx
140c03965: lea       rdx, [rdx + rdx*2]
140c03969: shl       rdx, 4
140c0396d: mov       rbx, qword ptr [r14 + rdx + 0x10]
140c03972: mov       rdi, qword ptr [r14 + rdx + 0x28]
140c03977: mov       rsi, qword ptr [rsi + 0x50]
140c0397b: xor       ebp, ebp
140c0397d: mov       edx, ebp
140c0397f: shl       rdx, 4
140c03983: inc       ebp
140c03985: mov       r14d, dword ptr [rsi + rdx + 8]
140c0398a: not       r14d
140c0398d: mov       r15d, dword ptr [rbx + r14*8]
140c03991: test      r15, r15
140c03994: je        0x140c038f0
140c0399a: test      r8d, r8d
140c0399d: je        0x140c038f5
140c039a3: mov       edx, dword ptr [rbx + r14*8 + 4]
140c039a8: shl       rdx, 0x20
140c039ac: or        rdx, r15
140c039af: cmp       rdx, r8
140c039b2: je        0x140c03901
140c039b8: jmp       0x140c038f5
140c039bd: add       rsp, 8
140c039c1: pop       rbx
140c039c2: pop       rbp
140c039c3: pop       rdi
140c039c4: pop       rsi
140c039c5: pop       r12
140c039c7: pop       r13
140c039c9: pop       r14
140c039cb: pop       r15
140c039cd: ret
