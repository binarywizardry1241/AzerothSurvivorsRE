14590f1f0: mov       rax, qword ptr [rcx + 0x50]
14590f1f4: mov       rdx, qword ptr [rcx + 0x58]
14590f1f8: shl       rdx, 6
14590f1fc: xor       r8d, r8d
14590f1ff: nop
14590f200: cmp       rdx, r8
14590f203: je        0x14590f21c
14590f205: cmp       byte ptr [rax + r8], 0x22
14590f20a: lea       r8, [r8 + 0x40]
14590f20e: ja        0x14590f200
14590f210: cmp       byte ptr [rcx + 0x72], 1
14590f214: je        0x14590f21f
14590f216: cmp       byte ptr [rcx + 0x73], 0
14590f21a: jne       0x14590f21f
14590f21c: xor       eax, eax
14590f21e: ret
14590f21f: movzx     eax, byte ptr [rcx + 0x70]
14590f223: test      al, 1
14590f225: sete      cl
14590f228: test      al, al
14590f22a: setne     al
14590f22d: and       al, cl
14590f22f: ret
