140811780: push      rsi
140811781: push      rbx
140811782: sub       rsp, 0x28
140811786: mov       eax, dword ptr [rip + 0x7832a7c]
14081178c: test      eax, eax
14081178e: jne       0x1408117dd
140811790: mov       cl, 1
140811792: xor       eax, eax
140811794: lock cmpxchg byte ptr [rip + 0x7832a3c], cl
14081179c: jne       0x1408117f7
14081179e: mov       rsi, qword ptr [rip + 0x7879243]
1408117a5: mov       rax, qword ptr [rsi]
1408117a8: shl       rax, 1
1408117ab: test      rax, rax
1408117ae: jne       0x140811805
1408117b0: movzx     eax, byte ptr [rip + 0x7832a22]
1408117b7: movzx     eax, byte ptr [rip + 0x7832a47]
1408117be: mov       rcx, qword ptr [rsi]
1408117c1: shl       rcx, 1
1408117c4: test      rcx, rcx
1408117c7: jne       0x140811837
1408117c9: xor       ecx, ecx
1408117cb: xchg      byte ptr [rip + 0x7832a07], cl
1408117d1: cmp       cl, 2
1408117d4: je        0x140811820
1408117d6: add       rsp, 0x28
1408117da: pop       rbx
1408117db: pop       rsi
1408117dc: ret
1408117dd: lea       rcx, [rip + 0x78329f4]
1408117e4: call      0x145c273e2
1408117e9: mov       cl, 1
1408117eb: xor       eax, eax
1408117ed: lock cmpxchg byte ptr [rip + 0x78329e3], cl
1408117f5: je        0x14081179e
1408117f7: lea       rcx, [rip + 0x78329da]
1408117fe: call      0x145d97960
140811803: jmp       0x14081179e
140811805: call      0x145d986f0
14081180a: mov       ecx, eax
14081180c: movzx     eax, byte ptr [rip + 0x78329c6]
140811813: movzx     eax, byte ptr [rip + 0x78329eb]
14081181a: test      cl, cl
14081181c: jne       0x1408117be
14081181e: jmp       0x1408117c9
140811820: lea       rcx, [rip + 0x78329b1]
140811827: mov       ebx, eax
140811829: call      0x145d97a20
14081182e: mov       eax, ebx
140811830: add       rsp, 0x28
140811834: pop       rbx
140811835: pop       rsi
140811836: ret
140811837: mov       ebx, eax
140811839: call      0x145d986f0
14081183e: test      al, al
140811840: jne       0x140811849
140811842: mov       byte ptr [rip + 0x7832990], 1
140811849: mov       eax, ebx
14081184b: jmp       0x1408117c9
