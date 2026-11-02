14590fcc0: push      rsi
14590fcc1: mov       r9, qword ptr [rcx + 0x10]
14590fcc5: test      r9, r9
14590fcc8: je        0x14590fce1
14590fcca: mov       rdx, qword ptr [rcx + 8]
14590fcce: mov       ecx, r9d
14590fcd1: and       ecx, 3
14590fcd4: cmp       r9, 4
14590fcd8: jae       0x14590fce5
14590fcda: xor       r8d, r8d
14590fcdd: xor       eax, eax
14590fcdf: jmp       0x14590fd2f
14590fce1: xor       eax, eax
14590fce3: pop       rsi
14590fce4: ret
14590fce5: and       r9, 0xfffffffffffffffc
14590fce9: lea       r10, [rdx + 0x38]
14590fced: xor       r8d, r8d
14590fcf0: xor       eax, eax
14590fcf2: nop       word ptr cs:[rax + rax]
14590fd00: movzx     r11d, byte ptr [r10 - 0x30]
14590fd05: add       r11d, eax
14590fd08: movzx     eax, byte ptr [r10 - 0x20]
14590fd0d: movzx     esi, byte ptr [r10 - 0x10]
14590fd12: add       esi, eax
14590fd14: add       esi, r11d
14590fd17: movzx     eax, byte ptr [r10]
14590fd1b: add       eax, esi
14590fd1d: add       r8, 4
14590fd21: add       r10, 0x40
14590fd25: cmp       r9, r8
14590fd28: jne       0x14590fd00
14590fd2a: test      rcx, rcx
14590fd2d: je        0x14590fd51
14590fd2f: shl       r8, 4
14590fd33: add       rdx, r8
14590fd36: add       rdx, 8
14590fd3a: shl       ecx, 4
14590fd3d: xor       r8d, r8d
14590fd40: movzx     r9d, byte ptr [rdx + r8]
14590fd45: add       eax, r9d
14590fd48: add       r8, 0x10
14590fd4c: cmp       rcx, r8
14590fd4f: jne       0x14590fd40
14590fd51: pop       rsi
14590fd52: ret
