1459b04e0: push      r15
1459b04e2: push      r14
1459b04e4: push      r13
1459b04e6: push      r12
1459b04e8: push      rsi
1459b04e9: push      rdi
1459b04ea: push      rbp
1459b04eb: push      rbx
1459b04ec: sub       rsp, 0x28
1459b04f0: cmp       rcx, rdx
1459b04f3: je        0x1459b071b
1459b04f9: mov       ebx, 2
1459b04fe: movabs    r14, 0x2800100000000200
1459b0508: jmp       0x1459b0530
1459b050a: or        r9b, 0xc0
1459b050e: mov       byte ptr [r10 + rsi], r9b
1459b0512: mov       byte ptr [r10 + rsi + 1], al
1459b0517: mov       eax, 2
1459b051c: nop       dword ptr [rax]
1459b0520: add       rax, rsi
1459b0523: mov       qword ptr [r8 + 0x10], rax
1459b0527: cmp       rcx, rdx
1459b052a: je        0x1459b071b
1459b0530: movzx     r9d, byte ptr [rcx]
1459b0534: movzx     edi, r9b
1459b0538: test      dil, dil
1459b053b: js        0x1459b0560
1459b053d: inc       rcx
1459b0540: mov       rsi, qword ptr [r8 + 0x10]
1459b0544: cmp       edi, 0x3d
1459b0547: jbe       0x1459b05e0
1459b054d: jmp       0x1459b0604
1459b0552: nop       word ptr cs:[rax + rax]
1459b0560: mov       eax, edi
1459b0562: and       eax, 0x1f
1459b0565: movzx     r10d, byte ptr [rcx + 1]
1459b056a: and       r10d, 0x3f
1459b056e: cmp       dil, 0xdf
1459b0572: jbe       0x1459b05b2
1459b0574: movzx     edi, byte ptr [rcx + 2]
1459b0578: shl       r10d, 6
1459b057c: and       edi, 0x3f
1459b057f: or        edi, r10d
1459b0582: cmp       r9b, 0xf0
1459b0586: jb        0x1459b05c9
1459b0588: movzx     r9d, byte ptr [rcx + 3]
1459b058d: add       rcx, 4
1459b0591: and       eax, 7
1459b0594: shl       eax, 0x12
1459b0597: shl       edi, 6
1459b059a: and       r9d, 0x3f
1459b059e: or        r9d, edi
1459b05a1: or        r9d, eax
1459b05a4: mov       edi, r9d
1459b05a7: mov       rsi, qword ptr [r8 + 0x10]
1459b05ab: cmp       edi, 0x3d
1459b05ae: jbe       0x1459b05e0
1459b05b0: jmp       0x1459b0604
1459b05b2: add       rcx, 2
1459b05b6: shl       eax, 6
1459b05b9: or        eax, r10d
1459b05bc: mov       edi, eax
1459b05be: mov       rsi, qword ptr [r8 + 0x10]
1459b05c2: cmp       edi, 0x3d
1459b05c5: jbe       0x1459b05e0
1459b05c7: jmp       0x1459b0604
1459b05c9: add       rcx, 3
1459b05cd: shl       eax, 0xc
1459b05d0: or        edi, eax
1459b05d2: mov       rsi, qword ptr [r8 + 0x10]
1459b05d6: cmp       edi, 0x3d
1459b05d9: ja        0x1459b0604
1459b05db: nop       dword ptr [rax + rax]
1459b05e0: mov       ebp, 0x20
1459b05e5: mov       eax, edi
1459b05e7: bt        r14, rax
1459b05eb: jae       0x1459b0604
1459b05ed: cmp       qword ptr [r8], rsi
1459b05f0: je        0x1459b0613
1459b05f2: mov       rax, qword ptr [r8 + 8]
1459b05f6: mov       byte ptr [rax + rsi], bpl
1459b05fa: mov       eax, 1
1459b05ff: jmp       0x1459b0520
1459b0604: cmp       edi, 0x80
1459b060a: jae       0x1459b0647
1459b060c: mov       ebp, edi
1459b060e: cmp       qword ptr [r8], rsi
1459b0611: jne       0x1459b05f2
1459b0613: mov       qword ptr [rsp + 0x20], 1
1459b061c: mov       rdi, r8
1459b061f: mov       r8d, 1
1459b0625: mov       r9d, 1
1459b062b: mov       r15, rcx
1459b062e: mov       rcx, rdi
1459b0631: mov       r12, rdx
1459b0634: mov       rdx, rsi
1459b0637: call      0x145cfd5e0
1459b063c: mov       rcx, r15
1459b063f: mov       rdx, r12
1459b0642: mov       r8, rdi
1459b0645: jmp       0x1459b05f2
1459b0647: cmp       edi, 0x10000
1459b064d: mov       eax, 4
1459b0652: sbb       rax, 0
1459b0656: cmp       edi, 0x800
1459b065c: cmovb     rax, rbx
1459b0660: mov       r9, qword ptr [r8]
1459b0663: sub       r9, rsi
1459b0666: cmp       rax, r9
1459b0669: ja        0x1459b06e7
1459b066b: mov       eax, edi
1459b066d: and       al, 0x3f
1459b066f: or        al, 0x80
1459b0671: mov       r9d, edi
1459b0674: shr       r9d, 6
1459b0678: mov       r10, qword ptr [r8 + 8]
1459b067c: cmp       edi, 0x800
1459b0682: jb        0x1459b050a
1459b0688: and       r9b, 0x3f
1459b068c: or        r9b, 0x80
1459b0690: mov       r11d, edi
1459b0693: shr       r11d, 0xc
1459b0697: cmp       edi, 0xffff
1459b069d: ja        0x1459b06bb
1459b069f: or        r11b, 0xe0
1459b06a3: mov       byte ptr [r10 + rsi], r11b
1459b06a7: mov       byte ptr [r10 + rsi + 1], r9b
1459b06ac: mov       byte ptr [r10 + rsi + 2], al
1459b06b1: mov       eax, 3
1459b06b6: jmp       0x1459b0520
1459b06bb: and       r11b, 0x3f
1459b06bf: or        r11b, 0x80
1459b06c3: shr       edi, 0x12
1459b06c6: or        dil, 0xf0
1459b06ca: mov       byte ptr [r10 + rsi], dil
1459b06ce: mov       byte ptr [r10 + rsi + 1], r11b
1459b06d3: mov       byte ptr [r10 + rsi + 2], r9b
1459b06d8: mov       byte ptr [r10 + rsi + 3], al
1459b06dd: mov       eax, 4
1459b06e2: jmp       0x1459b0520
1459b06e7: mov       qword ptr [rsp + 0x20], 1
1459b06f0: mov       r9d, 1
1459b06f6: mov       r15, rcx
1459b06f9: mov       rcx, r8
1459b06fc: mov       r12, rdx
1459b06ff: mov       rdx, rsi
1459b0702: mov       r13, r8
1459b0705: mov       r8, rax
1459b0708: call      0x145cfd5e0
1459b070d: mov       rcx, r15
1459b0710: mov       rdx, r12
1459b0713: mov       r8, r13
1459b0716: jmp       0x1459b066b
1459b071b: add       rsp, 0x28
1459b071f: pop       rbx
1459b0720: pop       rbp
1459b0721: pop       rdi
1459b0722: pop       rsi
1459b0723: pop       r12
1459b0725: pop       r13
1459b0727: pop       r14
1459b0729: pop       r15
1459b072b: ret
