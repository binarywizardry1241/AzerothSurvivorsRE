; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x145bbd290..0x145bbd46a SHA256 080e8a698523f1033de4094b963baeac6fc3dca98b23ad61a9cedb4c75f9630f
0x145bbd290: push rbp
0x145bbd291: push rsi
0x145bbd292: push rdi
0x145bbd293: push rbx
0x145bbd294: sub rsp, 0xc8
0x145bbd29b: lea rbp, [rsp + 0x80]
0x145bbd2a3: mov qword ptr [rbp + 0x40], 0xfffffffffffffffe
0x145bbd2ab: mov rax, r8
0x145bbd2ae: mov rsi, rcx
0x145bbd2b1: mov dword ptr [rbp - 0x58], 0
0x145bbd2b8: mov qword ptr [rbp - 0x50], 0
0x145bbd2c0: mov dword ptr [rbp - 0x48], 7
0x145bbd2c7: mov qword ptr [rbp - 0x44], 0
0x145bbd2cf: mov qword ptr [rbp - 0x3f], 0
0x145bbd2d7: mov byte ptr [rbp - 0x40], 1
0x145bbd2db: lea r8, [rbp - 0x58]
0x145bbd2df: mov rcx, rdx
0x145bbd2e2: mov rdx, rax
0x145bbd2e5: call 0x145ba8e20
0x145bbd2ea: test al, 1
0x145bbd2ec: je 0x145bbd2fe
0x145bbd2ee: mov qword ptr [rsi + 8], rdx
0x145bbd2f2: mov qword ptr [rsi], 0xffffffffffffffff
0x145bbd2f9: jmp 0x145bbd45b
0x145bbd2fe: mov qword ptr [rbp + 0x20], rdx
0x145bbd302: mov qword ptr [rbp], rdx
0x145bbd306: lea rcx, [rbp - 0x58]
0x145bbd30a: mov rdx, rbp
0x145bbd30d: call 0x145ba8f30
0x145bbd312: nop
0x145bbd313: cmp dword ptr [rbp - 0x58], 2
0x145bbd317: jne 0x145bbd348
0x145bbd319: mov rax, qword ptr [rbp - 0x50]
0x145bbd31d: mov ecx, eax
0x145bbd31f: and ecx, 3
0x145bbd322: lea edx, [rcx - 2]
0x145bbd325: cmp edx, 2
0x145bbd328: jb 0x145bbd344
0x145bbd32a: test rcx, rcx
0x145bbd32d: je 0x145bbd344
0x145bbd32f: dec rax
0x145bbd332: lea rcx, [rbp - 0x50]
0x145bbd336: mov qword ptr [rbp - 0x50], rax
0x145bbd33a: mov byte ptr [rbp - 0x58], 3
0x145bbd33e: call 0x145bdf7c0
0x145bbd343: nop
0x145bbd344: xor edi, edi
0x145bbd346: jmp 0x145bbd351
0x145bbd348: mov rbx, qword ptr [rbp - 0x20]
0x145bbd34c: mov edi, 1
0x145bbd351: mov qword ptr [rbp + 0x28], 0
0x145bbd359: mov qword ptr [rbp + 0x30], 1
0x145bbd361: mov qword ptr [rbp + 0x38], 0
0x145bbd369: test rdi, rdi
0x145bbd36c: mov rdx, rbx
0x145bbd36f: cmove rdx, rdi
0x145bbd373: lea rcx, [rbp + 0x28]
0x145bbd377: call 0x145bcaab0
0x145bbd37c: nop
0x145bbd37d: cmp rax, -1
0x145bbd381: je 0x145bbd393
0x145bbd383: movabs rcx, 0x2600000003
0x145bbd38d: mov rdi, qword ptr [rbp + 0x20]
0x145bbd391: jmp 0x145bbd405
0x145bbd393: mov rax, qword ptr [rbp + 0x38]
0x145bbd397: mov qword ptr [rbp + 8], rax
0x145bbd39b: mov rcx, rbp
0x145bbd39e: lea rdx, [rbp + 0x28]
0x145bbd3a2: mov r8, rdi
0x145bbd3a5: mov r9, rbx
0x145bbd3a8: call 0x145ba0cb0
0x145bbd3ad: mov qword ptr [rbp + 0x18], rax
0x145bbd3b1: mov qword ptr [rbp + 0x10], rdx
0x145bbd3b5: mov rdi, qword ptr [rbp + 0x38]
0x145bbd3b9: mov r8, rdi
0x145bbd3bc: mov rax, qword ptr [rbp + 8]
0x145bbd3c0: sub r8, rax
0x145bbd3c3: mov rdx, qword ptr [rbp + 0x30]
0x145bbd3c7: add rdx, rax
0x145bbd3ca: lea rcx, [rbp - 0x58]
0x145bbd3ce: call 0x145bd5650
0x145bbd3d3: nop
0x145bbd3d4: cmp qword ptr [rbp - 0x58], 0
0x145bbd3d9: je 0x145bbd42a
0x145bbd3db: lea rax, [rip + 0x16a9586]
0x145bbd3e2: test byte ptr [rbp + 0x18], 1
0x145bbd3e6: mov rcx, qword ptr [rbp + 0x10]
0x145bbd3ea: cmove rcx, rax
0x145bbd3ee: mov edx, 1
0x145bbd3f3: mov rdi, qword ptr [rbp + 0x20]
0x145bbd3f7: mov rax, qword ptr [rbp + 8]
0x145bbd3fb: mov qword ptr [rbp + 0x38], rax
0x145bbd3ff: cmp rdx, 1
0x145bbd403: jne 0x145bbd443
0x145bbd405: mov qword ptr [rsi + 8], rcx
0x145bbd409: mov qword ptr [rsi], 0xffffffffffffffff
0x145bbd410: mov rdx, qword ptr [rbp + 0x28]
0x145bbd414: test rdx, rdx
0x145bbd417: je 0x145bbd452
0x145bbd419: mov rcx, qword ptr [rbp + 0x30]
0x145bbd41d: mov r8d, 1
0x145bbd423: call 0x1400021d0
0x145bbd428: jmp 0x145bbd452
0x145bbd42a: mov rax, rdi
0x145bbd42d: mov rdi, qword ptr [rbp + 0x20]
0x145bbd431: mov rcx, qword ptr [rbp + 0x10]
0x145bbd435: mov rdx, qword ptr [rbp + 0x18]
0x145bbd439: mov qword ptr [rbp + 0x38], rax
0x145bbd43d: cmp rdx, 1
0x145bbd441: je 0x145bbd405
0x145bbd443: mov rax, qword ptr [rbp + 0x38]
0x145bbd447: mov qword ptr [rsi + 0x10], rax
0x145bbd44b: movups xmm0, xmmword ptr [rbp + 0x28]
0x145bbd44f: movups xmmword ptr [rsi], xmm0
0x145bbd452: mov rcx, rdi
0x145bbd455: call qword ptr [rip + 0x1dd465]
0x145bbd45b: mov rax, rsi
0x145bbd45e: add rsp, 0xc8
0x145bbd465: pop rbx
0x145bbd466: pop rdi
0x145bbd467: pop rsi
0x145bbd468: pop rbp
0x145bbd469: ret
