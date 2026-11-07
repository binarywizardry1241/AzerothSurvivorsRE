14008e420: push      rbp
14008e421: push      r15
14008e423: push      r14
14008e425: push      r13
14008e427: push      r12
14008e429: push      rsi
14008e42a: push      rdi
14008e42b: push      rbx
14008e42c: sub       rsp, 0x78
14008e430: lea       rbp, [rsp + 0x70]
14008e435: mov       qword ptr [rbp], 0xfffffffffffffffe
14008e43d: mov       r13, rcx
14008e440: test      r8, r8
14008e443: je        0x14008e4e1
14008e449: mov       rbx, r8
14008e44c: mov       r14, rdx
14008e44f: mov       qword ptr [rbp - 8], r9
14008e453: mov       rax, qword ptr [rbp + 0x70]
14008e457: mov       r12, r8
14008e45a: shl       r12, 4
14008e45e: mov       r8, qword ptr [rdx + 8]
14008e462: lea       rcx, [r12 - 0x10]
14008e467: mov       rdx, rcx
14008e46a: shr       rdx, 4
14008e46e: mul       rdx
14008e471: mov       rdi, rax
14008e474: seto      dl
14008e477: add       rdi, r8
14008e47a: setb      al
14008e47d: test      dl, dl
14008e47f: jne       0x14008e4b3
14008e481: test      al, al
14008e483: jne       0x14008e4b3
14008e485: lea       rax, [r14 + r12]
14008e489: mov       qword ptr [rbp - 0x10], rax
14008e48d: lea       r15, [r14 + 0x10]
14008e491: mov       rsi, qword ptr [r14]
14008e494: mov       rax, r15
14008e497: nop       word ptr [rax + rax]
14008e4a0: test      rcx, rcx
14008e4a3: je        0x14008e4cd
14008e4a5: add       rcx, -0x10
14008e4a9: add       rdi, qword ptr [rax + 8]
14008e4ad: lea       rax, [rax + 0x10]
14008e4b1: jae       0x14008e4a0
14008e4b3: lea       rcx, [rip + 0x5d42d5e]
14008e4ba: lea       r8, [rip + 0x5d42d8f]
14008e4c1: mov       edx, 0x35
14008e4c6: call      0x145d99570
14008e4cb: ud2
14008e4cd: test      rdi, rdi
14008e4d0: jns       0x14008e4fe
14008e4d2: xor       esi, esi
14008e4d4: mov       rcx, rsi
14008e4d7: mov       rdx, rdi
14008e4da: call      0x145d992bb
14008e4df: ud2
14008e4e1: mov       qword ptr [r13], 0
14008e4e9: mov       qword ptr [r13 + 8], 1
14008e4f1: mov       qword ptr [r13 + 0x10], 0
14008e4f9: jmp       0x14008e7e2
14008e4fe: mov       qword ptr [rbp - 0x18], r8
14008e502: je        0x14008e531
14008e504: mov       qword ptr [rbp - 0x38], rsi
14008e508: call      0x140002200
14008e50d: mov       esi, 1
14008e512: mov       edx, 1
14008e517: mov       rcx, rdi
14008e51a: call      0x1400021c0
14008e51f: test      rax, rax
14008e522: je        0x14008e4d4
14008e524: mov       rcx, rax
14008e527: mov       r8, qword ptr [rbp - 0x18]
14008e52b: mov       rsi, qword ptr [rbp - 0x38]
14008e52f: jmp       0x14008e536
14008e531: mov       ecx, 1
14008e536: mov       qword ptr [rbp - 0x30], rdi
14008e53a: mov       qword ptr [rbp - 0x28], rcx
14008e53e: mov       qword ptr [rbp - 0x20], 0
14008e546: cmp       r8, rdi
14008e549: mov       qword ptr [rbp - 0x40], r13
14008e54d: ja        0x14008e931
14008e553: xor       r13d, r13d
14008e556: test      r8, r8
14008e559: je        0x14008e578
14008e55b: lea       rax, [rcx + r13]
14008e55f: mov       rdx, rsi
14008e562: mov       rsi, rcx
14008e565: mov       rcx, rax
14008e568: mov       r8, qword ptr [rbp - 0x18]
14008e56c: call      0x145bfa0e7
14008e571: mov       r8, qword ptr [rbp - 0x18]
14008e575: mov       rcx, rsi
14008e578: add       r13, r8
14008e57b: add       rcx, r13
14008e57e: mov       rsi, rdi
14008e581: sub       rsi, r13
14008e584: mov       rdx, qword ptr [rbp + 0x70]
14008e588: cmp       rdx, 4
14008e58c: ja        0x14008e76f
14008e592: lea       rax, [rip + 0x5d442a7]
14008e599: movsxd    rdx, dword ptr [rax + rdx*4]
14008e59d: add       rdx, rax
14008e5a0: jmp       rdx
14008e5a2: cmp       rbx, 1
14008e5a6: je        0x14008e7ca
14008e5ac: add       r12, -0x10
14008e5b0: xor       ebx, ebx
14008e5b2: nop       word ptr cs:[rax + rax]
14008e5c0: mov       r8, qword ptr [r14 + rbx + 0x18]
14008e5c5: sub       rsi, r8
14008e5c8: jb        0x14008e7f6
14008e5ce: mov       rdx, qword ptr [r14 + rbx + 0x10]
14008e5d3: lea       r15, [rcx + r8]
14008e5d7: call      0x145bfa0e7
14008e5dc: add       rbx, 0x10
14008e5e0: mov       rcx, r15
14008e5e3: cmp       r12, rbx
14008e5e6: jne       0x14008e5c0
14008e5e8: jmp       0x14008e7ca
14008e5ed: cmp       rbx, 1
14008e5f1: je        0x14008e7ca
14008e5f7: mov       r14, qword ptr [rbp - 8]
14008e5fb: mov       r12, qword ptr [rbp - 0x10]
14008e5ff: nop
14008e600: cmp       rsi, 3
14008e604: jbe       0x14008e814
14008e60a: mov       rdx, qword ptr [r15]
14008e60d: mov       r8, qword ptr [r15 + 8]
14008e611: add       rsi, -4
14008e615: mov       eax, dword ptr [r14]
14008e618: mov       dword ptr [rcx], eax
14008e61a: sub       rsi, r8
14008e61d: jb        0x14008e8aa
14008e623: lea       rbx, [rcx + r8]
14008e627: add       rbx, 4
14008e62b: add       rcx, 4
14008e62f: call      0x145bfa0e7
14008e634: add       r15, 0x10
14008e638: mov       rcx, rbx
14008e63b: cmp       r15, r12
14008e63e: jne       0x14008e600
14008e640: jmp       0x14008e7ca
14008e645: cmp       rbx, 1
14008e649: je        0x14008e7ca
14008e64f: mov       r14, qword ptr [rbp - 8]
14008e653: mov       r12, qword ptr [rbp - 0x10]
14008e657: nop       word ptr [rax + rax]
14008e660: cmp       rsi, 1
14008e664: jbe       0x14008e832
14008e66a: mov       rdx, qword ptr [r15]
14008e66d: mov       r8, qword ptr [r15 + 8]
14008e671: add       rsi, -2
14008e675: movzx     eax, word ptr [r14]
14008e679: mov       word ptr [rcx], ax
14008e67c: sub       rsi, r8
14008e67f: jb        0x14008e8c5
14008e685: lea       rbx, [rcx + r8]
14008e689: add       rbx, 2
14008e68d: add       rcx, 2
14008e691: call      0x145bfa0e7
14008e696: add       r15, 0x10
14008e69a: mov       rcx, rbx
14008e69d: cmp       r15, r12
14008e6a0: jne       0x14008e660
14008e6a2: jmp       0x14008e7ca
14008e6a7: cmp       rbx, 1
14008e6ab: je        0x14008e7ca
14008e6b1: mov       r14, qword ptr [rbp - 8]
14008e6b5: mov       r12, qword ptr [rbp - 0x10]
14008e6b9: nop       dword ptr [rax]
14008e6c0: cmp       rsi, 2
14008e6c4: jbe       0x14008e850
14008e6ca: mov       rdx, qword ptr [r15]
14008e6cd: mov       r8, qword ptr [r15 + 8]
14008e6d1: add       rsi, -3
14008e6d5: movzx     eax, byte ptr [r14 + 2]
14008e6da: mov       byte ptr [rcx + 2], al
14008e6dd: movzx     eax, word ptr [r14]
14008e6e1: mov       word ptr [rcx], ax
14008e6e4: sub       rsi, r8
14008e6e7: jb        0x14008e8e0
14008e6ed: lea       rbx, [rcx + r8]
14008e6f1: add       rbx, 3
14008e6f5: add       rcx, 3
14008e6f9: call      0x145bfa0e7
14008e6fe: add       r15, 0x10
14008e702: mov       rcx, rbx
14008e705: cmp       r15, r12
14008e708: jne       0x14008e6c0
14008e70a: jmp       0x14008e7ca
14008e70f: cmp       rbx, 1
14008e713: je        0x14008e7ca
14008e719: mov       r14, qword ptr [rbp - 8]
14008e71d: mov       r12, qword ptr [rbp - 0x10]
14008e721: nop       word ptr cs:[rax + rax]
14008e730: test      rsi, rsi
14008e733: je        0x14008e86e
14008e739: mov       rdx, qword ptr [r15]
14008e73c: mov       r8, qword ptr [r15 + 8]
14008e740: dec       rsi
14008e743: movzx     eax, byte ptr [r14]
14008e747: mov       byte ptr [rcx], al
14008e749: sub       rsi, r8
14008e74c: jb        0x14008e8fb
14008e752: lea       rbx, [rcx + r8]
14008e756: inc       rbx
14008e759: inc       rcx
14008e75c: call      0x145bfa0e7
14008e761: add       r15, 0x10
14008e765: mov       rcx, rbx
14008e768: cmp       r15, r12
14008e76b: jne       0x14008e730
14008e76d: jmp       0x14008e7ca
14008e76f: cmp       rbx, 1
14008e773: je        0x14008e7ca
14008e775: mov       rdx, qword ptr [rbp - 8]
14008e779: mov       r13, qword ptr [rbp + 0x70]
14008e77d: nop       dword ptr [rax]
14008e780: sub       rsi, r13
14008e783: jb        0x14008e88c
14008e789: mov       r14, qword ptr [r15]
14008e78c: mov       r12, qword ptr [r15 + 8]
14008e790: mov       rbx, rcx
14008e793: mov       r8, r13
14008e796: call      0x145bfa0e7
14008e79b: sub       rsi, r12
14008e79e: jb        0x14008e916
14008e7a4: mov       rcx, rbx
14008e7a7: add       rcx, r13
14008e7aa: lea       rbx, [rcx + r12]
14008e7ae: mov       rdx, r14
14008e7b1: mov       r8, r12
14008e7b4: call      0x145bfa0e7
14008e7b9: add       r15, 0x10
14008e7bd: mov       rcx, rbx
14008e7c0: cmp       r15, qword ptr [rbp - 0x10]
14008e7c4: mov       rdx, qword ptr [rbp - 8]
14008e7c8: jne       0x14008e780
14008e7ca: sub       rdi, rsi
14008e7cd: mov       qword ptr [rbp - 0x20], rdi
14008e7d1: mov       r13, qword ptr [rbp - 0x40]
14008e7d5: mov       qword ptr [r13 + 0x10], rdi
14008e7d9: movups    xmm0, xmmword ptr [rbp - 0x30]
14008e7dd: movups    xmmword ptr [r13], xmm0
14008e7e2: mov       rax, r13
14008e7e5: add       rsp, 0x78
14008e7e9: pop       rbx
14008e7ea: pop       rdi
14008e7eb: pop       rsi
14008e7ec: pop       r12
14008e7ee: pop       r13
14008e7f0: pop       r14
14008e7f2: pop       r15
14008e7f4: pop       rbp
14008e7f5: ret
14008e7f6: lea       rcx, [rip + 0x5d42c6b]
14008e7fd: lea       r8, [rip + 0x5d429fc]
14008e804: mov       edx, 0x13
14008e809: call      0x145d99830
14008e80e: nop
14008e80f: jmp       0x14008e92f
14008e814: lea       rcx, [rip + 0x5d42c4d]
14008e81b: lea       r8, [rip + 0x5d429de]
14008e822: mov       edx, 0x13
14008e827: call      0x145d99830
14008e82c: nop
14008e82d: jmp       0x14008e92f
14008e832: lea       rcx, [rip + 0x5d42c2f]
14008e839: lea       r8, [rip + 0x5d429c0]
14008e840: mov       edx, 0x13
14008e845: call      0x145d99830
14008e84a: nop
14008e84b: jmp       0x14008e92f
14008e850: lea       rcx, [rip + 0x5d42c11]
14008e857: lea       r8, [rip + 0x5d429a2]
14008e85e: mov       edx, 0x13
14008e863: call      0x145d99830
14008e868: nop
14008e869: jmp       0x14008e92f
14008e86e: lea       rcx, [rip + 0x5d42bf3]
14008e875: lea       r8, [rip + 0x5d42984]
14008e87c: mov       edx, 0x13
14008e881: call      0x145d99830
14008e886: nop
14008e887: jmp       0x14008e92f
14008e88c: lea       rcx, [rip + 0x5d42bd5]
14008e893: lea       r8, [rip + 0x5d42966]
14008e89a: mov       edx, 0x13
14008e89f: call      0x145d99830
14008e8a4: nop
14008e8a5: jmp       0x14008e92f
14008e8aa: lea       rcx, [rip + 0x5d42bb7]
14008e8b1: lea       r8, [rip + 0x5d42948]
14008e8b8: mov       edx, 0x13
14008e8bd: call      0x145d99830
14008e8c2: nop
14008e8c3: jmp       0x14008e92f
14008e8c5: lea       rcx, [rip + 0x5d42b9c]
14008e8cc: lea       r8, [rip + 0x5d4292d]
14008e8d3: mov       edx, 0x13
14008e8d8: call      0x145d99830
14008e8dd: nop
14008e8de: jmp       0x14008e92f
14008e8e0: lea       rcx, [rip + 0x5d42b81]
14008e8e7: lea       r8, [rip + 0x5d42912]
14008e8ee: mov       edx, 0x13
14008e8f3: call      0x145d99830
14008e8f8: nop
14008e8f9: jmp       0x14008e92f
14008e8fb: lea       rcx, [rip + 0x5d42b66]
14008e902: lea       r8, [rip + 0x5d428f7]
14008e909: mov       edx, 0x13
14008e90e: call      0x145d99830
14008e913: nop
14008e914: jmp       0x14008e92f
14008e916: lea       rcx, [rip + 0x5d42b4b]
14008e91d: lea       r8, [rip + 0x5d428dc]
14008e924: mov       edx, 0x13
14008e929: call      0x145d99830
14008e92e: nop
14008e92f: ud2
14008e931: mov       qword ptr [rsp + 0x20], 1
14008e93a: lea       rcx, [rbp - 0x30]
14008e93e: mov       r9d, 1
14008e944: xor       edx, edx
14008e946: call      0x145bfa970
14008e94b: nop
14008e94c: mov       rcx, qword ptr [rbp - 0x28]
14008e950: mov       r13, qword ptr [rbp - 0x20]
14008e954: jmp       0x14008e55b
