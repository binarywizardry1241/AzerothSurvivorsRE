140811a60: push      rsi
140811a61: push      rbx
140811a62: sub       rsp, 0x28
140811a66: mov       eax, dword ptr [rip + 0x783279c]
140811a6c: test      eax, eax
140811a6e: jne       0x140811ac6
140811a70: mov       cl, 1
140811a72: xor       eax, eax
140811a74: lock cmpxchg byte ptr [rip + 0x783275c], cl
140811a7c: jne       0x140811ae0
140811a7e: mov       rsi, qword ptr [rip + 0x7878f63]
140811a85: mov       rax, qword ptr [rsi]
140811a88: shl       rax, 1
140811a8b: test      rax, rax
140811a8e: jne       0x140811aee
140811a90: movzx     eax, byte ptr [rip + 0x7832742]
140811a97: movzx     eax, byte ptr [rip + 0x7832767]
140811a9e: movzx     ebx, byte ptr [rip + 0x7832761]
140811aa5: mov       rcx, qword ptr [rsi]
140811aa8: shl       rcx, 1
140811aab: test      rcx, rcx
140811aae: jne       0x140811b22
140811ab0: xor       ecx, ecx
140811ab2: xchg      byte ptr [rip + 0x7832720], cl
140811ab8: cmp       cl, 2
140811abb: je        0x140811b10
140811abd: and       al, bl
140811abf: add       rsp, 0x28
140811ac3: pop       rbx
140811ac4: pop       rsi
140811ac5: ret
140811ac6: lea       rcx, [rip + 0x783270b]
140811acd: call      0x145c273e2
140811ad2: mov       cl, 1
140811ad4: xor       eax, eax
140811ad6: lock cmpxchg byte ptr [rip + 0x78326fa], cl
140811ade: je        0x140811a7e
140811ae0: lea       rcx, [rip + 0x78326f1]
140811ae7: call      0x145d97960
140811aec: jmp       0x140811a7e
140811aee: call      0x145d986f0
140811af3: mov       ecx, eax
140811af5: movzx     eax, byte ptr [rip + 0x78326dd]
140811afc: movzx     eax, byte ptr [rip + 0x7832702]
140811b03: movzx     ebx, byte ptr [rip + 0x78326fc]
140811b0a: test      cl, cl
140811b0c: jne       0x140811aa5
140811b0e: jmp       0x140811ab0
140811b10: lea       rcx, [rip + 0x78326c1]
140811b17: mov       esi, eax
140811b19: call      0x145d97a20
140811b1e: mov       eax, esi
140811b20: jmp       0x140811abd
140811b22: mov       esi, eax
140811b24: call      0x145d986f0
140811b29: test      al, al
140811b2b: jne       0x140811b34
140811b2d: mov       byte ptr [rip + 0x78326a5], 1
140811b34: mov       eax, esi
140811b36: jmp       0x140811ab0
