1459924d0: push      r15
1459924d2: push      r14
1459924d4: push      r13
1459924d6: push      r12
1459924d8: push      rsi
1459924d9: push      rdi
1459924da: push      rbp
1459924db: push      rbx
1459924dc: sub       rsp, 0x28
1459924e0: mov       rsi, r8
1459924e3: mov       rdi, rdx
1459924e6: mov       rbx, rcx
1459924e9: cmp       dword ptr [rcx], 1
1459924ec: jne       0x14599259c
1459924f2: mov       r15, qword ptr [rbx + 8]
1459924f6: mov       r12, qword ptr [rbx + 0x10]
1459924fa: mov       qword ptr [rbx + 8], 0
145992502: test      r15, r15
145992505: je        0x145992595
14599250b: movzx     ecx, byte ptr [rdi]
14599250e: mov       rdx, r15
145992511: mov       r8, r12
145992514: call      0x1459a2ab0
145992519: test      rdx, rdx
14599251c: je        0x145992595
14599251e: mov       r13, qword ptr [rsi + 0x10]
145992522: test      r13, r13
145992525: je        0x145992585
145992527: mov       qword ptr [rsp + 0x20], rdx
14599252c: mov       rbp, qword ptr [rsi + 8]
145992530: shl       r13, 4
145992534: xor       r14d, r14d
145992537: jmp       0x145992549
145992539: nop       dword ptr [rax]
145992540: add       r14, 0x10
145992544: cmp       r13, r14
145992547: je        0x14599256f
145992549: mov       rax, qword ptr [rbp + r14]
14599254e: cmp       qword ptr [rax + 0x38], r12
145992552: jne       0x145992540
145992554: mov       rcx, qword ptr [rax + 0x30]
145992558: mov       rdx, r15
14599255b: mov       r8, r12
14599255e: call      0x145c0a3e7
145992563: test      eax, eax
145992565: jne       0x145992540
145992567: movzx     ecx, byte ptr [rbp + r14 + 8]
14599256d: jmp       0x145992571
14599256f: xor       ecx, ecx
145992571: mov       rdx, qword ptr [rsp + 0x20]
145992576: mov       al, 1
145992578: cmp       cl, byte ptr [rdx + 0x9a]
14599257e: jb        0x145992595
145992580: jmp       0x145992636
145992585: xor       ecx, ecx
145992587: mov       al, 1
145992589: cmp       cl, byte ptr [rdx + 0x9a]
14599258f: jae       0x145992636
145992595: mov       qword ptr [rbx], 0
14599259c: cmp       byte ptr [rbx + 0x18], 0
1459925a0: je        0x145992634
1459925a6: mov       r14, qword ptr [rbx + 0x20]
1459925aa: mov       r15, qword ptr [rbx + 0x28]
1459925ae: mov       qword ptr [rbx + 0x20], 0
1459925b6: test      r14, r14
1459925b9: je        0x145992634
1459925bb: movzx     ecx, byte ptr [rdi]
1459925be: mov       rdx, r14
1459925c1: mov       r8, r15
1459925c4: call      0x1459a2ab0
1459925c9: test      rdx, rdx
1459925cc: je        0x145992634
1459925ce: mov       rdi, rdx
1459925d1: mov       rbx, qword ptr [rsi + 0x10]
1459925d5: test      rbx, rbx
1459925d8: je        0x145992628
1459925da: mov       rsi, qword ptr [rsi + 8]
1459925de: shl       rbx, 4
1459925e2: xor       r12d, r12d
1459925e5: jmp       0x1459925f9
1459925e7: nop       word ptr [rax + rax]
1459925f0: add       r12, 0x10
1459925f4: cmp       rbx, r12
1459925f7: je        0x145992628
1459925f9: mov       rax, qword ptr [rsi + r12]
1459925fd: cmp       qword ptr [rax + 0x38], r15
145992601: jne       0x1459925f0
145992603: mov       rcx, qword ptr [rax + 0x30]
145992607: mov       rdx, r14
14599260a: mov       r8, r15
14599260d: call      0x145c0a3e7
145992612: test      eax, eax
145992614: jne       0x1459925f0
145992616: movzx     ecx, byte ptr [rsi + r12 + 8]
14599261c: mov       al, 1
14599261e: cmp       cl, byte ptr [rdi + 0x9a]
145992624: jb        0x145992634
145992626: jmp       0x145992636
145992628: xor       ecx, ecx
14599262a: mov       al, 1
14599262c: cmp       cl, byte ptr [rdi + 0x9a]
145992632: jae       0x145992636
145992634: xor       eax, eax
145992636: add       rsp, 0x28
14599263a: pop       rbx
14599263b: pop       rbp
14599263c: pop       rdi
14599263d: pop       rsi
14599263e: pop       r12
145992640: pop       r13
145992642: pop       r14
145992644: pop       r15
145992646: ret
