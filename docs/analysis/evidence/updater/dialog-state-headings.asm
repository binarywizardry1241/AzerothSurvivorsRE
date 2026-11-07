; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1401bc6c9..0x1401bc88e SHA256 e32d2e5ec21c89f4a65c920154e6742b91f7c425c97428c1ccee2e036d9f04dc
0x1401bc6c9: cmp qword ptr [rbx + 0x50], -1
0x1401bc6ce: je 0x1401bc87d
0x1401bc6d4: lea rcx, [rip + 0x5c2c90d]
0x1401bc6db: mov edx, 0x15
0x1401bc6e0: call 0x1458ec450
0x1401bc6e5: mov r15, rdx
0x1401bc6e8: test rdx, rdx
0x1401bc6eb: js 0x1401bc7f0
0x1401bc6f1: je 0x1401bd9d0
0x1401bc6f7: mov r14, rax
0x1401bc6fa: call 0x140002200
0x1401bc6ff: mov r13d, 1
0x1401bc705: mov edx, 1
0x1401bc70a: mov rcx, r15
0x1401bc70d: call 0x1400021c0
0x1401bc712: test rax, rax
0x1401bc715: je 0x1401bc7f3
0x1401bc71b: mov r12, rax
0x1401bc71e: mov rcx, rax
0x1401bc721: mov rdx, r14
0x1401bc724: mov r8, r15
0x1401bc727: call 0x145bfa0e7
0x1401bc72c: cmp byte ptr [rsi + 0x18], 1
0x1401bc730: jne 0x1401bd9e0
0x1401bc736: mov eax, dword ptr [rsi + 0x19]
0x1401bc739: mov ecx, dword ptr [rsi + 0x1c]
0x1401bc73c: mov dword ptr [rbp + 3], ecx
0x1401bc73f: mov dword ptr [rbp], eax
0x1401bc742: mov rax, qword ptr [rsi + 0x20]
0x1401bc746: movzx edx, byte ptr [rsi + 0x28]
0x1401bc74a: mov cl, 1
0x1401bc74c: jmp 0x1401bd9f0
0x1401bc751: add rbx, 0xa0
0x1401bc758: lea rcx, [rip + 0x5c2c928]
0x1401bc75f: mov edx, 0x11
0x1401bc764: call 0x1458ec450
0x1401bc769: mov r15, rdx
0x1401bc76c: test rdx, rdx
0x1401bc76f: js 0x1401bc7f0
0x1401bc771: je 0x1401bd31b
0x1401bc777: mov r14, rax
0x1401bc77a: call 0x140002200
0x1401bc77f: mov r13d, 1
0x1401bc785: mov edx, 1
0x1401bc78a: mov rcx, r15
0x1401bc78d: call 0x1400021c0
0x1401bc792: test rax, rax
0x1401bc795: je 0x1401bc7f3
0x1401bc797: mov r12, rax
0x1401bc79a: mov rcx, rax
0x1401bc79d: mov rdx, r14
0x1401bc7a0: mov r8, r15
0x1401bc7a3: call 0x145bfa0e7
0x1401bc7a8: cmp byte ptr [rsi + 0x18], 1
0x1401bc7ac: jne 0x1401bd32b
0x1401bc7b2: mov eax, dword ptr [rsi + 0x19]
0x1401bc7b5: mov ecx, dword ptr [rsi + 0x1c]
0x1401bc7b8: mov dword ptr [rbp + 0x25b], ecx
0x1401bc7be: mov dword ptr [rbp + 0x258], eax
0x1401bc7c4: mov rax, qword ptr [rsi + 0x20]
0x1401bc7c8: movzx ecx, byte ptr [rsi + 0x28]
0x1401bc7cc: mov dl, 1
0x1401bc7ce: jmp 0x1401bd33b
0x1401bc7d3: add rbx, 0x20
0x1401bc7d7: lea rcx, [rip + 0x5c2c891]
0x1401bc7de: mov edx, 0xb
0x1401bc7e3: call 0x1458ec450
0x1401bc7e8: mov r15, rdx
0x1401bc7eb: test rdx, rdx
0x1401bc7ee: jns 0x1401bc81d
0x1401bc7f0: xor r13d, r13d
0x1401bc7f3: mov rcx, r13
0x1401bc7f6: mov rdx, r15
0x1401bc7f9: call 0x145d992bb
0x1401bc7fe: ud2
0x1401bc800: add rbx, 8
0x1401bc804: lea rcx, [rip + 0x5c2c86f]
0x1401bc80b: mov edx, 0xd
0x1401bc810: call 0x1458ec450
0x1401bc815: mov r15, rdx
0x1401bc818: test rdx, rdx
0x1401bc81b: js 0x1401bc7f0
0x1401bc81d: je 0x1401bc8aa
0x1401bc823: mov r14, rax
0x1401bc826: call 0x140002200
0x1401bc82b: mov r13d, 1
0x1401bc831: mov edx, 1
0x1401bc836: mov rcx, r15
0x1401bc839: call 0x1400021c0
0x1401bc83e: test rax, rax
0x1401bc841: je 0x1401bc7f3
0x1401bc843: mov r12, rax
0x1401bc846: mov rcx, rax
0x1401bc849: mov rdx, r14
0x1401bc84c: mov r8, r15
0x1401bc84f: call 0x145bfa0e7
0x1401bc854: movzx r13d, byte ptr [rsi + 0x18]
0x1401bc859: cmp r13b, 1
0x1401bc85d: jne 0x1401bc8bb
0x1401bc85f: mov eax, dword ptr [rsi + 0x19]
0x1401bc862: mov ecx, dword ptr [rsi + 0x1c]
0x1401bc865: mov dword ptr [rbp + 0x23b], ecx
0x1401bc86b: mov dword ptr [rbp + 0x238], eax
0x1401bc871: mov rax, qword ptr [rsi + 0x20]
0x1401bc875: movzx ecx, byte ptr [rsi + 0x28]
0x1401bc879: mov dl, 1
0x1401bc87b: jmp 0x1401bc8cb
0x1401bc87d: lea rcx, [rip + 0x5c2c779]
0x1401bc884: mov edx, 0xd
0x1401bc889: call 0x1458ec450
