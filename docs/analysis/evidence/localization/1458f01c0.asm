; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458f01c0..0x1458f0315 SHA256 4b2bc26afa3bab8dba104268073185e6b090f5f3bc58d3d48281ae250f93eaa3
0x1458f01c0: push rbp
0x1458f01c1: push rsi
0x1458f01c2: push rdi
0x1458f01c3: sub rsp, 0xd0
0x1458f01ca: lea rbp, [rsp + 0x80]
0x1458f01d2: mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
0x1458f01da: mov rsi, rcx
0x1458f01dd: mov qword ptr [rbp - 0x30], rdx
0x1458f01e1: mov qword ptr [rbp - 0x28], r8
0x1458f01e5: lea rcx, [rbp + 0x10]
0x1458f01e9: call 0x1458ef170
0x1458f01ee: mov rax, qword ptr [rbp + 0x10]
0x1458f01f2: cmp rax, -1
0x1458f01f6: je 0x1458f02b4
0x1458f01fc: mov qword ptr [rbp + 0x38], rax
0x1458f0200: mov rax, qword ptr [rbp + 0x18]
0x1458f0204: mov qword ptr [rbp + 0x30], rax
0x1458f0208: mov rdi, qword ptr [rbp + 0x20]
0x1458f020c: lea rax, [rbp - 0x30]
0x1458f0210: mov qword ptr [rbp + 0x10], rax
0x1458f0214: lea rax, [rip - 0x58ee15b]
0x1458f021b: mov qword ptr [rbp + 0x18], rax
0x1458f021f: lea rdx, [rip + 0x15e2747]
0x1458f0226: lea rcx, [rbp - 0x20]
0x1458f022a: lea r8, [rbp + 0x10]
0x1458f022e: call 0x145bcce30
0x1458f0233: nop
0x1458f0234: mov r9, qword ptr [rbp - 0x18]
0x1458f0238: mov rax, qword ptr [rbp - 0x10]
0x1458f023c: mov qword ptr [rsp + 0x20], rax
0x1458f0241: lea rcx, [rbp - 0x50]
0x1458f0245: mov rdx, qword ptr [rbp + 0x30]
0x1458f0249: mov r8, rdi
0x1458f024c: mov qword ptr [rbp + 0x40], r9
0x1458f0250: call 0x145ba6d40
0x1458f0255: nop
0x1458f0256: mov rdx, qword ptr [rbp - 0x20]
0x1458f025a: test rdx, rdx
0x1458f025d: je 0x1458f026e
0x1458f025f: mov r8d, 1
0x1458f0265: mov rcx, qword ptr [rbp + 0x40]
0x1458f0269: call 0x1400021d0
0x1458f026e: mov rdx, qword ptr [rbp - 0x48]
0x1458f0272: mov r8, qword ptr [rbp - 0x40]
0x1458f0276: lea rcx, [rbp - 8]
0x1458f027a: mov qword ptr [rbp + 0x40], rdx
0x1458f027e: call 0x145bbd290
0x1458f0283: nop
0x1458f0284: mov rdx, qword ptr [rbp - 0x50]
0x1458f0288: test rdx, rdx
0x1458f028b: je 0x1458f029c
0x1458f028d: mov r8d, 1
0x1458f0293: mov rcx, qword ptr [rbp + 0x40]
0x1458f0297: call 0x1400021d0
0x1458f029c: cmp qword ptr [rbp - 8], -1
0x1458f02a1: je 0x1458f02bd
0x1458f02a3: mov rax, qword ptr [rbp + 8]
0x1458f02a7: mov qword ptr [rsi + 0x10], rax
0x1458f02ab: movups xmm0, xmmword ptr [rbp - 8]
0x1458f02af: movups xmmword ptr [rsi], xmm0
0x1458f02b2: jmp 0x1458f02ef
0x1458f02b4: mov qword ptr [rsi], 0xffffffffffffffff
0x1458f02bb: jmp 0x1458f0307
0x1458f02bd: mov qword ptr [rsi], 0xffffffffffffffff
0x1458f02c4: mov rax, qword ptr [rbp]
0x1458f02c8: mov ecx, eax
0x1458f02ca: and ecx, 3
0x1458f02cd: lea edx, [rcx - 2]
0x1458f02d0: cmp edx, 2
0x1458f02d3: jb 0x1458f02ef
0x1458f02d5: test rcx, rcx
0x1458f02d8: je 0x1458f02ef
0x1458f02da: dec rax
0x1458f02dd: lea rcx, [rbp + 0x18]
0x1458f02e1: mov qword ptr [rbp + 0x18], rax
0x1458f02e5: mov byte ptr [rbp + 0x10], 3
0x1458f02e9: call 0x145bdf7c0
0x1458f02ee: nop
0x1458f02ef: mov rdx, qword ptr [rbp + 0x38]
0x1458f02f3: test rdx, rdx
0x1458f02f6: je 0x1458f0307
0x1458f02f8: mov r8d, 1
0x1458f02fe: mov rcx, qword ptr [rbp + 0x30]
0x1458f0302: call 0x1400021d0
0x1458f0307: mov rax, rsi
0x1458f030a: add rsp, 0xd0
0x1458f0311: pop rdi
0x1458f0312: pop rsi
0x1458f0313: pop rbp
0x1458f0314: ret
