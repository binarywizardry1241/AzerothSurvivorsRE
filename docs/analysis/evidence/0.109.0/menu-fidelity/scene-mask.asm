1408116a0: push      rsi
1408116a1: push      rbx
1408116a2: sub       rsp, 0x28
1408116a6: mov       eax, dword ptr [rip + 0x7832b5c]
1408116ac: test      eax, eax
1408116ae: jne       0x1408116fb
1408116b0: mov       dl, 1
1408116b2: xor       eax, eax
1408116b4: lock cmpxchg byte ptr [rip + 0x7832b1c], dl
1408116bc: jne       0x14081171c
1408116be: mov       rsi, qword ptr [rip + 0x7879323]
1408116c5: mov       rax, qword ptr [rsi]
1408116c8: shl       rax, 1
1408116cb: test      rax, rax
1408116ce: jne       0x140811731
1408116d0: movzx     eax, byte ptr [rip + 0x7832b02]
1408116d7: mov       byte ptr [rip + 0x7832b27], cl
1408116dd: mov       rax, qword ptr [rsi]
1408116e0: shl       rax, 1
1408116e3: test      rax, rax
1408116e6: jne       0x14081175d
1408116e8: xor       eax, eax
1408116ea: xchg      byte ptr [rip + 0x7832ae8], al
1408116f0: cmp       al, 2
1408116f2: je        0x14081174b
1408116f4: add       rsp, 0x28
1408116f8: pop       rbx
1408116f9: pop       rsi
1408116fa: ret
1408116fb: lea       rax, [rip + 0x7832ad6]
140811702: mov       ebx, ecx
140811704: mov       rcx, rax
140811707: call      0x145c273e2
14081170c: mov       ecx, ebx
14081170e: mov       dl, 1
140811710: xor       eax, eax
140811712: lock cmpxchg byte ptr [rip + 0x7832abe], dl
14081171a: je        0x1408116be
14081171c: lea       rax, [rip + 0x7832ab5]
140811723: mov       ebx, ecx
140811725: mov       rcx, rax
140811728: call      0x145d97960
14081172d: mov       ecx, ebx
14081172f: jmp       0x1408116be
140811731: mov       ebx, ecx
140811733: call      0x145d986f0
140811738: movzx     ecx, byte ptr [rip + 0x7832a9a]
14081173f: mov       byte ptr [rip + 0x7832abf], bl
140811745: test      al, al
140811747: jne       0x1408116dd
140811749: jmp       0x1408116e8
14081174b: lea       rcx, [rip + 0x7832a86]
140811752: add       rsp, 0x28
140811756: pop       rbx
140811757: pop       rsi
140811758: jmp       0x145d97a20
14081175d: call      0x145d986f0
140811762: test      al, al
140811764: jne       0x1408116e8
140811766: mov       byte ptr [rip + 0x7832a6c], 1
14081176d: jmp       0x1408116e8
