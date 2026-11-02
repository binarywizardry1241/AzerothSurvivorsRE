0000000145b652de 4c896de0                       mov qword ptr [rbp - 0x20], r13
0000000145b652e2 488945e8                       mov qword ptr [rbp - 0x18], rax
0000000145b652e6 4c896df0                       mov qword ptr [rbp - 0x10], r13
0000000145b652ea 488955f8                       mov qword ptr [rbp - 8], rdx
0000000145b652ee 4c897d00                       mov qword ptr [rbp], r15
0000000145b652f2 4c896d08                       mov qword ptr [rbp + 8], r13
0000000145b652f6 c6451800                       mov byte ptr [rbp + 0x18], 0
0000000145b652fa 48c7451000000000               mov qword ptr [rbp + 0x10], 0
0000000145b65302 f30f11b528010000               movss dword ptr [rbp + 0x128], xmm6
0000000145b6530a f30f11b52c010000               movss dword ptr [rbp + 0x12c], xmm6
0000000145b65312 f30f11bd30010000               movss dword ptr [rbp + 0x130], xmm7
0000000145b6531a f30f119d34010000               movss dword ptr [rbp + 0x134], xmm3
0000000145b65322 c7853801000000000040           mov dword ptr [rbp + 0x138], 0x40000000
0000000145b6532c f30f11a53c010000               movss dword ptr [rbp + 0x13c], xmm4
0000000145b65334 f3440f118d40010000             movss dword ptr [rbp + 0x140], xmm9
0000000145b6533d 8b85e8010000                   mov eax, dword ptr [rbp + 0x1e8]
0000000145b65343 898558010000                   mov dword ptr [rbp + 0x158], eax
0000000145b65349 488b85e0010000                 mov rax, qword ptr [rbp + 0x1e0]
0000000145b65350 48898550010000                 mov qword ptr [rbp + 0x150], rax
0000000145b65357 f30f11955c010000               movss dword ptr [rbp + 0x15c], xmm2
0000000145b6535f c7856001000000000000           mov dword ptr [rbp + 0x160], 0
0000000145b65369 f30f11ad64010000               movss dword ptr [rbp + 0x164], xmm5
0000000145b65371 c7856801000000000040           mov dword ptr [rbp + 0x168], 0x40000000
0000000145b6537b 0f118dd0000000                 movups xmmword ptr [rbp + 0xd0], xmm1
0000000145b65382 48c785e000000000000000         mov qword ptr [rbp + 0xe0], 0
0000000145b6538d 0f118d6c010000                 movups xmmword ptr [rbp + 0x16c], xmm1
0000000145b65394 f30f11857c010000               movss dword ptr [rbp + 0x17c], xmm0
0000000145b6539c f30f119580010000               movss dword ptr [rbp + 0x180], xmm2
0000000145b653a4 48c745c800000000               mov qword ptr [rbp - 0x38], 0
0000000145b653ac 48c745d008000000               mov qword ptr [rbp - 0x30], 8
0000000145b653b4 48c745d800000000               mov qword ptr [rbp - 0x28], 0
0000000145b653bc c7457800000000                 mov dword ptr [rbp + 0x78], 0
0000000145b653c3 c7858000000000000000           mov dword ptr [rbp + 0x80], 0
0000000145b653cd c685a001000001                 mov byte ptr [rbp + 0x1a0], 1
0000000145b653d4 48c74520ffffffff               mov qword ptr [rbp + 0x20], 0xffffffffffffffff
0000000145b653dc c7858800000000000000           mov dword ptr [rbp + 0x88], 0
0000000145b653e6 0f118d84010000                 movups xmmword ptr [rbp + 0x184], xmm1
0000000145b653ed c685a101000000                 mov byte ptr [rbp + 0x1a1], 0
0000000145b653f4 c78598000000ffffffff           mov dword ptr [rbp + 0x98], 0xffffffff
0000000145b653fe 48c7859401000000000000         mov qword ptr [rbp + 0x194], 0
0000000145b65409 c7859c01000000000000           mov dword ptr [rbp + 0x19c], 0
0000000145b65413 488bbec0050000                 mov rdi, qword ptr [rsi + 0x5c0]
0000000145b6541a 483bbeb0050000                 cmp rdi, qword ptr [rsi + 0x5b0]
0000000145b65421 750d                           jne 0x145b65430
0000000145b65423 488d8eb0050000                 lea rcx, [rsi + 0x5b0]
0000000145b6542a e8b16b6200                     call 0x14618bfe0
0000000145b6542f 90                             nop
0000000145b65430 488b9dd8010000                 mov rbx, qword ptr [rbp + 0x1d8]
0000000145b65437 4c8d7b40                       lea r15, [rbx + 0x40]
0000000145b6543b 4869cfe0010000                 imul rcx, rdi, 0x1e0
0000000145b65442 48038eb8050000                 add rcx, qword ptr [rsi + 0x5b8]
0000000145b65449 488d55c8                       lea rdx, [rbp - 0x38]
0000000145b6544d 41b8e0010000                   mov r8d, 0x1e0
0000000145b65453 e8f3fb4900                     call 0x14600504b
0000000145b65458 48ffc7                         inc rdi
0000000145b6545b 4889bec0050000                 mov qword ptr [rsi + 0x5c0], rdi
