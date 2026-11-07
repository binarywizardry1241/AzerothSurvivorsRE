14589c4d0: mov       r8, qword ptr [rcx + 0x80]
14589c4d7: mov       rax, qword ptr [rcx + 0x88]
14589c4de: shl       rax, 4
14589c4e2: lea       rcx, [rax + rax*4]
14589c4e6: xor       eax, eax
14589c4e8: xor       r9d, r9d
14589c4eb: nop       dword ptr [rax + rax]
14589c4f0: cmp       rcx, r9
14589c4f3: je        0x14589c508
14589c4f5: lea       r10, [r9 + 0x50]
14589c4f9: cmp       byte ptr [r8 + r9], dl
14589c4fd: mov       r9, r10
14589c500: jne       0x14589c4f0
14589c502: movzx     eax, byte ptr [r8 + r10 - 0x4f]
14589c508: ret
14589c509: int3
14589c50a: int3
14589c50b: int3
14589c50c: int3
14589c50d: int3
14589c50e: int3
14589c50f: int3
14589c510: push      rsi
14589c511: push      rbx
14589c512: sub       rsp, 0x28
14589c516: mov       ebx, edx
14589c518: mov       rsi, rcx
14589c51b: mov       rcx, r8
14589c51e: mov       rdx, r9
14589c521: call      0x14588d0d0
14589c526: mov       rcx, qword ptr [rsi + 0x20]
14589c52a: mov       rdx, qword ptr [rsi + 0x28]
14589c52e: shl       rdx, 4
14589c532: xor       r8d, r8d
14589c535: nop       word ptr cs:[rax + rax]
14589c540: cmp       rdx, r8
14589c543: je        0x14589c572
14589c545: lea       r9, [r8 + 0x10]
14589c549: cmp       byte ptr [rcx + r8], bl
14589c54d: mov       r8, r9
14589c550: jne       0x14589c540
14589c552: mov       rcx, qword ptr [rcx + r9 - 8]
14589c557: cmp       rcx, 0xc
14589c55b: mov       edx, 0xc
14589c560: cmovb     rdx, rcx
14589c564: test      rcx, rcx
14589c567: mov       ecx, 1
14589c56c: cmovne    rcx, rdx
14589c570: jmp       0x14589c577
14589c572: mov       ecx, 1
14589c577: cmp       rax, rcx
14589c57a: setb      al
14589c57d: add       rsp, 0x28
14589c581: pop       rbx
14589c582: pop       rsi
14589c583: ret
