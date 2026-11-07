; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458ec500..0x1458ec743 SHA256 1ab80233e2ac55c74fb7d3c9a94bf7e2c76a56f9a6a04658b6556a1caf68cd77
0x1458ec500: push r15
0x1458ec502: push r14
0x1458ec504: push r13
0x1458ec506: push r12
0x1458ec508: push rsi
0x1458ec509: push rdi
0x1458ec50a: push rbp
0x1458ec50b: push rbx
0x1458ec50c: sub rsp, 0x68
0x1458ec510: movdqa xmmword ptr [rsp + 0x50], xmm8
0x1458ec517: movdqa xmmword ptr [rsp + 0x40], xmm7
0x1458ec51d: movdqa xmmword ptr [rsp + 0x30], xmm6
0x1458ec523: mov rsi, rdx
0x1458ec526: mov rdi, rcx
0x1458ec529: mov eax, dword ptr [rip + 0x279e091]
0x1458ec52f: test eax, eax
0x1458ec531: jne 0x1458ec72b
0x1458ec537: mov rbx, qword ptr [rip + 0x279e072]
0x1458ec53e: mov rdx, qword ptr [rip + 0x279e073]
0x1458ec545: mov rcx, qword ptr [rip + 0x27a0b84]
0x1458ec54c: lea rax, [rdx - 1]
0x1458ec550: cmp rax, rcx
0x1458ec553: cmovb rcx, rax
0x1458ec557: cmp rcx, rdx
0x1458ec55a: jae 0x1458ec735
0x1458ec560: lea r15, [rcx + rcx*2]
0x1458ec564: shl r15, 4
0x1458ec568: cmp qword ptr [rbx + r15 + 0x18], 0
0x1458ec56e: je 0x1458ec63e
0x1458ec574: add r15, rbx
0x1458ec577: lea rcx, [r15 + 0x20]
0x1458ec57b: mov rdx, rdi
0x1458ec57e: mov r8, rsi
0x1458ec581: call 0x14000d750
0x1458ec586: mov rcx, rax
0x1458ec589: shr rcx, 0x39
0x1458ec58d: mov r14, qword ptr [r15]
0x1458ec590: mov r15, qword ptr [r15 + 8]
0x1458ec594: movd xmm0, ecx
0x1458ec598: punpcklbw xmm0, xmm0
0x1458ec59c: pshuflw xmm0, xmm0, 0
0x1458ec5a1: pshufd xmm6, xmm0, 0x44
0x1458ec5a6: xor edx, edx
0x1458ec5a8: pcmpeqd xmm7, xmm7
0x1458ec5ac: and rax, r15
0x1458ec5af: movdqu xmm8, xmmword ptr [r14 + rax]
0x1458ec5b5: movdqa xmm0, xmm8
0x1458ec5ba: pcmpeqb xmm0, xmm6
0x1458ec5be: pmovmskb r13d, xmm0
0x1458ec5c3: test r13d, r13d
0x1458ec5c6: je 0x1458ec620
0x1458ec5c8: mov qword ptr [rsp + 0x28], rdx
0x1458ec5cd: tzcnt ecx, r13d
0x1458ec5d2: mov r12, rax
0x1458ec5d5: add rcx, rax
0x1458ec5d8: and rcx, r15
0x1458ec5db: neg rcx
0x1458ec5de: lea rax, [rcx + rcx*4]
0x1458ec5e2: cmp rsi, qword ptr [r14 + rax*8 - 0x18]
0x1458ec5e7: jne 0x1458ec604
0x1458ec5e9: lea rbp, [r14 + rax*8]
0x1458ec5ed: mov rdx, qword ptr [rbp - 0x20]
0x1458ec5f1: mov rcx, rdi
0x1458ec5f4: mov r8, rsi
0x1458ec5f7: call 0x145bfa0e1
0x1458ec5fc: test eax, eax
0x1458ec5fe: je 0x1458ec6fa
0x1458ec604: lea eax, [r13 - 1]
0x1458ec608: and ax, r13w
0x1458ec60c: mov r13d, eax
0x1458ec60f: mov rax, r12
0x1458ec612: mov rdx, qword ptr [rsp + 0x28]
0x1458ec617: jne 0x1458ec5cd
0x1458ec619: nop dword ptr [rax]
0x1458ec620: pcmpeqb xmm8, xmm7
0x1458ec625: pmovmskb ecx, xmm8
0x1458ec62a: test ecx, ecx
0x1458ec62c: jne 0x1458ec63e
0x1458ec62e: add rax, rdx
0x1458ec631: add rax, 0x10
0x1458ec635: add rdx, 0x10
0x1458ec639: jmp 0x1458ec5ac
0x1458ec63e: cmp qword ptr [rbx + 0x18], 0
0x1458ec643: je 0x1458ec704
0x1458ec649: lea rcx, [rbx + 0x20]
0x1458ec64d: mov rdx, rdi
0x1458ec650: mov r8, rsi
0x1458ec653: call 0x14000d750
0x1458ec658: mov rcx, rax
0x1458ec65b: shr rcx, 0x39
0x1458ec65f: mov r14, qword ptr [rbx]
0x1458ec662: mov rbx, qword ptr [rbx + 8]
0x1458ec666: movd xmm0, ecx
0x1458ec66a: punpcklbw xmm0, xmm0
0x1458ec66e: pshuflw xmm0, xmm0, 0
0x1458ec673: pshufd xmm6, xmm0, 0x44
0x1458ec678: pcmpeqd xmm7, xmm7
0x1458ec67c: xor r15d, r15d
0x1458ec67f: and rax, rbx
0x1458ec682: movdqu xmm8, xmmword ptr [r14 + rax]
0x1458ec688: movdqa xmm0, xmm8
0x1458ec68d: pcmpeqb xmm0, xmm6
0x1458ec691: pmovmskb r12d, xmm0
0x1458ec696: test r12d, r12d
0x1458ec699: je 0x1458ec6df
0x1458ec69b: tzcnt ecx, r12d
0x1458ec6a0: mov r13, rax
0x1458ec6a3: add rcx, rax
0x1458ec6a6: and rcx, rbx
0x1458ec6a9: neg rcx
0x1458ec6ac: lea rax, [rcx + rcx*4]
0x1458ec6b0: cmp rsi, qword ptr [r14 + rax*8 - 0x18]
0x1458ec6b5: jne 0x1458ec6ce
0x1458ec6b7: lea rbp, [r14 + rax*8]
0x1458ec6bb: mov rdx, qword ptr [rbp - 0x20]
0x1458ec6bf: mov rcx, rdi
0x1458ec6c2: mov r8, rsi
0x1458ec6c5: call 0x145bfa0e1
0x1458ec6ca: test eax, eax
0x1458ec6cc: je 0x1458ec6fa
0x1458ec6ce: lea eax, [r12 - 1]
0x1458ec6d3: and ax, r12w
0x1458ec6d7: mov r12d, eax
0x1458ec6da: mov rax, r13
0x1458ec6dd: jne 0x1458ec69b
0x1458ec6df: pcmpeqb xmm8, xmm7
0x1458ec6e4: pmovmskb ecx, xmm8
0x1458ec6e9: test ecx, ecx
0x1458ec6eb: jne 0x1458ec708
0x1458ec6ed: add rax, r15
0x1458ec6f0: add rax, 0x10
0x1458ec6f4: add r15, 0x10
0x1458ec6f8: jmp 0x1458ec67f
0x1458ec6fa: mov rax, qword ptr [rbp - 0x10]
0x1458ec6fe: mov rdx, qword ptr [rbp - 8]
0x1458ec702: jmp 0x1458ec70a
0x1458ec704: xor eax, eax
0x1458ec706: jmp 0x1458ec70a
0x1458ec708: xor eax, eax
0x1458ec70a: movaps xmm6, xmmword ptr [rsp + 0x30]
0x1458ec70f: movaps xmm7, xmmword ptr [rsp + 0x40]
0x1458ec714: movaps xmm8, xmmword ptr [rsp + 0x50]
0x1458ec71a: add rsp, 0x68
0x1458ec71e: pop rbx
0x1458ec71f: pop rbp
0x1458ec720: pop rdi
0x1458ec721: pop rsi
0x1458ec722: pop r12
0x1458ec724: pop r13
0x1458ec726: pop r14
0x1458ec728: pop r15
0x1458ec72a: ret
0x1458ec72b: call 0x145d7e13e
0x1458ec730: jmp 0x1458ec537
0x1458ec735: lea r8, [rip + 0x13052ac]
0x1458ec73c: call 0x145d99653
0x1458ec741: ud2
