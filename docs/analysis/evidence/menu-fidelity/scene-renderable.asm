140811980: push      rsi
140811981: push      rbx
140811982: sub       rsp, 0x28
140811986: mov       eax, dword ptr [rip + 0x783287c]
14081198c: test      eax, eax
14081198e: jne       0x1408119e9
140811990: mov       cl, 1
140811992: xor       eax, eax
140811994: lock cmpxchg byte ptr [rip + 0x783283c], cl
14081199c: jne       0x140811a03
14081199e: mov       rsi, qword ptr [rip + 0x7879043]
1408119a5: mov       rax, qword ptr [rsi]
1408119a8: shl       rax, 1
1408119ab: test      rax, rax
1408119ae: jne       0x140811a11
1408119b0: movzx     eax, byte ptr [rip + 0x7832822]
1408119b7: movzx     eax, byte ptr [rip + 0x7832847]
1408119be: movzx     ebx, byte ptr [rip + 0x783283f]
1408119c5: mov       rcx, qword ptr [rsi]
1408119c8: shl       rcx, 1
1408119cb: test      rcx, rcx
1408119ce: jne       0x140811a45
1408119d0: xor       ecx, ecx
1408119d2: xchg      byte ptr [rip + 0x7832800], cl
1408119d8: cmp       cl, 2
1408119db: je        0x140811a33
1408119dd: xor       bl, 1
1408119e0: and       al, bl
1408119e2: add       rsp, 0x28
1408119e6: pop       rbx
1408119e7: pop       rsi
1408119e8: ret
1408119e9: lea       rcx, [rip + 0x78327e8]
1408119f0: call      0x145c273e2
1408119f5: mov       cl, 1
1408119f7: xor       eax, eax
1408119f9: lock cmpxchg byte ptr [rip + 0x78327d7], cl
140811a01: je        0x14081199e
140811a03: lea       rcx, [rip + 0x78327ce]
140811a0a: call      0x145d97960
140811a0f: jmp       0x14081199e
140811a11: call      0x145d986f0
140811a16: mov       ecx, eax
140811a18: movzx     eax, byte ptr [rip + 0x78327ba]
140811a1f: movzx     eax, byte ptr [rip + 0x78327df]
140811a26: movzx     ebx, byte ptr [rip + 0x78327d7]
140811a2d: test      cl, cl
140811a2f: jne       0x1408119c5
140811a31: jmp       0x1408119d0
140811a33: lea       rcx, [rip + 0x783279e]
140811a3a: mov       esi, eax
140811a3c: call      0x145d97a20
140811a41: mov       eax, esi
140811a43: jmp       0x1408119dd
140811a45: mov       esi, eax
140811a47: call      0x145d986f0
140811a4c: test      al, al
140811a4e: jne       0x140811a57
140811a50: mov       byte ptr [rip + 0x7832782], 1
140811a57: mov       eax, esi
140811a59: jmp       0x1408119d0
