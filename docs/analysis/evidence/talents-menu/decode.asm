1459c70d0: push      r15
1459c70d2: push      r14
1459c70d4: push      r13
1459c70d6: push      r12
1459c70d8: push      rsi
1459c70d9: push      rdi
1459c70da: push      rbp
1459c70db: push      rbx
1459c70dc: sub       rsp, 0x78
1459c70e0: cmp       byte ptr [rcx + 0x49], 0
1459c70e4: je        0x1459c70ee
1459c70e6: xor       r15d, r15d
1459c70e9: jmp       0x1459c7317
1459c70ee: mov       rsi, rcx
1459c70f1: lea       rdi, [rcx + 0x18]
1459c70f5: lea       rbx, [rsp + 0x48]
1459c70fa: movabs    rbp, 0x3a0000003a
1459c7104: lea       r14, [rsp + 0x30]
1459c7109: jmp       0x1459c713a
1459c710b: xor       eax, eax
1459c710d: movzx     ecx, byte ptr [r15 + 0x72]
1459c7112: movzx     edx, al
1459c7115: cmp       cl, dl
1459c7117: cmovb     edx, ecx
1459c711a: test      dl, dl
1459c711c: jne       0x1459c7317
1459c7122: nop       word ptr cs:[rax + rax]
1459c7130: cmp       byte ptr [rsi + 0x49], 1
1459c7134: je        0x1459c7314
1459c713a: mov       r12, qword ptr [rdi]
1459c713d: mov       rcx, rbx
1459c7140: mov       rdx, rdi
1459c7143: call      0x1459c7330
1459c7148: cmp       dword ptr [rsp + 0x48], 1
1459c714d: jne       0x1459c7170
1459c714f: mov       r13, qword ptr [rsp + 0x50]
1459c7154: mov       rax, qword ptr [rsp + 0x58]
1459c7159: mov       rcx, qword ptr [rsi + 8]
1459c715d: sub       r13, rcx
1459c7160: add       r12, rcx
1459c7163: mov       qword ptr [rsi + 8], rax
1459c7167: jmp       0x1459c719a
1459c7169: nop       dword ptr [rax]
1459c7170: cmp       byte ptr [rsi + 0x49], 0
1459c7174: jne       0x1459c70e6
1459c717a: mov       byte ptr [rsi + 0x49], 1
1459c717e: mov       r12, qword ptr [rsi + 8]
1459c7182: mov       r13, qword ptr [rsi + 0x10]
1459c7186: sub       r13, r12
1459c7189: setne     al
1459c718c: or        al, byte ptr [rsi + 0x48]
1459c718f: cmp       al, 1
1459c7191: jne       0x1459c70e6
1459c7197: add       r12, qword ptr [rdi]
1459c719a: mov       r15, qword ptr [rsi]
1459c719d: mov       qword ptr [rsp + 0x48], r12
1459c71a2: mov       qword ptr [rsp + 0x50], r13
1459c71a7: mov       qword ptr [rsp + 0x58], 0
1459c71b0: mov       qword ptr [rsp + 0x60], r13
1459c71b5: mov       byte ptr [rsp + 0x70], 1
1459c71ba: mov       qword ptr [rsp + 0x68], rbp
1459c71bf: mov       rcx, r14
1459c71c2: mov       rdx, rbx
1459c71c5: call      0x1459c7330
1459c71ca: cmp       dword ptr [rsp + 0x30], 1
1459c71cf: jne       0x1459c7130
1459c71d5: mov       rdx, qword ptr [rsp + 0x38]
1459c71da: mov       rax, qword ptr [rsp + 0x40]
1459c71df: mov       qword ptr [rsp + 0x28], rax
1459c71e4: mov       r14, rsi
1459c71e7: mov       rsi, rdi
1459c71ea: mov       rdi, rbx
1459c71ed: mov       rbx, rbp
1459c71f0: movzx     ebp, byte ptr [r15]
1459c71f4: mov       rcx, r12
1459c71f7: call      0x140089200
1459c71fc: mov       r8, rdx
1459c71ff: mov       ecx, ebp
1459c7201: mov       rbp, rbx
1459c7204: mov       rbx, rdi
1459c7207: mov       rdi, rsi
1459c720a: mov       rsi, r14
1459c720d: lea       r14, [rsp + 0x30]
1459c7212: mov       rdx, rax
1459c7215: call      0x145912d90
1459c721a: test      rdx, rdx
1459c721d: je        0x1459c7130
1459c7223: mov       r15, rdx
1459c7226: mov       rax, qword ptr [rsp + 0x28]
1459c722b: add       r12, rax
1459c722e: sub       r13, rax
1459c7231: mov       rcx, r12
1459c7234: mov       rdx, r13
1459c7237: call      0x140089200
1459c723c: test      rdx, rdx
1459c723f: je        0x1459c7130
1459c7245: mov       rcx, rax
1459c7248: cmp       rdx, 1
1459c724c: jne       0x1459c7268
1459c724e: movzx     r8d, byte ptr [rcx]
1459c7252: cmp       r8d, 0x2b
1459c7256: je        0x1459c7130
1459c725c: cmp       r8d, 0x2d
1459c7260: je        0x1459c7130
1459c7266: jmp       0x1459c726c
1459c7268: movzx     r8d, byte ptr [rcx]
1459c726c: xor       eax, eax
1459c726e: cmp       r8b, 0x2b
1459c7272: sete      al
1459c7275: mov       r8, rdx
1459c7278: sub       r8, rax
1459c727b: add       rcx, rax
1459c727e: cmp       r8, 3
1459c7282: jae       0x1459c72c7
1459c7284: test      r8, r8
1459c7287: je        0x1459c710b
1459c728d: movzx     eax, byte ptr [rcx]
1459c7290: add       eax, -0x30
1459c7293: cmp       eax, 9
1459c7296: ja        0x1459c7130
1459c729c: cmp       r8, 1
1459c72a0: je        0x1459c710d
1459c72a6: movzx     ecx, byte ptr [rcx + 1]
1459c72aa: add       ecx, -0x30
1459c72ad: cmp       ecx, 9
1459c72b0: ja        0x1459c7130
1459c72b6: movzx     eax, al
1459c72b9: add       eax, eax
1459c72bb: lea       eax, [rax + rax*4]
1459c72be: add       cl, al
1459c72c0: mov       eax, ecx
1459c72c2: jmp       0x1459c710d
1459c72c7: neg       rax
1459c72ca: add       rdx, rax
1459c72cd: neg       rdx
1459c72d0: xor       r8d, r8d
1459c72d3: xor       eax, eax
1459c72d5: mov       r9, rdx
1459c72d8: add       r9, r8
1459c72db: je        0x1459c710d
1459c72e1: mov       r9b, 0xa
1459c72e4: mul       r9b
1459c72e7: jo        0x1459c7130
1459c72ed: movzx     r10d, byte ptr [rcx + r8]
1459c72f2: add       r10d, -0x30
1459c72f6: add       al, r10b
1459c72f9: setb      r9b
1459c72fd: cmp       r10d, 9
1459c7301: ja        0x1459c7130
1459c7307: inc       r8
1459c730a: test      r9b, r9b
1459c730d: je        0x1459c72d5
1459c730f: jmp       0x1459c7130
1459c7314: xor       r15d, r15d
1459c7317: mov       rax, r15
1459c731a: add       rsp, 0x78
1459c731e: pop       rbx
1459c731f: pop       rbp
1459c7320: pop       rdi
1459c7321: pop       rsi
1459c7322: pop       r12
1459c7324: pop       r13
1459c7326: pop       r14
1459c7328: pop       r15
1459c732a: ret
