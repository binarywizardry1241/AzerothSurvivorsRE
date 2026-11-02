; Current0.115.0 SHA256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Selected 0x1459840b1..0x14598418c
0x1459840b1: movups xmm0, xmmword ptr [rdi + 0x20]
0x1459840b5: mov byte ptr [rbp + 0x147], 1
0x1459840bc: movups xmmword ptr [rsp + 0x20], xmm0
0x1459840c1: mov r9d, 4
0x1459840c7: lea rcx, [rbp + 0xe0]
0x1459840ce: mov rdx, r15
0x1459840d1: lea r8, [rip + 0x19abe11] ; @0x14732fee9 b'nameicondmgcolortoprevived\x0csink-test t=\xc5 '
0x1459840d8: call 0x145858350
0x1459840dd: nop
0x1459840de: movups xmm0, xmmword ptr [rdi + 0x30]
0x1459840e2: mov byte ptr [rbp + 0x147], 1
0x1459840e9: movups xmmword ptr [rsp + 0x20], xmm0
0x1459840ee: mov r9d, 4
0x1459840f4: mov rcx, r15
0x1459840f7: lea rdx, [rbp + 0xe0]
0x1459840fe: lea r8, [rip + 0x19abde8] ; @0x14732feed b'icondmgcolortoprevived\x0csink-test t=\xc5 '
0x145984105: call 0x145858350
0x14598410a: nop
0x14598410b: movsd xmm0, qword ptr [rdi + 0x40]
0x145984110: call 0x145d14667
0x145984115: mov byte ptr [rbp + 0x147], 1
0x14598411c: movsd qword ptr [rsp + 0x20], xmm0
0x145984122: mov r9d, 3
0x145984128: mov rcx, rsi
0x14598412b: mov rdx, r15
0x14598412e: lea r8, [rip + 0x19abdbc] ; @0x14732fef1 b'dmgcolortoprevived\x0csink-test t=\xc5 '
0x145984135: call 0x14584ec40
0x14598413a: nop
0x14598413b: mov bl, byte ptr [rdi + 0x48]
0x14598413e: mov r8d, 4
0x145984144: mov rcx, rsi
0x145984147: lea rdx, [rip + 0x19ae63a] ; @0x147332788 b'procpartsNone'
0x14598414e: call 0x1458580a0
0x145984153: nop
0x145984154: movzx esi, bl
0x145984157: xor rsi, 5
0x14598415b: mov rax, qword ptr [rbp + 0xc0]
0x145984162: mov rcx, qword ptr [rbp + 0xd0]
0x145984169: sub rax, rcx
0x14598416c: cmp rsi, rax
0x14598416f: ja 0x145984c5e
0x145984175: test bl, bl
0x145984177: lea rdx, [rip + 0x1688ee7] ; @0x14700d065 b'falsetrue\x01"\xc0\x01"'
0x14598417e: lea rax, [rip + 0x1688ee5] ; @0x14700d06a b'true\x01"\xc0\x01"'
0x145984185: cmovne rdx, rax
0x145984189: add rcx, qword ptr [rbp + 0xc8]
; Selected 0x14598423c..0x1459842e8
0x14598423c: call 0x1400021c0
0x145984241: test rax, rax
0x145984244: je 0x145984e94
0x14598424a: mov r15, rax
0x14598424d: mov byte ptr [rax], 0x5b
0x145984250: mov rax, qword ptr [rbp - 0x40]
0x145984254: mov qword ptr [rbp + 0x38], rax
0x145984258: test rsi, rsi
0x14598425b: mov qword ptr [rbp + 0x40], rdi
0x14598425f: je 0x145984a30
0x145984265: lea rax, [rdi + rsi*8]
0x145984269: mov qword ptr [rbp - 0x10], rax
0x14598426d: mov r13b, 1
0x145984270: mov r10d, 1
0x145984276: mov esi, 1
0x14598427b: mov rbx, rdi
0x14598427e: jmp 0x1459842b0
0x145984280: mov rbx, r12
0x145984283: add rbx, 8
0x145984287: add rsi, rdi
0x14598428a: mov eax, dword ptr [rbp + 0x110]
0x145984290: mov ecx, dword ptr [rbp + 0x113]
0x145984296: mov dword ptr [rbp + 0xa0], eax
0x14598429c: mov dword ptr [rbp + 0xa3], ecx
0x1459842a2: cmp rbx, qword ptr [rbp - 0x10]
0x1459842a6: mov r10, qword ptr [rbp + 0x28]
0x1459842aa: je 0x145984a3e
0x1459842b0: mov r14, qword ptr [rbx]
0x1459842b3: mov qword ptr [rbp + 0xc0], r10
0x1459842ba: mov qword ptr [rbp + 0xc8], r15
0x1459842c1: mov qword ptr [rbp + 0xd0], rsi
0x1459842c8: mov byte ptr [rbp + 0xd8], r13b
0x1459842cf: mov eax, dword ptr [rbp + 0xa0]
0x1459842d5: mov ecx, dword ptr [rbp + 0xa3]
0x1459842db: lea rdx, [rbp + 0xd0]
0x1459842e2: mov dword ptr [rdx + 0xc], ecx
0x1459842e5: mov dword ptr [rdx + 9], eax
; Selected 0x14598443d..0x1459844b7
0x14598443e: mov qword ptr [rbp + 0xf0], rax
0x145984445: mov rax, qword ptr [rbp + 0x128]
0x14598444c: mov qword ptr [rbp + 0xf8], rax
0x145984453: movaps xmmword ptr [rbp + 0xe0], xmm0
0x14598445a: movq xmm0, qword ptr [r14 + 0x18]
0x145984460: call 0x145d14667
0x145984465: movdqa xmm6, xmm0
0x145984469: mov rsi, qword ptr [rbp + 0xf0]
0x145984470: cmp byte ptr [rbp + 0xf8], 0
0x145984477: jne 0x14598449b
0x145984479: cmp qword ptr [rbp + 0xe0], rsi
0x145984480: je 0x1459849ab
0x145984486: mov rax, qword ptr [rbp + 0xe8]
0x14598448d: mov byte ptr [rax + rsi], 0x2c
0x145984491: inc rsi
0x145984494: mov qword ptr [rbp + 0xf0], rsi
0x14598449b: mov byte ptr [rbp + 0xf8], 0
0x1459844a2: mov r8d, 3
0x1459844a8: mov rcx, r12
0x1459844ab: lea rdx, [rip + 0x19aba3f] ; @0x14732fef1 b'dmgcolortoprevived\x0csink-test t=\xc5 '
0x1459844b2: call 0x14585a6f0
; Selected 0x145984afd..0x145984b27
0x145984afd: lea rax, [rbp + 0x50]
0x145984b01: mov qword ptr [rsp + 0x20], rax
0x145984b06: mov r9d, 5
0x145984b0c: lea rcx, [rbp + 0xc0]
0x145984b13: lea rdx, [rbp + 0xe0]
0x145984b1a: lea r8, [rip + 0x19adc6b] ; @0x14733278c b'partsNone'
0x145984b21: call 0x145858210
0x145984b26: nop
