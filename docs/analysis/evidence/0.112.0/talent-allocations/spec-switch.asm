1458d2770: push      rbp
1458d2771: push      r15
1458d2773: push      r14
1458d2775: push      r13
1458d2777: push      r12
1458d2779: push      rsi
1458d277a: push      rdi
1458d277b: push      rbx
1458d277c: sub       rsp, 0xc8
1458d2783: lea       rbp, [rsp + 0x80]
1458d278b: mov       qword ptr [rbp + 0x40], 0xfffffffffffffffe
1458d2793: mov       rdi, r8
1458d2796: mov       ebx, edx
1458d2798: mov       rsi, rcx
1458d279b: mov       rax, qword ptr [rcx + 0x80]
1458d27a2: mov       rcx, qword ptr [rcx + 0x88]
1458d27a9: shl       rcx, 4
1458d27ad: lea       rcx, [rcx + rcx*4]
1458d27b1: xor       r15d, r15d
1458d27b4: xor       edx, edx
1458d27b6: nop       word ptr cs:[rax + rax]
1458d27c0: cmp       rcx, rdx
1458d27c3: je        0x1458d27d7
1458d27c5: lea       r8, [rdx + 0x50]
1458d27c9: cmp       byte ptr [rax + rdx], bl
1458d27cc: mov       rdx, r8
1458d27cf: jne       0x1458d27c0
1458d27d1: movzx     r15d, byte ptr [rax + r8 - 0x4f]
1458d27d7: cmp       rdi, 3
1458d27db: setb      al
1458d27de: cmp       rdi, r15
1458d27e1: setne     r14b
1458d27e5: and       r14b, al
1458d27e8: cmp       r14b, 1
1458d27ec: jne       0x1458d2b46
1458d27f2: mov       rax, qword ptr [rsi + 0x68]
1458d27f6: mov       rdx, qword ptr [rsi + 0x70]
1458d27fa: shl       rdx, 5
1458d27fe: xor       r13d, r13d
1458d2801: xor       ecx, ecx
1458d2803: mov       r8, rax
1458d2806: nop       word ptr cs:[rax + rax]
1458d2810: cmp       rdx, rcx
1458d2813: je        0x1458d285f
1458d2815: add       rcx, 0x20
1458d2819: cmp       byte ptr [r8 + 4], bl
1458d281d: lea       r8, [r8 + 0x20]
1458d2821: jne       0x1458d2810
1458d2823: mov       r13, qword ptr [rax + rcx - 8]
1458d2828: mov       r12, r13
1458d282b: shl       r12, 4
1458d282f: mov       rdx, r13
1458d2832: shr       rdx, 0x3c
1458d2836: setne     dl
1458d2839: movabs    r8, 0x7ffffffffffffff8
1458d2843: cmp       r12, r8
1458d2846: seta      r8b
1458d284a: or        r8b, dl
1458d284d: je        0x1458d2872
1458d284f: xor       r13d, r13d
1458d2852: mov       rcx, r13
1458d2855: mov       rdx, r12
1458d2858: call      0x145da94eb
1458d285d: ud2
1458d285f: mov       eax, 8
1458d2864: mov       qword ptr [rbp + 0x20], rax
1458d2868: mov       qword ptr [rbp + 0x30], 0
1458d2870: jmp       0x1458d28dd
1458d2872: mov       rdx, qword ptr [rax + rcx - 0x10]
1458d2877: test      r12, r12
1458d287a: je        0x1458d28c4
1458d287c: mov       qword ptr [rbp + 0x28], rdx
1458d2880: mov       qword ptr [rbp + 0x10], r13
1458d2884: call      0x140002200
1458d2889: mov       r13d, 8
1458d288f: mov       edx, 8
1458d2894: mov       rcx, r12
1458d2897: call      0x1400021c0
1458d289c: mov       qword ptr [rbp + 0x20], rax
1458d28a0: test      rax, rax
1458d28a3: je        0x1458d2852
1458d28a5: mov       r13, qword ptr [rbp + 0x10]
1458d28a9: mov       qword ptr [rbp + 0x30], r13
1458d28ad: mov       rdx, qword ptr [rbp + 0x28]
1458d28b1: test      r13, r13
1458d28b4: je        0x1458d28da
1458d28b6: mov       rcx, qword ptr [rbp + 0x20]
1458d28ba: mov       r8, r12
1458d28bd: call      0x145c0a3db
1458d28c2: jmp       0x1458d28dd
1458d28c4: mov       eax, 8
1458d28c9: mov       qword ptr [rbp + 0x20], rax
1458d28cd: mov       qword ptr [rbp + 0x30], 0
1458d28d5: test      r13, r13
1458d28d8: jne       0x1458d28b6
1458d28da: xor       r13d, r13d
1458d28dd: mov       byte ptr [rbp + 0x3d], 1
1458d28e1: lea       rcx, [rbp - 0x10]
1458d28e5: mov       rdx, rsi
1458d28e8: mov       r8d, ebx
1458d28eb: mov       r9, rdi
1458d28ee: call      0x1458d2340
1458d28f3: nop
1458d28f4: mov       rax, qword ptr [rsi + 0x80]
1458d28fb: mov       r12, qword ptr [rsi + 0x88]
1458d2902: test      r12, r12
1458d2905: je        0x1458d2936
1458d2907: mov       rcx, r12
1458d290a: shl       rcx, 4
1458d290e: lea       rdx, [rcx + rcx*4]
1458d2912: xor       ecx, ecx
1458d2914: xor       r8d, r8d
1458d2917: nop       word ptr [rax + rax]
1458d2920: cmp       byte ptr [rax + r8], bl
1458d2924: je        0x1458d2b5d
1458d292a: inc       rcx
1458d292d: add       r8, 0x50
1458d2931: cmp       rdx, r8
1458d2934: jne       0x1458d2920
1458d2936: lea       rcx, [rsi + 0x78]
1458d293a: xorps     xmm0, xmm0
1458d293d: movups    xmmword ptr [rbp - 0x48], xmm0
1458d2941: movups    xmmword ptr [rbp - 0x30], xmm0
1458d2945: mov       byte ptr [rbp - 0x60], bl
1458d2948: mov       byte ptr [rbp - 0x5f], 0
1458d294c: mov       qword ptr [rbp - 0x58], 0
1458d2954: mov       qword ptr [rbp - 0x50], 8
1458d295c: mov       qword ptr [rbp - 0x38], 8
1458d2964: mov       qword ptr [rbp - 0x20], 8
1458d296c: mov       qword ptr [rbp - 0x18], 0
1458d2974: cmp       r12, qword ptr [rcx]
1458d2977: jne       0x1458d2986
1458d2979: call      0x145c16860
1458d297e: nop
1458d297f: mov       rax, qword ptr [rsi + 0x80]
1458d2986: lea       rcx, [r12 + r12*4]
1458d298a: shl       rcx, 4
1458d298e: movups    xmm0, xmmword ptr [rbp - 0x20]
1458d2992: movups    xmmword ptr [rax + rcx + 0x40], xmm0
1458d2997: movups    xmm0, xmmword ptr [rbp - 0x60]
1458d299b: movups    xmm1, xmmword ptr [rbp - 0x50]
1458d299f: movups    xmm2, xmmword ptr [rbp - 0x40]
1458d29a3: movups    xmm3, xmmword ptr [rbp - 0x30]
1458d29a7: movups    xmmword ptr [rax + rcx + 0x30], xmm3
1458d29ac: movups    xmmword ptr [rax + rcx + 0x20], xmm2
1458d29b1: movups    xmmword ptr [rax + rcx + 0x10], xmm1
1458d29b6: movups    xmmword ptr [rax + rcx], xmm0
1458d29ba: lea       rdx, [r12 + 1]
1458d29bf: mov       qword ptr [rsi + 0x88], rdx
1458d29c6: cmp       r12, rdx
1458d29c9: jae       0x1458d2b6c
1458d29cf: mov       qword ptr [rbp + 0x10], rdi
1458d29d3: cmp       r15d, 3
1458d29d7: jae       0x1458d2b9d
1458d29dd: lea       rdi, [r12 + r12*4]
1458d29e1: shl       rdi, 4
1458d29e5: mov       rax, qword ptr [rsi + 0x80]
1458d29ec: add       rax, rdi
1458d29ef: lea       rcx, [r15 + r15*2]
1458d29f3: lea       r15, [rax + rcx*8]
1458d29f7: add       r15, 8
1458d29fb: mov       rdx, qword ptr [rax + rcx*8 + 8]
1458d2a00: test      rdx, rdx
1458d2a03: je        0x1458d2a18
1458d2a05: mov       rcx, qword ptr [r15 + 8]
1458d2a09: shl       rdx, 4
1458d2a0d: mov       r8d, 8
1458d2a13: call      0x1400021d0
1458d2a18: mov       rax, qword ptr [rbp + 0x30]
1458d2a1c: mov       qword ptr [r15], rax
1458d2a1f: mov       rax, qword ptr [rbp + 0x20]
1458d2a23: mov       qword ptr [r15 + 8], rax
1458d2a27: mov       qword ptr [r15 + 0x10], r13
1458d2a2b: mov       r13, qword ptr [rbp]
1458d2a2f: mov       r15, r13
1458d2a32: shl       r15, 4
1458d2a36: mov       rax, r13
1458d2a39: shr       rax, 0x3c
1458d2a3d: setne     al
1458d2a40: movabs    rcx, 0x7ffffffffffffff8
1458d2a4a: cmp       r15, rcx
1458d2a4d: seta      cl
1458d2a50: or        cl, al
1458d2a52: je        0x1458d2a6c
1458d2a54: xor       ecx, ecx
1458d2a56: mov       byte ptr [rbp + 0x3f], 1
1458d2a5a: mov       byte ptr [rbp + 0x3e], 0
1458d2a5e: mov       rdx, r15
1458d2a61: call      0x145da94eb
1458d2a66: nop
1458d2a67: jmp       0x1458d2bde
1458d2a6c: mov       rdx, qword ptr [rbp - 8]
1458d2a70: test      r15, r15
1458d2a73: je        0x1458d2b7e
1458d2a79: mov       qword ptr [rbp + 8], rdx
1458d2a7d: call      0x140002200
1458d2a82: mov       edx, 8
1458d2a87: mov       rcx, r15
1458d2a8a: call      0x1400021c0
1458d2a8f: mov       ecx, 8
1458d2a94: mov       qword ptr [rbp + 0x28], rax
1458d2a98: test      rax, rax
1458d2a9b: je        0x1458d2a56
1458d2a9d: mov       qword ptr [rbp + 0x18], r13
1458d2aa1: mov       rdx, qword ptr [rbp + 8]
1458d2aa5: test      r13, r13
1458d2aa8: je        0x1458d2ab6
1458d2aaa: mov       rcx, qword ptr [rbp + 0x28]
1458d2aae: mov       r8, r15
1458d2ab1: call      0x145c0a3db
1458d2ab6: mov       rdx, qword ptr [rsi + 0x88]
1458d2abd: cmp       r12, rdx
1458d2ac0: jae       0x1458d2bb4
1458d2ac6: mov       rax, qword ptr [rsi + 0x80]
1458d2acd: add       rax, rdi
1458d2ad0: mov       rcx, qword ptr [rbp + 0x10]
1458d2ad4: lea       rcx, [rcx + rcx*2]
1458d2ad8: lea       r15, [rax + rcx*8]
1458d2adc: add       r15, 8
1458d2ae0: mov       rdx, qword ptr [rax + rcx*8 + 8]
1458d2ae5: test      rdx, rdx
1458d2ae8: je        0x1458d2afd
1458d2aea: mov       rcx, qword ptr [r15 + 8]
1458d2aee: shl       rdx, 4
1458d2af2: mov       r8d, 8
1458d2af8: call      0x1400021d0
1458d2afd: mov       rax, qword ptr [rbp + 0x18]
1458d2b01: mov       qword ptr [r15], rax
1458d2b04: mov       rax, qword ptr [rbp + 0x28]
1458d2b08: mov       qword ptr [r15 + 8], rax
1458d2b0c: mov       qword ptr [r15 + 0x10], r13
1458d2b10: mov       rdx, qword ptr [rsi + 0x88]
1458d2b17: cmp       r12, rdx
1458d2b1a: jae       0x1458d2bc6
1458d2b20: mov       rax, qword ptr [rsi + 0x80]
1458d2b27: mov       rcx, qword ptr [rbp + 0x10]
1458d2b2b: mov       byte ptr [rax + rdi + 1], cl
1458d2b2f: mov       byte ptr [rbp + 0x3f], 0
1458d2b33: mov       byte ptr [rbp + 0x3e], 0
1458d2b37: lea       r8, [rbp - 0x10]
1458d2b3b: mov       rcx, rsi
1458d2b3e: mov       edx, ebx
1458d2b40: call      0x1458dda90
1458d2b45: nop
1458d2b46: mov       eax, r14d
1458d2b49: add       rsp, 0xc8
1458d2b50: pop       rbx
1458d2b51: pop       rdi
1458d2b52: pop       rsi
1458d2b53: pop       r12
1458d2b55: pop       r13
1458d2b57: pop       r14
1458d2b59: pop       r15
1458d2b5b: pop       rbp
1458d2b5c: ret
1458d2b5d: mov       rdx, r12
1458d2b60: mov       r12, rcx
1458d2b63: cmp       r12, rdx
1458d2b66: jb        0x1458d29cf
1458d2b6c: lea       r8, [rip + 0x1335a05]
1458d2b73: mov       rcx, r12
1458d2b76: call      0x145da9883
1458d2b7b: nop
1458d2b7c: jmp       0x1458d2bde
1458d2b7e: mov       eax, 8
1458d2b83: mov       qword ptr [rbp + 0x28], rax
1458d2b87: mov       qword ptr [rbp + 0x18], 0
1458d2b8f: test      r13, r13
1458d2b92: jne       0x1458d2aaa
1458d2b98: jmp       0x1458d2ab6
1458d2b9d: lea       r8, [rip + 0x13359ec]
1458d2ba4: mov       edx, 3
1458d2ba9: mov       rcx, r15
1458d2bac: call      0x145da9883
1458d2bb1: nop
1458d2bb2: jmp       0x1458d2bde
1458d2bb4: lea       r8, [rip + 0x13359ed]
1458d2bbb: mov       rcx, r12
1458d2bbe: call      0x145da9883
1458d2bc3: nop
1458d2bc4: jmp       0x1458d2bde
1458d2bc6: mov       byte ptr [rbp + 0x3f], 1
1458d2bca: mov       byte ptr [rbp + 0x3e], 0
1458d2bce: lea       r8, [rip + 0x13359eb]
1458d2bd5: mov       rcx, r12
1458d2bd8: call      0x145da9883
1458d2bdd: nop
1458d2bde: ud2
