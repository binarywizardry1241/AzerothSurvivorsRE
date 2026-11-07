1458a9e50: push      rbp
1458a9e51: push      r14
1458a9e53: push      rsi
1458a9e54: push      rdi
1458a9e55: push      rbx
1458a9e56: sub       rsp, 0xb0
1458a9e5d: lea       rbp, [rsp + 0x80]
1458a9e65: mov       qword ptr [rbp + 0x28], 0xfffffffffffffffe
1458a9e6d: mov       rdx, r9
1458a9e70: mov       rsi, rcx
1458a9e73: mov       rcx, r8
1458a9e76: call      0x140089200
1458a9e7b: mov       qword ptr [rbp - 0x28], 0
1458a9e83: mov       qword ptr [rbp - 0x20], rdx
1458a9e87: mov       qword ptr [rbp - 0x18], rax
1458a9e8b: mov       qword ptr [rbp - 0x10], rdx
1458a9e8f: mov       qword ptr [rbp - 8], 0
1458a9e97: mov       qword ptr [rbp], rdx
1458a9e9b: movabs    rax, 0x7c0000007c
1458a9ea5: mov       qword ptr [rbp + 8], rax
1458a9ea9: mov       byte ptr [rbp + 0x10], 1
1458a9ead: mov       word ptr [rbp + 0x18], 1
1458a9eb3: lea       rcx, [rbp - 0x40]
1458a9eb7: lea       rdx, [rbp - 0x28]
1458a9ebb: call      0x1459bd2c0
1458a9ec0: mov       rcx, qword ptr [rbp - 0x38]
1458a9ec4: cmp       qword ptr [rbp - 0x30], 4
1458a9ec9: jne       0x1458a9ee9
1458a9ecb: cmp       qword ptr [rcx + 8], 6
1458a9ed0: jne       0x1458a9ee9
1458a9ed2: mov       rax, qword ptr [rcx]
1458a9ed5: mov       edx, 0x656c6174
1458a9eda: xor       edx, dword ptr [rax]
1458a9edc: movzx     eax, word ptr [rax + 4]
1458a9ee0: xor       eax, 0x746e
1458a9ee5: or        eax, edx
1458a9ee7: je        0x1458a9f1a
1458a9ee9: mov       qword ptr [rsi + 8], 0xffffffffffffffff
1458a9ef1: mov       rdx, qword ptr [rbp - 0x40]
1458a9ef5: test      rdx, rdx
1458a9ef8: je        0x1458a9f09
1458a9efa: shl       rdx, 4
1458a9efe: mov       r8d, 8
1458a9f04: call      0x1400021d0
1458a9f09: mov       rax, rsi
1458a9f0c: add       rsp, 0xb0
1458a9f13: pop       rbx
1458a9f14: pop       rdi
1458a9f15: pop       rsi
1458a9f16: pop       r14
1458a9f18: pop       rbp
1458a9f19: ret
1458a9f1a: mov       rdx, qword ptr [rcx + 0x18]
1458a9f1e: test      rdx, rdx
1458a9f21: je        0x1458a9ee9
1458a9f23: mov       rdi, qword ptr [rcx + 0x10]
1458a9f27: cmp       rdx, 1
1458a9f2b: jne       0x1458a9f3f
1458a9f2d: movzx     r8d, byte ptr [rdi]
1458a9f31: cmp       r8d, 0x2b
1458a9f35: je        0x1458a9ee9
1458a9f37: cmp       r8d, 0x2d
1458a9f3b: je        0x1458a9ee9
1458a9f3d: jmp       0x1458a9f43
1458a9f3f: movzx     r8d, byte ptr [rdi]
1458a9f43: xor       eax, eax
1458a9f45: cmp       r8b, 0x2b
1458a9f49: sete      al
1458a9f4c: mov       r8, rdx
1458a9f4f: sub       r8, rax
1458a9f52: add       rdi, rax
1458a9f55: cmp       r8, 3
1458a9f59: jae       0x1458a9f93
1458a9f5b: test      r8, r8
1458a9f5e: je        0x1458a9fdc
1458a9f60: movzx     eax, byte ptr [rdi]
1458a9f63: add       eax, -0x30
1458a9f66: cmp       eax, 9
1458a9f69: ja        0x1458a9ee9
1458a9f6f: cmp       r8, 1
1458a9f73: je        0x1458a9fde
1458a9f75: movzx     edx, byte ptr [rdi + 1]
1458a9f79: add       edx, -0x30
1458a9f7c: cmp       edx, 9
1458a9f7f: ja        0x1458a9ee9
1458a9f85: movzx     eax, al
1458a9f88: add       eax, eax
1458a9f8a: lea       eax, [rax + rax*4]
1458a9f8d: add       dl, al
1458a9f8f: mov       eax, edx
1458a9f91: jmp       0x1458a9fde
1458a9f93: neg       rax
1458a9f96: add       rdx, rax
1458a9f99: neg       rdx
1458a9f9c: xor       r8d, r8d
1458a9f9f: mov       r9b, 0xa
1458a9fa2: xor       eax, eax
1458a9fa4: mov       r10, rdx
1458a9fa7: add       r10, r8
1458a9faa: je        0x1458a9fde
1458a9fac: mul       r9b
1458a9faf: jo        0x1458a9ee9
1458a9fb5: movzx     r11d, byte ptr [rdi + r8]
1458a9fba: add       r11d, -0x30
1458a9fbe: add       al, r11b
1458a9fc1: setb      r10b
1458a9fc5: cmp       r11d, 9
1458a9fc9: ja        0x1458a9ee9
1458a9fcf: inc       r8
1458a9fd2: test      r10b, r10b
1458a9fd5: je        0x1458a9fa4
1458a9fd7: jmp       0x1458a9ee9
1458a9fdc: xor       eax, eax
1458a9fde: mov       r8, qword ptr [rcx + 0x28]
1458a9fe2: test      r8, r8
1458a9fe5: je        0x1458a9ee9
1458a9feb: mov       rbx, qword ptr [rcx + 0x20]
1458a9fef: cmp       r8, 1
1458a9ff3: jne       0x1458aa00c
1458a9ff5: movzx     edx, byte ptr [rbx]
1458a9ff8: cmp       edx, 0x2b
1458a9ffb: je        0x1458a9ee9
1458aa001: cmp       edx, 0x2d
1458aa004: je        0x1458a9ee9
1458aa00a: jmp       0x1458aa00f
1458aa00c: movzx     edx, byte ptr [rbx]
1458aa00f: xor       r9d, r9d
1458aa012: cmp       dl, 0x2b
1458aa015: sete      r9b
1458aa019: mov       rdx, r8
1458aa01c: sub       rdx, r9
1458aa01f: add       rbx, r9
1458aa022: cmp       rdx, 9
1458aa026: jae       0x1458aa0ae
1458aa02c: test      rdx, rdx
1458aa02f: je        0x1458aa0ff
1458aa035: movzx     edi, byte ptr [rbx]
1458aa038: add       edi, -0x30
1458aa03b: cmp       edi, 9
1458aa03e: ja        0x1458a9ee9
1458aa044: cmp       rdx, 1
1458aa048: je        0x1458aa101
1458aa04e: movzx     r8d, byte ptr [rbx + 1]
1458aa053: add       r8d, -0x30
1458aa057: cmp       r8d, 9
1458aa05b: ja        0x1458a9ee9
1458aa061: lea       r9d, [rdi + rdi*4]
1458aa065: lea       edi, [r8 + r9*2]
1458aa069: cmp       rdx, 2
1458aa06d: je        0x1458aa101
1458aa073: movzx     r8d, byte ptr [rbx + 2]
1458aa078: add       r8d, -0x30
1458aa07c: cmp       r8d, 9
1458aa080: ja        0x1458a9ee9
1458aa086: mov       r10, rcx
1458aa089: lea       r9d, [rdi + rdi*4]
1458aa08d: lea       edi, [r8 + r9*2]
1458aa091: cmp       rdx, 3
1458aa095: jne       0x1458aa1c8
1458aa09b: mov       rcx, r10
1458aa09e: shl       rdi, 0x20
1458aa0a2: test      dil, 1
1458aa0a6: jne       0x1458a9ee9
1458aa0ac: jmp       0x1458aa10f
1458aa0ae: neg       r9
1458aa0b1: add       r8, r9
1458aa0b4: neg       r8
1458aa0b7: xor       edi, edi
1458aa0b9: mov       r10d, 0xa
1458aa0bf: xor       r9d, r9d
1458aa0c2: mov       rdx, r8
1458aa0c5: add       rdx, r9
1458aa0c8: je        0x1458aa101
1458aa0ca: mov       r11d, eax
1458aa0cd: mov       eax, edi
1458aa0cf: mul       r10d
1458aa0d2: jo        0x1458aa298
1458aa0d8: mov       edi, eax
1458aa0da: movzx     eax, byte ptr [rbx + r9]
1458aa0df: add       eax, -0x30
1458aa0e2: add       edi, eax
1458aa0e4: setb      dl
1458aa0e7: cmp       eax, 9
1458aa0ea: ja        0x1458a9ee9
1458aa0f0: mov       eax, r11d
1458aa0f3: inc       r9
1458aa0f6: test      dl, dl
1458aa0f8: je        0x1458aa0c2
1458aa0fa: jmp       0x1458a9ee9
1458aa0ff: xor       edi, edi
1458aa101: shl       rdi, 0x20
1458aa105: test      dil, 1
1458aa109: jne       0x1458a9ee9
1458aa10f: shr       rdi, 0x20
1458aa113: mov       r9d, 0x6e
1458aa119: mov       ebx, 2
1458aa11e: mov       edx, edi
1458aa120: lea       r8d, [r9 - 0x1e]
1458aa124: sub       edx, r8d
1458aa127: jb        0x1458aa14e
1458aa129: lea       r8d, [r9 - 0xf]
1458aa12d: sub       edx, r8d
1458aa130: jb        0x1458aa153
1458aa132: sub       edx, r9d
1458aa135: jb        0x1458aa155
1458aa137: add       r9d, 0x2d
1458aa13b: add       ebx, 3
1458aa13e: cmp       r9d, 0x36b
1458aa145: jne       0x1458aa120
1458aa147: mov       ebx, 0x33
1458aa14c: jmp       0x1458aa155
1458aa14e: add       ebx, -2
1458aa151: jmp       0x1458aa155
1458aa153: dec       ebx
1458aa155: mov       r8, qword ptr [rcx + 0x30]
1458aa159: mov       qword ptr [rbp + 0x20], rcx
1458aa15d: mov       r9, qword ptr [rcx + 0x38]
1458aa161: lea       rcx, [rbp - 0x28]
1458aa165: mov       r14d, eax
1458aa168: mov       edx, eax
1458aa16a: call      0x14590fa90
1458aa16f: nop
1458aa170: lea       rcx, [rbp - 0x58]
1458aa174: lea       rdx, [rbp - 0x28]
1458aa178: mov       r8d, r14d
1458aa17b: mov       r9d, ebx
1458aa17e: call      0x1459106e0
1458aa183: nop
1458aa184: mov       rax, qword ptr [rbp - 0x48]
1458aa188: mov       qword ptr [rbp - 0x15], rax
1458aa18c: movups    xmm0, xmmword ptr [rbp - 0x58]
1458aa190: movups    xmmword ptr [rbp - 0x25], xmm0
1458aa194: mov       dword ptr [rsi], edi
1458aa196: mov       byte ptr [rsi + 4], r14b
1458aa19a: movups    xmm0, xmmword ptr [rbp - 0x28]
1458aa19e: mov       rax, qword ptr [rbp - 0x1d]
1458aa1a2: mov       rcx, qword ptr [rbp - 0x15]
1458aa1a6: movups    xmmword ptr [rsi + 5], xmm0
1458aa1aa: mov       qword ptr [rsi + 0x10], rax
1458aa1ae: mov       qword ptr [rsi + 0x18], rcx
1458aa1b2: mov       rcx, qword ptr [rbp + 0x20]
1458aa1b6: mov       rdx, qword ptr [rbp - 0x40]
1458aa1ba: test      rdx, rdx
1458aa1bd: jne       0x1458a9efa
1458aa1c3: jmp       0x1458a9f09
1458aa1c8: movzx     r8d, byte ptr [rbx + 3]
1458aa1cd: add       r8d, -0x30
1458aa1d1: cmp       r8d, 9
1458aa1d5: mov       rcx, r10
1458aa1d8: ja        0x1458a9ee9
1458aa1de: lea       r9d, [rdi + rdi*4]
1458aa1e2: lea       edi, [r8 + r9*2]
1458aa1e6: cmp       rdx, 4
1458aa1ea: je        0x1458aa09b
1458aa1f0: movzx     r8d, byte ptr [rbx + 4]
1458aa1f5: add       r8d, -0x30
1458aa1f9: cmp       r8d, 9
1458aa1fd: mov       rcx, r10
1458aa200: ja        0x1458a9ee9
1458aa206: lea       r9d, [rdi + rdi*4]
1458aa20a: lea       edi, [r8 + r9*2]
1458aa20e: cmp       rdx, 5
1458aa212: je        0x1458aa09b
1458aa218: movzx     r8d, byte ptr [rbx + 5]
1458aa21d: add       r8d, -0x30
1458aa221: cmp       r8d, 9
1458aa225: mov       rcx, r10
1458aa228: ja        0x1458a9ee9
1458aa22e: lea       r9d, [rdi + rdi*4]
1458aa232: lea       edi, [r8 + r9*2]
1458aa236: cmp       rdx, 6
1458aa23a: je        0x1458aa09b
1458aa240: movzx     r8d, byte ptr [rbx + 6]
1458aa245: add       r8d, -0x30
1458aa249: cmp       r8d, 9
1458aa24d: mov       rcx, r10
1458aa250: ja        0x1458a9ee9
1458aa256: lea       r9d, [rdi + rdi*4]
1458aa25a: lea       edi, [r8 + r9*2]
1458aa25e: cmp       rdx, 7
1458aa262: je        0x1458aa09b
1458aa268: movzx     r8d, byte ptr [rbx + 7]
1458aa26d: add       r8d, -0x30
1458aa271: cmp       r8d, 9
1458aa275: mov       rcx, r10
1458aa278: ja        0x1458a9ee9
1458aa27e: lea       edx, [rdi + rdi*4]
1458aa281: lea       edi, [r8 + rdx*2]
1458aa285: shl       rdi, 0x20
1458aa289: test      dil, 1
1458aa28d: jne       0x1458a9ee9
1458aa293: jmp       0x1458aa10f
1458aa298: movzx     eax, byte ptr [rbx + r9]
1458aa29d: add       al, 0xd0
1458aa29f: xor       edi, edi
1458aa2a1: cmp       al, 0xa
1458aa2a3: setb      dil
1458aa2a7: shl       edi, 8
1458aa2aa: add       rdi, 0x101
1458aa2b1: mov       eax, r11d
1458aa2b4: test      dil, 1
1458aa2b8: jne       0x1458a9ee9
1458aa2be: jmp       0x1458aa10f
