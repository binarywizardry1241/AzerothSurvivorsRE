0x140211270: push r15
0x140211272: push r14
0x140211274: push r12
0x140211276: push rsi
0x140211277: push rdi
0x140211278: push rbx
0x140211279: sub rsp, 0x378
0x140211280: movaps xmmword ptr [rsp + 0x360], xmm6
0x140211288: mov r14, r8
0x14021128b: mov rsi, rdx
0x14021128e: mov rdi, rcx
0x140211291: lea rcx, [rip + 0x5cffd71]
0x140211298: mov edx, 0xa
0x14021129d: call 0x1458dfee0
0x1402112a2: movups xmm0, xmmword ptr [r14 + 0xe0]
0x1402112aa: movzx ebx, byte ptr [r14 + 0x132]
0x1402112b2: lea rcx, [rip + 0x5cffd5a]
0x1402112b9: mov qword ptr [rsp + 0x40], rcx
0x1402112be: movups xmmword ptr [rsp + 0x30], xmm0
0x1402112c3: mov qword ptr [rsp + 0x28], rdx
0x1402112c8: mov qword ptr [rsp + 0x20], rax
0x1402112cd: mov byte ptr [rsp + 0x50], 0
0x1402112d2: mov qword ptr [rsp + 0x48], 5
0x1402112db: mov rcx, rdi
0x1402112de: mov rdx, rsi
0x1402112e1: mov r8d, ebx
0x1402112e4: mov r9b, 4
0x1402112e7: call 0x14020cb50
0x1402112ec: lea rcx, [rip + 0x5cffd25]
0x1402112f3: mov edx, 8
0x1402112f8: call 0x1458dfee0
0x1402112fd: mov r15, rax
0x140211300: mov r12, rdx
0x140211303: movups xmm6, xmmword ptr [r14 + 0xf8]
0x14021130b: lea rcx, [rip + 0x5cffd0e]
0x140211312: mov edx, 0xd
0x140211317: call 0x1458dfee0
0x14021131c: mov qword ptr [rsp + 0x48], rdx
0x140211321: mov qword ptr [rsp + 0x40], rax
0x140211326: movups xmmword ptr [rsp + 0x30], xmm6
0x14021132b: mov qword ptr [rsp + 0x28], r12
0x140211330: mov qword ptr [rsp + 0x20], r15
0x140211335: mov byte ptr [rsp + 0x50], 1
0x14021133a: mov rcx, rdi
0x14021133d: mov rdx, rsi
0x140211340: mov r8d, ebx
0x140211343: mov r9b, 5
0x140211346: call 0x14020cb50
0x14021134b: lea rcx, [rip + 0x5cffcdb]
0x140211352: mov edx, 0x35
0x140211357: call 0x1458dfee0
0x14021135c: mov r14, rdx
0x14021135f: test rdx, rdx
0x140211362: jns 0x140211374
0x140211364: xor r12d, r12d
0x140211367: mov rcx, r12
0x14021136a: mov rdx, r14
0x14021136d: call 0x145eb6fcb
0x140211372: ud2
0x140211374: je 0x1402113c6
0x140211376: mov rbx, rax
0x140211379: call 0x140002200
0x14021137e: mov r12d, 1
0x140211384: mov edx, 1
0x140211389: mov rcx, r14
0x14021138c: call 0x1400021c0
0x140211391: test rax, rax
0x140211394: je 0x140211367
0x140211396: mov r15, rax
0x140211399: mov rcx, rax
0x14021139c: mov rdx, rbx
0x14021139f: mov r8, r14
0x1402113a2: call 0x145d145fb
0x1402113a7: cmp byte ptr [rsi], 1
0x1402113aa: jne 0x1402113d1
0x1402113ac: mov eax, dword ptr [rsi + 1]
0x1402113af: mov ecx, dword ptr [rsi + 4]
0x1402113b2: mov dword ptr [rsp + 0x63], ecx
0x1402113b6: mov dword ptr [rsp + 0x60], eax
0x1402113ba: mov rax, qword ptr [rsi + 8]
0x1402113be: movzx ecx, byte ptr [rsi + 0x10]
0x1402113c2: mov dl, 1
0x1402113c4: jmp 0x1402113e1
0x1402113c6: mov r15d, 1
0x1402113cc: cmp byte ptr [rsi], 1
0x1402113cf: je 0x1402113ac
0x1402113d1: mov rax, qword ptr [rsi + 8]
0x1402113d5: lock inc qword ptr [rax]
0x1402113d9: jle 0x14021178b
0x1402113df: xor edx, edx
0x1402113e1: movups xmm0, xmmword ptr [rip + 0x5cff0e0]
0x1402113e8: movups xmmword ptr [rsp + 0x69], xmm0
0x1402113ed: mov dword ptr [rsp + 0x79], 0x3f800000
0x1402113f5: mov r8, qword ptr [rdi]
0x1402113f8: lea rbx, [rdi + 8]
0x1402113fc: mov qword ptr [rsp + 0xa0], r14
0x140211404: mov qword ptr [rsp + 0xa8], r15
0x14021140c: mov qword ptr [rsp + 0xb0], r14
0x140211414: mov qword ptr [rsp + 0xb8], 0
0x140211420: mov qword ptr [rsp + 0xc0], 4
0x14021142c: mov qword ptr [rsp + 0xc8], 0
0x140211438: mov byte ptr [rsp + 0xd0], dl
0x14021143f: mov edx, dword ptr [rsp + 0x60]
0x140211443: mov r9d, dword ptr [rsp + 0x63]
0x140211448: mov dword ptr [rsp + 0xd1], edx
0x14021144f: mov dword ptr [rsp + 0xd4], r9d
0x140211457: mov qword ptr [rsp + 0xd8], rax
0x14021145f: mov qword ptr [rsp + 0xe0], rcx
0x140211467: mov dword ptr [rsp + 0xe8], 0x41500000
0x140211472: mov word ptr [rsp + 0xec], 0x190
0x14021147c: mov byte ptr [rsp + 0xee], 1
0x140211484: movups xmm0, xmmword ptr [rsp + 0x68]
0x140211489: movups xmmword ptr [rsp + 0xef], xmm0
0x140211491: mov rax, qword ptr [rsp + 0x75]
0x140211496: mov qword ptr [rsp + 0xfc], rax
0x14021149e: mov eax, dword ptr [rip + 0x5d03e3c]
0x1402114a4: mov dword ptr [rsp + 0x114], eax
0x1402114ab: movups xmm0, xmmword ptr [rip + 0x5d03e1e]
0x1402114b2: movups xmmword ptr [rsp + 0x104], xmm0
0x1402114ba: movsd xmm0, qword ptr [rip + 0x5cceaae]
0x1402114c2: movsd qword ptr [rsp + 0x118], xmm0
0x1402114cb: mov qword ptr [rsp + 0x98], r8
0x1402114d3: lea r14, [rip + 0x5ccf666]
0x1402114da: lea rcx, [rsp + 0x220]
0x1402114e2: lea r8, [rsp + 0x98]
0x1402114ea: mov rdx, rbx
0x1402114ed: mov r9, r14
0x1402114f0: call 0x1402bacf0
0x1402114f5: xorps xmm0, xmm0
0x1402114f8: movaps xmmword ptr [rsp + 0x2c0], xmm0
0x140211500: movaps xmmword ptr [rsp + 0x2b0], xmm0
0x140211508: movaps xmmword ptr [rsp + 0x2a0], xmm0
0x140211510: movaps xmmword ptr [rsp + 0x290], xmm0
0x140211518: movaps xmmword ptr [rsp + 0x280], xmm0
0x140211520: mov qword ptr [rsp + 0x2d0], 0
0x14021152c: mov byte ptr [rsp + 0x21c], 0
0x140211534: mov dword ptr [rsp + 0x218], 0
0x14021153f: movups xmm0, xmmword ptr [rip + 0x5cff4ba]
0x140211546: movups xmmword ptr [rsp + 0x2d8], xmm0
0x14021154e: movups xmm0, xmmword ptr [rip + 0x5cff4bb]
0x140211555: movups xmmword ptr [rsp + 0x2e8], xmm0
0x14021155d: movups xmm0, xmmword ptr [rip + 0x5cff4bc]
0x140211564: movups xmmword ptr [rsp + 0x2f8], xmm0
0x14021156c: movups xmm0, xmmword ptr [rip + 0x5cff4bd]
0x140211573: movups xmmword ptr [rsp + 0x308], xmm0
0x14021157b: movups xmm0, xmmword ptr [rip + 0x5cff4ce]
0x140211582: movups xmmword ptr [rsp + 0x328], xmm0
0x14021158a: movups xmm0, xmmword ptr [rip + 0x5cff4af]
0x140211591: movups xmmword ptr [rsp + 0x318], xmm0
0x140211599: movups xmm0, xmmword ptr [rip + 0x5cff4d0]
0x1402115a0: movups xmmword ptr [rsp + 0x348], xmm0
0x1402115a8: movups xmm0, xmmword ptr [rip + 0x5cff4b1]
0x1402115af: movups xmmword ptr [rsp + 0x338], xmm0
0x1402115b7: movups xmm0, xmmword ptr [rip + 0x5cff38a]
0x1402115be: movaps xmmword ptr [rsp + 0x220], xmm0
0x1402115c6: mov qword ptr [rsp + 0x230], 0
0x1402115d2: movups xmm0, xmmword ptr [rip + 0x5cff387]
0x1402115d9: movups xmmword ptr [rsp + 0x238], xmm0
0x1402115e1: mov qword ptr [rsp + 0x248], 0
0x1402115ed: movups xmm0, xmmword ptr [rip + 0x5cff384]
0x1402115f4: movaps xmmword ptr [rsp + 0x250], xmm0
0x1402115fc: mov qword ptr [rsp + 0x260], 0
0x140211608: movups xmm0, xmmword ptr [rip + 0x5cff381]
0x14021160f: movups xmmword ptr [rsp + 0x268], xmm0
0x140211617: mov qword ptr [rsp + 0x278], 0
0x140211623: mov rdi, qword ptr [rdi]
0x140211626: lea rcx, [rsp + 0xa0]
0x14021162e: lea rdx, [rsp + 0x220]
0x140211636: mov r8d, 0x138
0x14021163c: call 0x145d145fb
0x140211641: movaps xmm0, xmmword ptr [rip + 0x5cce8b8]
0x140211648: movups xmmword ptr [rsp + 0x1d8], xmm0
0x140211650: mov dword ptr [rsp + 0x1e8], 1
0x14021165b: mov qword ptr [rsp + 0x1ec], 0
0x140211667: mov byte ptr [rsp + 0x1f4], 1
0x14021166f: mov qword ptr [rsp + 0x1f8], 0
0x14021167b: mov dword ptr [rsp + 0x200], 0x3f800000
0x140211686: mov word ptr [rsp + 0x204], 0
0x140211690: mov dword ptr [rsp + 0x206], 0x10000
0x14021169b: mov word ptr [rsp + 0x20a], 0
0x1402116a5: mov dword ptr [rsp + 0x20c], 0x10000
0x1402116b0: mov word ptr [rsp + 0x210], 0
0x1402116ba: mov dword ptr [rsp + 0x212], 0
0x1402116c5: mov word ptr [rsp + 0x216], 0
0x1402116cf: mov byte ptr [rsp + 0x21d], 5
0x1402116d7: mov qword ptr [rsp + 0x98], rdi
0x1402116df: lea rcx, [rsp + 0x68]
0x1402116e4: lea r8, [rsp + 0x98]
0x1402116ec: mov rdx, rbx
0x1402116ef: mov r9, r14
0x1402116f2: call 0x1402b57b0
0x1402116f7: mov rax, qword ptr [rsp + 0x68]
0x1402116fc: mov rcx, qword ptr [rsp + 0x90]
0x140211704: mov qword ptr [rsp + 0x98], rax
0x14021170c: movups xmm0, xmmword ptr [rsp + 0x70]
0x140211711: movups xmmword ptr [rsp + 0xa0], xmm0
0x140211719: movups xmm0, xmmword ptr [rsp + 0x80]
0x140211721: movups xmmword ptr [rsp + 0xb0], xmm0
0x140211729: mov qword ptr [rsp + 0xc0], rcx
0x140211731: mov byte ptr [rsp + 0x220], 5
0x140211739: lea rcx, [rip + 0x5d164bb]
0x140211740: mov edx, 4
0x140211745: call 0x1458dfee0
0x14021174a: mov qword ptr [rsp + 0x20], rdx
0x14021174f: mov dword ptr [rsp + 0x28], 0x41900000
0x140211757: lea rcx, [rsp + 0x98]
0x14021175f: lea r8, [rsp + 0x220]
0x140211767: mov rdx, rsi
0x14021176a: mov r9, rax
0x14021176d: call 0x14020dbd0
0x140211772: movaps xmm6, xmmword ptr [rsp + 0x360]
0x14021177a: add rsp, 0x378
0x140211781: pop rbx
0x140211782: pop rdi
0x140211783: pop rsi
0x140211784: pop r12
0x140211786: pop r14
0x140211788: pop r15
0x14021178a: ret
0x14021178b: ud2
