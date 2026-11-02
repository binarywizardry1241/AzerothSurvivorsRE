; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1459a13c0..0x1459a1643 SHA256 28eb759a4c914a194faa6f2945aca156ae77dc78366e665bba84033057f70662
0x1459a13c0: push rbp
0x1459a13c1: push r15
0x1459a13c3: push r14
0x1459a13c5: push r13
0x1459a13c7: push r12
0x1459a13c9: push rsi
0x1459a13ca: push rdi
0x1459a13cb: push rbx
0x1459a13cc: sub rsp, 0xb8
0x1459a13d3: lea rbp, [rsp + 0x80]
0x1459a13db: movdqa xmmword ptr [rbp + 0x20], xmm8
0x1459a13e1: movdqa xmmword ptr [rbp + 0x10], xmm7
0x1459a13e6: movaps xmmword ptr [rbp], xmm6
0x1459a13ea: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1459a13f2: mov rdi, r9
0x1459a13f5: mov rsi, r8
0x1459a13f8: mov rbx, rcx
0x1459a13fb: lea r15, [rcx + 0x20]
0x1459a13ff: mov rcx, r15
0x1459a1402: mov qword ptr [rbp - 0x10], rdx
0x1459a1406: call 0x14000d010
0x1459a140b: nop
0x1459a140c: mov r14, rax
0x1459a140f: cmp qword ptr [rbx + 0x10], 0
0x1459a1414: je 0x1459a1610
0x1459a141a: mov qword ptr [rbp - 0x20], rsi
0x1459a141e: mov r13, qword ptr [rbx]
0x1459a1421: mov r9, qword ptr [rbx + 8]
0x1459a1425: mov rsi, r14
0x1459a1428: shr rsi, 0x39
0x1459a142c: movd xmm0, esi
0x1459a1430: punpcklbw xmm0, xmm0
0x1459a1434: pshuflw xmm0, xmm0, 0
0x1459a1439: pshufd xmm6, xmm0, 0x44
0x1459a143e: mov r11, qword ptr [rbp - 0x10]
0x1459a1442: mov r15, qword ptr [r11 + 8]
0x1459a1446: mov r8, qword ptr [r11 + 0x10]
0x1459a144a: xor edx, edx
0x1459a144c: pcmpeqd xmm7, xmm7
0x1459a1450: xor ecx, ecx
0x1459a1452: and r14, r9
0x1459a1455: movdqu xmm8, xmmword ptr [r13 + r14]
0x1459a145c: movdqa xmm0, xmm8
0x1459a1461: pcmpeqb xmm0, xmm6
0x1459a1465: pmovmskb r12d, xmm0
0x1459a146a: test r12d, r12d
0x1459a146d: je 0x1459a14f0
0x1459a1473: mov qword ptr [rbp - 0x18], rdi
0x1459a1477: mov qword ptr [rbp - 0x48], r9
0x1459a147b: mov qword ptr [rbp - 0x40], rbx
0x1459a147f: mov qword ptr [rbp - 0x38], rcx
0x1459a1483: mov qword ptr [rbp - 0x30], rdx
0x1459a1487: tzcnt eax, r12d
0x1459a148c: add rax, r14
0x1459a148f: and rax, r9
0x1459a1492: neg rax
0x1459a1495: lea rax, [rax + rax*4]
0x1459a1499: cmp r8, qword ptr [r13 + rax*8 - 0x18]
0x1459a149e: jne 0x1459a14c5
0x1459a14a0: lea rdi, [rax*8]
0x1459a14a8: add rdi, r13
0x1459a14ab: mov rdx, qword ptr [rdi - 0x20]
0x1459a14af: mov rcx, r15
0x1459a14b2: mov rbx, r8
0x1459a14b5: call 0x145bfa0e1
0x1459a14ba: mov r8, rbx
0x1459a14bd: mov r11, qword ptr [rbp - 0x10]
0x1459a14c1: test eax, eax
0x1459a14c3: je 0x1459a1539
0x1459a14c5: lea eax, [r12 - 1]
0x1459a14ca: and ax, r12w
0x1459a14ce: mov r12d, eax
0x1459a14d1: mov rdi, qword ptr [rbp - 0x18]
0x1459a14d5: mov r9, qword ptr [rbp - 0x48]
0x1459a14d9: mov rbx, qword ptr [rbp - 0x40]
0x1459a14dd: mov rcx, qword ptr [rbp - 0x38]
0x1459a14e1: mov rdx, qword ptr [rbp - 0x30]
0x1459a14e5: jne 0x1459a1487
0x1459a14e7: nop word ptr [rax + rax]
0x1459a14f0: cmp rdx, 1
0x1459a14f4: mov r10, qword ptr [rbp - 0x28]
0x1459a14f8: je 0x1459a150e
0x1459a14fa: pmovmskb eax, xmm8
0x1459a14ff: test eax, eax
0x1459a1501: je 0x1459a1523
0x1459a1503: tzcnt r10d, eax
0x1459a1508: add r10, r14
0x1459a150b: and r10, r9
0x1459a150e: pcmpeqb xmm8, xmm7
0x1459a1513: pmovmskb eax, xmm8
0x1459a1518: test eax, eax
0x1459a151a: jne 0x1459a156e
0x1459a151c: mov edx, 1
0x1459a1521: jmp 0x1459a1525
0x1459a1523: xor edx, edx
0x1459a1525: mov qword ptr [rbp - 0x28], r10
0x1459a1529: add r14, rcx
0x1459a152c: add r14, 0x10
0x1459a1530: add rcx, 0x10
0x1459a1534: jmp 0x1459a1452
0x1459a1539: mov rbx, qword ptr [rdi - 0x10]
0x1459a153d: mov r14, qword ptr [rdi - 8]
0x1459a1541: mov rax, qword ptr [rbp - 0x20]
0x1459a1545: mov qword ptr [rdi - 0x10], rax
0x1459a1549: mov rax, qword ptr [rbp - 0x18]
0x1459a154d: mov qword ptr [rdi - 8], rax
0x1459a1551: mov rdx, qword ptr [r11]
0x1459a1554: test rdx, rdx
0x1459a1557: je 0x1459a15e9
0x1459a155d: mov rcx, qword ptr [r11 + 8]
0x1459a1561: mov r8d, 1
0x1459a1567: call 0x1400021d0
0x1459a156c: jmp 0x1459a15e9
0x1459a156e: movzx eax, byte ptr [r13 + r10]
0x1459a1574: test al, al
0x1459a1576: mov rdx, qword ptr [rbp - 0x20]
0x1459a157a: jns 0x1459a1629
0x1459a1580: mov rcx, qword ptr [r11 + 0x10]
0x1459a1584: mov qword ptr [rbp - 0x50], rcx
0x1459a1588: movups xmm0, xmmword ptr [r11]
0x1459a158c: movaps xmmword ptr [rbp - 0x60], xmm0
0x1459a1590: and al, 1
0x1459a1592: lea rcx, [r10 - 0x10]
0x1459a1596: and rcx, r9
0x1459a1599: mov byte ptr [r13 + r10], sil
0x1459a159e: mov byte ptr [r13 + rcx + 0x10], sil
0x1459a15a3: movzx eax, al
0x1459a15a6: movd xmm0, eax
0x1459a15aa: shufpd xmm0, xmmword ptr [rip + 0x3fbc7d], 2
0x1459a15b3: movdqu xmm1, xmmword ptr [rbx + 0x10]
0x1459a15b8: psubq xmm1, xmm0
0x1459a15bc: movdqu xmmword ptr [rbx + 0x10], xmm1
0x1459a15c1: neg r10
0x1459a15c4: lea rax, [r10 + r10*4]
0x1459a15c8: mov rcx, qword ptr [rbp - 0x50]
0x1459a15cc: mov qword ptr [r13 + rax*8 - 0x18], rcx
0x1459a15d1: movdqa xmm0, xmmword ptr [rbp - 0x60]
0x1459a15d6: movdqu xmmword ptr [r13 + rax*8 - 0x28], xmm0
0x1459a15dd: mov qword ptr [r13 + rax*8 - 0x10], rdx
0x1459a15e2: mov qword ptr [r13 + rax*8 - 8], rdi
0x1459a15e7: xor ebx, ebx
0x1459a15e9: mov rax, rbx
0x1459a15ec: mov rdx, r14
0x1459a15ef: movaps xmm6, xmmword ptr [rbp]
0x1459a15f3: movaps xmm7, xmmword ptr [rbp + 0x10]
0x1459a15f7: movaps xmm8, xmmword ptr [rbp + 0x20]
0x1459a15fc: add rsp, 0xb8
0x1459a1603: pop rbx
0x1459a1604: pop rdi
0x1459a1605: pop rsi
0x1459a1606: pop r12
0x1459a1608: pop r13
0x1459a160a: pop r14
0x1459a160c: pop r15
0x1459a160e: pop rbp
0x1459a160f: ret
0x1459a1610: mov edx, 1
0x1459a1615: mov rcx, rbx
0x1459a1618: mov r8, r15
0x1459a161b: mov r9b, 1
0x1459a161e: call 0x145d7cd70
0x1459a1623: nop
0x1459a1624: jmp 0x1459a141a
0x1459a1629: movdqa xmm0, xmmword ptr [r13]
0x1459a162f: pmovmskb eax, xmm0
0x1459a1633: tzcnt r10d, eax
0x1459a1638: movzx eax, byte ptr [r13 + r10]
0x1459a163e: jmp 0x1459a1580
